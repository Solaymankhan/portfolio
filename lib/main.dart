import 'package:flutter/material.dart';
import 'package:untitled/utils/constants/colors.dart';
import 'package:untitled/utils/constants/strings.dart';
import 'package:untitled/veiw/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name_txt,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: greenDarkColor),
        useMaterial3: true,
      ),
      home: const homePage(),
    );
  }
}
