import 'package:flutter_native_resources/config/pluguins/share_pluguin.dart';
import 'package:flutter_native_resources/my_app/app.dart';

import '../../domain/domain.dart';
import '../providers/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;
  const PokemonScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));
    return Scaffold(
      body: Center(
        child: pokemonAsync.when(
          data: (pokemon) {
            return _PokemonView(pokemon: pokemon);
          },
          error: (error, stackTrace) => _ErrorWidget(message: error.toString()),
          loading: () => const _LoadingWidget(),
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String message;
  const _ErrorWidget({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Error: $message')));
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;
  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
            onPressed: () {
              //Link => deep link
              SharePlugin.shareLink(pokemon.spriteFront, 'See this pokemon');
            },
            icon: const Icon(Icons.share_outlined),
          )
        ],
      ),
      body: Center(
        child: Image.network(
          pokemon.spriteFront,
          fit: BoxFit.contain,
          height: 150.0,
          width: 150.0,
        ),
      ),
    );
  }
}
