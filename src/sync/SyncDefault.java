package sync;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import controle.ServidorControl;
import modelo.local.ServidorBEAN;
import okhttp3.HttpUrl;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by itzda on 07/06/2018.
 */
public class SyncDefault {

    private static String ip = "localhost";
    private static String url ="http://ctrltechinfo.ddns.net/";
    private static String url2 ="http://192.168.1.100:8080/LojaServer/";
  private static String url3 =   "http://ctrltechinfo2.sytes.net/";
    
   /* private static HttpUrl baseUrl = new HttpUrl.Builder()
                    .scheme("http")
                    .host("localhost:8089/LojaServer")
                    .build();*/
 private static  Gson gson = new GsonBuilder()
        .setLenient()
        .create();
    public static final Retrofit RETROFIT_LOJA = new Retrofit.Builder().
            baseUrl(url2).
            addConverterFactory(GsonConverterFactory.create()).
            build();
   
}

