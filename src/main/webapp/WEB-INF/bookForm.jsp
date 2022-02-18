<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Add New Book</title>
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
                    <div class="container col-6 p-5">
                        <div class="d-flex justify-content-between align-items-center pb-3">
                            <h2 class="text-center mb-4 ">Add a Book to your Shelf!</h2>
                            <a href="/books">back to the shelves!</a>
                        </div>
                        <div class="card mx-auto p-5 bg-secondary text-dark">
                            <form:form action="/books/data" method="POST" modelAttribute="book">
                                <div class="mb-3">
                                    <form:label path="title" for="formInput" class="form-label">Title:</form:label>
                                    <form:errors path="title" class="text-danger" />
                                    <form:input type="text" class="form-control" id="formInput" path="title"
                                        placeholder="" />
                                </div>
                                <div class="mb-3">
                                    <form:label path="authorName" for="formInput" class="form-label">Author Name:
                                    </form:label>
                                    <form:errors path="authorName" class="text-danger" />
                                    <form:input type="text" class="form-control" id="formInput" path="authorName"
                                        placeholder="" />
                                </div>
                                <div class="mb-3">
                                    <form:label path="thoughts" for="formControlTextarea" class="form-label">My
                                        thoughts:</form:label>
                                    <form:errors path="thoughts" class="text-danger" />
                                    <form:textarea class="form-control" id="formControlTextarea" path="thoughts"
                                        rows="4"></form:textarea>
                                </div>
                                <div>
                                    <form:input type="hidden" path="user" value="${user.id}" />
                                    
                                </div>

                                <div class="d-flex justify-content-end">
                                    <input type="submit" value="Submit" class="btn btn-primary fw-bold">
                                </div>
                            </form:form>
                        </div>
                    </div>
                </body>

                </html>