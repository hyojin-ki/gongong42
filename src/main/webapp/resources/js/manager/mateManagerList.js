$(function(){

	
	$.ajax({
		type:"POST",
		url:"/manager/mateManagementJson.do",
		success:function(result){
			printPage(result);
		}
		
		
		
	})
	//page클릭
	$('tfoot').on('click','.pageno',function(){
		
		var pageNo = $(this).data('pageno');
		$.ajax({
			url:'/manager/mateManagementJson.do',
			type:'POST',
			data:{
				"pageNo":pageNo
			},
			success:function(result){
				printPage(result);
			}
			
		})
	})
	//이전
	$('tfoot').on('click','.beforePage',function(){
		var pageNo = $(this).data('pageno');
		$.ajax({
			url:'/manager/mateManagementJson.do',
			type:'POST',
			data:{
				"pageNo":pageNo
			},
			success:function(result){
				printPage(result);
			}
			
		})
	})
	
	
	//다음
	$('tfoot').on('click','.afterPage',function(){
		var pageNo = $(this).data('pageno');
		$.ajax({
			url:'/manager/mateManagementJson.do',
			type:'POST',
			data:{
				"pageNo":pageNo
			},
			success:function(result){
				printPage(result);
			}
			
		})
	})
	
	
	
	$('#matelist-table tbody').on('click', '#matelist-detail-btn', function(){
		
		var pId = $(this).data('performanceid');
		
		$('#mate-detail-modal').modal('show');
		console.log(pId);
	})
	
	
	
	
	
})



//pagination print funtion
function printPage(result){
	var list = result.mateList;
	
	var $tbody = $('#matelist-table tbody');
	$tbody.empty();
	var rows = '';
	for(var i in list){
		
		var performance = list[i].performance;
		var pId = performance.id;
		var pTitle = performance.title;
		var pCat = performance.category;
		var pImg = performance.imagePath;
		
		var schedule = performance.schedule[0];
		var showDate = schedule.showDate;
		var showTime = schedule.showTime;
		var showNumber = schedule.showNumber;
		
		var totalCnt = list[i].totalCnt;
		var aSeat = list[i].aseats;
		var sSeat = list[i].sseats;
		var rSeat = list[i].rseats;
			
		rows += '<tr>';
		rows += '<td>'+pId+'</td>';
		rows += '<td><img class="img-thumbnail" style="width:100px;" src="/resources/sample-images/'+pImg+'" alt="" /><div>'+pTitle+'</div></td>'
		rows += '<td>'+pCat+'</td>'
		rows += '<td>'+showDate+'</td>'	;
		rows += '<td>'+showTime+'</td>' ;
		rows += '<td>'+showNumber+'</td>'
		rows += '<td>'+rSeat+'</td>';
		rows += '<td>'+sSeat+'</td>';
		rows += '<td>'+aSeat+'</td>';
		rows += '<td>'+totalCnt+'</td>';
		rows += '<td><button class="btn btn-primary" id="matelist-update-btn" data-performanceid="'+pId+'" type="button">수정</button></td>'
		rows += '<td><button class="btn btn-danger" id="matelist-delete-btn" data-performanceid="'+pId+'" type="button">삭제</button></td>'	
		rows += '<td><button class="btn btn-warning" id="matelist-detail-btn" data-performanceid="'+pId+'" type="button">상세</button></td>'	
		rows += '</tr>'
		
	
	}
	$tbody.append(rows);
	$('#matelist-table tbody tr td').addClass('align-middle');
	
	var length = result.mateList.length;
	
	var pagination = result.pagination;
	var pageNo = pagination.pageNo;
	var beginPage = pagination.beginPage;
	var endPage = pagination.endPage;
	
	console.log(pagination);
	
	$tfoot = $('#matelist-table tfoot td');
	$tfoot.empty();
	var rows = '';
	rows += '<nav class="page navigation mx-auto" style="width:273px">'
	rows += '<ul class="pagination mx-auto">'	
	
	if(pageNo > beginPage){
		rows += '<li class="page-item"><a href="#" class="page-link beforePage" data-pageno="'+(pageNo-1)+'" >이전</a></li>'
	}	
	for(var page = beginPage; page <= endPage; page++){
		var active = (pageNo == page) ? "active" : "";	
		rows += '<li class="page-item '+active+'"><a href="#" class="page-link pageno"  data-pageno="'+page+'">'+page+'</a></li>'
	}
	
	if(pageNo < endPage){
		rows += '<li class="page-item"><a href="#" class="page-link afterPage" data-pageno="'+(pageNo+1)+'">다음</a></li>'
	}
	rows +=	'</ul></nav>'
	$tfoot.append(rows);


}


