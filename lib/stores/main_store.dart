// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:mobx/mobx.dart';

import '../models/pokemons_list.dart';
import '../network/pokemon_service.dart';
import '../prefs/local_storage.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {

  // Private

  @observable
  List<OnePokemonModel> _favoritesPokemons = [];

  @observable
  List<OnePokemonModel> _pokemons = [];

  @observable
  PokemonList? _lastLoadedList;

  @computed
  String? get _nextPageUrl => _lastLoadedList?.next;

  @computed
  bool get _isLastPageLoaded => _lastLoadedList?.next == null && _lastLoadedList != null;

  // Public

  @computed
  List<OnePokemonModel> get units => _pokemons
      .where((element) => !_favoritesPokemons._containsPokemon(element))
      .toList();

  @computed
  List<OnePokemonModel> get favoriteUnits => _favoritesPokemons
      .map((e) => e.like())
      .toList();

  // Actions

  @action
  Future<void> viewIsReady() async {
    _updateFavoritePokemons();
    loadPokemons();
  }

  @action
  Future<void> onFavoriteClick(OnePokemonModel model) async {
    LocalStorage.shared.addOrRemoveFavoritePokemon(model);
    _updateFavoritePokemons();
  }

  @action
  Future<void> loadPokemons() async {
    if (_isLastPageLoaded) {}


    if (_nextPageUrl != null) {
      _lastLoadedList = await PokemonService.shared
          .getPokemonListFromUrl(nextPageUrl: _nextPageUrl!);
    } else {
      _lastLoadedList = await PokemonService.shared.getPokemonList();
    }

    var pokemons = _lastLoadedList?.result ?? [];

    for (var pokemon in pokemons) {
      var model = await PokemonService.shared.getPokemonDetails(url: pokemon.url);
      pokemon.imageUrl = model.frontDefault;
    }

    _pokemons += pokemons;

  }

  // Private function

  Future<void> _updateFavoritePokemons() async {
    final favoritesPokemon = await LocalStorage.shared.loadFavoritesPokemons();

    for (var pokemon in favoritesPokemon) {
      var model = await PokemonService.shared.getPokemonDetails(url: pokemon.url);
      pokemon.imageUrl = model.frontDefault;
    }

    _favoritesPokemons = favoritesPokemon;
  }
}

// Extensions

extension on List<OnePokemonModel> {
  bool _containsPokemon(OnePokemonModel element) {
    for (OnePokemonModel e in this) {
      if (e.name == element.name) return true;
    }
    return false;
  }
}
