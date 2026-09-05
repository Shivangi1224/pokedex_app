import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonErrorWidget extends StatelessWidget {
  final String message;

  const PokemonErrorWidget({super.key, this.message = 'Pokémon not found'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.red.withAlpha(15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/illustrations/not_found.svg',
              height: 160,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Try checking the spelling or search another one.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: Colors.black54,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}