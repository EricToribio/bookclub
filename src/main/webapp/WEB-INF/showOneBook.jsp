<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>View Book Details</title>
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

        <body class="">
            <div class="container col-6  p-5">
                <div class="d-flex justify-content-between align-items-center pb-3">
                    <h1>
                        <c:out value = "${book.title}"/>
                    </h1>
                    <a href="/books">back to the shelves!</a>
                </div>
                <div>
                    <h4>
                        <c:if test="${user_id == book.user.id }">You</c:if>
                        <c:if test="${user_id != book.user.id }"><c:out value="${book.user.userName}"/></c:if>
                        read <c:out value = "${book.title}"/> by <c:out value = "${book.authorName}"/>
                    </h4>
                </div>
                <div>
                    <p>
                        Here are
                        <c:if test="${user_id == book.user.id }">your</c:if>
                        <c:if test="${user_id != book.user.id }"><c:out value="${book.user.userName}"/>'s</c:if>
                        thoughts
                    </p>

                </div>
                <div>
                    <p>
                        <c:out value = "${book.thoughts}"/>
                    </p>
                </div>
                <div class="d-flex justify-content-end">
                    <c:if test="${user_id == book.user.id }">
                        <a class="btn btn-warning" href="/books/${book.id}/edit">Edit</a>
                    </c:if>
                </div>
            </div>
        </body>

        </html>