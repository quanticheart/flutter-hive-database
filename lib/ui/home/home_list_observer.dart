import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivedatabase/repository/model/amiibo.dart';
import 'package:hivedatabase/repository/repository.dart';
import 'package:hivedatabase/ui/home/dialog.dart';
import 'package:hivedatabase/ui/home/widgets/empty_list.dart';
import 'package:hivedatabase/ui/home/widgets/error.dart';
import 'package:hivedatabase/ui/home/widgets/loading.dart';

class ScreenHomeListener extends StatefulWidget {
  const ScreenHomeListener({Key? key, required this.repository})
      : super(key: key);

  final Repository repository;

  @override
  State<ScreenHomeListener> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHomeListener> {
  int _status = 0;

  @override
  void initState() {
    super.initState();
    widget.repository.listListener().then(
          (value) => {
            if (value == false) {_status = 2} else {_status = 3},
            setState(() {})
          },
        );
  }

  _update() {
    widget.repository.listListener();
  }

  _delete(BuildContext context) {
    dialogAction(
      context,
      description: "Deseja realmente apagar todo o conteudo?",
      () {
        widget.repository.clear();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amiibos List'),
      ),
      body: SwitchCaseWidget(
        stateBuilder: (state) {
          if (state == 0) {
            return const Loading();
          }

          if (state == 2) {
            return const ErrorOnData();
          }

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ValueListenableBuilder(
                valueListenable: widget.repository.listener(),
                builder:
                    (BuildContext context, Box<Amiibo> value, Widget? child) {
                  List<Amiibo> list = value.values.cast<Amiibo>().toList();

                  if (list.isEmpty) {
                    return const EmptyList();
                  } else {
                    return ListView.separated(
                      separatorBuilder: (_, index) =>
                          const SizedBox(height: 16),
                      itemCount: list.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var data = list[index];
                        return Card(
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
                        );
                      },
                    );
                  }
                },
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => _delete(context),
                  tooltip: 'Delete',
                  child: const Icon(Icons.delete),
                ),
                const SizedBox(height: 16),
                FloatingActionButton(
                  onPressed: () => _update(),
                  tooltip: 'Reload',
                  child: const Icon(Icons.update),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
        activeState: _status,
      ),
    );
  }
}

class SwitchCaseWidget<T> extends StatelessWidget {
  final Widget? Function(T? t) stateBuilder;
  final T activeState;

  const SwitchCaseWidget({
    super.key,
    required this.stateBuilder,
    required this.activeState,
  });

  @override
  Widget build(BuildContext context) {
    return stateBuilder(activeState) ?? const SizedBox.shrink();
  }
}
