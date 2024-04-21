import 'package:flutter_native_resources/features/native_resources/presentation/providers/providers.dart';
import 'package:flutter_native_resources/my_app/app.dart';
import 'package:go_router/go_router.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _PokemonsView(),
    );
  }
}

class _PokemonsView extends ConsumerStatefulWidget {
  const _PokemonsView({super.key});

  @override
  PokemonsViewState createState() => PokemonsViewState();
}

class PokemonsViewState extends ConsumerState<_PokemonsView> {
  final scrollController = ScrollController();

  void infiteScroll() {
    final currentPokemons = ref.read(pokemonIdsProvider);
    if (currentPokemons.length > 400) {
      scrollController.removeListener(infiteScroll);
      return;
    }

    if ((scrollController.position.pixels + 200) >
        scrollController.position.maxScrollExtent) {
      ref.read(pokemonIdsProvider.notifier).update(
            (state) => [
              ...state,
              ...List.generate(30, (index) => state.length + index + 1),
            ],
          );
    }
  }

  @override
  void initState() {
    scrollController.addListener(infiteScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withOpacity(0.8),
        ),
        const _PokemonGrid(),
      ],
    );
  }
}

class _PokemonGrid extends ConsumerWidget {
  const _PokemonGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonIds = ref.watch(pokemonIdsProvider);
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: pokemonIds.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.push('/pokemons/${index + 1}'),
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
