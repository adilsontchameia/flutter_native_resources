import 'package:dio/dio.dart';
import 'package:flutter_native_resources/features/pokemons/insfrastructure/mappers/pokemon_mapper.dart';

import '../../domain/domain.dart';

class PokemonsDatasourceImpl implements PokemonsDatasource {
  final Dio dio;

  PokemonsDatasourceImpl()
      : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    try {
      final response = await dio.get('/pokemon/$id');
      final pokemon = PokemonMapper.pokemonApiPokemonToEntity(response.data);

      return (pokemon, 'Success...');
    } catch (e) {
      return (null, 'Could not get a Pokemon: $e');
    }
  }
}
