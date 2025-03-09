import 'package:flutter/material.dart';
import 'package:to_do_app/to_do_list.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoList(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purpleAccent,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(5)
            // )
          )
        ),

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22)
          )
        )
      ),
    );
  }
}