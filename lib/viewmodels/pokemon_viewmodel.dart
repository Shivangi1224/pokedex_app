import 'package:flutter/foundation.dart';
import '../models/pokemon.dart';
import '../repository/pokemon_repository.dart';

enum ViewState { initial, loading, success, error }

class PokemonViewModel extends ChangeNotifier {
  final PokemonRepository _repository = PokemonRepository();

  ViewState currentState = ViewState.initial;
  Pokemon? pokemon;
  String errorMessage = '';

  Future<void> searchPokemon(String name) async {
    if (name.trim().isEmpty) {
      errorMessage = 'Please enter a Pokémon name';
      currentState = ViewState.error;
      notifyListeners();
      return;
    }

    currentState = ViewState.loading;
    notifyListeners();

    try {
      pokemon = await _repository.getPokemon(name.trim().toLowerCase());
      currentState = ViewState.success;
    } catch (e) {
      pokemon = null;
      errorMessage = 'Could not find "$name". Check the spelling and try again.';
      currentState = ViewState.error;
    }

    notifyListeners();
  }

  void reset() {
    currentState = ViewState.initial;
    pokemon = null;
    errorMessage = '';
    notifyListeners();
  }
}