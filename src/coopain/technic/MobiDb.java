package coopain.technic;

import android.database.sqlite.SQLiteOpenHelper;
import android.content.Context;
import android.database.sqlite.*;


//class MobiDb : classe pour la création de la base de données locale SQlite et des tables
public abstract class MobiDb extends SQLiteOpenHelper {

	private static final android.content.Context context = null;
// Constructeur

	public MobiDb(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
		super(context, name, factory, version);
	}
// Méthode pour créer les tables inseminateur, vehicule et histoKm

	@Override // Surcharge d’une méthode héritée
	public void onCreate(SQLiteDatabase db) {
		String strReq = "CREATE TABLE inseminateur(id INTEGER PRIMARY KEY AUTOINCREMENT,nom TEXT, prenom TEXT)";
		db.execSQL(strReq);
		strReq = "CREATE TABLE vehicule(id INTEGER PRIMARY KEY AUTOINCREMENT,immat TEXT, marque TEXT, modele TEXT, dateAchat TEXT)";
		db.execSQL(strReq);

	}
}
