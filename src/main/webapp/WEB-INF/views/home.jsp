<%@page import="com.sample.web.view.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>같이 보자! 공공연한사이</title>
<link rel="stylesheet" href="/resources/css/jquery.fullPage.css">
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript" src="/resources/js/custom.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.js"></script>
<script type="text/javascript" src="/resources/js/jquery.color.js"></script>
</head>
<style>
.card-img-top:hover{
	 cursor:pointer;
	 transform: scale(1.1);
	 -webkit-transition: transform 0.7s ease-in-out;
	 background-color: rgba(1,1,1,0.7);
}
</style>
<body>
	<!-- header start -->
	<header>
<%@ include file="common/navi.jsp" %>
	</header>
	<!-- header end -->
	<!-- body -->
	<div class="body">
		<div id="fullpage">
			<div class="section" id="section1">
				<c:forEach var="consert" items="${concerts }">
					<div class="slide">
						<div class="row">
							<div class="col-4 text-center" style="margin: auto 0;">
								<div class="text-white font-weight-bold" style="font-size: 4rem;" >${consert.title }</div>
								<div class="text-white" style="font-size: 2rem;">
									<span><fmt:formatDate value="${consert.startDate }"
											pattern="yyyy.MM.dd" /></span> <span>~</span> <span><fmt:formatDate
										value="${consert.endDate }" pattern="yyyy.MM.dd" /></span>
									<div>${consert.hallinfo.name }</div>
								</div>
							</div>
							<div class="col-4">
								<div class="d-flex justify-content-center">
								<!-- card -->
									<div class="card shadow transfrom-card" style="width: 30rem;">
										<div class="card-body">
											<img class="card-img-top" style="width: 438px; height: 613px;" src="/resources/sample-images/${consert.imagePath}" alt="" />
										</div>
										<div class="card-footer">
											<div class="row">
												<div class="col-12 text-center">
												 <c:forEach var="genre" items="${consert.genres }"> 
													<button class="btn btn-link" onclick="searchGenre('${genre}')">#${genre }</button>
												</c:forEach>
												</div>
											</div>
										</div>
									</div>
								<!-- card -->
								</div>
							</div>
							<div class="col-4 text-center" style="margin: auto 0; padding: 100px;">
								<div class="row">
									<div class="col-12 bg-white card shadow" style="padding: 30px;">
										Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nobis minima perferendis reiciendis eius provident aut eveniet consectetur voluptates dicta soluta praesentium debitis non ab enim quis at ipsum officia iusto! Delectus totam accusamus quibusdam? Repellendus nulla vero consequuntur fugiat autem quidem rem. Quod necessitatibus corporis est explicabo sit perspiciatis illum mollitia laudantium consequatur dolores dolore aliquid molestiae consectetur quia nisi odio quae odit placeat a iusto hic ducimus voluptatem excepturi. Hic veritatis dicta esse possimus non quam eius? Aspernatur deserunt ratione cupiditate quasi aperiam. Minima modi dolores deserunt dolore ut assumenda quo omnis soluta. Eveniet qui ea in nemo quam!
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="section" id="section1">
				<c:forEach var="musical" items="${musicals }">
				<div class="slide slide-background-img"
					 style="background-color:rgba(1,1,1,0.9); background-size:40% 100%; background-position:right;
					 		background-image: url('/resources/sample-images/${musical.imagePath}'); cursor:pointer;" onclick="location.href='/performance/list.do?order=dateOrder&category=콘서트&pageNo=&changed=Y&title=${musical.title}&genre=전체&startDay=&endDay=&age=0'">
					<div class="container-fluid">
						<div class="row">
							<div class="col-8 ele-opacity">
									<div class="text-white font-weight-bold" style="font-size: 8rem;" >${musical.title }</div>
										<div class="text-white" style="font-size: 4rem;">
											<span><fmt:formatDate value="${musical.startDate }"
													pattern="yyyy.MM.dd" /></span> <span>~</span> <span><fmt:formatDate
													value="${musical.endDate }" pattern="yyyy.MM.dd" /></span>
											<div>${musical.hallinfo.name }</div>
										</div>
							</div>
							<div class="col-4">
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<div class="section" id="section1">
			<c:forEach var="theater" items="${theaters }">
				<div class="slide slide-background-img"
					 style="background-color:rgba(1,1,1,0.9); background-size:40% 100%; background-position:right;
					 		background-image: url('/resources/sample-images/${theater.imagePath}'); cursor:pointer;" onclick="location.href='/performance/list.do?order=dateOrder&category=콘서트&pageNo=&changed=Y&title=${theater.title}&genre=전체&startDay=&endDay=&age=0'">
					<div class="container-fluid">
						<div class="row">
							<div class="col-8 ele-opacity">
									<div class="text-white font-weight-bold" style="font-size: 8rem; opacity: 0" >${theater.title }</div>
										<div class="text-white" style="font-size: 4rem; opacity: 0;">
											<span><fmt:formatDate value="${theater.startDate }"
													pattern="yyyy.MM.dd" /></span> <span>~</span> <span><fmt:formatDate
													value="${theater.endDate }" pattern="yyyy.MM.dd" /></span>
											<div>${theater.hallinfo.name }</div>
										</div>
								</div>
							<div class="col-4">
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- home footer -->
			<div class="fp-auto-height section" id="section4">
				<div class="footer" style="height: 200px;">
					 <%@ include file="common/footer.jsp" %>
				</div>
			</div>
		</div>
	</div>
	<!-- body -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.8.9/jquery.fullPage.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.ele-opacity').css('opacity','0').animate({
				opacity:'1'
			}, 2000);
			
			
			$('#fullpage').fullpage({
				//options here
				slidesNavigation : true,
				slidesNavPosition : 'bottom',
				autoScrolling : true,
				navigation : true,
				controlArrows : false,
				navigationPosition : 'right',
				sectionsColor : [ '#4F5051', '#C87D26', '#fff', '#000000' ],
				keyboardScrolling : true
//				afterRender: function () {
//					setInterval(function () {
//				    	$.fn.fullpage.moveSlideRight();
//				    	$('.ele-opacity').css('opacity','0').animate({
//							opacity:'1'
//						}, 2000);
//				    }, 5000);
//			   }
//
			});

		});
	</script>

</body>
</html>