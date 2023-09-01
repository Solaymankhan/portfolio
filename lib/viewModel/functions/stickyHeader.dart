import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:untitled/utils/constants/strings.dart';

import '../../utils/constants/colors.dart';
import '../../utils/shapes/headerTextShape.dart';

class stickyHeader extends MultiSliver {
  stickyHeader({
    Key? key,
    required String title,
    required double size,
    required List<Widget> items,
  }) : super(
          key: key,
          pushPinnedChildren: true,
          children: [
            SliverPinnedHeader(
              child: headerTextShape(txt: title, size: size)
                  .objectCenterLeft()
                  .box
                  .height(70)
                  .color(greenBlackColor)
                  .make(),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(items),
            ),
          ],
        );
}
