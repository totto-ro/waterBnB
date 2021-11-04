<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Search</title>
		<link rel="stylesheet" type="text/css" href="/css/styles.css">
	</head>
	<body>
		<main>
			<nav>
				<h1>
					Welcome back 
					<c:out value="${user.first_name}"></c:out>
					<c:out value="${user.last_name}"></c:out>
				</h1>
				<a href="/">Home</a>
				<a href="/logout">Logout</a>
			</nav>
	<%--			<h1>Found Pools:</h1>
			<div>
				<h1>
					<c:out value="${messageNoPools}"></c:out>
				</h1>
			</div>
			<div>
				<form class="searh" action="/search">
					<input type="text" name="place"/>
					<button type="submit">Search</button>
				</form>
			</div>
			<table>
			    <thead>
			        <tr>
			            <th>Title</th>
			            <th>Rating</th>
			            <th>Actions</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach var="element" items="${placeList}">
			        <tr>
			            <td><a href="/search/${ element.id }">${ element.getAddress() }</a></td>
			            <td><c:out value="${ element.getPool_size() }"/></td>
			            <td class="actions" ><a href="/host/pools/${ element.id }">${ element.getRating() } - See more</a></td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>  --%>
		</main>
	</body>
</html>