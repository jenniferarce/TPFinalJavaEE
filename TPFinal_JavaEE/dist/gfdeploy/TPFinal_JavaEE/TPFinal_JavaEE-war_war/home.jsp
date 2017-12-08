<%-- 
    Document   : home
    Created on : 04/12/2017, 21:28:26
    Author     : Jenn
--%>

<%@page import="com.beans.adminFlight"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TP</title>

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
                    <!-- <li class="nav-item">
                         <a class="nav-link" href="#">Features</a>
                     </li>
                     <li class="nav-item">
                         <a class="nav-link" href="#">Pricing</a>
                     </li>
                     <li class="nav-item">
                         <a class="nav-link" href="#">About</a>
                     </li>-->

                </ul>

                <li class="nav-item d-flex justify-content-end">
                    <a class="nav-link" href="index.html" style="color: white" title="Logout">                      
                        Logout
                        <i class="fa fa-sign-out fa-lg" aria-hidden="true"></i>
                    </a>
                </li>
                <!-- <form class="form-inline my-2 my-lg-0">
                     <input class="form-control mr-sm-2" type="text" placeholder="Search">
                     <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                 </form>-->           
            </div>
        </nav>
        <br>
        <div class="d-flex justify-content-start p-2">
            <h6>Bienvenido <%= request.getParameter("userName")%></h6>
            <!-- OBTENER EL NOMBRE DESDE LA VARIABLE SESSION -->
        </div>

        <br><br>
<!-- 
        <%  //  List<String> aux = adminFlight.doSearchDestinations() %> -->
        
        <div class="container d-flex justify-content-center flex-md-column">

            <div class="col-sm-5 m-auto">
                <form method="GET" action="searchFlight">
                    <h4>Search flights</h4>
                    <div class="form-group">
                        <label for="origin">Origen</label>
                        <select class="form-control" id="origin" name="origin" style="width:100%">
                            <option>Buenos Aires</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="destination">Destino</label>
                        <select class="form-control" id="destination" name="destination">
                            <option>Londres</option>
                        </select>
                    </div>

                    <button class="btn btn-primary" type="submit">
                        <i class="fa fa-search"></i>
                        Search
                    </button>

                </form>
            </div>

            <div class="col-sm-7 pt-3 m-auto">
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Origin</th>
                            <th>Destination</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Buenos Aires</td>
                            <td>Londres</td>
                            <td>55.000</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>
