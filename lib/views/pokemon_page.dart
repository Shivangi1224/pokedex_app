import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/pokemon_viewmodel.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/pokemon_card.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final TextEditingController _controller = TextEditingController();

  Widget _buildBody(PokemonViewModel viewModel) {
    switch (viewModel.currentState) {
      case ViewState.initial:
        return const Text('Search for a Pokémon to get started.');
      case ViewState.loading:
        return const LoadingWidget();
      case ViewState.error:
        return const PokemonErrorWidget();
      case ViewState.success:
        return PokemonCard(pokemon: viewModel.pokemon!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pokédex',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  height: 0.5,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.catching_pokemon_outlined, size: 30),
            ],
          ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Consumer<PokemonViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Search box + button
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Search Pokémon...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () async {
                          await viewModel.searchPokemon(_controller.text);

                          if (viewModel.currentState == ViewState.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(viewModel.errorMessage),
                                backgroundColor: Colors.red[400],
                              ),
                            );
                          }
                        },
                        child: Text('Search'),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  _buildBody(viewModel),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}