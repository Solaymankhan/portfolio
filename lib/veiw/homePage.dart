import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utils/constants/colors.dart';
import 'package:untitled/utils/shapes/headerTextShape.dart';
import 'package:untitled/utils/shapes/normalTextShape.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:html' as html;
import 'package:untitled/utils/constants/assets.dart';
import 'package:untitled/utils/constants/strings.dart';
import '../viewModel/controllers/homeController.dart';
import '../viewModel/functions/stickyHeader.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  static final homeCntrlr = Get.put(homeController());

  @override
  Widget build(BuildContext context) {
    homeCntrlr.readAbout();
    homeCntrlr.wdt.value = MediaQuery.of(context).size.width;
    homeCntrlr.ht.value = MediaQuery.of(context).size.height;
    homeCntrlr.writingFontSize.value =
        homeCntrlr.normal_font_size(homeCntrlr.wdt.value);
    homeCntrlr.imageSize.value = homeCntrlr.image_size(homeCntrlr.wdt.value);
    homeCntrlr.sloganFontSize.value =
        homeCntrlr.slogan_font_size(homeCntrlr.wdt.value);
    homeCntrlr.nameFontSize.value =
        homeCntrlr.name_font_size(homeCntrlr.wdt.value);
    homeCntrlr.headerFontSize.value =
        homeCntrlr.header_font_size(homeCntrlr.wdt.value);
    homeCntrlr.socialMediaIconSize.value =
        homeCntrlr.social_media_size(homeCntrlr.wdt.value);
    homeCntrlr.marginSize.value = homeCntrlr.margin(homeCntrlr.wdt.value);

    return Scaffold(
        backgroundColor: greenBlackColor,
        body: SafeArea(
            child: Obx(() => homeCntrlr.wdt.value > homeCntrlr.ht.value &&
                    homeCntrlr.wdt.value > 600
                ? widthgreaterHeigt()
                : heigtgreaterWidth())).marginOnly(
            left: homeCntrlr.marginSize.value,
            right: homeCntrlr.marginSize.value));
  }

  Widget heigtgreaterWidth() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(
            child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: homeCntrlr.imageSize.value,
                  width: homeCntrlr.imageSize.value,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(width: 4, color: greyColor),
                      image: DecorationImage(
                          image: AssetImage(
                            profile_image,
                          ),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerTextShape(
                        txt: name_txt, size: homeCntrlr.nameFontSize.value),
                    headerTextShape(
                        txt: profession_txt,
                        size: homeCntrlr.headerFontSize.value),
                    AnimatedTextKit(totalRepeatCount: 100, animatedTexts: [
                      TyperAnimatedText(
                        flutter_txt,
                        textStyle: TextStyle(
                            fontSize: homeCntrlr.headerFontSize.value,
                            fontWeight: FontWeight.bold,
                            color: redColor),
                      ),
                      TyperAnimatedText(
                        android_txt,
                        textStyle: TextStyle(
                            fontSize: homeCntrlr.headerFontSize.value,
                            fontWeight: FontWeight.bold,
                            color: redColor),
                      ),
                      TyperAnimatedText(
                        ios_txt,
                        textStyle: TextStyle(
                            fontSize: homeCntrlr.headerFontSize.value,
                            fontWeight: FontWeight.bold,
                            color: redColor),
                      ),
                      TyperAnimatedText(
                        web_txt,
                        textStyle: TextStyle(
                            fontSize: homeCntrlr.headerFontSize.value,
                            fontWeight: FontWeight.bold,
                            color: redColor),
                      )
                    ]),
                  ],
                ).expand()
              ],
            ),
            10.heightBox,
            normalTextShape(
                txt: what_i_do, size: homeCntrlr.sloganFontSize.value),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        html.window.open(linked_in_link_txt,blank_txt);
                      },
                      onHover: (isHovered) {
                        homeCntrlr.isLinkedinHovered.value = isHovered;
                      },
                      child: SvgPicture.asset(linkedin_svg,
                          height: homeCntrlr.isLinkedinHovered.value
                              ? homeCntrlr.socialMediaIconSize.value + 10.0
                              : homeCntrlr.socialMediaIconSize.value,
                          color: homeCntrlr.isLinkedinHovered.value
                              ? whiteColor
                              : greenWhiteColor)),
                ).box.margin(EdgeInsets.all(10)).make(),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        html.window.open(git_hub_link_txt,blank_txt);
                      },
                      onHover: (isHovered) {
                        homeCntrlr.isGithubHovered.value = isHovered;
                      },
                      child: SvgPicture.asset(github_svg,
                          height: homeCntrlr.isGithubHovered.value
                              ? homeCntrlr.socialMediaIconSize.value + 10.0
                              : homeCntrlr.socialMediaIconSize.value,
                          color: homeCntrlr.isGithubHovered.value
                              ? whiteColor
                              : greenWhiteColor)),
                ).box.margin(EdgeInsets.all(10)).make(),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        html.window.open(insta_gram_link_txt,blank_txt);
                      },
                      onHover: (isHovered) {
                        homeCntrlr.isInstagramHovered.value = isHovered;
                      },
                      child: SvgPicture.asset(instagram_svg,
                          height: homeCntrlr.isInstagramHovered.value
                              ? homeCntrlr.socialMediaIconSize.value + 10.0
                              : homeCntrlr.socialMediaIconSize.value,
                          color: homeCntrlr.isInstagramHovered.value
                              ? whiteColor
                              : greenWhiteColor)),
                ).box.margin(EdgeInsets.all(10)).make(),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        html.window.open(face_book_link_txt,blank_txt);
                      },
                      onHover: (isHovered) {
                        homeCntrlr.isFacebookHovered.value = isHovered;
                      },
                      child: SvgPicture.asset(facebook_svg,
                          height: homeCntrlr.isFacebookHovered.value
                              ? homeCntrlr.socialMediaIconSize.value + 10.0
                              : homeCntrlr.socialMediaIconSize.value,
                          color: homeCntrlr.isFacebookHovered.value
                              ? whiteColor
                              : greenWhiteColor)),
                ).box.margin(EdgeInsets.all(10)).make(),
              ],
            ).box.height(100).make()
          ],
        )),
        stickyHeader(
          title: about_txt,
          size: homeCntrlr.headerFontSize.value,
          items: [
            10.heightBox,
            normalTextShape(
                txt: homeCntrlr.fileContent.value,
                size: homeCntrlr.writingFontSize.value),
            10.heightBox,
          ],
        ),
        stickyHeader(
          title: my_works_txt,
          size: homeCntrlr.headerFontSize.value,
          items: [
            10.heightBox,
            Row(
              children: [
                Image(
                    height: homeCntrlr.socialMediaIconSize.value,
                    image: AssetImage(izmir_image)),
                SizedBox(width: 10),
                headerTextShape(
                        txt: izmir_txt, size: homeCntrlr.sloganFontSize.value)
                    .box
                    .customRounded(BorderRadius.circular(8))
                    .color(greenBGColor)
                    .padding(EdgeInsets.all(5))
                    .make(),
              ],
            ),
            10.heightBox,
            normalTextShape(
                txt: izmir_works_txt, size: homeCntrlr.writingFontSize.value),
            20.heightBox,
            Row(
              children: [
                Image(
                    height: homeCntrlr.socialMediaIconSize.value,
                    image: AssetImage(zender_image)),
                SizedBox(width: 10),
                headerTextShape(
                        txt: zender_messenger_txt,
                        size: homeCntrlr.sloganFontSize.value)
                    .box
                    .customRounded(BorderRadius.circular(8))
                    .color(greenBGColor)
                    .padding(EdgeInsets.all(5))
                    .make(),
              ],
            ),
            10.heightBox,
            normalTextShape(
                txt: zender_works_txt, size: homeCntrlr.writingFontSize.value),
            20.heightBox,
            Row(
              children: [
                Image(
                    height: homeCntrlr.socialMediaIconSize.value,
                    image: AssetImage(news_everyday_image)),
                SizedBox(width: 10),
                headerTextShape(
                        txt: news_everyday_txt,
                        size: homeCntrlr.sloganFontSize.value)
                    .box
                    .customRounded(BorderRadius.circular(8))
                    .color(greenBGColor)
                    .padding(EdgeInsets.all(5))
                    .make(),
              ],
            ),
            10.heightBox,
            normalTextShape(
                txt: news_everyday_work_txt,
                size: homeCntrlr.writingFontSize.value),
            20.heightBox,
            Row(
              children: [
                Image(
                    height: homeCntrlr.socialMediaIconSize.value,
                    image: AssetImage(calender_image)),
                SizedBox(width: 10),
                headerTextShape(
                        txt: calendar_txt,
                        size: homeCntrlr.sloganFontSize.value)
                    .box
                    .customRounded(BorderRadius.circular(8))
                    .color(greenBGColor)
                    .padding(EdgeInsets.all(5))
                    .make(),
              ],
            ),
            10.heightBox,
            normalTextShape(
                txt: calendar_365_work_txt,
                size: homeCntrlr.writingFontSize.value),
            10.heightBox,
          ],
        ),
        stickyHeader(
          title: contact_txt,
          size: homeCntrlr.headerFontSize.value,
          items: [
            Row(
              children: [
                Icon(CupertinoIcons.phone_fill,
                        size: homeCntrlr.socialMediaIconSize.value,
                        color: greenWhiteColor)
                    .box
                    .margin(EdgeInsets.all(10))
                    .make(),
                normalTextShape(
                    txt: phone_txt, size: homeCntrlr.writingFontSize.value),
              ],
            ),
            Row(
              children: [
                Icon(CupertinoIcons.mail_solid,
                        size: homeCntrlr.socialMediaIconSize.value,
                        color: greenWhiteColor)
                    .box
                    .margin(EdgeInsets.all(10))
                    .make(),
                normalTextShape(
                    txt: email_txt, size: homeCntrlr.writingFontSize.value),
              ],
            ),
          ],
        ),
        SliverToBoxAdapter(child: SizedBox(height: 30)),
      ],
    );
  }

  Widget widthgreaterHeigt() {
    return Row(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: homeCntrlr.imageSize.value,
                    width: homeCntrlr.imageSize.value,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(width: 4, color: greyColor),
                        image: DecorationImage(
                            image: AssetImage(
                              profile_image,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerTextShape(
                          txt: name_txt, size: homeCntrlr.nameFontSize.value),
                      headerTextShape(
                          txt: profession_txt,
                          size: homeCntrlr.headerFontSize.value),
                      AnimatedTextKit(totalRepeatCount: 100, animatedTexts: [
                        TyperAnimatedText(
                          flutter_txt,
                          textStyle: TextStyle(
                              fontSize: homeCntrlr.headerFontSize.value,
                              fontWeight: FontWeight.bold,
                              color: redColor),
                        ),
                        TyperAnimatedText(
                          android_txt,
                          textStyle: TextStyle(
                              fontSize: homeCntrlr.headerFontSize.value,
                              fontWeight: FontWeight.bold,
                              color: redColor),
                        ),
                        TyperAnimatedText(
                          ios_txt,
                          textStyle: TextStyle(
                              fontSize: homeCntrlr.headerFontSize.value,
                              fontWeight: FontWeight.bold,
                              color: redColor),
                        ),
                        TyperAnimatedText(
                          web_txt,
                          textStyle: TextStyle(
                              fontSize: homeCntrlr.headerFontSize.value,
                              fontWeight: FontWeight.bold,
                              color: redColor),
                        )
                      ]),
                    ],
                  )
                ],
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {},
                        onHover: (isHovered) {
                          homeCntrlr.isLinkedinHovered.value = isHovered;
                        },
                        child: SvgPicture.asset(linkedin_svg,
                            height: homeCntrlr.isLinkedinHovered.value
                                ? homeCntrlr.socialMediaIconSize.value + 10.0
                                : homeCntrlr.socialMediaIconSize.value,
                            color: homeCntrlr.isLinkedinHovered.value
                                ? whiteColor
                                : greenWhiteColor)),
                  ).box.margin(EdgeInsets.all(10)).make(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {},
                        onHover: (isHovered) {
                          homeCntrlr.isGithubHovered.value = isHovered;
                        },
                        child: SvgPicture.asset(github_svg,
                            height: homeCntrlr.isGithubHovered.value
                                ? homeCntrlr.socialMediaIconSize.value + 10.0
                                : homeCntrlr.socialMediaIconSize.value,
                            color: homeCntrlr.isGithubHovered.value
                                ? whiteColor
                                : greenWhiteColor)),
                  ).box.margin(EdgeInsets.all(10)).make(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {},
                        onHover: (isHovered) {
                          homeCntrlr.isInstagramHovered.value = isHovered;
                        },
                        child: SvgPicture.asset(instagram_svg,
                            height: homeCntrlr.isInstagramHovered.value
                                ? homeCntrlr.socialMediaIconSize.value + 10.0
                                : homeCntrlr.socialMediaIconSize.value,
                            color: homeCntrlr.isInstagramHovered.value
                                ? whiteColor
                                : greenWhiteColor)),
                  ).box.margin(EdgeInsets.all(10)).make(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {},
                        onHover: (isHovered) {
                          homeCntrlr.isFacebookHovered.value = isHovered;
                        },
                        child: SvgPicture.asset(facebook_svg,
                            height: homeCntrlr.isFacebookHovered.value
                                ? homeCntrlr.socialMediaIconSize.value + 10.0
                                : homeCntrlr.socialMediaIconSize.value,
                            color: homeCntrlr.isFacebookHovered.value
                                ? whiteColor
                                : greenWhiteColor)),
                  ).box.margin(EdgeInsets.all(10)).make(),
                ],
              ).box.height(100).make()
            ],
          ),
        )),
        Expanded(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Column(children: [
              30.heightBox,
              normalTextShape(
                txt: what_i_do, size: homeCntrlr.sloganFontSize.value),
              10.heightBox,
            ],)),
            stickyHeader(
              title: about_txt,
              size: homeCntrlr.headerFontSize.value,
              items: [
                10.heightBox,
                normalTextShape(
                    txt: homeCntrlr.fileContent.value,
                    size: homeCntrlr.writingFontSize.value),
                10.heightBox,
              ],
            ),
            stickyHeader(
              title: my_works_txt,
              size: homeCntrlr.headerFontSize.value,
              items: [
                10.heightBox,
                Row(
                  children: [
                    Image(
                        height: homeCntrlr.socialMediaIconSize.value,
                        image: AssetImage(izmir_image)),
                    SizedBox(width: 10),
                    headerTextShape(
                            txt: izmir_txt,
                            size: homeCntrlr.sloganFontSize.value-10.0)
                        .box
                        .customRounded(BorderRadius.circular(8))
                        .color(greenBGColor)
                        .padding(EdgeInsets.all(5))
                        .make(),
                  ],
                ),
                10.heightBox,
                normalTextShape(
                    txt: izmir_works_txt,
                    size: homeCntrlr.writingFontSize.value),
                20.heightBox,
                Row(
                  children: [
                    Image(
                        height: homeCntrlr.socialMediaIconSize.value,
                        image: AssetImage(zender_image)),
                    SizedBox(width: 10),
                    headerTextShape(
                            txt: zender_messenger_txt,
                            size: homeCntrlr.sloganFontSize.value-10.0,)
                        .box
                        .customRounded(BorderRadius.circular(8))
                        .color(greenBGColor)
                        .padding(EdgeInsets.all(5))
                        .make(),
                  ],
                ),
                10.heightBox,
                normalTextShape(
                    txt: zender_works_txt,
                    size: homeCntrlr.writingFontSize.value),
                20.heightBox,
                Row(
                  children: [
                    Image(
                        height: homeCntrlr.socialMediaIconSize.value,
                        image: AssetImage(news_everyday_image)),
                    SizedBox(width: 10),
                    headerTextShape(
                            txt: news_everyday_txt,
                            size: homeCntrlr.sloganFontSize.value-10.0,)
                        .box
                        .customRounded(BorderRadius.circular(8))
                        .color(greenBGColor)
                        .padding(EdgeInsets.all(5))
                        .make(),
                  ],
                ),
                10.heightBox,
                normalTextShape(
                    txt: news_everyday_work_txt,
                    size: homeCntrlr.writingFontSize.value),
                20.heightBox,
                Row(
                  children: [
                    Image(
                        height: homeCntrlr.socialMediaIconSize.value,
                        image: AssetImage(calender_image)),
                    SizedBox(width: 10),
                    headerTextShape(
                            txt: calendar_txt,
                            size: homeCntrlr.sloganFontSize.value-10.0)
                        .box
                        .customRounded(BorderRadius.circular(8))
                        .color(greenBGColor)
                        .padding(EdgeInsets.all(5))
                        .make(),
                  ],
                ),
                10.heightBox,
                normalTextShape(
                    txt: calendar_365_work_txt,
                    size: homeCntrlr.writingFontSize.value),
                10.heightBox,
              ],
            ),
            stickyHeader(
              title: contact_txt,
              size: homeCntrlr.headerFontSize.value,
              items: [
                Row(
                  children: [
                    Icon(CupertinoIcons.phone_fill,
                            size: homeCntrlr.socialMediaIconSize.value,
                            color: greenWhiteColor)
                        .box
                        .margin(EdgeInsets.all(10))
                        .make(),
                    normalTextShape(
                        txt: phone_txt, size: homeCntrlr.writingFontSize.value).expand(),
                  ],
                ),
                Row(
                  children: [
                    Icon(CupertinoIcons.mail_solid,
                            size: homeCntrlr.socialMediaIconSize.value,
                            color: greenWhiteColor)
                        .box
                        .margin(EdgeInsets.all(10))
                        .make(),
                    normalTextShape(
                        txt: email_txt, size: homeCntrlr.writingFontSize.value).expand(),
                  ],
                ),
              ],
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ).paddingOnly(left: 10))
      ],
    );
  }
}
