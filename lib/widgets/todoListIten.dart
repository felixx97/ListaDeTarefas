import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class todoListItem extends StatelessWidget {
  const todoListItem({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 75, 126, 202),
        ),
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //posicionar itens na esquerda cross
          children: [
            Text(
              DateFormat('dd/MM/yy - HH:mm').format(todo.dateTime),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            )
          ],
        ),
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            label: 'Delete',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (context) {},
          ),
        ],
      ),
    );
  }
}
