<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>같이 보자! 공공연한사이</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/manager.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.color.js"></script>
<script type="text/javascript" src="/resources/js/custom.js"></script>
<script type="text/javascript"
	src="/resources/js/manager/mateManager.js"></script>
<script type="text/javascript"
	src="/resources/js/manager/mateManagerList.js"></script>
	
</head>
<body>
	<c:set var="topName" value="mate" />
	<%@ include file="../manager/common/managerTop.jsp"%>
	<div class="page-wrapper chiller-theme toggled">
		<%@ include file="../manager/common/managernavi.jsp"%>
		<div class="page-content">
			<div class="container-fluid">
				<div class="container">
					<div class="row">
						<div class="col-12 mt-5 p-3 text-center ">
							<h1>메이트 리스트</h1>
							<hr />
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<table class="table" id="matelist-table">
								<thead class="text-center">
									<tr>
										<th>P.ID</th>
										<th>공연</th>
										<th>카테고리</th>
										<th>공연일자</th>
										<th>공연시간</th>
										<th>회차</th>
										<th>R석</th>
										<th>S석</th>
										<th>A석</th>
										<th>메이트방 수</th>
										<th>수정</th>
										<th>삭제</th>
										<th>상세</th>
									</tr>
								</thead>
								<tbody class="text-center mb-4">
								</tbody>
								<tfoot class="mx-auto">
									<tr>
										<td colspan="13">
											
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>