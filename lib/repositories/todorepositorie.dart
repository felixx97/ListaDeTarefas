import 'dart:convert';

import 'package:flutter_application_2/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const todoListKey = 'todo_list';

class Todorepository {
  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos) {
    //recebera uma lista de Todos
    final String jsonString = json.encode(todos);
    print(jsonString);
    sharedPreferences.setString(todoListKey, jsonString);
  }
}
