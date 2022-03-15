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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(
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
                  const SizedBox(
                    width: 8, //espaço vazio entre botão e a caixa de dialogo
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
              const SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text("Tarefa 1"),
                    subtitle: Text("20/11/2021"),
                    leading: const Icon(
                      Icons.save,
                      size: 25,
                    ),
                    onTap: () {
                      print("tarefa1");
                    },
                  ),
                  ListTile(
                    title: Text("Tarefa 2"),
                    subtitle: Text("25/11/2021"),
                    leading: const Icon(
                      Icons.save,
                      size: 25,
                    ),
                    onTap: () {
                      print("tarefa2");
                    },
                    onLongPress: () {
                      print("pressionou");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
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
