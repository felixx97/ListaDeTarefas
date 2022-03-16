import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/todoListIten.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    //expandido ate o limite do outro widget
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma Tafera',
                        hintText: 'EX. Estudar Flutter',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      String text = todoController.text;
                      setState(() {
                        todos.add(text);
                      });
                      todoController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      //personalizar botão
                      primary: Colors.pink,
                      padding: const EdgeInsets.all(14.5),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Flexible(
                //permitir que a lista não ultrapasse o tamanho maximo
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (String todo in todos) todoListItem(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    //maior largura possivel
                    child: Text(
                      "Você possui 0 tarefas pendentes",
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      //personalizar botão
                      primary: Colors.pink,
                      padding: const EdgeInsets.all(14.5),
                    ),
                    child: Text('Limpar tudo'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
