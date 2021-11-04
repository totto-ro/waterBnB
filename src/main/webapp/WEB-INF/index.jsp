<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Index</title>
		<link rel="stylesheet" type="text/css" href="/css/styles.css">
	</head>
	<body>
		<main>
			<nav>
				<a href="/registration">Signin / Signup</a>
			</nav>
			<h1>Find places to swim and sleep on water bnb</h1>
			<div>
				<form class="searh" action="/search">
					<input type="text" name="place"/>
					<button type="submit">Search</button>
				</form>
			</div>
		</main>
	</body>
</html>