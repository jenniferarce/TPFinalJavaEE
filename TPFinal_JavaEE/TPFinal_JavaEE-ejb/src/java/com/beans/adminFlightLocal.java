/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.entities.Flight;
import javax.ejb.Local;

/**
 *
 * @author Jenn
 */
@Local
public interface adminFlightLocal {
    public Flight doSearchFlight(String origin, String destination);
}
