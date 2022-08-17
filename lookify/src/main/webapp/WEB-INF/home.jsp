<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Lookify</title>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="d-flex justify-content-center m-4 container home">
		<div class="align-items-center">
			<div class="row ml-5 mt-1 ">
				<div class="span6">
					<div class="row ml-5 mt-2 mr-3 ">
						<h1 class="form-heading mb-5 mr-3">WELCOME TO LOOKIFY !!</h1>

						<form class="form align-items-right ml-4 mt-5"
							action="/lookify/dashboard" method="GET">
							<button type="submit" class="btn btn-link text-right">start
								exploring ..</button>

						</form>

					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>