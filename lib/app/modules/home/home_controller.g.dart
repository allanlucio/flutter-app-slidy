// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$pokemonsAtom = Atom(name: '_HomeController.pokemons');

  @override
  ObservableFuture<List<PokemonModel>> get pokemons {
    _$pokemonsAtom.context.enforceReadPolicy(_$pokemonsAtom);
    _$pokemonsAtom.reportObserved();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableFuture<List<PokemonModel>> value) {
    _$pokemonsAtom.context.conditionallyRunInAction(() {
      super.pokemons = value;
      _$pokemonsAtom.reportChanged();
    }, _$pokemonsAtom, name: '${_$pokemonsAtom.name}_set');
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic fetchPokemons() {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super.fetchPokemons();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'pokemons: ${pokemons.toString()}';
    return '{$string}';
  }
}
