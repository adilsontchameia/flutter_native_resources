import '../domain.dart';

abstract class PokemonRepository {
  Future<(Pokemon?, String)> getPokemon(String id);
}
