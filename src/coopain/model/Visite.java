package coopain.model;

import java.util.ArrayList;

public class Visite {

    private Adherent leAdherent;
    private String heure; // sous la forme hh:mm par exemple "09:00"
    private ArrayList<PrestationVisite> lesPrestationsVisite;

    public Visite(Adherent unAdherent, String uneHeure) {
    }

    public Adherent getLeAdherent() {
        return leAdherent;
    }

    public String getHeure() {
        return heure;
    }

    public ArrayList<PrestationVisite> getLesPrestationsVisite() {
        return lesPrestationsVisite;
    }

    public void ajouterPrestationVisite(TypePrestation unTypePrestation, int unNombreActes) {
    }
// Retourne le montant total à facturer pour la visite
// le montant d’une prestation de la visite s’obtient
// en multipliant le nombre d’actes réalisés par le prix forfaitaire du type de la prestation

    public float montantAfacturer() {
        float montant = 0;
        // À compléter
        return montant;
    }
}
