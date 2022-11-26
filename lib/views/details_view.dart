import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/details_store.dart';
import 'utils.dart';

class PokemonDetailsView extends StatefulWidget {
  const PokemonDetailsView({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  // Store

  final DetailsStore store = DetailsStore();

  // Lifecycle

  @override
  void initState() {
    store.viewIsReady(widget.url);
  }

  // Build UI

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                store.model?.name.toUpperCase() ?? "",
              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green[800],
              centerTitle: true,
            ),
            body: store.model != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              child: Image.network(
                                store.model!.frontDefault,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                                width: 150,
                                child: Image.network(
                                  store.model!.backDefault,
                                  fit: BoxFit.contain,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Weight',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '${store.model!.weight}',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Height',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '${store.model!.height}',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '${store.model!.order}',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Base experience',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '${store.model!.experience}',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 25,
                            color: Colors.green[800],
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Text(
                                  'Types',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          getTextWidgets(store.model!.types),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 25,
                            color: Colors.green[800],
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Text(
                                  'Abilities',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,  color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          getTextWidgets(store.model!.abilities),
                        ]),
                      ],
                    ),
                  )
                : Container()));
  }
}
