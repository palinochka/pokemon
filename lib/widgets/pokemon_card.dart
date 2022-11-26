import 'package:flutter/material.dart';

import '../assets_mini/icons.dart';
import '../models/pokemons_list.dart';
import '../views/utils.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard(
      {Key? key,
      required this.onePokemonModel,
      required this.onTap,
      required this.onRoute})
      : super(key: key);

  final OnePokemonModel onePokemonModel;
  final Function(OnePokemonModel) onTap;
  final Function(String url) onRoute;

  @override
  Widget build(BuildContext context) {
    bool isLiked = onePokemonModel.isLiked;
    String buttonText = isLiked ? "DISLIKE" : "LIKE";
    return GestureDetector(
      onTap: () {
        onRoute(onePokemonModel.url);
      },
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(width: 1.3, color: Colors.grey),
        ),
        child: Column(
          children: [
            Image.network(onePokemonModel.imageUrl),
            Text(
              onePokemonModel.name.capitalize(),
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                const Spacer(),
                OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5);
                          return null; // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      onTap(onePokemonModel);
                    },
                    child: Row(
                      children: [
                        Text(buttonText,
                            style: TextStyle(color: Colors.green[800])),
                        !isLiked
                            ? const Icon(
                                MyFlutterApp.heart,
                                color: Colors.green,
                              )
                            : Container()
                      ],
                    )),
                const Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
