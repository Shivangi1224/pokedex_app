import 'package:flutter/material.dart';
import '../models/pokemon.dart'; // .. -> go up one folder

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  // Maps a Pokémon type name to a matching color
  Color _typeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire': return const Color(0xFFFF6B4A);
      case 'water': return const Color(0xFF4FC3F7);
      case 'grass': return const Color(0xFF66BB6A);
      case 'electric': return const Color(0xFFFFD54F);
      case 'psychic': return const Color(0xFFF06292);
      case 'ice': return const Color(0xFF80DEEA);
      case 'dragon': return const Color(0xFF7E57C2);
      case 'dark': return const Color(0xFF5D4037);
      case 'fairy': return const Color(0xFFF8BBD0);
      case 'normal': return const Color(0xFFBDBDBD);
      case 'fighting': return const Color(0xFFD84315);
      case 'flying': return const Color(0xFF90A4AE);
      case 'poison': return const Color(0xFFAB47BC);
      case 'ground': return const Color(0xFFD7A86E);
      case 'rock': return const Color(0xFFA1887F);
      case 'bug': return const Color(0xFF9CCC65);
      case 'ghost': return const Color(0xFF7986CB);
      case 'steel': return const Color(0xFFB0BEC5);
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color mainColor = _typeColor(pokemon.types.first);

/*
    pokemon.types is a List<String> —
    Which could have one item (['electric']) or two (['grass', 'poison']).
    .first means "give me the item at position 0"
*/

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // gives roundness to the main card
      ),

      color: mainColor.withAlpha(190), // soft tint of the type color (opacity)

      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image with colored circular backdrop
            Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: mainColor.withAlpha(160),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  pokemon.imageUrl,
                  fit: BoxFit.contain,
                  /*
                    'fit' tells Flutter how to scale the image inside that space.
                    'BoxFit.contain' means:
                    "shrink or grow the image so it fits entirely inside the box,
                    keeping its original proportions —
                    even if that leaves empty space on the sides."
                    This prevents the Pokemon image from looking stretched or cropped.
                  */
                  errorBuilder: (context, error, stackTrace){
                    return const Icon(
                        Icons.broken_image,
                        size: 80,
                        color: Colors.grey
                    );
                  },
                  // instead of black box (when image cannot load)
                  // this shows broken image
                ),
              ),
            ),

            SizedBox(height: 16,),

            // Pokemon name: Capitalized

            Text(
              pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
                fontFamily: 'Poppins',
                height: 0.5,
              ),
            ),

            SizedBox(height: 12,),

            // Type chips, colored per-type

            Wrap(
              spacing: 8,           // horizontal gap between items (in pixels)
              runSpacing: 8,        // vertical gap if chips overflow wraps to a new line
              alignment: WrapAlignment.center,
              children: pokemon.types.map((type) {
                final chipColor = _typeColor(type);
                return Chip(
                  label: Text(
                    type.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      height: 0.5,
                    ),
                  ),
                  backgroundColor: chipColor,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                );
              }
              ).toList(),
            ),

            SizedBox(height: 20,),

            // Stat row: height + weight, in a light rounded box
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _statColumn(
                    Icons.height,
                    'Height',
                    '${pokemon.height / 10} m',
                  ),
                  _statColumn(
                      Icons.monitor_weight_outlined,
                      'Weight',
                      '${pokemon.weight / 10} kg',
                  ),
                  /*
                    ${...} inside a string is called string interpolation —
                    it lets you insert a variable's value directly into text.
                    'Height: ${pokemon.height}' becomes like "Height: 4" automatically.
                  */
                ],
              ),
            ),

            const SizedBox(height: 30,),

            Text(
              'Abilities: ${pokemon.abilities.join(', ')}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 0.8,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for one stat (icon + label + value)
  Widget _statColumn(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(
            icon,
            color: Colors.black54
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
          ),
        ),
      ],
    );
  }
}