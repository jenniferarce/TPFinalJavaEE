/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.entities.Flight;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author Jenn
 */
@Stateless
public class adminFlight implements adminFlightLocal {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Flight> doSearchFlight(String origin, String destination) {
        TypedQuery tQuery = (TypedQuery) em.createQuery("SELECT f.origin, f.destination, f.price FROM Flight AS f WHERE f.origin='" + origin + "' AND f.destination='" + destination + "'");

        System.out.println("flights size : " + tQuery.getResultList().size());

        List<Flight> flights = new ArrayList<>(tQuery.getResultList());

        return flights;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @Override
    public List<String> doSearchDestinations() {

        TypedQuery tQuery = (TypedQuery) em.createQuery("SELECT DISTINCT(f.destination) FROM Flight AS f");

        List<String> destinations = tQuery.getResultList();

        return destinations;
    }

    @Override
    public List<String> doSearchOrigins() {
        TypedQuery tQuery = (TypedQuery) em.createQuery("SELECT DISTINCT(f.origin) FROM Flight AS f");

        List<String> origins = tQuery.getResultList();
        System.out.println("Origins size " + origins.size());
        for (String origin : origins) {
            System.out.println("Origin: " + origin);
        }
        return origins;
    }
}
