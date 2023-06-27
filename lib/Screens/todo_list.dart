// import 'package:demoapp/src/services/database_services.dart';
// import 'package:flutter/material.dart';
// import 'package:demoapp/loading.dart';
// import 'package:demoapp/model/to_do.dart';

// class TodoList extends StatefulWidget {
//   @override
//   _TodoListState createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   bool isComplet = false; // just for now
//   String _searchText = '';
//   TextEditingController todoTitleController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   void _runFilter(String value) {
//     setState(() {
//       _searchText = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Todo List"),
//         backgroundColor: Colors.purple,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   onChanged: (value) {
//                     _runFilter(value);
//                   },
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     contentPadding: EdgeInsets.all(15.0),
//                     prefixIcon: Icon(
//                       Icons.search,
//                       color: Theme.of(context).primaryColor,
//                       size: 25,
//                     ),
//                     hintText: 'Search',
//                     hintStyle: TextStyle(
//                       color: Theme.of(context).primaryColor.withOpacity(0.7),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: StreamBuilder<List<Todo>>(
//                   stream: DatabaseService().listTodos(),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return Loading();
//                     }
//                     List<Todo> todos = snapshot.data ?? [];
//                     todos = todos
//                         .where((todo) => todo.title
//                             .toLowerCase()
//                             .contains(_searchText.toLowerCase()))
//                         .toList();

//                     return Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: ListView.separated(
//                         separatorBuilder: (context, index) =>
//                             SizedBox(height: 10),
//                         itemCount: todos.length,
//                         itemBuilder: (context, index) {
//                           return Card(
//                             elevation: 2,
//                             child: Dismissible(
//                               key: Key(todos[index].title),
//                               background: Container(
//                                 padding: EdgeInsets.only(left: 20),
//                                 alignment: Alignment.centerLeft,
//                                 child: Icon(Icons.delete, color: Colors.white),
//                                 color: Colors.red,
//                               ),
//                               onDismissed: (direction) async {
//                                 await DatabaseService()
//                                     .removeTodo(todos[index].uid);
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                         content: Text("Todo item deleted")));
//                               },
//                               child: ListTile(
//                                 onTap: () {
//                                   DatabaseService()
//                                       .completTask(todos[index].uid);
//                                 },
//                                 leading: Container(
//                                   padding: EdgeInsets.all(2),
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     color: todos[index].isComplet
//                                         ? Colors.green
//                                         : Theme.of(context).primaryColor,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: todos[index].isComplet
//                                       ? Icon(
//                                           Icons.check,
//                                           color: Colors.white,
//                                         )
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todos[index].title,
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Theme.of(context).primaryColor,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 subtitle: Text(todos[index].details ??
//                                     ''), // Replace this with actual field
//                                 trailing: Text(todos[index].createdDate ??
//                                     ''), // Replace this with actual field
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         backgroundColor: Theme.of(context).primaryColor,
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               backgroundColor: Colors.grey[800],
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               title: Text(
//                 "Add Todo",
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white,
//                 ),
//               ),
//               content: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       controller: todoTitleController,
//                       style: TextStyle(
//                         fontSize: 18,
//                         height: 1.5,
//                         color: Colors.white,
//                       ),
//                       autofocus: true,
//                       validator: (value) {
//                         if (value?.isEmpty ?? true) {
//                           return 'Please enter a task';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         hintText: "eg. exercise",
//                         hintStyle:
//                             TextStyle(color: Colors.white.withOpacity(0.7)),
//                         border: UnderlineInputBorder(),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     SizedBox(
//                       width: width,
//                       height: 50,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           primary: Theme.of(context).primaryColor,
//                         ),
//                         child:
//                             Text("Add", style: TextStyle(color: Colors.white)),
//                         onPressed: () async {
//                           if (_formKey.currentState?.validate() ?? false) {
//                             await DatabaseService()
//                                 .createNewTodo(todoTitleController.text.trim());
//                             Navigator.pop(context);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("Todo item added")));
//                           }
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:demoapp/src/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:demoapp/loading.dart';
import 'package:demoapp/model/to_do.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isComplet = false; // just for now
  String _searchText = '';
  TextEditingController todoTitleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _runFilter(String value) {
    setState(() {
      _searchText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade200,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      _runFilter(value);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.all(15.0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                        size: 25,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.7),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<Todo>>(
                    stream: DatabaseService().listTodos(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Loading();
                      }
                      List<Todo> todos = snapshot.data ?? [];
                      todos = todos
                          .where((todo) => todo.title
                              .toLowerCase()
                              .contains(_searchText.toLowerCase()))
                          .toList();

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 2,
                              child: Dismissible(
                                key: Key(todos[index].title),
                                background: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  alignment: Alignment.centerLeft,
                                  child:
                                      Icon(Icons.delete, color: Colors.white),
                                  color: Colors.red,
                                ),
                                onDismissed: (direction) async {
                                  await DatabaseService()
                                      .removeTodo(todos[index].uid);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Todo item deleted")));
                                },
                                child: ListTile(
                                  onTap: () {
                                    DatabaseService()
                                        .completTask(todos[index].uid);
                                  },
                                  leading: Container(
                                    padding: EdgeInsets.all(2),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: todos[index].isComplet
                                          ? Colors.green
                                          : Theme.of(context).primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: todos[index].isComplet
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          )
                                        : Container(),
                                  ),
                                  title: Text(
                                    todos[index].title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Text(todos[index].details ??
                                      ''), // Replace this with actual field
                                  trailing: Text(todos[index].createdDate ??
                                      ''), // Replace this with actual field
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text(
                "Add Todo",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: todoTitleController,
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: Colors.white,
                      ),
                      autofocus: true,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter a task';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "eg. exercise",
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.7)),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: width,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: Theme.of(context).primaryColor,
                        ),
                        child:
                            Text("Add", style: TextStyle(color: Colors.white)),
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            await DatabaseService()
                                .createNewTodo(todoTitleController.text.trim());
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Todo item added")));
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
