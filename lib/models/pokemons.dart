class PokemonModel {

  PokemonModel.fromJson(Map<String, dynamic> map)
      : name = map["name"],
        height = map["height"],
        weight = map["weight"],
        order = map["order"],
        experience = map["base_experience"],
        backDefault = map["sprites"]["back_default"],
        frontDefault = map["sprites"]["front_default"],
        types = (map["types"] as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .map((e) => e["type"]["name"] as String).toList(),
        abilities = (map["abilities"] as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .map((e) => e["ability"]["name"] as String).toList();

  final String name;
  final int height;
  final int weight;
  final int order;
  final int experience;

  final String backDefault;
  final String frontDefault;

  final List<String> types;
  final List<String> abilities;
}
