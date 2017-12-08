/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.entities.User;
import javax.ejb.Local;

/**
 *
 * @author Jennifer
 */
@Local
public interface adminUserLocal {

    User doLogin(String userName, String userPassword);
    
    boolean doRegister(User user);
}
