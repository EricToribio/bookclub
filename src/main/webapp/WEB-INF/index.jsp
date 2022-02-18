<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Login</title>
                    <!-- for Bootstrap CSS -->
                    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
                    <!-- YOUR own local CSS -->
                    <link rel="stylesheet" type="text/css" href="/css/style.css">
                    <!-- For any Bootstrap that uses JS or jQuery-->
                    <script src="/webjars/jquery/jquery.min.js"></script>
                    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
                    <!-- YOUR own local JS -->
                    <script type="text/javascript" src="/js/app.js"></script>
                </head>

                <body>
                    <div class="d-flex justify-content-around p-5">
                        
                            <div class="card mx-auto p-5 bg-secondary text-dark">
                                <h2 class="text-center mb-4 text-white">Regsiter</h2>
                                <form:form action="/register" method="POST" modelAttribute="newUser">
                                    <div class="mb-3">
                                        <form:label path="userName" for="formInput" class="form-label">User Name:</form:label>
                                        <form:errors path="userName" class="text-danger" />
                                        <form:input type="text" class="form-control" id="formInput" path="userName"
                                            placeholder="" />
                                    </div>
                                    <div class="mb-3">
                                        <form:label path="email" for="formControlTextarea" class="form-label">
                                            email:</form:label>
                                        <form:errors path="email" class="text-danger" />
                                        <form:input class="form-control"  path="email"/>
                                    </div>
                                    <div class="mb-3">
                                        <form:label path="password" for="formInput" class="form-label">Password:
                                        </form:label>
                                        <form:errors path="password" class="text-danger" />
                                        <form:input type="password" class="form-control" id="formInput" path="password"
                                            placeholder="" />
                                    </div>
                                    <div class="mb-3">
                                        <form:label path="confirm" for="formInput" class="form-label">Confirm Password:
                                        </form:label>
                                        <form:errors path="confirm" class="text-danger" />
                                        <form:input type="password" class="form-control" id="formInput" path="confirm"
                                            placeholder="" />
                                    </div>
                                    <div class="d-flex justify-content-end">
                                        <input type="submit" value="Submit" class="btn btn-primary fw-bold">
                                    </div>
                                </form:form>
                            </div>
                        
                        <div class="card mx-auto p-5 bg-secondary text-dark">
                            <h2 class="text-center mb-4 text-white">login</h2>
                            <form:form action="/login" method="POST" modelAttribute="newLogin">
                              <div class="mb-3">
                                    <form:label path="email" for="formControlTextarea" class="form-label">
                                        email:</form:label>
                                    <form:errors path="email" class="text-danger" />
                                    <form:input class="form-control"  path="email"/>
                                </div>
                                <div class="mb-3">
                                    <form:label path="password" for="formInput" class="form-label">Password:
                                    </form:label>
                                    <form:errors path="password" class="text-danger" />
                                    <form:input type="password" class="form-control" id="formInput" path="password"
                                        placeholder="" />
                                </div>
                                <div class="d-flex justify-content-end">
                                    <input type="submit" value="Submit" class="btn btn-primary fw-bold">
                                </div>
                            </form:form>
                        </div>
                    </div>
                </body>

                </html>
