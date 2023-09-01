import 'package:flutter/material.dart';
import 'package:untitled/utils/constants/colors.dart';

import '../constants/strings.dart';

class headerTextShape extends StatelessWidget {
  const headerTextShape({Key? key, required this.txt, required this.size})
      : super(key: key);
  final txt, size;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      txt,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: whiteColor),
    );
  }
}
