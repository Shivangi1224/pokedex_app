class Pokemon {
  final String name;
  final int height;
  final int weight;
  final String imageUrl;
  final List<String> types;
  final List<String> abilities;

  Pokemon({
    required this.name,
    required this.height,
    required this.weight,
    required this.imageUrl,
    required this.types,
    required this.abilities,
});

  factory Pokemon.fromJson(Map<String, dynamic > json) {
    return Pokemon(
        name: json['name'],
        height: json['height'],
        weight: json['weight'],
        imageUrl: json['sprites']['other']['official-artwork']['front_default'], // [] imagine these are drawers.
      // this location contains sharper images than the previous one
      // imageUrl: json['sprites']['front_default'], (from this to the above one)
        types: (json['types'] as List)
              .map((item) => item['type']['name'] as String)
              .toList(),
      abilities: (json['abilities'] as List)
          .map((item) => item['ability']['name'] as String)
          .toList(),
    );
  }
}