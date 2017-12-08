/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.entities.User;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Jennifer
 */
@Stateless
public class adminUser implements adminUserLocal {

    @PersistenceContext
    private EntityManager em;

    @Override
    public User doLogin(String userName, String userPassword) {
        //PROBAR

        Query query = em.createQuery("SELECT u FROM User AS u WHERE u.userName='" + userName + "' AND u.userPassword='" + userPassword + "'");
        
        if (query.getResultList().isEmpty()) {
            return null;
        } else {
            return (User) query.getSingleResult();
        }

        //The @Table annotation is used for DB. 
        //If you need to change the name in your JPQL, use the @Entity annotation: 
        //@Entity(name="nameUsedInJPQL") => nameUsedInJPQL is used in your JPQL. 
        //If you do not specify anything in your @Entity, 
        //that the case-sensitive Entity class name is used.
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @Override
    public boolean doRegister(User user) {
        em.persist(user);
        
        if (em.contains(user)) {
            return true;
        }else{
            return false;
        }
    }
}
