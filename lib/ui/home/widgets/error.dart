import 'package:flutter/widgets.dart';

class ErrorOnData extends StatelessWidget {
  const ErrorOnData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Erro ao carregar os dados"));
  }
}
