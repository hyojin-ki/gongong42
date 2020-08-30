$(function(){

	
	$.ajax({
		type:"POST",
		url:"/manager/mateManagementJson.do",
		success:function(result){
			
			
			var list = result.mateList;
			
			var $tbody = $('#matelist-table tbody');
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
				var showNumber = schedule.showTime;
				
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
				rows += '<td><button class="btn btn-primary" id="matelist-update-btn" type="button">수정</button></td>'
				rows += '<td><button class="btn btn-danger" id="matelist-delete-btn" type="button">삭제</button></td>'	
				rows += '<td><button class="btn btn-warning" id="matelist-detail-btn" type="button">상세</button></td>'	
				rows += '</tr>'
				
			
			}
			$tbody.append(rows);
			$('#matelist-table tbody tr td').addClass('align-middle');
			
			console.log('l : ',result.mateList.length)
			
			$tfoot = $('#matelist-table tfoot td');
			var rows = '';
			rows += '<nav class="page navigation mx-auto" style="width:273px">'
			rows += '<ul class="pagination mx-auto">'	
			rows += '<li class="page-item"><a href="#" class="page-link">이전</a></li>'
			rows += '<li class="page-item"><a href="#" class="page-link">1</a></li>'
			rows += '<li class="page-item"><a href="#" class="page-link">1</a></li>'
			rows += '<li class="page-item"><a href="#" class="page-link">1</a></li>'
			rows += '<li class="page-item"><a href="#" class="page-link">1</a></li>'
			rows += '<li class="page-item"><a href="#" class="page-link">1</a></li>'
			rows += '<li class="page-item"><a href="#" class="page-link">다음</a></li>'
			rows +=	'</ul></nav>'
			$tfoot.append(rows);
		}
		
		
		
	})
	
	
	
	
	
})


