<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : flightsList
    Created on : 08/12/2017, 23:12:11
    Author     : Jenn
--%>

<%@page import="java.util.List"%>
<%@page import="com.entities.Flight"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search results</title>

        <link rel="icon" href="images/duke.png">

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/blog-home.css" rel="stylesheet">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top d-flex pb-3 mb-3">
            <a class="navbar-brand" style="color:white;">Java EE TP</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="createFlight.jsp">Create flight</a>
                    </li>
                </ul>

                <li class="nav-item d-flex justify-content-end">
                    <a class="nav-link" href="index.html" style="color: white" title="Logout">                      
                        Logout
                        <i class="fa fa-sign-out fa-lg" aria-hidden="true"></i>
                    </a>
                </li>      
            </div>
        </nav>

        <br>

        <div class="container-fluid d-flex justify-content-center flex-md-column pb-4">

            <div class="col-sm-7 m-auto">
                <% List<Flight> eList = (List<Flight>) request.getAttribute("flights");%>
                <h4>Search: </h4>

                <label>Origin: <%= request.getAttribute("origin")%></label>
                <br>
                <label>Destination: <%= request.getAttribute("destination")%></label>
                <br>
                <label>Flights: <%= eList.size()%></label>

                <hr>

                <h4>Search results: </h4>

                <table id="resultsTable" class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Origin</th>
                            <th>Destination</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>

                        <% if (eList.size() > 0) { %>
                        <c:forEach var="row" items="${flights}">
                            <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
                                </c:forEach>
                            </tr>
                        </c:forEach>

                        <% } else { %>
                        <tr>
                            <td colspan=3 align="center"><b>No records found..</b></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>

                <div class="d-flex justify-content-end pb-4">
                    <a class="btn btn-info" href="home.jsp">Back to Home</a>
                </div>
            </div>

        </div>
    </body>
</html>
