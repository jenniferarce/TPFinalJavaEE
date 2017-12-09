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
        <title>JSP Page</title>
    </head>
    <body>
        Flights: <%= request.getAttribute("flights")%>

        <% List<Flight> eList = (List<Flight>) request.getAttribute("flights"); %>

        <h2>TEST RESULTS: </h2>
        <table id="resultsTable" class="table table-striped table-hover table-bordered">
            <thead>
                <tr>
                    <th>Origin</th>
                    <th>Destination</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>

            <c:forEach items="${eList}" var="employee">
                <tr>
                    <td> <c:out value="${employee.getOrigin()}"/></td>
                <td><c:out value="${employee.destination}"/></td>  
                <td><c:out value="${employee.price}"/></td>
                </tr>
            </c:forEach>

  <!--<c:forEach var="row" items="${request.getAttribute("flights")}">
      <tr>
      <c:forEach var="column" items="${row}">
          <td><c:out value="${column}"/></td>
      </c:forEach>
      </tr>
  </c:forEach>-->



                </tbody>
        </table>
    </body>
</html>
