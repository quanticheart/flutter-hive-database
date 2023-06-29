import 'package:flutter/material.dart';

dialogAction(
  BuildContext context,
  VoidCallback callback, {
  String title = "Atenção",
  String? description,
}) async {
  await showDialog(
      context: context,
      builder: (internalContext) {
        return Dialog(
            backgroundColor: Colors.white70,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(Icons.warning_outlined),
                  const SizedBox(height: 8),
                  Text(title),
                  const SizedBox(height: 8),
                  if (description != null)
                    Column(
                      children: [
                        Text(
                          description,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                      ],
                    )
                  else
                    const SizedBox(height: 0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(16),
                            elevation: 0,
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(internalContext).pop();
                            callback();
                          },
                          child: const Text(
                            "Sim",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(16),
                            elevation: 0,
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(internalContext).pop();
                          },
                          child: const Text(
                            "Não",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      });
}
