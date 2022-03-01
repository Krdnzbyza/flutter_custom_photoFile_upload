import 'package:flutter/material.dart';
import 'package:photo_camera_reader/photoFile/view/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.black)),
        themeMode: ThemeMode.dark,
        title: 'Photo/Fİle Picker',
        home: PhotoHomeView());
  }
}
