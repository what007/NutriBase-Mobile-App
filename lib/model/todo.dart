class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Push Up', isDone: true),
      ToDo(id: '02', todoText: 'Bicep Curl', isDone: true),
      ToDo(
        id: '03',
        todoText: '3KM run',
      ),
      ToDo(
        id: '04',
        todoText: '50 Sit Ups',
      ),
      ToDo(
        id: '05',
        todoText: 'Pull Ups',
      ),
      ToDo(
        id: '06',
        todoText: 'Lunges',
      ),
    ];
  }
}
