package com.andres.consumoretrofit;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class EventosView extends AppCompatActivity {

    private String baseUrl = "http://192.168.171.64:3001/api/";
    private List<Evento> lista = new ArrayList<>();
    private EventoAdapter adapter;
    private RecyclerView rvlista;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_eventosview);


        leerTodo();
    }

    private void leerTodo() {

        adapter = new EventoAdapter(lista, this);
        rvlista = findViewById(R.id.listaEventos);
        rvlista.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL,false));
        rvlista.setAdapter(adapter);


        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(baseUrl)
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        EventoApi eventoApi = retrofit.create(EventoApi.class);

        Call<List<Evento>> res = eventoApi.leerTodo();

        res.enqueue(new Callback<List<Evento>>() {
            @Override
            public void onResponse(Call<List<Evento>> call, Response<List<Evento>> response) {
                lista.clear();
                lista.addAll(response.body());
                adapter.notifyDataSetChanged();
                Toast.makeText(EventosView.this, "Eventos " + lista.size(), Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onFailure(Call<List<Evento>> call, Throwable t) {
                t.printStackTrace();
                Toast.makeText(EventosView.this, "Error" + t.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });

    }
}