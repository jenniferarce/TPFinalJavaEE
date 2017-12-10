<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : createFlight
    Created on : 09/12/2017, 17:46:49
    Author     : Jenn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Flight</title>

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

        <div class="container d-flex justify-content-center flex-md-column pb-4">

            <div class="col-sm-5 m-auto">

                <form method="POST" action="createFlight">
                    <h4>Create</h4>

                    <% if (request.getAttribute("isFlightCreated") != null) {
                            if (Boolean.parseBoolean(request.getAttribute("isFlightCreated").toString())) {%>
                    <div class="alert alert-success alert-dismissible">
                        <%= request.getAttribute("isCreated")%>
                    </div>
                    <%} else {%>
                    <div class="alert alert-danger alert-dismissible">
                        <%= request.getAttribute("isCreated")%>
                    </div>
                    <%}
                        }%>

                    <div class="form-group">
                        <label for="origin">Origin</label>
                        <input type="text" id="origin" class="form-control" name="origin">
                    </div>

                    <div class="form-group">
                        <label for="destination">Destination</label>
                        <input type="text" id="destination" class="form-control" name="destination">
                    </div>

                    <div class="form-group">
                        <label for="price">Price</label>
                        <input type="number" id="price" class="form-control" name="price">
                    </div>

                    <div class="form-inline d-flex justify-content-between">
                        <button class="btn btn-primary" type="submit">Submit</button>
                        <a class="btn btn-info" href="home.jsp">Back to Home</a>
                    </div>
                </form>
            </div>                   

        </div>

    </body>
</html>
