/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.entities.Flight;
import javax.ejb.Stateless;

/**
 *
 * @author Jenn
 */
@Stateless
public class adminFlight implements adminFlightLocal {

    @Override
    public Flight doSearchFlight(String origin, String destination) {
        //TODO: DO SOMETHING
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

        //Este método deberá devolver una instancia de Flight en caso que existan registros con el
        //origen y el destino especificados. En caso de que no exista, deberá devolver NULL.
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
