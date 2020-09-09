<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>같이 보자! 공공연한사이</title>
<link rel="stylesheet" href="/resources/css/jquery.fullPage.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/manager.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.js"></script>
<script type="text/javascript" src="/resources/js/jquery.color.js"></script>
<script type="text/javascript" src="/resources/js/custom.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style type="text/css">

	.title-inactive {
		color: #424242;
	}
	
	
	.title-active {
		color: #DF013A;
	}
	
	
</style>
</head>
<body>
	<c:set var="topName" value="performance"/>
	<%@ include file="../manager/common/managerTop.jsp" %>
	<div class="page-wrapper chiller-theme toggled">
  <%@ include file="../manager/common/managernavi.jsp" %>
   <div class="page-content">
   	<div class="container">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 mt-5 p-3 text-center">	
					<ul class="nav navbar-nav d-inline-flex">
				      <li class="nav-item">
				        <ul class="list-inline-mb-0">
				          <li class="list-inline-item">
				          	<a href="/performance/adminList.do?category=콘서트" class="h1 pl-3 font-weight-bold 
				          	${category eq '콘서트'? 'title-active' : 'title-inactive' }">Consert</a>
				          </li>
				          <li class="list-inline-item">
				          	<a href="/performance/adminList.do?category=뮤지컬" class="h1 pl-3 font-weight-bold 
				          	${category eq '뮤지컬'? 'title-active' : 'title-inactive' }">Musical</a>
				          </li>
				          <li class="list-inline-item">
				          	<a href="/performance/adminList.do?category=연극" class="h1 pl-3 font-weight-bold 
				          	${category eq '연극'? 'title-active' : 'title-inactive' }">Play</a>
				          </li>       
				        </ul>
				      </li>
				    </ul>
							
					
				</div>
			</div>
			
			<div class="row mt-5 justify-content-center">
				<div class="col-12">
					<div class="d-flex justify-content-between">
						<div class="p-2">
							<h5 class="text-danger d-inline bolder">${category }</h5>
							<span>검색결과</span>
						</div>
						<div class="p-2">
							<button type="button" class="btn btn-link ${param.order eq 'dateOrder' || empty param.order? 'text-danger' : 'text-dark' }"
								onclick="selectOrder('dateOrder')" id="dateOrder">개봉일순</button>
							<button type="button" class="btn btn-link ${param.order eq 'likeOrder'? 'text-danger' : 'text-dark' }"
								onclick="selectOrder('likeOrder')" id="likeOrder">좋아요순</button>
							<button type="button" class="btn btn-link ${param.order eq 'salesOrder'? 'text-danger' : 'text-dark' }"
								onclick="selectOrder('salesOrder')" id="salesOrder">예매순</button>
						</div>
					</div>
					<hr />
				</div>
			</div>


			<div class="row mt-2 justify-content-center">
				<div class="col-12 border p-3">
					<form method="get" id="search-form">
						<input type="hidden" name="order" id="listOrder" value="${param.order }" />
						<input type="hidden" name="category" value="${category }" />
						<input type="hidden" name="pageNo" id="pageNo" />
						<input type="hidden" name="changed" id="formChanged" value="N" />
						<div class="form-group">
							<label>공연명</label> <input type="text" class="form-control"
								name="title" id="performanceName" 
								value="${param.title }" />
						</div>
						<div class="form-group">
							<label class="">공연장르</label>
							<div class="btn-group-toggle  " >
								<label class="btn ${(empty param.genre || param.genre eq '전체'  ) ? 'btn-danger' : 'btn-outline-danger'} mb-2"> 
									<input type="checkbox" name="genre" value="전체" ${(empty param.genre || param.genre eq '전체'  ) ? "checked" : ""} id="genreAll">전체
								</label>
							<c:set var="searchGenres" value="${paramValues.genre }" />	 								
							<c:forEach var="genre" items="${genres }">
								<c:set var="searched" value="N"/>	
								<c:forEach var="paramGenre" items="${searchGenres }">
									<c:choose>
										<c:when test="${genre eq paramGenre }">
											<c:set var="searched" value="Y"/>	
										</c:when>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${searched eq 'N' }">
										<label class="btn btn-outline-danger mb-2"> 
											<input type="checkbox" name="genre" value="${genre }">${genre }
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn btn-danger mb-2"> 
											<input type="checkbox" name="genre" checked value="${genre }" >${genre }
										</label>							
									</c:otherwise>
								</c:choose>
							</c:forEach>								
							</div>
						</div>
						
						<div class="form-group">
							<div class="form-inline ">
								<div>
									<label>공연기간</label>
								</div>
								<div class="ml-3">
									<input type="date" class="form-control d-inline"
										name="startDay" id="performanceStartDay"
										value="${param.startDay }" /> ~ <input
										type="date" class="form-control d-inline" name="endDay"
										id="performanceEndDay"
										value="${param.endDay }" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>관람연령</label>
							<div class="btn-group-toggle  " data-toggle="buttons">
							
								<label class="btn btn-outline-danger mb-2"> 
									<input type="radio" name="age" value="0" ${(empty param.age || param.age eq '0') ? "checked" : '' } id="ageAll">전체
								</label> 
								<label class="btn btn-outline-danger mb-2"> 
									<input type="radio" name="age" value="12" ${param.age eq '12' ? "checked" : '' } >12세이상
								</label> 
								<label class="btn btn-outline-danger mb-2"> 
									<input type="radio" name="age" value="15" ${param.age eq '15' ? "checked" : '' }>15세이상
								</label> 
								<label class="btn btn-outline-danger mb-2"> 
									<input type="radio" name="age" value="19" ${param.age eq '19' ? "checked" : '' }>청소년관람불가
								</label>
							</div>
						</div>					
						<div class="d-flex justify-content-end">
							<button type="submit" class="btn btn-danger mr-4">검색</button>
						</div>
					</form>
				</div>
			</div>

			<!-- 공연 목록 row시작 -->
			<div class="row mt-4 justify-content-center">
				<!-- 공연 목록 시작 -->
				<div class="col-12 mt-3">

				<c:forEach var="performance" items="${performances }">
					<div class="row mt-2 mb-3"> <!-- 공연정보 카드 1 시작 -->				
						<div class="col-12">
							<div class="card">								
								<div class="card-body">
									<div class="row">
										<div class="col-3">
										 <c:choose>
											 <c:when test="${fn:substring(performance.imagePath, 0,4) eq 'http' }">
											 	<c:set var="path" value="${performance.imagePath }"/>
											 </c:when>
											 <c:otherwise>
											 	<c:set var="path" value="/resources/sample-images/${performance.imagePath }"/>
											 </c:otherwise>
										 </c:choose>
											<img src="${path }" 
												class="img-thumbnail">
										</div>
										<div class="col-9">
											<div class="row mb-2">
												<div class="col-12">
													<span class="badge badge-pill badge-warning mr-2">														
													<c:choose>
														<c:when test="${performance.rating eq 0}">
       														전체
    													</c:when>
    													<c:otherwise>
      														${performance.rating }
    													</c:otherwise>
    												</c:choose>													
													</span>
													<h5 class="d-inline font-weight-bold">
														<c:out value="${performance.title }" />
													</h5>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-7 ">
													<table class="table table-borderless">
														<colgroup>
															<col width="20%" />
															<col width="80%" />
														</colgroup>
														<tr>
															<th>장르</th>
															<td>
															<c:forEach var="genre" items="${performance.genres }"> 
																${genre }&nbsp;
															</c:forEach>															
															</td>
														</tr>
														<tr>
															<th>러닝타임</th>
															<td>
																${performance.runningTime }
															</td>
														</tr>
														<tr>
															<th>공연기간</th>
															<td>
																<fmt:formatDate value="${performance.startDate }" pattern="yyyy년 M월 d일" />
																~
																<fmt:formatDate value="${performance.endDate }" pattern="yyyy년 M월 d일" />
																
															</td>
														</tr>
														<tr>
															<th>분류</th>
															<td>${performance.category }</td>
														</tr>
														<tr>
															<th>공연장소</th>
															<td>${performance.hallName }</td>
														</tr>
														<tr>
															<th>좌석정보</th>
															<td>
															<c:forEach var="seat" items="${performance.seatPrices }">
																${seat.seatRate }석 
																<fmt:formatNumber value="${seat.price }" />원																
															</c:forEach>															
															</td>
														</tr>
														<tr>
															<td colspan="2">
																<label class="">
																<c:forEach var="genre" items="${performance.genres }"> 
																	<button class="btn btn-link" onclick="searchGenre('${genre}')">#${genre }</button>
																</c:forEach>																	
																</label>
															</td>
														</tr>
													</table>
												</div>
												<!-- 공연 간단 정보창 끝 -->
												<!-- 메이트 정보(보여주지 않음) -->
												<div class="col-5">
													<div class="row justify-content-center">
														<div class="col-12">
															<div class="card" style="display:none;">
																<div class="card-body" >
																	<div class="mb-4">
																		<i class='fas fa-bullhorn mr-2'
																			style='font-size: 24px'></i>
																		<h6 class="d-inline font-weight-bold">메이트 모집중</h6>
																	</div>
																	<div>
																		<h6>현재 00/000명이 해당 공연의 메이트가 되었습니다.</h6>
																	</div>
																	<div class="progress mt-3">
																		<div
																			class="progress-bar bg-danger progress-bar-striped"
																			role="progressbar" style="width: 75%;"
																			aria-valuenow="75" aria-valuemin="0"
																			aria-valuemax="100">75%</div>
																	</div>
																	<div class="mt-3 ">
																		<h6 class="d-inline">메이트 그룹 현황</h6>
																		<span class="d-inline">00/00</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- 메이트 그룹 창 끝 -->
											</div>
											<!-- 공연정보 표시끝 -->
										</div>
									</div>
									<div class="row mt-2 p-2 "> <!-- 좋아요수, 뒷풀이 게시판수, 예매하기, 상세보기 버튼그룹 -->
										<div class="col-12 d-flex justify-content-between">
											<div>
												<!-- 좋아요수, 뒷풀이 게시판 수 표시 -->
												<div class="d-inline mr-2">
													<i class='fas fa-heart mr-2'
														style='font-size: 24px; color: red;'></i><label id="${performance.id }likes">${performance.likes }</label>
												</div>
												<!-- 뒷풀이게시판 -->
												<!--  
												<div class="d-inline" style="display:none;">
													<i class='far fa-comment-alt mr-2' style='font-size: 24px'></i><label></label>
												</div>
												-->
											</div>
											<div>
												<!--  
												<button type="button" class="btn btn-outline-danger mr-2"
													onclick="buyTicket(${performance.id})">예매하기</button>
												-->
												<button type="button" class="btn btn-outline-dark mr-2"
													onclick="showDetail(${performance.id})">상세보기</button>
												<button type="button" class="btn btn btn-info mr-2"
													onclick="updatePerformance(${performance.id})">수정하기</button>
												<button type="button" class="btn btn btn-danger mr-2"
													onclick="deletePerformance(${performance.id})">삭제하기</button>
											</div>
										</div>
									</div>	<!-- 예매하기 상세보기 버튼그룹 끝 -->
									<!-- 사용자가 보는 창에선 수정하기와 삭제하기가 보이지 않도록 한다 -->
									<!--  
									<div class="row mt-2 p-2">
										<div class="col-12 d-flex justify-content-end">
											<button type="button" class="btn btn btn-info mr-2"
													onclick="updatePerformance(${performance.id})">수정하기</button>
											<button type="button" class="btn btn btn-danger "
													onclick="deletePerformance(${performance.id})">삭제하기</button>
										</div>
									</div>
									-->
									<!--  
									<div class="row">
										<label class="pr-2 pl-2"><a href="#">#범죄</a><a
											href="#">#액션</a><a href="#">#스릴러</a></label>
									</div>
									-->
									<!-- 태그 창 끝 -->
								</div>
								<!-- card body 끝 -->
							</div>
							<!-- card 끝 -->
						</div>
						<!-- 카드 row col-12끝 -->
					</div>
					<!-- 카드 row끝 공연정보카드1 끝남-->
				</c:forEach>
				
					
					<!-- 카드 row끝 -->
				</div>
			</div>
			<!-- 공연목록 끝 -->

			<!-- 공연 상세정보 모달창 -->
			<div class="modal" id="myModal">
				<div class="modal-dialog"
					style="max-width: 100%; width: 80%; display: table;">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h6 class="modal-title font-weight-bold">공연 상세정보</h6>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-3">
											<img src="/resources/sample-images/movie_image2.jpg"
												class="img-thumbnail" id="modalImg">
										</div>
										<div class="col-9">
											<div class="row mb-2">
												<div class="col-12">
													<span class="badge badge-pill badge-warning mr-2" id="modalAge"></span>
													<h5 class="d-inline font-weight-bold" id="modalTitle"></h5>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-7 ">
													<table class="table table-borderless">
														<colgroup>
															<col width="20%" />
															<col width="80%" />
														</colgroup>
														<tr>
															<th>장르</th>
															<td id="modalGenre"></td>
														</tr>
														<tr>
															<th>러닝타임</th>
															<td id="modalRunningTime"></td>
														</tr>
														<tr>
															<th>공연기간</th>
															<td id="modalPeriod"></td>
														</tr>
														<tr>
															<th>분류</th>
															<td id="modalCategory"></td>
														</tr>
														<tr>
															<th>공연장소</th>
															<td id="modalHallName"></td>
														</tr>
														<tr>
															<th>좌석정보</th>
															<td id="modalSeatInfo"></td>
														</tr>
														<tr>
															<td colspan="2">
																<label class="" id="modalTags">																	
																</label>
															</td>
														</tr>
													</table>
												</div>
												<!-- 공연 간단 정보창 끝 -->
												<div class="col-5">
													<div class="row justify-content-center">
														<div class="col-12">
															<div class="card">
																<!-- 뒷풀이게시판 -->
																<div class="card-body" style="display:none;">
																	<div class="mb-4">
																		<i class='fas fa-bullhorn mr-2'
																			style='font-size: 24px'></i>
																		<h6 class="d-inline font-weight-bold">메이트 모집중</h6>
																	</div>
																	<div>
																		<h6>현재 00/100명이 해당 공연의 메이트가 되었습니다.</h6>
																	</div>
																	<div class="progress mt-3">
																		<div
																			class="progress-bar bg-danger progress-bar-striped"
																			role="progressbar" style="width: 75%;"
																			aria-valuenow="75" aria-valuemin="0"
																			aria-valuemax="100">75%</div>
																	</div>
																	<div class="mt-3 ">
																		<h6 class="d-inline">메이트 그룹 현황</h6>
																		<span class="d-inline">00/30</span>
																	</div>
																</div>
																<!-- 카카오맵 api by LMS (start 2020.08.26) -->
																<div class="card-body">
																	<div id="map" style="width:380px; height:300px;"></div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- 메이트 그룹 창 끝 -->
											</div>
											<!-- 공연정보 표시끝 -->
										</div>
									</div>
									<div class="row mt-2 ">
										<div class="col-12 d-flex justify-content-between">
											<div>
												<!-- 좋아요수, 뒷풀이 게시판 수 표시 -->
												<div class="d-inline mr-2">
													<button type="button" class="btn btn-sm" id="clickLike"
													data-no="" data-liked="">
														<i class='fas fa-heart mr-2'
														style='font-size: 24px; color: red;'></i>
													</button>
													<label id="modalLikes"></label>
												</div>
												<!--  
												<div class="d-inline" style="display:none;">
													<button type="button" class="btn btn-sm" id="goBoard">													
														<i class='far fa-comment-alt mr-2' style='font-size: 24px'></i>
													</button>
													<label id="modalAfterParty"></label>
												</div>
												-->
											</div>
											
										</div>
									</div>
									<div class="row justify-content-center">
									<!--  
										<label class="pr-2 pl-2"><a href="#">#범죄</a><a
											href="#">#액션</a><a href="#">#스릴러</a></label>
									-->
									<!--
										여기서 버튼 onclick 정의하지 말고 아래에 클릭이벤트 정의
										$("#bton").click(function(no){
										})
									-->
									<!--  
										<button type="button" class="btn btn-outline-danger mr-4 btn-lg"
											id="modalBuyBtn" data-no="">예매하기</button>
										<button type="button" class="btn btn-outline-dark btn-lg" style="display:none;"
											id="modalMateGroupBtn" data-no="">메이트 그룹</button>
									-->		
										<button type="button" class="btn btn btn-info mr-4 btn-lg"
												id="modalUpdateBtn" data-no="" >수정하기</button>
										<button type="button" class="btn btn btn-danger mr-4 btn-lg"
												id="modalDeleteBtn" data-no="">삭제하기</button>
									</div>
									
									<!--  
									<div class="row justify-content-end mt-3">
										<button type="button" class="btn btn btn-info mr-4 btn-lg"
												id="modalUpdateBtn" data-no="" >수정하기</button>
										<button type="button" class="btn btn btn-danger mr-2 btn-lg"
												id="modalDeleteBtn" data-no="">삭제하기</button>	
									</div>
									-->
									
									<!-- 태그 창 끝 -->
								</div>
								<!-- card body 끝 -->
							</div>
							<!-- card 끝 -->
							<div> <!-- 공연상세 정보 -->
								<div class="mt-3 p-2">
									<h5 class="font-weight-bold">공연정보</h5>
									<table class="table table-bordered mt-3">
										<colgroup>
											<col width="20%">
											<col width="80%">
										</colgroup>
										<tbody>
											<tr>
												<th>공연명</th>
												<td id="modalDetailtitle"></td>
											</tr>
											<tr>
												<th>공연장소</th>
												<td id="modalDetailHallName">
													<p></p>
													<p></p>
												</td>
											</tr>
											<tr>
												<th>공연기간(개봉일)</th>
												<td id="modalDetailPeriod"></td>
											</tr>
											<!--  
											<tr>
												<th>공연시간</th>
												<td id="modalDetailTime"></td>
											</tr>
											-->
											<tr>
												<th>러닝타임</th>
												<td id="modalDetailRunningTime"></td>
											</tr>
											<tr>
												<th>좌석등급 및 가격</th>
												<td id="modalDetailSeatInfo"></td>
											</tr>
											<tr>
												<th>관람연령</th>
												<td id="modalDetailAge"></td>
											</tr>
										</tbody>									
									</table>							
								</div>	<!-- 공연정보 테이블 끝 -->
								<div class="mt-3 p-2"> <!-- 공연 -->
									<h5 class="font-weight-bold">내용</h5>				
									<div class="mt-3" style="width:85%">
										 <p id="modalDetailExplain"></p>
									</div>									
								</div>
									
								<div class="mt-3 p-2">
									<h5 class="font-weight-bold">성별 나이별 관람추이</h5>				
									<div class="row mt-3 p-2 justify-content-start">
										<div class="col-5">
											<div class="card">
												<div class="card-body">
													<canvas id="chartGender">
													</canvas>
													<div id="defaultChart" class="text-center"
														style="display: none;"></div>
												</div>
											</div>
										</div>
										<div class="col-5">
											<div class="card" >
												<div class="card-body">
													<canvas id="chartAge">
													</canvas>
													<div id="defaultAgeChart" class="text-center"
														style="display: none;"></div>
												</div>
											</div>
										</div>
									</div>
								</div> <!-- 공연 상세정보 -->	
															
							</div>	<!-- 공연상세정보 끝 -->						
							
						</div>
						<!-- Modal footer -->
						
						<!--  -->						
						
					</div>
				</div>
			</div> <!-- 공연 상세정보 모달창 끝 -->
			
			<!--  
			<div>
				테스트용
				
				pageNo:  ${pageNo }
				totalPageCount: ${totalPageCount }
				rows: ${rows }
				pagination.beginPage: ${pagination.beginPage }
				pagination.endPage: ${pagination.endPage }
			</div>
			-->
			
			
			
			<div class="row mt-5 justify-content-center">
				<!-- 페이지네이션 -->
				<nav aria-label="Page navigation example">			
							
					<c:if test="${pageNo > 1 }">
						<button class="btn btn-light"
						 onclick="goPage('${pageNo-1}')">이전</button>
					</c:if>
						
					<c:forEach var="idx" begin="${pagination.beginPage }" end="${pagination.endPage }" step="1">
						
						<button class="btn btn-light paging-num ${pageNo == idx? 'active': '' }"
						onclick="goPage('${idx}')" >${idx }</button>
						
					</c:forEach>	
						
					<c:if test="${pageNo < totalPageCount }">
						<button class="btn btn-light"
						 onclick="goPage('${pageNo+1}')">다음</button>
					</c:if>	
						
					
				</nav>
			</div>
			<!-- 페이지네이션 끝 -->
		</div> <!-- container-fluid 끝 -->
</div>
</div>
</div>
<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=333f1bf83c9503d02a701757427f6892&libraries=services"></script>	
<script type="text/javascript">
$(function(){
	
	console.log("시작");
	
	var $checkedAge = $("input[name='age']:checked");
	console.log($checkedAge);
	$($checkedAge).closest('label').siblings().find('input').prop("checked", false);
	$($checkedAge).closest('label').removeClass("btn-danger").addClass("btn-outline-danger");
	//$(this).siblings().find('input').prop("checked", false);
	
	if ($checkedAge.val() != 0) {
		$("#ageAll").prop("checked", false);
		$("#ageAll").closest('label').removeClass("btn-outline-danger").addClass("btn-outline-danger");
	}
	
	
});

function updatePerformance(no) {
	console.log("updatePerformance(no="+no+")");
	
	var category = '${category}';
	location.href='/performance/update/main.do?category='+category+'&performanceId='+no;
	//location.href='/payment/step1.do?no='+no;
}

function deletePerformance(no) {
	console.log("deletePerformance(no="+no+")");
	
	var category = '${category}';
	
	location.href='/performance/delete.do?category='+category+'&performanceId='+no;
	
}



$("#search-form").find("input").change(function() {
	console.log("input필드값이 바뀌었습니다.");
	var $changed = $("#search-form input[name=changed]");
	console.log($changed);
	console.log("변경전"+$changed.val());
	$changed.val("Y");
	console.log("변경후"+$changed.val());
	//$($changed).val("Y");
	//console.log("변경후 formChanged값: "+$($changed).val());
});

$(":input[name=genre]").closest('label').click(function(event) {
	console.log("input필드 중 체크박스값이 바뀌었습니다.");
	var $changed = $("#search-form input[name=changed]");
	console.log($changed);
	console.log("변경전"+$changed.val());
	$changed.val("Y");
	console.log("변경후"+$changed.val());
	//console.log("변경전 formChanged값: "+$($changed).val());
	//$($changed).val("Y");
	//console.log("변경후 formChanged값: "+$($changed).val());
});

$(":input[name=age]").closest('label').click(function(event) {
	console.log("input필드 중 라디오값이 바뀌었습니다.");
	var $changed = $("#search-form input[name=changed]");
	console.log($changed);
	console.log("변경전"+$changed.val());
	$changed.val("Y");
	console.log("변경후"+$changed.val());
	//console.log("변경전 formChanged값: "+$($changed).val());
	//$($changed).val("Y");
	//console.log("변경후 formChanged값: "+$($changed).val());
});



function goPage(no) {
	console.log("page 링크를 눌렀다.");
	console.log("page: "+no);
	if ($("#pageNo").val() == "") {
		console.log("비었ㄷ.");
	}else{
		
		console.log("pageNo="+$("#pageNo").val());
	}
	
	$("#pageNo").val(no);
	$("#search-form").submit();
}

function searchGenre(genre) {
	console.log("clickTag: "+genre);
	
	var checked = $("#search-form input[name=genre]:checked");
	
	console.log(checked);
	
	var genreVals = $("#search-form input[name=genre]");
	console.log(genreVals);
	
	for (var idx = 0; idx < genreVals.length; idx++ ) {
		
		var genreBtn = genreVals[idx];
		console.log($(genreBtn).val());
		
		if ($(genreBtn).val() == genre) {
			console.log($(genreBtn).val()+"가 누른 태그임");
			$(genreBtn).prop("checked", true);			
		}else {
			$(genreBtn).prop("checked", false);	
		}		
	}
	
	$("#search-form").submit();
	
	
}


function selectOrder(option) {
	//console.log(option);	
	var optionId = "#"+option;
	//console.log($(optionId));
	
	$(optionId).removeClass("text-dark").addClass("text-danger");
	$(optionId).siblings().removeClass("text-danger").addClass("text-dark");
	$("#listOrder").val(option);
	
	console.log("input필드값이 바뀌었습니다.");
	var $changed = $("#search-form input[name=changed]");
	console.log($changed);
	console.log("변경전"+$changed.val());
	$changed.val("Y");
	console.log("변경후"+$changed.val());
	
	console.log($("#listOrder").val());
	
	// 이후 form submit 출력
	$("#search-form").submit();
}

$("#performanceStartDay").change(function() {
	//console.log(this);
	//console.log($(this).val());
	
	var now = new Date().toISOString().substring(0, 10);		
	var $endDay = $("#performanceEndDay");
	
	if ($endDay.val() == "") return;
	if ($endDay.val() < $(this).val()) {
		//console.log("시작날짜가 끝나는 날짜보다 커");
		$(this).val($endDay.val());
	}
})

$("#performanceEndDay").change(function() {
	console.log(this);
	console.log($(this).val());
	var now = new Date().toISOString().substring(0, 10);	
	
	var $startDay = $("#performanceStartDay");
	if ($(this).val() < now) {	// 입력한 종료날짜가 오늘보다 이전이면
		$(this).val(now);	// 종료날짜를 오늘로 바꿔준다.
	}
	if ($(this).val() < $startDay.val()) {
		$(this).val("");		
	}
	
	//var now = new Date().toISOString().substring(0, 10);	
	//if ($(this).val() < now) {
	//	console.log("마감날짜가  오늘보다 작아");
	//}
})

function buyTicket(no) {
	console.log("buyTicket(no="+no+")");
	
	location.href='/payment/step1.do?no='+no;
}

$("#modalBuyBtn").click(function() {
	var no = $("#modalBuyBtn").data("no");
	console.log("modalBuyBtn(no="+no+")");
	buyTicket(no);
})

$("#modalUpdateBtn").click(function() {
	var no = $("#modalUpdateBtn").data("no");
	console.log("#modalUpdateBtn(no="+no+")");
	updatePerformance(no);
})

$("#modalDeleteBtn").click(function() {
	var no = $("#modalDeleteBtn").data("no");
	console.log("#modalDeleteBtn"+no+")");
	deletePerformance(no);
})


function numberWithComma(num)
{
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

function showDetail(performanceId) {	
	console.log("showDetail(performanceId="+performanceId+")");
	var loginUser="${ LOGIN_USER.id}";
	console.log("loginUserId: "+loginUser);
	
		
	$.ajax({
		type:"GET",
		url:"/performance/detail.do",
		data: {id:performanceId, userId:loginUser},
		dataType: 'json',
		success: function(data) {
			var hallInfo = data.hallInfo;
			var performance = data.performance;
			var userLiked = data.userLiked;
			
			var manReserveCount = data.manReserveCount;
			var womanReserveCount = data.womanReserveCount;
			var age10ReserveStats = data.age10ReserveStats;
			var age20ReserveStats = data.age20ReserveStats;
			var age30ReserveStats = data.age30ReserveStats;
			var age40ReserveStats = data.age40ReserveStats;
			var age50ReserveStats = data.age50ReserveStats;
			
			console.log("manReserveCount: "+ manReserveCount);
			console.log("womanReserveCount: "+ womanReserveCount);
			
			console.log("디테일을 눌렀다.");
			
			var modalImagePath = performance.imagePath;
			console.log("ImagePath 시작: " + modalImagePath.substring(0,4));
			if (modalImagePath.substring(0,4) != 'http') {
				modalImagePath="/resources/sample-images/"+performance.imagePath;
			}
			
			$("#modalImg").attr("src", modalImagePath);			
			var rating = performance.rating;
			if (performance.rating == "0") {
				rating = "전체";
			}
						
			$("#modalAge").text(rating);
			$("#modalTitle").text(performance.title);
			
			var performanceGenres = "";						
			for (var idx=0; idx < performance.genres.length; idx++) {
				performanceGenres += performance.genres[idx]+ " ";				
			}			
			
			$("#modalGenre").text(performanceGenres);	
			
			console.log(performance.runningTime);
			$("#modalRunningTime").text(performance.runningTime);
			
			var period = performance.startDate + " ~ " +  performance.endDate;		
			$("#modalPeriod").text(period);
			$("#modalCategory").text(performance.category);
			$("#modalHallName").text(performance.hallName);
						
			var seatPrices = "";
			for (var idx=0; idx < performance.seatPrices.length; idx++) {
				seatPrices += performance.seatPrices[idx].seatRate + "석 "
				+ numberWithComma(performance.seatPrices[idx].price) + "원 ";
			}
			
			console.log(seatPrices);
			
			$("#modalSeatInfo").text(seatPrices);
			
			var tags="";
			for (var idx=0; idx < performance.genres.length; idx++) {
				tags += "#"+performance.genres[idx];				
			}	
			
			$("#modalTags").text(tags).css("color", "#06F");
			
			$("#modalLikes").text(performance.likes);
			$("#modalAfterParty").text();
			
			$("#modalDetailtitle").text(performance.title);
			$("#modalDetailHallName p:eq(0)").text(performance.hallName);
			$("#modalDetailHallName p:eq(1)").text("("+performance.hallAddress+")");
			$("#modalDetailPeriod").text(period);
			//$("#modalDetailTime").text(performance.expla);
			$("#modalDetailRunningTime").text(performance.runningTime);
			$("#modalDetailSeatInfo").text(seatPrices);
			
			if (rating != '전체') {
				rating = "만 "+rating+"이상 관람가";	
			}else {
				rating = rating+"관람가";
			}			
			
			$("#modalDetailAge").text(rating);
			$("#modalDetailExplain").text(performance.explain);
			
			
			$("#modalBuyBtn").data("no", performance.id);
			$("#showMateGroupBtn").data("no", performance.id);
			$("#modalDeleteBtn").data("no", performance.id);
			$("#modalUpdateBtn").data("no", performance.id);
			$("#clickLike").data("no", performance.id);
			$("#clickLike").data("liked", userLiked);	// 이전에 좋아요를 눌렀는지 여부 
			
			
			
			
			console.log("성공함");
			console.log(performance);
			
			var id = document.getElementById('map');
			kakaoMap(id, hallInfo);
			
			
// 통계 그래프 그리기
			
			// 성별 그래프
			var genderColors=['skyblue', '#e23b3b'];
			
			var donutOptions= {
				cutoutPercentage: 30, //도넛두께 : 값이 클수록 얇아짐 
				legend: {
							position:'bottom', 
							padding:5, 
							labels: {
								pointStyle:'circle', 
								usePointStyle:true
							}
						}
			};
			
						
			var chDonutData = {
				labels: ['남자', '여자'], 
				datasets: [ { 
					backgroundColor: genderColors.slice(0,2), 
					borderWidth: 0, 
					data: [manReserveCount,womanReserveCount] // 데이터
				} ]
			};
			
			var $chDonut = $("#chartGender"); 
			var $defaultChart = $("#defaultChart");
			
			if ((manReserveCount == 0) && (womanReserveCount == 0)) {
				console.log("아직 아무도 구매를 하지 않음");
				
				var defaultImage = "<img class='mt-5' src='/resources/sample-images/notPrepared.png' width='140px'/>";
				defaultImage += "<p class='mt-4 mb-4 font-weight-bold'>아직 성별 예매정보가 없습니다.</p>";
				
				$defaultChart.html(defaultImage);
				$defaultChart.show();
				$chDonut.hide();
			} else {
				$defaultChart.hide();
				$chDonut.show();
				if ($chDonut) { 
					new Chart($chDonut, { 
						type: 'pie', 
						data: chDonutData, 
						options: donutOptions 
						}
					); 
				}
			
			} // 데이터 값이 있을 때 그래프 그리기 
			
			// 나이대별 관람추이
			var $chBar = $("#chartAge");
			//var ageCanvas=  document.getElementById('chartAge');
			//var context = ageCanvas.getContext('2d');			
			var $defaultAgeChart = $("#defaultAgeChart");
			//context.clearRect(0, 0, ageCanvas.width, ageCanvas.height);
			$("#chartAge").empty();
			
			if ((age10ReserveStats == 0) && (age20ReserveStats == 0) && 
					(age30ReserveStats == 0) && (age40ReserveStats == 0) &&
					(age50ReserveStats == 0)) {
				console.log("아직 아무도 구매를 하지 않음");
				
				var defaultImage = "<img class='mt-5' src='/resources/sample-images/notPrepared.png' width='140px'/>";
				defaultImage += "<p class='mt-4 mb-4 font-weight-bold'>아직 연령대별 예매정보가 없습니다.</p>";
				
				$defaultAgeChart.html(defaultImage);
				$defaultAgeChart.show();
				$chBar.hide();
			} else {
				$defaultAgeChart.hide();
				$chBar.show();
				
				if ($chBar) {
					new Chart($chBar, {
						type: 'bar',
						data: {
							labels: ['10대↓', '20대', '30대', '40대', '50대↑'],
							datasets: [{
								label: '# of ReserveCount',
								data: [age10ReserveStats, age20ReserveStats,
									age30ReserveStats, age40ReserveStats, age50ReserveStats],	// 퍼센트 구해서 넣기
								backgroundColor: [
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)'
								],
								borderColor: [
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)'
								],
								borderWidth: 1
							}]
						},
						options: {
							scales: {
								yAxes: [{
									ticks: {
										beginAtZero: true
									}
								}]
							}
						}
						
					})		
				}// bar 끝
				
				
			} // 연령대별 예매정보가 있다면 끝
			
		} // success 끝
	})
	
	
	
	
	
	
	
	
	
	$("#myModal").modal("show");
	// modal 창이 열리는 시점(스타일이 변경되는 시점)에서 지도 영역이 변경되었다고 알려주는 함수 호출
	map.relayout();
	
	
};

function showMateGroup(no) {
	console.log(no);
	
};

$("#clickLike").click(function(){
	//console.log(this);
	
	//console.log($(this).find("i"));
	
	// 로그인 여부 확인하고 로그인 상태이면, 좋아요 표시
	
	
	
})

$("#goBoard").click(function() {
	// board로 보냄
})


$(function() {
	$(":input[name=genre]").closest('label').click(function(event) {
		event.preventDefault();
		console.log("before", ($(this).find('input').prop("checked")));

		$(this).find('input').prop("checked", !($(this).find('input').prop("checked")))
		
		console.log("after", ($(this).find('input').prop("checked")));
		
		console.log($(this).find('input').val());
		
		
		
		if ($(this).find('input').prop("checked")) {
			
			
			$(this).removeClass("btn-outline-danger").addClass("btn-danger");
			
			// 무시해도되는 코드임
			// 전체 누르면 다른 버튼은 취소되도록
			if ($(this).find('input').val()=="전체") {				
				$(this).siblings().find('input').prop("checked", false);
				$(this).siblings().removeClass("btn-danger").addClass("btn-outline-danger");				
			}else {	// 전체 말고 다른 버튼 눌렀을 때 전체 버튼이 이미 눌러져 있는경우 전체버튼 체크해제됨
				if ($("#genreAll").prop("checked")) {
					console.log("다른 장르버튼 눌렀을때 전체버튼이 체크되어있는가");
					$("#genreAll").closest('label').removeClass("btn-danger").addClass("btn-outline-danger");	
					$("#genreAll").prop("checked", false);
				}	
			
			}			
			
			console.log("체크되었음");
		} else {
			$(this).removeClass("btn-danger").addClass("btn-outline-danger");
		}
	})
})

function kakaoMap(id, hallInfo) {
	
	// 카카오맵 api script 부분 by LMS (2020.08.26)
	var mapContainer = id, // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(hallInfo.gpsX, hallInfo.gpsY), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(hallInfo.address, function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
		
		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		    // 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });
		
		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+hallInfo.name+'</div>'
		    });
		    infowindow.open(map, marker);
		
		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(coords);
		} 
	})
}
</script>
</body>
</html>