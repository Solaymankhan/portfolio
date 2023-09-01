import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/constants/assets.dart';

class homeController extends GetxController {
  RxDouble wdt = 0.0.obs,
      ht = 0.0.obs,
      writingFontSize = 0.0.obs,
      headerFontSize = 0.0.obs,
      sloganFontSize = 0.0.obs,
      nameFontSize = 0.0.obs,
      marginSize = 0.0.obs,
      imageSize = 0.0.obs,
      socialMediaIconSize = 0.0.obs;
  RxString fileContent = ''.obs;
  RxBool isLinkedinHovered = false.obs,
      isGithubHovered = false.obs,
      isInstagramHovered = false.obs,
      isFacebookHovered = false.obs;

  normal_font_size(wdt) {
    double size = 0.03 * wdt;
    if (size > 22.0) size = 22.0;
    if (size < 15.0) size = 15.0;
    return size;
  }

  slogan_font_size(wdt) {
    double size = 0.035 * wdt;
    if (size > 28.0) size = 28.0;
    if (size < 18.0) size = 18.0;
    return size;
  }

  header_font_size(wdt) {
    double size = 0.045 * wdt;
    if (size > 35.0) size = 35.0;
    if (size < 22.0) size = 22.0;
    return size;
  }

  name_font_size(wdt) {
    double size = 0.07 * wdt;
    if (size > 60.0) size = 60.0;
    if (size < 28.0) size = 28.0;
    return size;
  }

  image_size(wdt) {
    double size = 0.3 * wdt;
    if (size > 200.0) size = 200;
    return size;
  }

  social_media_size(wdt) {
    double size = 0.05 * wdt;
    if (size > 40.0) size = 40;
    return size;
  }

  readAbout() async {
    fileContent.value = await rootBundle.loadString(about_file);
  }

  margin(wdt) {
    double size = 0.05 * wdt;
    return size;
  }
}
