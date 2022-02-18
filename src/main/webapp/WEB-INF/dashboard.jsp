<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- c:out ; c:forEach etc. -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- Formatting (dates) -->
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- form:form -->
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!-- for rendering errors on PUT routes -->
                <%@ page isErrorPage="true" %>
                    <!DOCTYPE html>
                    <html>
                    <head>
                        <meta charset="UTF-8">
                        <title>All books</title>
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
                        <!-- Enter body here -->
                        <div class="col-4 container p-5">
                            <div class="d-flex justify-content-between align-items-center pb-3">
                                <h1>Welcome
                                    <c:out value = "${user.userName}"/>
                                </h1>
                                <form action="/logout" method="post"> 
                                    <button class="border-0 bg-transparent text-primary">Logout</button>
                                </form>
                            </div>
                            <div class="d-flex justify-content-between align-items-center pb-3">
                                <h5>Books from everyone's shelves</h5>
                                <a href="/books/new">+ Add to my shelf!</a>
                            </div>
                            <Table class="table table-striped table-bordered ">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Author Name</th>
                                        <th>Posted By</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="book" items="${books}">
                                        <tr>
                                            <td>
                                                <c:out value="${book.id}" />
                                            </td>
                                            <td>
                                                <a href="/books/${book.id}"><c:out value="${book.title}" /></a>
                                            </td>
                                            <td>
                                                <c:out value="${book.authorName}" />
                                            </td>
                                            <td>
                                                <c:out value="${book.user.userName}" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </Table>
                        </div>
                    </body>
                    </html>