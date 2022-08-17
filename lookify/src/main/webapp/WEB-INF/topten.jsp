<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Lookify</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="d-flex justify-content-center m-4 container">
		<div class="align-items-center">
			<div class="row ml-5 mt-1 ">
				<div class="span6">
					<div class="row ml-5 mt-2 mr-4">
						<div class="col-md-3">
							<a href="/lookify/dashboard">Dashboard</a>
						</div>
						
					</div>
					<div class="row ml-5 mt-2 mr-3">
					<h1>Top Ten Songs </h1>
					<table class="table table-hover display nowrap mt-4">
							<thead>
								<tr>
									<th colspan="1">Title</th>
									<th colspan="1">Rating</th>
									<th colspan="2">Action</th>
								</tr>
							</thead>
							<tbody>
							  <c:forEach var="item" items="${lookifyList}">
									<tr>
										<td colspan="1"><a href="/lookify/${item.id}/view">
										<c:out value="${item.title}" />
										</a>
										
										</td>
										<td colspan="1">
										<c:out value="${item.rating}" /></td>
										<td colspan="1">
										<form action="/lookify/${item.id}/delete" method="POST">
												<input type="hidden" name="_method" value="DELETE">
												<input type="submit" value="delete"
													class="btn btn-link mb-1">
											</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>