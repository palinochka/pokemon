import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/pokemons_list.dart';

class LocalStorage {

  static final shared = LocalStorage();

  static const _favoritesKey = "favorites_key";

  Future<List<OnePokemonModel>> loadFavoritesPokemons() async {
    final prefs = await SharedPreferences.getInstance();

    final result = prefs.getStringList(_favoritesKey)
        ?.map((e) => OnePokemonModel.fromJson(jsonDecode(e) as Map<String, dynamic>))
        .toList() ?? [];

    return result;
  }

  Future<void> addOrRemoveFavoritePokemon(OnePokemonModel pokemonModel) async {
    final prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList(_favoritesKey);

    if (result == null) {
      prefs.setStringList(_favoritesKey, [jsonEncode(pokemonModel)]);
      return;
    }
    bool isExist = result.contains(jsonEncode(pokemonModel));
    if (isExist) {
      result.removeWhere((element) => OnePokemonModel.fromJson(jsonDecode(element)).name == pokemonModel.name);
    } else {
      result.add(jsonEncode(pokemonModel));
    }

    prefs.setStringList(_favoritesKey, result);
  }
}