<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Lookify</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<c:if test="${success != null}">
			<div class="alert alert-success" role="alert">
				<c:out value="${success}" />
			</div>
		</c:if>
	</div>
	<div class="d-flex justify-content-center m-4 container">
		<div class="align-items-center">
			<div class="row ml-5 mt-1 ">
				<div class="span6">
					<form:form class="form align-items-center mt-4"
						modelAttribute="list" action="/lookify/new" method="POST">
						<div class="row mb-3">
							<form:label class="form-label" path="title">Title:</form:label>
							<div class="col-12">
								<form:input type="text" path="title" cssClass="form-control"
									cssErrorClass="form-control is-invalid" />
								<form:errors cssClass="invalid-feedback" path="title" />
							</div>
						</div>

						<div class="row mb-3">
							<form:label class="form-label" path="artist">Artist:</form:label>
							<div class="col-12">
								<form:input type="text" path="artist" cssClass="form-control"
									cssErrorClass="form-control is-invalid" />
								<form:errors cssClass="invalid-feedback" path="artist" />
							</div>
						</div>

						<div class="row mb-3">
							<form:select class="form-select" path="rating"
								aria-label="Default select example">
								<option selected>Rating</option>
								<c:forEach var="i" begin="1" end="10">
									<form:option value="${i}">
										<c:out value="${i}" />
									</form:option>

								</c:forEach>
							</form:select>
							<form:errors cssClass="invalid-feedback" path="rating" />
						</div>

						<div class="row mb-3">
							<div class="col-12">
								<button class="btn btn-large btn-dark" type="submit">Add Song</button>
							</div>
						</div>
					</form:form>
					<div class="row mb-3">
							<div class="col-12">
								<a href="/lookify/dashboard">Dashboard</a>
							</div>
						</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>