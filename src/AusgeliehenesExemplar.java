
import java.util.Date;

/**
 *
 * @author sieber
 */
public class AusgeliehenesExemplar {
    
    String mBarcode = "";
    String mRsn = "";
    String mNote1 = "";
    String mNote2 = "";
    Date mFaellig = new Date();
    boolean mVorgemerkt = false;
    String mVormerkNutzer = "";
    
    AusgeliehenesExemplar(String barcode, String rsn, String note1, String note2, Date faellig, boolean vorgemerkt, String vormerkNutzer) {
        mBarcode = barcode;
        mRsn = rsn;
        mNote1 = note1;
        mNote2 = note2;
        mFaellig = faellig;
        mVorgemerkt = vorgemerkt;
        mVormerkNutzer = vormerkNutzer;
    }
    
}
