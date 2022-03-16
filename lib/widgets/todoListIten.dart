import 'package:flutter/material.dart';

class todoListItem extends StatelessWidget {
  const todoListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[700],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //posicionar itens na esquerda cross
        children: const [
          Text(
            "20/11/2015",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            'tarefa 1',
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
