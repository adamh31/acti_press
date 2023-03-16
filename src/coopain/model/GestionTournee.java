package coopain.model;

import java.util.ArrayList;

public class GestionTournee {

    private Tournee laTournee;
// Constructeur

    public GestionTournee(Tournee uneTournee) {
        this.laTournee = uneTournee;
    }
// Ajoute la visite uneVisite à la liste des visites de la tournée

    public void ajouterVisite(Visite uneVisite) {
        laTournee.ajouterVisite(uneVisite);
    }
// Retourne la liste des adhérents visités sur la tournée
// un adhérent n'est visité qu'une seule fois au cours de la tournée

    public ArrayList<Adherent> getAdherents() {
        ArrayList<Adherent> lesAdherents = null;
// À compléter sur votre copie
        return lesAdherents;
    }

// Retourne le montant total à facturer pour l’ensemble des visites de la tournée
    public float CATournee() {
        float ca = 0.0F;
        for (Visite v : this.laTournee.getLesVisites()) {
            ca += v.montantAfacturer();
        }
// Cette méthode fera l’objet d’un test unitaire
        return ca;
    }
// Retourne le montant total à facturer pour l’ensemble des visites de la tournée
// correspondant au type de prestation passé en paramètre

    public float CATournee(TypePrestation unTypePrestation) {
        float ca = 10000;
        return ca;
    }
}
