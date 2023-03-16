package coopain.model;

public class Personne {

	private String nom;
	private String prenom;
	private String telPortable;

	public Personne(String unNom, String unPrenom, String unTelPortable) {
		// code de la methode
		nom = unNom;
		prenom = unPrenom;
		telPortable = unTelPortable;
	}
// Accesseurs : get & set ...
	public String getNom() {
		return nom;
	}

	public String getPrenom() {
		return prenom;
	}
	// autres methodes si besoin
}
