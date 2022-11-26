// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on _MainStore, Store {
  Computed<String?>? _$_nextPageUrlComputed;

  @override
  String? get _nextPageUrl =>
      (_$_nextPageUrlComputed ??= Computed<String?>(() => super._nextPageUrl,
              name: '_MainStore._nextPageUrl'))
          .value;
  Computed<bool>? _$_isLastPageLoadedComputed;

  @override
  bool get _isLastPageLoaded => (_$_isLastPageLoadedComputed ??= Computed<bool>(
          () => super._isLastPageLoaded,
          name: '_MainStore._isLastPageLoaded'))
      .value;
  Computed<List<OnePokemonModel>>? _$unitsComputed;

  @override
  List<OnePokemonModel> get units =>
      (_$unitsComputed ??= Computed<List<OnePokemonModel>>(() => super.units,
              name: '_MainStore.units'))
          .value;
  Computed<List<OnePokemonModel>>? _$favoriteUnitsComputed;

  @override
  List<OnePokemonModel> get favoriteUnits => (_$favoriteUnitsComputed ??=
          Computed<List<OnePokemonModel>>(() => super.favoriteUnits,
              name: '_MainStore.favoriteUnits'))
      .value;

  late final _$_favoritesPokemonsAtom =
      Atom(name: '_MainStore._favoritesPokemons', context: context);

  @override
  List<OnePokemonModel> get _favoritesPokemons {
    _$_favoritesPokemonsAtom.reportRead();
    return super._favoritesPokemons;
  }

  @override
  set _favoritesPokemons(List<OnePokemonModel> value) {
    _$_favoritesPokemonsAtom.reportWrite(value, super._favoritesPokemons, () {
      super._favoritesPokemons = value;
    });
  }

  late final _$_pokemonsAtom =
      Atom(name: '_MainStore._pokemons', context: context);

  @override
  List<OnePokemonModel> get _pokemons {
    _$_pokemonsAtom.reportRead();
    return super._pokemons;
  }

  @override
  set _pokemons(List<OnePokemonModel> value) {
    _$_pokemonsAtom.reportWrite(value, super._pokemons, () {
      super._pokemons = value;
    });
  }

  late final _$_lastLoadedListAtom =
      Atom(name: '_MainStore._lastLoadedList', context: context);

  @override
  PokemonList? get _lastLoadedList {
    _$_lastLoadedListAtom.reportRead();
    return super._lastLoadedList;
  }

  @override
  set _lastLoadedList(PokemonList? value) {
    _$_lastLoadedListAtom.reportWrite(value, super._lastLoadedList, () {
      super._lastLoadedList = value;
    });
  }

  late final _$viewIsReadyAsyncAction =
      AsyncAction('_MainStore.viewIsReady', context: context);

  @override
  Future<void> viewIsReady() {
    return _$viewIsReadyAsyncAction.run(() => super.viewIsReady());
  }

  late final _$onFavoriteClickAsyncAction =
      AsyncAction('_MainStore.onFavoriteClick', context: context);

  @override
  Future<void> onFavoriteClick(OnePokemonModel model) {
    return _$onFavoriteClickAsyncAction.run(() => super.onFavoriteClick(model));
  }

  late final _$loadPokemonsAsyncAction =
      AsyncAction('_MainStore.loadPokemons', context: context);

  @override
  Future<void> loadPokemons() {
    return _$loadPokemonsAsyncAction.run(() => super.loadPokemons());
  }

  @override
  String toString() {
    return '''
units: ${units},
favoriteUnits: ${favoriteUnits}
    ''';
  }
}
