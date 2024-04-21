import '../../domain/domain.dart';
import '../insfrastructure.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonsDatasource datasource;

  PokemonRepositoryImpl(PokemonsDatasource? datasource)
      : datasource = datasource ?? PokemonsDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) {
    return datasource.getPokemon(id);
  }
}
