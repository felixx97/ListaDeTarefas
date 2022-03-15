import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                //expandido ate o limite do outro widget
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adicione uma Tafera',
                    hintText: 'EX. Estudar Flutter',
                  ),
                ),
              ),
              SizedBox(
                width: 8, //espaço vazio entre botão e a caixa de dialogo
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  //personalizar botão
                  primary: Colors.pink,
                  padding: EdgeInsets.all(14),
                ),
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
