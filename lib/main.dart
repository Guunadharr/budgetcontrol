import 'package:budgetcontrol/views/budgetscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budget Control',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 46, 115),
        accentColor: Colors.blue[900],
        fontFamily: 'DMSans',
      ),
      home: BudgetScreen(),
    );
  }
}
