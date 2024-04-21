import '../domain.dart';

abstract class PokemonsDatasource {
  Future<(Pokemon?, String)> getPokemon(String id);
}
