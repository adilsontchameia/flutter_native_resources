import '../../domain/domain.dart';
import '../models/pokeapi_response.dart';

class PokemonMapper {
  static Pokemon pokemonApiPokemonToEntity(Map<String, dynamic> json) {
    final pokeApiPokemon = PokemonResponse.fromJson(json);
    return Pokemon(
      id: pokeApiPokemon.id,
      name: pokeApiPokemon.name,
      spriteFront: pokeApiPokemon.sprites.frontDefault,
    );
  }
}
