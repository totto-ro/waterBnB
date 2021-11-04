<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Dashboard</title>
		<link rel="stylesheet" type="text/css" href="/css/styles.css">
	</head>
	<body>
		<main>
			<nav>
				<h1>
					Welcome back, 
					<c:out value="${firstName}"></c:out>
					<c:out value="${lastName}"></c:out>
				</h1>
				<h1> Current Listings</h1>
				<a href="/logout">Logout</a>
			</nav>
	<%--			<table>
			    <thead>
			        <tr>
			            <th>Address</th>
			            <th>Pool Size</th>
			            <th>Cost per night</th>
			            <th>Details</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach var="element" items="${poolList}">
			        <tr>
			        	<td>${ element.getAddress() }</td>
			        	<td>${ element.getPool_size() }</td>
			            <td>${ element.getCost() }</td>
			            <td class="actions" ><a href="/host/pools/${ element.id }">${ element.getRating() } - edit</a></td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
			<div>
				<h1>New Listing</h1>
				<form:form action="/place/new" method="POST" modelAttribute="place">
					<div class="form-group">
				        <form:label path="address">Address</form:label>
				        <form:errors path="address"/>
				        <form:input class="form-control" path="name"/>
				    </div>
				    <div class="form-group">
				        <form:label path="description">Description</form:label>
				        <form:errors path="description"/>
				        <form:textarea path="description"/>
				    </div>
				    <div class="form-group">
				        <form:label path="cost">Cost per night</form:label>
				        <form:errors path="cost"/>
				        <form:input type="number" path="cost"/>
				    </div>
				    <div>
				    	<select class="select" name="id" id="id">
				        <option value=""> -- Select Size -- </option>
				        
				        	<option class="option" value="${ place.pool_size }">Small</option>
				        	<option class="option" value="${ place.pool_size }">Medium</option>
				        	<option class="option" value="${ place.pool_size }">Big</option>
				    
				        </select>
				    </div>
				    <button>Add Listing</button>
				</form:form>
			</div>  --%>
			
		</main>
	</body>
</html>