import 'package:biblia_links/domain/usercases/bible_ofiline_usercase.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblia Reformada',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key});

  
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final BibleOffilineUserCase bibleOffilineRepository = BibleOffilineUserCase();
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
   
    


  }
  
  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      
    );
  }
}
