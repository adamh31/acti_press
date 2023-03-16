package coopain.model;

public class TypePrestation {
// type de prestation

	private String libelle;
	private float prixForfaitaire;
// prix forfaitaire du type de prestation (prix forfaitaire d’un acte)

	public TypePrestation(String libelle, float prixForfaitaire) {
		this.libelle = libelle;
		this.prixForfaitaire = prixForfaitaire;
	}

	public float getPrixForfaitaire() {
		return prixForfaitaire;
	}

}
