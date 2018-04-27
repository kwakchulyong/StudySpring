<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.1.0/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	  <h2>Member List</h2>
      <p>
		<table class="table table-striped">
			<thead>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>password</th>
			</tr>
			</thead>
			<tbody>
		  <c:forEach var="row" items="${memberList}">
			<tr>
				<td>${row.id}</td>
				<td>${row.name}</td>
				<td>${row.password}</td>
			</tr>
		  </c:forEach>
		  </tbody>
		</table>
      </p>
      <p>
        <button type="button" class="btn btn-sm btn-success" onclick="location.href='/'">Back</button>
      </p>
	</div>



</body>
</html>