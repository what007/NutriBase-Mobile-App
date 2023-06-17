// // // import 'package:demoapp/src/services/database_services.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:demoapp/loading.dart';
// // // import 'package:demoapp/model/to_do.dart';

// // // class TodoList extends StatefulWidget {
// // //   @override
// // //   _TodoListState createState() => _TodoListState();
// // // }

// // // class _TodoListState extends State<TodoList> {
// // //   bool isComplet = false; // just for now
// // //   TextEditingController todoTitleController = TextEditingController();
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     double width = MediaQuery.of(context).size.width;
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text("Todo List"),
// // //       ),
// // //       body: SafeArea(
// // //         child: StreamBuilder<List<Todo>>(
// // //             stream: DatabaseService().listTodos(),
// // //             builder: (context, snapshot) {
// // //               if (!snapshot.hasData) {
// // //                 return Loading();
// // //               }
// // //               List<Todo> todos = snapshot.data ?? [];
// // //               return Padding(
// // //                 padding: EdgeInsets.all(25),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     // Text(
// // //                     //   "All Todos",
// // //                     //   style: TextStyle(
// // //                     //     fontSize: 30,
// // //                     //     color: Colors.white,
// // //                     //     fontWeight: FontWeight.bold,
// // //                     //   ),
// // //                     // ),
// // //                     SizedBox(height: 10),
// // //                     Divider(
// // //                       color: Colors.grey[600],
// // //                     ),
// // //                     SizedBox(height: 20),
// // //                     ListView.separated(
// // //                       separatorBuilder: (context, index) => Divider(
// // //                         color: Colors.grey[800],
// // //                       ),
// // //                       shrinkWrap: true,
// // //                       itemCount: todos.length,
// // //                       itemBuilder: (context, index) {
// // //                         return Dismissible(
// // //                           key: Key(todos[index].title),
// // //                           background: Container(
// // //                             padding: EdgeInsets.only(left: 20),
// // //                             alignment: Alignment.centerLeft,
// // //                             child: Icon(Icons.delete),
// // //                             color: Colors.red,
// // //                           ),
// // //                           onDismissed: (direction) async {
// // //                             await DatabaseService()
// // //                                 .removeTodo(todos[index].uid);
// // //                             //
// // //                           },
// // //                           child: ListTile(
// // //                             onTap: () {
// // //                               DatabaseService().completTask(todos[index].uid);
// // //                             },
// // //                             leading: Container(
// // //                               padding: EdgeInsets.all(2),
// // //                               height: 30,
// // //                               width: 30,
// // //                               decoration: BoxDecoration(
// // //                                 color: Theme.of(context).primaryColor,
// // //                                 shape: BoxShape.circle,
// // //                               ),
// // //                               child: todos[index].isComplet
// // //                                   ? Icon(
// // //                                       Icons.check,
// // //                                       color: Colors.white,
// // //                                     )
// // //                                   : Container(),
// // //                             ),
// // //                             title: Text(
// // //                               todos[index].title,
// // //                               style: TextStyle(
// // //                                 fontSize: 20,
// // //                                 color: Colors.grey[200],
// // //                                 fontWeight: FontWeight.w600,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         );
// // //                       },
// // //                     )
// // //                   ],
// // //                 ),
// // //               );
// // //             }),
// // //       ),
// // //       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// // //       floatingActionButton: FloatingActionButton(
// // //         child: Icon(Icons.add),
// // //         backgroundColor: Theme.of(context).primaryColor,
// // //         onPressed: () {
// // //           showDialog(
// // //             context: context,
// // //             builder: (context) => SimpleDialog(
// // //               contentPadding: EdgeInsets.symmetric(
// // //                 horizontal: 25,
// // //                 vertical: 20,
// // //               ),
// // //               backgroundColor: Colors.grey[800],
// // //               shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(20),
// // //               ),
// // //               title: Row(
// // //                 children: [
// // //                   Text(
// // //                     "Add Todo",
// // //                     style: TextStyle(
// // //                       fontSize: 20,
// // //                       color: Colors.white,
// // //                     ),
// // //                   ),
// // //                   Spacer(),
// // //                   IconButton(
// // //                     icon: Icon(
// // //                       Icons.cancel,
// // //                       color: Colors.grey,
// // //                       size: 30,
// // //                     ),
// // //                     onPressed: () => Navigator.pop(context),
// // //                   )
// // //                 ],
// // //               ),
// // //               children: [
// // //                 Divider(),
// // //                 TextFormField(
// // //                   controller: todoTitleController,
// // //                   style: TextStyle(
// // //                     fontSize: 18,
// // //                     height: 1.5,
// // //                     color: Colors.white,
// // //                   ),
// // //                   autofocus: true,
// // //                   decoration: InputDecoration(
// // //                     hintText: "eg. exercise",
// // //                     hintStyle: TextStyle(color: Colors.white70),
// // //                     border: InputBorder.none,
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 20),
// // //                 SizedBox(
// // //                   width: width,
// // //                   height: 50,
// // //                   child: ElevatedButton(
// // //                     style: ElevatedButton.styleFrom(
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(20),
// // //                       ),
// // //                       primary: Theme.of(context).primaryColor,
// // //                     ),
// // //                     child: Text("Add"),
// // //                     onPressed: () async {
// // //                       if (todoTitleController.text.isNotEmpty) {
// // //                         await DatabaseService()
// // //                             .createNewTodo(todoTitleController.text.trim());
// // //                         Navigator.pop(context);
// // //                       }
// // //                     },
// // //                   ),
// // //                 )
// // //               ],
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }

// // // // class TodoList extends StatefulWidget {
// // // //   @override
// // // //   _TodoListState createState() => _TodoListState();
// // // // }

// // // // class _TodoListState extends State<TodoList> {
// // // //   bool isComplete = false; // just for now
// // // //   TextEditingController todoTitleController = TextEditingController();

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text("Todo List"),
// // // //       ),
// // // //       body: SafeArea(
// // // //         child: StreamBuilder<List<Todo>>(
// // // //           stream: DatabaseService().listTodos(),
// // // //           builder: (context, snapshot) {
// // // //             if (!snapshot.hasData) {
// // // //               return Loading();
// // // //             }
// // // //             List<Todo> todos = snapshot.data ?? [];
// // // //             return ListView.separated(
// // // //               padding: EdgeInsets.all(16),
// // // //               separatorBuilder: (context, index) => Divider(
// // // //                 color: Colors.grey[300],
// // // //               ),
// // // //               itemCount: todos.length,
// // // //               itemBuilder: (context, index) {
// // // //                 return Dismissible(
// // // //                   key: Key(todos[index].title),
// // // //                   background: Container(
// // // //                     alignment: Alignment.centerLeft,
// // // //                     color: Colors.red,
// // // //                     child: Padding(
// // // //                       padding: EdgeInsets.only(left: 16),
// // // //                       child: Icon(Icons.delete, color: Colors.white),
// // // //                     ),
// // // //                   ),
// // // //                   onDismissed: (direction) async {
// // // //                     await DatabaseService().removeTodo(todos[index].uid);
// // // //                     // Show a snackbar or perform any other action
// // // //                   },
// // // //                   child: ListTile(
// // // //                     onTap: () {
// // // //                       DatabaseService().completTask(todos[index].uid);
// // // //                     },
// // // //                     leading: Container(
// // // //                       height: 30,
// // // //                       width: 30,
// // // //                       decoration: BoxDecoration(
// // // //                         color: Theme.of(context).primaryColor,
// // // //                         shape: BoxShape.circle,
// // // //                       ),
// // // //                       child: Icon(
// // // //                         Icons.check,
// // // //                         color: Colors.white,
// // // //                         size: 16,
// // // //                       ),
// // // //                     ),
// // // //                     title: Text(
// // // //                       todos[index].title,
// // // //                       style: TextStyle(
// // // //                         fontSize: 16,
// // // //                         color: Colors.grey[800],
// // // //                         fontWeight: FontWeight.w600,
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 );
// // // //               },
// // // //             );
// // // //           },
// // // //         ),
// // // //       ),
// // // //       floatingActionButton: FloatingActionButton(
// // // //         child: Icon(Icons.add),
// // // //         onPressed: () {
// // // //           showDialog(
// // // //             context: context,
// // // //             builder: (context) => AlertDialog(
// // // //               title: Text("Add Todo"),
// // // //               content: TextFormField(
// // // //                 controller: todoTitleController,
// // // //                 decoration: InputDecoration(
// // // //                   hintText: "Enter a todo",
// // // //                 ),
// // // //               ),
// // // //               actions: [
// // // //                 TextButton(
// // // //                   child: Text("Cancel"),
// // // //                   onPressed: () => Navigator.pop(context),
// // // //                 ),
// // // //                 ElevatedButton(
// // // //                   child: Text("Add"),
// // // //                   onPressed: () async {
// // // //                     if (todoTitleController.text.isNotEmpty) {
// // // //                       await DatabaseService().createNewTodo(
// // // //                         todoTitleController.text.trim(),
// // // //                       );
// // // //                       Navigator.pop(context);
// // // //                     }
// // // //                   },
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           );
// // // //         },
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // import 'package:demoapp/src/services/database_services.dart';
// // import 'package:flutter/material.dart';
// // import 'package:demoapp/loading.dart';
// // import 'package:demoapp/model/to_do.dart';

// // class TodoList extends StatefulWidget {
// //   @override
// //   _TodoListState createState() => _TodoListState();
// // }

// // class _TodoListState extends State<TodoList> {
// //   bool isComplet = false; // just for now
// //   String _searchText = '';
// //   TextEditingController todoTitleController = TextEditingController();
// //   final _formKey = GlobalKey<FormState>();

// //   void _runFilter(String value) {
// //     setState(() {
// //       _searchText = value;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double width = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(100.0), // here the desired height
// //         child: AppBar(
// //           title: Text("Todo List"),
// //           bottom: PreferredSize(
// //             preferredSize: Size.fromHeight(48.0),
// //             child: Padding(
// //               padding: EdgeInsets.all(8.0),
// //               child: TextField(
// //                 onChanged: (value) {
// //                   _runFilter(value);
// //                 },
// //                 decoration: InputDecoration(
// //                   contentPadding: EdgeInsets.all(0),
// //                   prefixIcon: Icon(
// //                     Icons.search,
// //                     color: Colors.white,
// //                     size: 20,
// //                   ),
// //                   prefixIconConstraints: BoxConstraints(
// //                     maxHeight: 20,
// //                     minWidth: 25,
// //                   ),
// //                   border: InputBorder.none,
// //                   hintText: 'Search',
// //                   hintStyle: TextStyle(color: Colors.white),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: SafeArea(
// //         child: StreamBuilder<List<Todo>>(
// //           stream: DatabaseService().listTodos(),
// //           builder: (context, snapshot) {
// //             if (!snapshot.hasData) {
// //               return Loading();
// //             }
// //             List<Todo> todos = snapshot.data ?? [];
// //             // Filter the todos here:
// //             todos = todos
// //                 .where((todo) => todo.title
// //                     .toLowerCase()
// //                     .contains(_searchText.toLowerCase()))
// //                 .toList();
// //             return Padding(
// //               padding: EdgeInsets.all(25),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   SizedBox(height: 20),
// //                   Divider(
// //                     color: Theme.of(context).primaryColor,
// //                   ),
// //                   SizedBox(height: 20),
// //                   Expanded(
// //                     child: ListView.separated(
// //                       separatorBuilder: (context, index) => Divider(
// //                         color: Theme.of(context).primaryColor,
// //                       ),
// //                       itemCount: todos.length,
// //                       itemBuilder: (context, index) {
// //                         return Dismissible(
// //                           key: Key(todos[index].title),
// //                           background: Container(
// //                             padding: EdgeInsets.only(left: 20),
// //                             alignment: Alignment.centerLeft,
// //                             child: Icon(Icons.delete, color: Colors.white),
// //                             color: Colors.red,
// //                           ),
// //                           onDismissed: (direction) async {
// //                             await DatabaseService()
// //                                 .removeTodo(todos[index].uid);
// //                             ScaffoldMessenger.of(context).showSnackBar(
// //                                 SnackBar(content: Text("Todo item deleted")));
// //                           },
// //                           child: ListTile(
// //                             onTap: () {
// //                               DatabaseService().completTask(todos[index].uid);
// //                             },
// //                             leading: Container(
// //                               padding: EdgeInsets.all(2),
// //                               height: 30,
// //                               width: 30,
// //                               decoration: BoxDecoration(
// //                                 color: todos[index].isComplet
// //                                     ? Colors.green
// //                                     : Theme.of(context).primaryColor,
// //                                 shape: BoxShape.circle,
// //                               ),
// //                               child: todos[index].isComplet
// //                                   ? Icon(
// //                                       Icons.check,
// //                                       color: Colors.white,
// //                                     )
// //                                   : Container(),
// //                             ),
// //                             title: Text(
// //                               todos[index].title,
// //                               style: TextStyle(
// //                                 fontSize: 20,
// //                                 color: Theme.of(context).primaryColor,
// //                                 fontWeight: FontWeight.w600,
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// //       floatingActionButton: FloatingActionButton(
// //         child: Icon(Icons.add),
// //         backgroundColor: Theme.of(context).primaryColor,
// //         onPressed: () {
// //           showDialog(
// //             context: context,
// //             builder: (context) => AlertDialog(
// //               backgroundColor: Colors.grey[800],
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //               title: Text(
// //                 "Add Todo",
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               content: Form(
// //                 key: _formKey,
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     TextFormField(
// //                       controller: todoTitleController,
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         height: 1.5,
// //                         color: Colors.white,
// //                       ),
// //                       autofocus: true,
// //                       validator: (value) {
// //                         if (value?.isEmpty ?? true) {
// //                           return 'Please enter a task';
// //                         }
// //                         return null;
// //                       },
// //                       decoration: InputDecoration(
// //                         hintText: "eg. exercise",
// //                         hintStyle:
// //                             TextStyle(color: Colors.white.withOpacity(0.7)),
// //                         border: UnderlineInputBorder(),
// //                       ),
// //                     ),
// //                     SizedBox(height: 20),
// //                     SizedBox(
// //                       width: width,
// //                       height: 50,
// //                       child: ElevatedButton(
// //                         style: ElevatedButton.styleFrom(
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(20),
// //                           ),
// //                           primary: Theme.of(context).primaryColor,
// //                         ),
// //                         child:
// //                             Text("Add", style: TextStyle(color: Colors.white)),
// //                         onPressed: () async {
// //                           if (_formKey.currentState?.validate() ?? false) {
// //                             await DatabaseService()
// //                                 .createNewTodo(todoTitleController.text.trim());
// //                             Navigator.pop(context);
// //                             ScaffoldMessenger.of(context).showSnackBar(
// //                                 SnackBar(content: Text("Todo item added")));
// //                           }
// //                         },
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

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
//       ),
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: TextField(
//                 onChanged: (value) {
//                   _runFilter(value);
//                 },
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.all(15.0),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: Theme.of(context).primaryColor,
//                     size: 25,
//                   ),
//                   hintText: 'Search',
//                   hintStyle: TextStyle(
//                     color: Theme.of(context).primaryColor.withOpacity(0.7),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: StreamBuilder<List<Todo>>(
//                 stream: DatabaseService().listTodos(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Loading();
//                   }
//                   List<Todo> todos = snapshot.data ?? [];
//                   // Filter the todos here:
//                   todos = todos
//                       .where((todo) => todo.title
//                           .toLowerCase()
//                           .contains(_searchText.toLowerCase()))
//                       .toList();
//                   return Padding(
//                     padding: EdgeInsets.all(25),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 20),
//                         Divider(
//                           color: Theme.of(context).primaryColor,
//                         ),
//                         SizedBox(height: 20),
//                         Flexible(
//                           child: ListView.separated(
//                             separatorBuilder: (context, index) => Divider(
//                               color: Theme.of(context).primaryColor,
//                             ),
//                             itemCount: todos.length,
//                             itemBuilder: (context, index) {
//                               return Dismissible(
//                                 key: Key(todos[index].title),
//                                 background: Container(
//                                   padding: EdgeInsets.only(left: 20),
//                                   alignment: Alignment.centerLeft,
//                                   child:
//                                       Icon(Icons.delete, color: Colors.white),
//                                   color: Colors.red,
//                                 ),
//                                 onDismissed: (direction) async {
//                                   await DatabaseService()
//                                       .removeTodo(todos[index].uid);
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           content: Text("Todo item deleted")));
//                                 },
//                                 child: ListTile(
//                                   onTap: () {
//                                     DatabaseService()
//                                         .completTask(todos[index].uid);
//                                   },
//                                   leading: Container(
//                                     padding: EdgeInsets.all(2),
//                                     height: 30,
//                                     width: 30,
//                                     decoration: BoxDecoration(
//                                       color: todos[index].isComplet
//                                           ? Colors.green
//                                           : Theme.of(context).primaryColor,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: todos[index].isComplet
//                                         ? Icon(
//                                             Icons.check,
//                                             color: Colors.white,
//                                           )
//                                         : Container(),
//                                   ),
//                                   title: Text(
//                                     todos[index].title,
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       color: Theme.of(context).primaryColor,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
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
      ),
      body: SafeArea(
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
                                child: Icon(Icons.delete, color: Colors.white),
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
