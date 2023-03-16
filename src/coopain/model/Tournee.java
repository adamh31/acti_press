package coopain.model;

import java.util.Date;
import java.util.ArrayList;

public class Tournee {

	private Date date;
	private int kmRealises; // nombre de km effectués pendant la tournée
	private Inseminateur leInseminateur;
	private ArrayList<Visite> lesVisites;

	public Tournee(Date uneDate, Inseminateur unInseminateur) {

	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
	}

	public int getKmRealises() {
		return kmRealises;
	}

	public void setKmRealises(int kmRealises) {

	}

	public Inseminateur getLeInseminateur() {
		return leInseminateur;
	}

	public ArrayList<Visite> getLesVisites() {
		return lesVisites;
	}

	public void ajouterVisite(Visite uneVisite) {

	}
}
