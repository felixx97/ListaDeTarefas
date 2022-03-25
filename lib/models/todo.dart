class Todo {
  Todo({required this.title, required this.dateTime});

  Todo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        dateTime = DateTime.parse(json['datetime']);

  String title;
  DateTime dateTime;

  Map<String, dynamic> toJson() {
    //string significa a chave, dynamic. tipo de dado armazenado
    return {
      'title': title,
      'datetime': dateTime.toIso8601String(),
    };
  }
}
