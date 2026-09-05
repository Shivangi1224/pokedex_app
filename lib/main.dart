import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/pokemon_page.dart';
import 'viewmodels/pokemon_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (context) => PokemonViewModel(),
        child: const PokemonPage(),
      ),
    );
  }
}