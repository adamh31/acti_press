/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package coopain.model;

import java.util.ArrayList;
import java.text.SimpleDateFormat;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;


/**
 *
 * @author patrick
 */
public class GestionTourneeTest {

    private Inseminateur ins1;
    private Adherent adh1, adh2;
    private Visite v1, v2;
    private TypePrestation tp1, tp2;
    private Tournee t1;
    private GestionTournee gt;

    @Before
    public void setUp() throws Exception { // Méthode setup() automatiquement exécutée
// avant chaque appel de la méthode de test
        tp1 = new TypePrestation("Insémination", 100);
        tp2 = new TypePrestation("Echographie", 10);
        ins1 = new Inseminateur("Petit", "Ferdinand", "0600000100");
        adh1 = new Adherent("Duboeuf", "Georges", "0600000020", "48.5331", "7.72");
        adh2 = new Adherent("Cow", "Marguerite", "0600000003", "48.5833", "7.75");
        t1 = new Tournee(new SimpleDateFormat("dd-MM-yyyy").parse("06-05-2020"), ins1);
        gt = new GestionTournee(t1);
// Préparation des visites
// À compléter sur votre copie
    }

    @Test
    public void testCATournee() {
// À compléter sur votre copie
    }

}
