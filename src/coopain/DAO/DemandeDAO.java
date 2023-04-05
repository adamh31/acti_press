/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package coopain.DAO;

import coopain.technic.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import javax.swing.JOptionPane;
import coopain.model.Commune;

/**
 *
 * @author r.pontello
 */
public class DemandeDAO {
    
    
    String BDD = "bdd_coopain";
    String url = "localhost/bdd_coopain";
    String user = "coopain";
    String passwd = "coopain";
    
    try{
    Connection conn = bdd_coopain.getConnect();
    String sql = "SELECT* FROM demande";
    
}catch(Exception e){
    System.out.println("Impossible de se connecter aux demandes");
}

    

}
