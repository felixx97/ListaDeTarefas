import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/todo.dart';
import 'package:flutter_application_2/repositories/todorepositorie.dart';
import 'package:flutter_application_2/widgets/todoListIten.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  final Todorepository todorepository = Todorepository();

  List<Todo> todos = [];
  Todo? deletedTodo;
  int? deletedTodoPos;

  String? errorText;

  @override
  void initState() {
    super.initState(); //metodo chamado na criação do widget

    todorepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma Tafera',
                          hintText: 'EX. Estudar Flutter',
                          errorText: errorText,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 189, 104, 132),
                              width: 2,
                            ),
                          ),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 184, 80, 153)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        String text = todoController.text;
                        if (text.isEmpty) {
                          setState(() {
                            errorText = 'O titulo não pode ser vazio';
                          });
                          return;
                        }
                        setState(() {
                          Todo newTodo = Todo(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          todos.add(newTodo);
                          errorText = null;
                        });
                        todoController.clear();
                        todorepository.saveTodoList(todos);
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
                      for (Todo todo in todos)
                        todoListItem(
                          todo: todo,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      //maior largura possivel
                      child: Text(
                        "Você possui ${todos.length} tarefas pendentes",
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: showDeleteConfirmationDialog,
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
      ),
    );
  }

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });
    todorepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars(); //limpando os snack bar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} foi removida com sucesso!',
          style: TextStyle(
            color: Colors.pink,
          ),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'desfazer',
          textColor: Colors.green,
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
            todorepository.saveTodoList(todos);
          },
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Limpar tudo?"),
        content: Text("certeza de apagar todas as tarefas"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(primary: Colors.pink),
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deletedAllTodos();
            },
            style: TextButton.styleFrom(primary: Colors.pink),
            child: Text("Limpar tudo"),
          ),
        ],
      ),
    );
  }

  void deletedAllTodos() {
    setState(() {
      todos.clear();
    });
    todorepository.saveTodoList(todos);
  }
}
