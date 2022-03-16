import 'package:flutter/material.dart';

class todoListItem extends StatelessWidget {
  const todoListItem({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 125, 86, 151),
      ),
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //posicionar itens na esquerda cross
        children: [
          Text(
            "20/11/2015",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.pink[200],
            ),
          )
        ],
      ),
    );
  }
}
