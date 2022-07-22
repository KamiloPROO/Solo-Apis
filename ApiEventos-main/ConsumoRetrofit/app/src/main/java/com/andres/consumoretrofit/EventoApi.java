package com.andres.consumoretrofit;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;

public interface EventoApi {

    @GET("eventos")
    Call<List<Evento>> leerTodo();
}
