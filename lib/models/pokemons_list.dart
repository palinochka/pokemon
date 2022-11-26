class PokemonList {
  PokemonList.fromJson(Map<String, dynamic> map)
      : result = (map["results"] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .map((e) => OnePokemonModel(name: e["name"], url: e["url"]))
        .toList(),
        next = map["next"],
        prev = map["prev"];

  final List<OnePokemonModel> result;
  final String? next;
  final String? prev;
}

class OnePokemonModel {

  OnePokemonModel({
    required this.name,
    required this.url
  });

  factory OnePokemonModel.fromJson(Map<String,dynamic> json) {
    return OnePokemonModel(name: json["name"], url: json["url"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["url"] = url;
    return data;
  }

  OnePokemonModel like() {
    final self = this;
    self.isLiked = true;
    return self;
  }

  bool isLiked = false;
  late String imageUrl;

  final String name;
  final String url;
}