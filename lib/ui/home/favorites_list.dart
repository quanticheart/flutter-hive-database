import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivedatabase/repository/repository.dart';
import 'package:hivedatabase/ui/home/dialog.dart';
import 'package:hivedatabase/ui/home/widgets/empty_list.dart';

import '../../repository/model/amiibo.dart';

class ScreenFavorites extends StatefulWidget {
  const ScreenFavorites({Key? key, required this.repository}) : super(key: key);

  final Repository repository;

  @override
  State<ScreenFavorites> createState() => _ScreenFavoritesState();
}

class _ScreenFavoritesState extends State<ScreenFavorites> {
  @override
  void initState() {
    super.initState();
  }

  _delete(BuildContext context, int index, Amiibo data) {
    dialogAction(
      context,
      description: "Deseja realmente remover o favorito?",
      () {
        widget.repository.removeFavorite(data, index);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amiibos List'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ValueListenableBuilder(
          valueListenable: widget.repository.listenerFavorites(),
          builder: (BuildContext context, Box<Amiibo> value, Widget? child) {
            List<Amiibo> list = value.values.cast<Amiibo>().toList();
            if (list.isEmpty) {
              return const EmptyList();
            } else {
              return ListView.separated(
                separatorBuilder: (_, index) => const SizedBox(height: 16),
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var data = list[index];
                  return InkWell(
                    onTap: () => _delete(context, index, data),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.blueGrey[200],
                      child: ListTile(
                        title: Text(
                          data.name ?? "Empty",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        subtitle: Text(data.gameSeries ?? "",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black38)),
                        leading: SizedBox(
                          width: 70,
                          child: Image.network(data.image ?? ""),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
