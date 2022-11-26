import 'package:dio/dio.dart';

import '../models/pokemons.dart';
import '../models/pokemons_list.dart';

class PokemonService {

  static final shared = PokemonService();

  final Dio _dio = Dio();

  Future<PokemonList> getPokemonList() async {
    final response = await _dio.get(
      "https://pokeapi.co/api/v2/pokemon"
    );
    return PokemonList.fromJson(response.data);
  }

  Future<PokemonList> getPokemonListFromUrl({
    required String nextPageUrl
  }) async {
    final response = await _dio.get(
        nextPageUrl
    );
    return PokemonList.fromJson(response.data);
  }

  Future<PokemonModel> getPokemonDetails({required String url}) async {
    final response = await _dio.get(url);
    return PokemonModel.fromJson(response.data);
  }
}
