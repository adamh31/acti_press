/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coopain.model;

public class Adherent extends Personne {

	private String latitude;
	private String longitude;

	public Adherent(String unNom, String unPrenom, String unTelPortable, String uneLatitude,
	    String uneLongitude) {
		super(unNom, unPrenom, unTelPortable);

	}

	/* renvoie une chaîne de caractères composée de la latitude et de la longitude séparées par un espace */
	public String getCoordGPS() {
		return "";
	}

}
