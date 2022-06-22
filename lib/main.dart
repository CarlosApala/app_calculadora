import 'package:app_calculadora/bloc/addnumero_bloc.dart';
import 'package:app_calculadora/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Color.fromRGBO(05, 21, 30, 1),
      systemNavigationBarContrastEnforced: true,
      systemNavigationBarDividerColor: Color.fromRGBO(05, 21, 30, 1)

      //Colors.orange[300], // status bar color
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddnumeroBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage()),
    );
  }
}
