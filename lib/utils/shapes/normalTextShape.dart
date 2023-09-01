import 'package:flutter/material.dart';
import 'package:untitled/utils/constants/colors.dart';

import '../constants/strings.dart';

class normalTextShape extends StatelessWidget {
  const normalTextShape({Key? key, required this.txt, required this.size})
      : super(key: key);
  final txt, size;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      txt,
      style: TextStyle(
          fontSize: size,
          color: greenWhiteColor,
          fontWeight: FontWeight.w500),
    );
  }
}
