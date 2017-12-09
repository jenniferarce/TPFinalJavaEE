<%@page import="com.entities.Flight"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : home
    Created on : 04/12/2017, 21:28:26
    Author     : Jenn
--%>

<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.lang.String"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="com.beans.adminFlightLocal"%>
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

        <%!
            //adminFlightLocal helloEjb;
%>
        <%
            //Context context = new InitialContext();
            //helloEjb = (adminFlight) context.lookup(adminFlightLocal.class.getName());
%>

        <div class="d-flex justify-content-start p-2">
            <h6>Bienvenido <%= request.getParameter("userName")%></h6>
            <!-- OBTENER EL NOMBRE DESDE LA VARIABLE SESSION -->
        </div>

        <br><br>

        <div class="container d-flex justify-content-center flex-md-column pb-4">

            <div class="col-sm-5 m-auto">
                <sql:setDataSource  var="co"   driver="com.mysql.jdbc.Driver" 
                                    url="jdbc:mysql://localhost:3306/tpfinal"
                                    user="javaee"
                                    password="1234"
                                    />

                <sql:query var="origins" dataSource="${co}">
                    SELECT DISTINCT(ORIGIN) FROM flights
                </sql:query>

                <sql:query var="destinations" dataSource="${co}">
                    SELECT DISTINCT(DESTINATION) FROM flights
                </sql:query>

                <sql:query var="flights" dataSource="${co}">
                    SELECT ORIGIN, DESTINATION, PRICE FROM flights
                </sql:query>

                <form method="GET" action="searchFlight">
                    <h4>Search flights</h4>

                    <div class="form-group">
                        <label for="origin">Origin</label>
                        <select class="form-control" id="origin" name="origin" style="width:100%">
                            <c:forEach var="row" items="${origins.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option><c:out value="${column}"/></option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="destination">Destination</label>
                        <select class="form-control" id="destination" name="destination">
                            <c:forEach var="row" items="${destinations.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option><c:out value="${column}"/></option>
                                </c:forEach>
                            </c:forEach>
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
                        <c:forEach var="row" items="${flights.rowsByIndex}">
                            <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>---</td>
                            <td>---</td>
                            <td>--</td>
                        </tr>
                        <c:forEach var="row" items="<%= request.getParameter("flights")%>">
                            <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
                                </c:forEach>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

                <hr>
                <h4>RESULTS: </h4>

                <table id="resultsTable" class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Origin</th>
                            <th>Destination</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="<%= request.getParameter("flights")%>">
                            <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
                                </c:forEach>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>

            <hr>
            <h2>TEST RESULTS: </h2>
            <table width="700px" align="center"
                   style="border:1px solid #000000;">
                <tr>
                    <td colspan=4 align="center"
                        style="background-color:teal">
                        <b>User Record</b></td>
                </tr>
                <tr style="background-color:lightgrey;">
                    <td><b>User Name</b></td>
                    <td><b>Password</b></td>
                    <td><b>Email</b></td>
                </tr>
                <%
                    int count = 0;
                    String color = "#F9EBB3";
                    if (request.getAttribute("flights") != null) {
                        ArrayList<Flight> al = (ArrayList<Flight>)request.getAttribute("flights");
                        System.out.println(al);
                        Iterator itr = al.iterator();
                        while (itr.hasNext()) {

                            if ((count % 2) == 0) {
                                color = "#eeffee";
                            }
                            count++;
                            ArrayList pList = (ArrayList)itr.next();
                            

                %>
                <tr style="background-color:<%=color%>;">
                    <td><%=pList.get(0)%></td>
                    <td><%=pList.get(1)%></td>
                    <td><%=pList.get(2)%></td>
                </tr>
                <%
                        }
                    }
                    if (count == 0) {
                %>
                <tr>
                    <td colspan=4 align="center"
                        style="background-color:#eeffee"><b>No Record Found..</b></td>
                </tr>
                <%            }
                %>
            </table>

        </div>


    </body>
</html>
