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
				<c:forEach var="concert" items="${concerts }">
					<div class="slide slide-background-img"
					style="background-image: url('/resources/sample-images/${concert.imagePath}'); cursor:pointer;" onclick="location.href='/performance/list.do?order=dateOrder&category=콘서트&pageNo=&changed=Y&title=${concert.title}&genre=전체&startDay=&endDay=&age=0'">
					<div class="container">
						<div class="row">
							<div class="col-6">
								<div class="row">
									<div class="col-12">
										<div class="row">
											<div class="col-12">
												<div class="content-title text-white">
													<div class="display-2 font-weight-bold text-center">
														<div>${concert.title }</div>
													</div>
												</div>
											</div>
											<!-- <div class="col-12">
												<div class="content-sub-title">
													<div class="display-4 text-white text-center mt-3">덴마크
														출신 팝 프린스</div>
												</div>
											</div> -->
											<div class="col-12">
												<div class="content-info mt-3">
													<div class="h4 text-white text-center">
														<span><fmt:formatDate value="${concert.startDate }" pattern="yyyy.MM.dd"/></span> <span>~</span> <span><fmt:formatDate value="${concert.endDate }" pattern="yyyy.MM.dd"/></span>
														<div>${concert.hallinfo.name }</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6 text-center"></div>
						</div>
					</div>
				</div>
				<!-- <div class="slide slide-background-img" 
				style="background-image: url('/resources/sample-images/sample-consert6.jpg');"></div> -->
				</c:forEach>
			</div>
			<div class="section" id="section1">
				<c:forEach var="musical" items="${musicals }">
				<div class="slide slide-background-img"
					style="background-image: url('/resources/sample-images/${musical.imagePath}'); cursor:pointer;" onclick="location.href='/performance/list.do?order=dateOrder&category=뮤지컬&pageNo=&changed=Y&title=${musical.title}&genre=전체&startDay=&endDay=&age=0'">
					<div class="container">
						<div class="row">
							<div class="col-6">
								<div class="row">
									<div class="col-12">
										<div class="row">
											<div class="col-12">
												<div class="content-title text-white">
													<div class="display-2 font-weight-bold text-center">
														<div>${musical.title }</div>
													</div>
												</div>
											</div>
											<!-- <div class="col-12">
												<div class="content-sub-title">
													<div class="display-4 text-white text-center mt-3">덴마크
														출신 팝 프린스</div>
												</div>
											</div> -->
											<div class="col-12">
												<div class="content-info mt-3">
													<div class="h4 text-white text-center">
														<span><fmt:formatDate value="${musical.startDate }" pattern="yyyy.MM.dd"/></span> <span>~</span> <span><fmt:formatDate value="${musical.endDate }" pattern="yyyy.MM.dd"/></span>
														<div>${musical.hallinfo.name }</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6 text-center"></div>
						</div>
					</div>
				</div>
				<!-- <div class="slide slide-background-img" 
				style="background-image: url('/resources/sample-images/sample-consert6.jpg');"></div> -->
				</c:forEach>
			</div>
			<div class="section" id="section1">
			<c:forEach var="theater" items="${theaters }">
				<div class="slide slide-background-img"
					style="background-image: url('/resources/sample-images/${theater.imagePath}'); cursor:pointer;" onclick="location.href='/performance/list.do?order=dateOrder&category=연극&pageNo=&changed=Y&title=${theater.title}&genre=전체&startDay=&endDay=&age=0'">
					<div class="container">
						<div class="row">
							<div class="col-6">
								<div class="row">
									<div class="col-12">
										<div class="row">
											<div class="col-12">
												<div class="content-title text-white">
													<div class="display-2 font-weight-bold text-center">
														<div>${theater.title }</div>
													</div>
												</div>
											</div>
											<!-- <div class="col-12">
												<div class="content-sub-title">
													<div class="display-4 text-white text-center mt-3">덴마크
														출신 팝 프린스</div>
												</div>
											</div> -->
											<div class="col-12">
												<div class="content-info mt-3">
													<div class="h4 text-white text-center">
														<span><fmt:formatDate value="${theater.startDate }" pattern="yyyy.MM.dd"/></span> <span>~</span> <span><fmt:formatDate value="${theater.endDate }" pattern="yyyy.MM.dd"/></span>
														<div>${theater.hallinfo.name }</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6 text-center"></div>
						</div>
					</div>
				</div>
				<!-- <div class="slide slide-background-img" 
				style="background-image: url('/resources/sample-images/sample-consert6.jpg');"></div> -->
			</c:forEach>
			</div>

			<!-- home footer -->

			<div class="fp-auto-height section" id="section4">
				<div class="footer" style="height: 200px;"></div>

			</div>
		</div>
	</div>
	<!-- body -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.8.9/jquery.fullPage.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#fullpage').fullpage({
				//options here
				slidesNavigation : true,
				slidesNavPosition : 'bottom',
				autoScrolling : true,
				navigation : true,
				controlArrows : false,
				navigationPosition : 'right',
				sectionsColor : [ '#fff', '#fff', '#fff', '#000000' ],
				keyboardScrolling : true,
			 afterRender: function () {
			        setInterval(function () {
			           $.fn.fullpage.moveSlideRight();
			       }, 3000);
			   }

			});

		});
	</script>

</body>
</html>