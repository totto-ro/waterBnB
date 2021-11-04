<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Registration</title>
		<link rel="stylesheet" type="text/css" href="/css/register.css">
	</head>
	<body>
		<nav>
			<a href="/">Go Back</a>
		</nav>
		<main>
			
			<section class="leftSide">
			    <form class="newRegister" method="POST" action="/registration">
			    	<h1>Register!</h1>
				    <div class="addInput">
						<c:out value="${errorMessage}"></c:out>
					</div>
					<div class="addInput">
						<label for="first_name"> First name: </label>
						<input type="text" id="first_name" name="first_name" />
					</div>
					<div class="addInput">
						<label for="last_name"> Last name: </label>
						<input type="text" id="last_name" name="last_name" />
					</div>
					<div class="addInput">
						<label for="email"> Email: </label>
						<input type="text" id="email" name="email" />
					</div>
					<div class="addInput">
						<label for="password"> Password: </label>
						<input type="password" id="password" name="password" />
					</div>
					<div class="addInput">
						<label for="passwordConfirmation"> Password confirmation: </label>
						<input type="password" id="passwordConfirmation" name="passwordConfirmation" />
					</div>
					<div class="addInput">
						<select class="select" name="type_user" id="type_user">
				        <option value=""> -- Select Profile -- </option>
				        	<option class="option" value="${ 0 }">Host</option>
				        	<option class="option" value="${ 1 }">Guest</option>
				        </select>
					</div>
					<div class="addInput">
						<input class="button" type="submit" value="Register!"/>
					</div>
			    </form>
			</section>
			<section class="rightSide">
				<div class="userLogin">
					<h1>Login</h1>
				    <p><c:out value="${error}" /></p>
				    <form method="post" action="/login">
				        <p class="login">
				            <label for="email">Email: </label>
				            <input type="text" id="email" name="email"/>
				        </p>
				        <p class="login">
				            <label for="password">Password: </label>
				            <input type="password" id="password" name="password"/>
				        </p>
				        <div class="addInput">
				        	 <input class="button" type="submit" value="Login!"/>
				        </div>
				    </form>
				</div>
			
			</section>
		
				
		
		</main>
	</body>
</html>