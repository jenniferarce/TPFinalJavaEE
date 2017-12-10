/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.beans.adminUserLocal;
import com.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jennifer
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    @EJB
    private adminUserLocal adminUser;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String userName = request.getParameter("userName");
            String userPassword = request.getParameter("userPassword");

            User user = adminUser.doLogin(userName, userPassword);

            System.out.println(user.toString());
      
            if (user != null) {
                request.setAttribute("userName", user.getUserName());
;
                //Obtain the session object, create a new session if doesn't exist
                HttpSession session = request.getSession(true);

                //Check if our session variable is set, if so, get the session variable value
                //which is an Integer object, and add one to the value.
                //If the value is not set, create an Integer object with the default value 1.
                //Add the variable to the session overwriting any possible present values.
                String param = (String) session.getAttribute("MySessionVariable");
               /* if (param != null) {

                    session.setAttribute("MySessionVariable", new Integer(param.intValue() + 1));
                    param = (String) session.getAttribute("MySessionVariable");

                }*/ if(param == null) {
                    param = user.getUserName();
                    session.setAttribute("MySessionVariable", param);

                }

                request.getRequestDispatcher("home.jsp").forward(request, response);

            } else if (user == null) {
                out.println("<div class='alert alert-danger alert-dismissible'>");
                out.println("Incorrect user or password.");
                out.println("</div>");
                // out.println("<label style='color:red;'>Incorrect user or password.</label>");
                request.getRequestDispatcher("index.html").include(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
