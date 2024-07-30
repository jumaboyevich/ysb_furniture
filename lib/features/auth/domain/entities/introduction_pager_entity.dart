import 'package:flutter/material.dart';

class IntroductionPagerEntity {
  final String image;
  final String titleIcon;
  final String titleText;
  final Color titleColor;
  final String descriptionTitle;
  final String descriptionContent;

  IntroductionPagerEntity(
      {required this.image,
      required this.titleIcon,
      required this.titleText,
      required this.titleColor,
      required this.descriptionTitle,
      required this.descriptionContent});
}
