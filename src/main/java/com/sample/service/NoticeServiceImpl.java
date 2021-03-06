package com.sample.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.NoticeDao;
import com.sample.dto.NoticeDetailDto;
import com.sample.dto.NoticeInsideContentDto;
import com.sample.web.form.NoticeForm;
import com.sample.web.view.Image;
import com.sample.web.view.Notice;
import com.sample.web.view.NoticeImage;
import com.sample.web.view.Pagination;

/**
 * 
 * @author semin
 *
 */
@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public List<Notice> displayAllNotice() {
		
		List<Notice> notices = noticeDao.getAllNotices();
		
		return notices;
	}

	@Override
	public void addNewImage(Map<String, String> map) {
		noticeDao.insertNoticeImages(map);
	}
	
	@Override
	public List<String> displayAllNoticeImages() {
		List<String> images = noticeDao.getAllNoticeImages();
		
		return images;
	}
	
	@Override
	public NoticeDetailDto displayNoticeDetail(int noticeId) {
		NoticeDetailDto findNoticeDetail = noticeDao.getNoticeById(noticeId);
		return findNoticeDetail;
		
	}
	
	@Override
	public void addNewNotice(Notice notice, List<NoticeInsideContentDto> noticeListDto) {
		
		Map<String, Object> imgMap = new HashMap<>();
		imgMap.put("list", notice.getImages());
		
		Map<String, Object> noticeDtoMap = new HashMap<>();
		noticeDtoMap.put("noticeListDto", noticeListDto);
		
		// 공지사항 추가(notice_main 테이블)
		noticeDao.insertNoticeMain(notice);
		// 공지사항의 사진, (notice_image_path 테이블)
		noticeDao.insertNoticeImagePath(imgMap);
		// 공지사항의 본문내용, (notice_inside_content 테이블)
		noticeDao.insertNoticeInsideContent(noticeDtoMap);
	}
	
	@Override
	public Map<String, Object> getNoticeForPaging(int pageNo, int rows, String status, String keyword) {
		
		// 검색조건을 담을 맵을 생성한다.
		Map<String, String> map = new HashMap<String, String>();
		map.put("status", status);
		map.put("keyword", keyword);
		
		// 공지 갯수 조회하기
		int totalRows = noticeDao.getTotalRowsOfNoticeList(map);
		
		// 페이지 네비게이션에 필요한 정보 생성하기
		// 한 화면에 보여줄 행의 갯수, 블록당 페이지번호 수, 현재 페이지 번호, 총 행의 갯수
		Pagination pagination = new Pagination(rows, 5, pageNo, totalRows);
		// 현재 페이지번호에 해당하는 데이터 조회에 필요한 구간 계산하기
		int beginIndex = (pageNo - 1)*rows + 1;
		if (beginIndex == 1) {
			beginIndex = 0;
		}
		if ((beginIndex-1) % 10 == 0) {
			beginIndex -= 1;
		}
		int endIndex = rows;
		
		// 조회조건을 만족하는 글 조회하기
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("status", status);
		map2.put("keyword", keyword);
		map2.put("beginIndex", beginIndex);
		map2.put("endIndex", endIndex);
		
		List<Notice> notices = noticeDao.getNotices(map2);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("notices", notices);
		returnMap.put("pagination", pagination);
		returnMap.put("totalRows", totalRows);
		
		return returnMap;
	}
	
	@Override
	public void increaseViewCount(int noticeId) {
		
		Map<String, Integer> map = new HashMap<>();
		map.put("noticeId", noticeId);
		
		noticeDao.updateViewCount(map);
	}
	
	@Override
	public Notice BasedOnCurrentNoticeIdNextNoticeInfo(int currentNoticeId) {
		return noticeDao.getNextNoticeInfo(currentNoticeId);
	}
	
	@Override
	public Notice BasedOnCurrentNoticeIdPreNoticeInfo(int currentNoticeId) {
		return noticeDao.getPreNoticeInfo(currentNoticeId);
		
	}
	
	@Override
	public void deleteNoticeById(int noticeId) {
		noticeDao.deleteNotice(noticeId);
		
	}

	@Override
	public void updateNotice(NoticeForm noticeForm) {
		
		if ("서비스소식".equals(noticeForm.getCategory())) {
			noticeForm.setCategoryNo(0);
		} else if ("서비스오픈".equals(noticeForm.getCategory())) {
			noticeForm.setCategoryNo(1);
		} else if ("서비스종료".equals(noticeForm.getCategory())) {
			noticeForm.setCategoryNo(2);
		} else if ("서비스안내".equals(noticeForm.getCategory())) {
			noticeForm.setCategoryNo(3);
		} else if ("기타".equals(noticeForm.getCategory())) {
			noticeForm.setCategoryNo(4);
		}
		
		noticeDao.modifyNoticeMain(noticeForm);
		
		noticeDao.deleteNoticeImgTable(noticeForm.getNoticeId());
		
		for (int i=0; i<noticeForm.getImagePath().size(); i++) {
			NoticeImage noticeImg = new NoticeImage();
			if (noticeForm.getImagePath().get(i).contains("../resources/sample-images/")) {
				String imageName = noticeForm.getImagePath().get(i).substring(27);
				noticeImg.setImagePath(imageName);
			} else {
				noticeImg.setImagePath(noticeForm.getImagePath().get(i));
			}
			noticeImg.setId(noticeForm.getNoticeId());
			noticeDao.modifyNoticeImg(noticeImg);
		} 
		
		NoticeInsideContentDto insideDtoFormTitle = new NoticeInsideContentDto();
		NoticeInsideContentDto insideDtoFormContent = new NoticeInsideContentDto();
		NoticeInsideContentDto insideDtoSubtitle = new NoticeInsideContentDto();
		NoticeInsideContentDto insideDtoSubContent = new NoticeInsideContentDto();
		
		insideDtoFormTitle.setTitle(noticeForm.getFormTitle());
		insideDtoFormTitle.setContent("");
		insideDtoFormTitle.setPosition(1);
		
		insideDtoFormContent.setTitle("");
		insideDtoFormContent.setContent(noticeForm.getFormContent());
		insideDtoFormContent.setPosition(2);
		
		insideDtoSubtitle.setTitle(noticeForm.getSubTitle());
		insideDtoSubtitle.setContent("");
		insideDtoSubtitle.setPosition(3);
		
		insideDtoSubContent.setTitle("");
		insideDtoSubContent.setContent(noticeForm.getSubContent());
		insideDtoSubContent.setPosition(4);
		
		Map<String, Object> formTitleMap = new HashMap<>();
		formTitleMap.put("TitleAndContent", insideDtoFormTitle);
		formTitleMap.put("noticeId", noticeForm.getNoticeId());
		noticeDao.modifyNoticeTitlesAndContents(formTitleMap);
		
		Map<String, Object> formContentMap = new HashMap<>();
		formContentMap.put("TitleAndContent", insideDtoFormContent);
		formContentMap.put("noticeId", noticeForm.getNoticeId());
		noticeDao.modifyNoticeTitlesAndContents(formContentMap);
		
		Map<String, Object> subTitleMap = new HashMap<>();
		subTitleMap.put("TitleAndContent", insideDtoSubtitle);
		subTitleMap.put("noticeId", noticeForm.getNoticeId());
		noticeDao.modifyNoticeTitlesAndContents(subTitleMap);
		
		Map<String, Object> subContentMap = new HashMap<>();
		subContentMap.put("TitleAndContent", insideDtoSubContent);
		subContentMap.put("noticeId", noticeForm.getNoticeId());
		noticeDao.modifyNoticeTitlesAndContents(subContentMap);
		
	}
	
	@Override
	public List<Image> getAllImages() {
		
		return noticeDao.getAllImages();
		
	}
	
	@Override
	public List<Image> getAllImageByKeyword(String keyword) {
		
		return noticeDao.getAllImagesBySearchKeyword(keyword);
		
	}
	public int getTotalNoticeNow() {
		Map<String, String> map = new HashMap<>();
		map.put("status", "전체");
		map.put("regDate", "now");
		
		return noticeDao.getTotalRowsOfNoticeList(map);
	}
	
}
