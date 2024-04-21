import 'package:flutter_native_resources/features/pokemons/insfrastructure/repositories/pokemons_repository_impl.dart';
import 'package:flutter_native_resources/my_app/app.dart';

import '../../domain/domain.dart';

final pokemonsRepositoryProvider = Provider<PokemonRepository>((ref) {
  return PokemonRepositoryImpl();
});

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {
  final pokemonRepository = ref.watch(pokemonsRepositoryProvider);
  final (pokemon, error) = await pokemonRepository.getPokemon(id);

  if (pokemon != null) return pokemon;

  throw error;
});
