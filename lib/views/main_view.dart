
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_section_list/flutter_section_grid.dart';

import '../models/pokemons_list.dart';
import '../stores/main_store.dart';
import '../widgets/pokemon_card.dart';
import 'details_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SectionAdapterMixin, SectionGridAdapterMixin {

  // Controllers

  ScrollController scrollController = ScrollController();

  // Store

  final MainStore store = MainStore();

  // Lifecycle

  @override
  void initState() {
    super.initState();
    store.viewIsReady();

    scrollController.addListener(() {
      if (scrollController.position.extentAfter < 600) {
        store.loadPokemons();
      }
    });
  }

  // Build UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.green[800],
      ),
      body: Observer(
          builder: (_) => SectionGridView.builder(
                adapter: this,
            controller: scrollController,
          )),
    );
  }

  // Routes

  void routeToDetails(BuildContext context, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PokemonDetailsView(url: url))
    );
  }

  // Sectioned Grid

  @override
  Widget getItem(BuildContext context, IndexPath indexPath) {
    EdgeInsets inset = getSectionInsets(indexPath.section);
    double totalWidth = crossAxisExtent - inset.left - inset.right;
    double width;
    double height;

    width = totalWidth / 2 - getCrossAxisSpacing(indexPath.section);
    height = width;

    OnePokemonModel model;

    if (store.favoriteUnits.isEmpty) {
      model = store.units[indexPath.item];
    } else {
      model = indexPath.section == 0
          ? store.favoriteUnits[indexPath.item]
          : store.units[indexPath.item];
    }

    return SizedBox(
      width: width,
      height: height,
      child: PokemonCard(
        onePokemonModel: model,
        onTap: store.onFavoriteClick,
        onRoute: (String url) {
          routeToDetails(context, url);
        },
      ),
    );
  }

  @override
  int numberOfItems(int section) {
    if (store.favoriteUnits.isEmpty) {
      return store.units.length;
    }
    return section == 0 ? store.favoriteUnits.length : store.units.length;
  }

  @override
  int numberOfSections() {
    return store.favoriteUnits.isEmpty ? 1 : 2;
  }

  @override
  double getMainAxisSpacing(int section) {
    return 5;
  }

  @override
  double getCrossAxisSpacing(int section) {
    return 5;
  }

  @override
  EdgeInsets getSectionInsets(int section) {
    return const EdgeInsets.fromLTRB(10, 8, 10, 8);
  }

  @override
  bool shouldExistSectionHeader(int section) {
    return true;
  }

  @override
  double getHeaderItemSpacing(int section) {
    return 5;
  }

  @override
  Widget getSectionHeader(BuildContext context, int section) {
    String sectionName;
    if (store.favoriteUnits.isEmpty) {
      sectionName = "All";
    } else {
      sectionName = section == 0 ? "Favorites" : "All";
    }
    return SizedBox(
      height: 45,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              sectionName,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
