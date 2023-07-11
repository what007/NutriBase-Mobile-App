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
// // //   String _searchText = '';
// // //   TextEditingController todoTitleController = TextEditingController();
// // //   final _formKey = GlobalKey<FormState>();

// // //   void _runFilter(String value) {
// // //     setState(() {
// // //       _searchText = value;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     double width = MediaQuery.of(context).size.width;

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text("Exercise List"),
// // //         backgroundColor: Colors.purple,
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             begin: Alignment.topCenter,
// // //             end: Alignment.bottomCenter,
// // //             colors: [
// // //               Colors.deepPurple.shade800,
// // //               Colors.deepPurple.shade200,
// // //             ],
// // //           ),
// // //         ),
// // //         child: SafeArea(
// // //           child: Padding(
// // //             padding: const EdgeInsets.all(8.0),
// // //             child: Column(
// // //               children: <Widget>[
// // //                 Padding(
// // //                   padding: const EdgeInsets.all(8.0),
// // //                   child: TextField(
// // //                     onChanged: (value) {
// // //                       _runFilter(value);
// // //                     },
// // //                     decoration: InputDecoration(
// // //                       filled: true,
// // //                       fillColor: Colors.grey[200],
// // //                       contentPadding: EdgeInsets.all(15.0),
// // //                       prefixIcon: Icon(
// // //                         Icons.search,
// // //                         color: Theme.of(context).primaryColor,
// // //                         size: 25,
// // //                       ),
// // //                       hintText: 'Search',
// // //                       hintStyle: TextStyle(
// // //                         color: Theme.of(context).primaryColor.withOpacity(0.7),
// // //                       ),
// // //                       border: OutlineInputBorder(
// // //                         borderRadius: BorderRadius.circular(25.0),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 Expanded(
// // //                   child: StreamBuilder<List<Todo>>(
// // //                     stream: DatabaseService().listTodos(),
// // //                     builder: (context, snapshot) {
// // //                       if (!snapshot.hasData) {
// // //                         return Loading();
// // //                       }
// // //                       List<Todo> todos = snapshot.data ?? [];
// // //                       todos = todos
// // //                           .where((todo) => todo.title
// // //                               .toLowerCase()
// // //                               .contains(_searchText.toLowerCase()))
// // //                           .toList();

// // //                       return Padding(
// // //                         padding: const EdgeInsets.all(10.0),
// // //                         child: ListView.separated(
// // //                           separatorBuilder: (context, index) =>
// // //                               SizedBox(height: 10),
// // //                           itemCount: todos.length,
// // //                           itemBuilder: (context, index) {
// // //                             return Card(
// // //                               elevation: 2,
// // //                               child: Dismissible(
// // //                                 key: Key(todos[index].title),
// // //                                 background: Container(
// // //                                   padding: EdgeInsets.only(left: 20),
// // //                                   alignment: Alignment.centerLeft,
// // //                                   child:
// // //                                       Icon(Icons.delete, color: Colors.white),
// // //                                   color: Colors.red,
// // //                                 ),
// // //                                 onDismissed: (direction) async {
// // //                                   await DatabaseService()
// // //                                       .removeTodo(todos[index].uid);
// // //                                   ScaffoldMessenger.of(context).showSnackBar(
// // //                                       SnackBar(
// // //                                           content: Text("Todo item deleted")));
// // //                                 },
// // //                                 child: ListTile(
// // //                                   onTap: () {
// // //                                     DatabaseService()
// // //                                         .completTask(todos[index].uid);
// // //                                   },
// // //                                   leading: Container(
// // //                                     padding: EdgeInsets.all(2),
// // //                                     height: 30,
// // //                                     width: 30,
// // //                                     decoration: BoxDecoration(
// // //                                       color: todos[index].isComplet
// // //                                           ? Colors.green
// // //                                           : Theme.of(context).primaryColor,
// // //                                       shape: BoxShape.circle,
// // //                                     ),
// // //                                     child: todos[index].isComplet
// // //                                         ? Icon(
// // //                                             Icons.check,
// // //                                             color: Colors.white,
// // //                                           )
// // //                                         : Container(),
// // //                                   ),
// // //                                   title: Text(
// // //                                     todos[index].title,
// // //                                     style: TextStyle(
// // //                                       fontSize: 20,
// // //                                       color: Theme.of(context).primaryColor,
// // //                                       fontWeight: FontWeight.w600,
// // //                                     ),
// // //                                   ),
// // //                                   subtitle: Text(todos[index].details ??
// // //                                       ''), // Replace this with actual field
// // //                                   trailing: Text(todos[index].createdDate ??
// // //                                       ''), // Replace this with actual field
// // //                                 ),
// // //                               ),
// // //                             );
// // //                           },
// // //                         ),
// // //                       );
// // //                     },
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// // //       floatingActionButton: FloatingActionButton(
// // //         child: Icon(Icons.add),
// // //         backgroundColor: Theme.of(context).primaryColor,
// // //         onPressed: () {
// // //           showDialog(
// // //             context: context,
// // //             builder: (context) => AlertDialog(
// // //               backgroundColor: Colors.grey[800],
// // //               shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(20),
// // //               ),
// // //               title: Text(
// // //                 "Add Exercise",
// // //                 style: TextStyle(
// // //                   fontSize: 20,
// // //                   color: Colors.white,
// // //                 ),
// // //               ),
// // //               content: Form(
// // //                 key: _formKey,
// // //                 child: Column(
// // //                   mainAxisSize: MainAxisSize.min,
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     TextFormField(
// // //                       controller: todoTitleController,
// // //                       style: TextStyle(
// // //                         fontSize: 18,
// // //                         height: 1.5,
// // //                         color: Colors.white,
// // //                       ),
// // //                       autofocus: true,
// // //                       validator: (value) {
// // //                         if (value?.isEmpty ?? true) {
// // //                           return 'Please enter a type of Exercise';
// // //                         }
// // //                         if (double.tryParse(value!) != null) {
// // //                           return 'Numeric input is not allowed';
// // //                         }
// // //                         return null;
// // //                       },
// // //                       decoration: InputDecoration(
// // //                         hintText: "eg. exercise",
// // //                         hintStyle:
// // //                             TextStyle(color: Colors.white.withOpacity(0.7)),
// // //                         border: UnderlineInputBorder(),
// // //                       ),
// // //                     ),

// // //                     SizedBox(height: 20),
// // //                     SizedBox(
// // //                       width: width,
// // //                       height: 50,
// // //                       child: ElevatedButton(
// // //                         style: ElevatedButton.styleFrom(
// // //                           shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(20),
// // //                           ),
// // //                           primary: Theme.of(context).primaryColor,
// // //                         ),
// // //                         child:
// // //                             Text("Add", style: TextStyle(color: Colors.white)),
// // //                         onPressed: () async {
// // //                           if (_formKey.currentState?.validate() ?? false) {
// // //                             await DatabaseService()
// // //                                 .createNewTodo(todoTitleController.text.trim());
// // //                             Navigator.pop(context);
// // //                             ScaffoldMessenger.of(context).showSnackBar(
// // //                                 SnackBar(content: Text("Todo item added")));
// // //                           }
// // //                         },
// // //                       ),
// // //                     )
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:demoapp/src/services/database_services.dart';
// // import 'package:flutter/material.dart';
// // import 'package:demoapp/loading.dart';
// // import 'package:demoapp/model/to_do.dart';

// // class TodoList extends StatefulWidget {
// //   @override
// //   _TodoListState createState() => _TodoListState();
// // }

// // class _TodoListState extends State<TodoList> {
// //   bool isComplet = false;
// //   String _searchText = '';
// //   TextEditingController todoTitleController = TextEditingController();
// //   final _formKey = GlobalKey<FormState>();
// //   bool _exercisesStarted = false; // Flag to block creating new exercises
// //   int _completedExercises = 0; // Counter for completed exercises
// //   List<Todo> _allTodos = []; // Keep track of all todos

// //   void _runFilter(String value) {
// //     setState(() {
// //       _searchText = value;
// //     });
// //   }

// //   void _resetExercises() {
// //     setState(() {
// //       _exercisesStarted = false;
// //       _completedExercises = 0;
// //       // Reset all todos isComplet to false
// //       _allTodos.forEach((todo) {
// //         DatabaseService().resetTodos();
// //       });
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double width = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Exercise List"),
// //         backgroundColor: Colors.purple,
// //         actions: [
// //           if (_completedExercises == _allTodos.length)
// //             IconButton(
// //               icon: Icon(Icons.restart_alt),
// //               onPressed: _resetExercises,
// //             )
// //         ],
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: [
// //               Colors.deepPurple.shade800,
// //               Colors.deepPurple.shade200,
// //             ],
// //           ),
// //         ),
// //         child: SafeArea(
// //           child: Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Column(
// //               children: <Widget>[
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: TextField(
// //                     onChanged: (value) {
// //                       _runFilter(value);
// //                     },
// //                     decoration: InputDecoration(
// //                       filled: true,
// //                       fillColor: Colors.grey[200],
// //                       contentPadding: EdgeInsets.all(15.0),
// //                       prefixIcon: Icon(
// //                         Icons.search,
// //                         color: Theme.of(context).primaryColor,
// //                         size: 25,
// //                       ),
// //                       hintText: 'Search',
// //                       hintStyle: TextStyle(
// //                         color: Theme.of(context).primaryColor.withOpacity(0.7),
// //                       ),
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(25.0),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 if (_allTodos.isNotEmpty)
// //                   LinearProgressIndicator(
// //                     value: _completedExercises / _allTodos.length,
// //                     color: Colors.green,
// //                     backgroundColor: Colors.green.shade100,
// //                   ),
// //                 Expanded(
// //                   child: StreamBuilder<List<Todo>>(
// //                     stream: DatabaseService().listTodos(),
// //                     builder: (context, snapshot) {
// //                       if (!snapshot.hasData) {
// //                         return Loading();
// //                       }
// //                       _allTodos = snapshot.data ?? [];
// //                       List<Todo> todos = _allTodos
// //                           .where((todo) => todo.title
// //                               .toLowerCase()
// //                               .contains(_searchText.toLowerCase()))
// //                           .toList();

// //                       _completedExercises =
// //                           todos.where((todo) => todo.isComplet).length;

// //                       return Padding(
// //                         padding: const EdgeInsets.all(10.0),
// //                         child: ListView.separated(
// //                           separatorBuilder: (context, index) =>
// //                               SizedBox(height: 10),
// //                           itemCount: todos.length,
// //                           itemBuilder: (context, index) {
// //                             return Card(
// //                               elevation: 2,
// //                               child: Dismissible(
// //                                 key: Key(todos[index].title),
// //                                 background: Container(
// //                                   padding: EdgeInsets.only(left: 20),
// //                                   alignment: Alignment.centerLeft,
// //                                   child:
// //                                       Icon(Icons.delete, color: Colors.white),
// //                                   color: Colors.red,
// //                                 ),
// //                                 onDismissed: (direction) async {
// //                                   await DatabaseService()
// //                                       .removeTodo(todos[index].uid);
// //                                   ScaffoldMessenger.of(context).showSnackBar(
// //                                       SnackBar(
// //                                           content: Text("Todo item deleted")));
// //                                 },
// //                                 child: ListTile(
// //                                   onTap: () {
// //                                     if (!_exercisesStarted) {
// //                                       ScaffoldMessenger.of(context)
// //                                           .showSnackBar(SnackBar(
// //                                               content: Text(
// //                                                   "Cannot check off exercise before starting")));
// //                                       return;
// //                                     }
// //                                     DatabaseService().toggleCompleteTask(
// //                                         todos[index].uid,
// //                                         !todos[index].isComplet);
// //                                   },
// //                                   leading: Container(
// //                                     padding: EdgeInsets.all(2),
// //                                     height: 30,
// //                                     width: 30,
// //                                     decoration: BoxDecoration(
// //                                       color: todos[index].isComplet
// //                                           ? Colors.green
// //                                           : Theme.of(context).primaryColor,
// //                                       shape: BoxShape.circle,
// //                                     ),
// //                                     child: todos[index].isComplet
// //                                         ? Icon(
// //                                             Icons.check,
// //                                             color: Colors.white,
// //                                           )
// //                                         : Container(),
// //                                   ),
// //                                   title: Text(
// //                                     todos[index].title,
// //                                     style: TextStyle(
// //                                       fontSize: 20,
// //                                       color: Theme.of(context).primaryColor,
// //                                       fontWeight: FontWeight.w600,
// //                                     ),
// //                                   ),
// //                                   subtitle: Text(todos[index].details ??
// //                                       ''), // Replace this with actual field
// //                                   trailing: Text(todos[index].createdDate ??
// //                                       ''), // Replace this with actual field
// //                                 ),
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// //       floatingActionButton: !_exercisesStarted
// //           ? FloatingActionButton(
// //               child: Icon(Icons.add),
// //               backgroundColor: Theme.of(context).primaryColor,
// //               onPressed: () {
// //                 showDialog(
// //                   context: context,
// //                   builder: (context) => AlertDialog(
// //                     backgroundColor: Colors.grey[800],
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(20),
// //                     ),
// //                     title: Text(
// //                       "Add Exercise",
// //                       style: TextStyle(
// //                         fontSize: 20,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                     content: Form(
// //                       key: _formKey,
// //                       child: Column(
// //                         mainAxisSize: MainAxisSize.min,
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           TextFormField(
// //                             controller: todoTitleController,
// //                             style: TextStyle(
// //                               fontSize: 18,
// //                               height: 1.5,
// //                               color: Colors.white,
// //                             ),
// //                             autofocus: true,
// //                             validator: (value) {
// //                               if (value?.isEmpty ?? true) {
// //                                 return 'Please enter a type of Exercise';
// //                               }
// //                               if (double.tryParse(value!) != null) {
// //                                 return 'Numeric input is not allowed';
// //                               }
// //                               return null;
// //                             },
// //                             decoration: InputDecoration(
// //                               hintText: "eg. exercise",
// //                               hintStyle: TextStyle(
// //                                   color: Colors.white.withOpacity(0.7)),
// //                               border: UnderlineInputBorder(),
// //                             ),
// //                           ),
// //                           SizedBox(height: 20),
// //                           SizedBox(
// //                             width: width,
// //                             height: 50,
// //                             child: ElevatedButton(
// //                               style: ElevatedButton.styleFrom(
// //                                 primary: Theme.of(context).primaryColor,
// //                                 onPrimary: Colors.white,
// //                               ),
// //                               child: Text(
// //                                 "Add",
// //                                 style: TextStyle(fontSize: 20),
// //                               ),
// //                               onPressed: () {
// //                                 if (_formKey.currentState!.validate()) {
// //                                   _exercisesStarted = true;
// //                                   DatabaseService().createNewTodo(
// //                                       todoTitleController.text.trim());
// //                                   todoTitleController.clear();
// //                                   Navigator.of(context).pop();
// //                                 }
// //                               },
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             )
// //           : null,
// //     );
// //   }
// // }

// import 'package:demoapp/src/services/database_services.dart';
// import 'package:flutter/material.dart';
// import 'package:demoapp/loading.dart';
// import 'package:demoapp/model/to_do.dart';
// import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

// class TodoList extends StatefulWidget {
//   @override
//   _TodoListState createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList>
//     with AutomaticKeepAliveClientMixin<TodoList> {
//   String _searchText = '';
//   TextEditingController todoTitleController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _exercisesStarted =
//       false; // Flag to block creating new exercises once they are started
//   int _completedExercises = 0; // Counter for completed exercises
//   List<Todo> _allTodos = []; // Keep track of all todos

//   @override
//   void initState() {
//     super.initState();
//     loadProgress(); // Load progress here.
//   }

//   void _runFilter(String value) {
//     setState(() {
//       _searchText = value;
//     });
//   }

//   Future<void> saveProgress() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt('completedExercises', _completedExercises);
//     prefs.setInt('totalTodos', _allTodos.length);
//   }

//   Future<void> loadProgress() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     _completedExercises = prefs.getInt('completedExercises') ?? 0;
//     int totalTodos = prefs.getInt('totalTodos') ?? 0;

//     if (_allTodos.length < totalTodos) {
//       _allTodos.length = totalTodos;
//     }
//   }

//   void _resetExercises() {
//     setState(() {
//       _exercisesStarted = false;
//       _completedExercises = 0;
//       DatabaseService().resetTodos();
//     });
//   }

//   @override
//   bool get wantKeepAlive =>
//       true; // Indicates that we want to keep this widget alive

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     super.build(context);
//     loadProgress();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Exercise List"),
//         backgroundColor: Colors.purple,
//         actions: [
//           if (_completedExercises == _allTodos.length)
//             IconButton(
//               icon: Icon(Icons.restart_alt),
//               onPressed: _resetExercises,
//             )
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.deepPurple.shade800,
//               Colors.deepPurple.shade200,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     onChanged: (value) {
//                       _runFilter(value);
//                     },
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                       contentPadding: EdgeInsets.all(15.0),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: Theme.of(context).primaryColor,
//                         size: 25,
//                       ),
//                       hintText: 'Search',
//                       hintStyle: TextStyle(
//                         color: Theme.of(context).primaryColor.withOpacity(0.7),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Always show the progress bar
//                 // LinearProgressIndicator(
//                 //   value: _completedExercises /
//                 //       (_allTodos.length == 0 ? 1 : _allTodos.length),
//                 //   color: Colors.green,
//                 //   backgroundColor: Colors.green.shade100,
//                 // ),
//                 Container(
//                   height: 20,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     child: LinearProgressIndicator(
//                       minHeight: 20,
//                       value: _completedExercises /
//                           (_allTodos.length == 0 ? 1 : _allTodos.length),
//                       color: Colors.green,
//                       backgroundColor: Colors.green.shade100,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: Text(
//                     '${(_completedExercises / (_allTodos.length == 0 ? 1 : _allTodos.length) * 100).toStringAsFixed(0)}%',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: StreamBuilder<List<Todo>>(
//                     stream: DatabaseService().listTodos(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return Loading();
//                       }
//                       _allTodos = snapshot.data ?? [];
//                       List<Todo> todos = _allTodos
//                           .where((todo) => todo.title
//                               .toLowerCase()
//                               .contains(_searchText.toLowerCase()))
//                           .toList();

//                       _completedExercises =
//                           todos.where((todo) => todo.isComplet).length;

//                       return Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: ListView.separated(
//                           separatorBuilder: (context, index) =>
//                               SizedBox(height: 10),
//                           itemCount: todos.length,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               elevation: 2,
//                               child: Dismissible(
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
//                                     if (!todos[index].isComplet) {
//                                       setState(() {
//                                         _exercisesStarted = true;
//                                         todos[index].isComplet = true;
//                                         _completedExercises++;
//                                       });
//                                       DatabaseService().toggleCompleteTask(
//                                           todos[index].uid, true);
//                                       saveProgress();
//                                     }
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
//                                   subtitle: Text(todos[index].details ?? ''),
//                                   trailing:
//                                       Text(todos[index].createdDate ?? ''),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: _exercisesStarted
//           ? null
//           : FloatingActionButton(
//               child: Icon(Icons.add),
//               backgroundColor: Theme.of(context).primaryColor,
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     backgroundColor: Colors.grey[800],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     title: Text(
//                       "Add Exercise",
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                     content: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextFormField(
//                             controller: todoTitleController,
//                             style: TextStyle(
//                               fontSize: 18,
//                               height: 1.5,
//                               color: Colors.white,
//                             ),
//                             autofocus: true,
//                             validator: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'Please enter a type of Exercise';
//                               }
//                               if (double.tryParse(value!) != null) {
//                                 return 'Numeric input is not allowed';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               hintText: "eg. exercise",
//                               hintStyle: TextStyle(
//                                   color: Colors.white.withOpacity(0.7)),
//                               border: UnderlineInputBorder(),
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           SizedBox(
//                             width: width,
//                             height: 50,
//                             child: ElevatedButton(
//                               child: Text(
//                                 'Add',
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                               style: ButtonStyle(
//                                 backgroundColor: MaterialStateProperty.all(
//                                   Color.fromARGB(255, 43, 39, 165),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   Todo todo = Todo(
//                                     uid: '',
//                                     title: todoTitleController.text,
//                                     details: '',
//                                     createdDate: DateTime.now().toString(),
//                                     isComplet: false,
//                                   );
//                                   DatabaseService().createNewTodo(
//                                       todoTitleController.text.trim());
//                                   todoTitleController.clear();
//                                   _allTodos.add(
//                                       todo); // Don't forget to update your total todos
//                                   saveProgress(); // Save progress here.
//                                   Navigator.pop(context);
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
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

class _TodoListState extends State<TodoList>
    with AutomaticKeepAliveClientMixin<TodoList> {
  String _searchText = '';
  TextEditingController todoTitleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _exercisesStarted =
      false; // Flag to block creating new exercises once they are started
  int _completedExercises = 0; // Counter for completed exercises
  List<Todo> _allTodos = []; // Keep track of all todos

  void _runFilter(String value) {
    setState(() {
      _searchText = value;
    });
  }

  void _resetExercises() {
    setState(() {
      _exercisesStarted = false;
      _completedExercises = 0;
      DatabaseService().resetTodos();
    });
  }

  @override
  bool get wantKeepAlive =>
      true; // Indicates that we want to keep this widget alive

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Exercise List"),
        backgroundColor: Colors.purple,
        actions: [
          if (_completedExercises == _allTodos.length)
            IconButton(
              icon: Icon(Icons.restart_alt),
              onPressed: _resetExercises,
            )
        ],
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
                // Always show the progress bar
                // LinearProgressIndicator(
                //   value: _completedExercises /
                //       (_allTodos.length == 0 ? 1 : _allTodos.length),
                //   color: Colors.green,
                //   backgroundColor: Colors.green.shade100,
                // ),
                Container(
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      minHeight: 20,
                      value: _completedExercises /
                          (_allTodos.length == 0 ? 1 : _allTodos.length),
                      color: Colors.green,
                      backgroundColor: Colors.green.shade100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    '${(_completedExercises / (_allTodos.length == 0 ? 1 : _allTodos.length) * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
                      _allTodos = snapshot.data ?? [];
                      List<Todo> todos = _allTodos
                          .where((todo) => todo.title
                              .toLowerCase()
                              .contains(_searchText.toLowerCase()))
                          .toList();

                      _completedExercises =
                          todos.where((todo) => todo.isComplet).length;

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
                                    if (!todos[index].isComplet) {
                                      setState(() {
                                        _exercisesStarted = true;
                                        todos[index].isComplet = true;
                                        _completedExercises++;
                                      });
                                      DatabaseService().toggleCompleteTask(
                                          todos[index].uid, true);
                                    }
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
                                  subtitle: Text(todos[index].details ?? ''),
                                  trailing:
                                      Text(todos[index].createdDate ?? ''),
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
      floatingActionButton: _exercisesStarted
          ? null
          : FloatingActionButton(
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
                      "Add Exercise",
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
                                return 'Please enter a type of Exercise';
                              }
                              if (double.tryParse(value!) != null) {
                                return 'Numeric input is not allowed';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "eg. exercise",
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.7)),
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: width,
                            height: 50,
                            child: ElevatedButton(
                              child: Text(
                                'Add',
                                style: TextStyle(fontSize: 18),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 43, 39, 165),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Todo todo = Todo(
                                    uid: '',
                                    title: todoTitleController.text,
                                    details: '',
                                    createdDate: DateTime.now().toString(),
                                    isComplet: false,
                                  );
                                  DatabaseService().createNewTodo(
                                      todoTitleController.text.trim());
                                  todoTitleController.clear();
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
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
