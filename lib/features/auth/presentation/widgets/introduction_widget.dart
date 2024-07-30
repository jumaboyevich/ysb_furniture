import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ysb_furniture/assets/colors/colors.dart';
import 'package:ysb_furniture/features/auth/domain/entities/introduction_pager_entity.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key, required this.data});
  final IntroductionPagerEntity data;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(data.image),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                SvgPicture.asset(data.titleIcon),
                const SizedBox(
                  width: 9,
                ),
                Expanded(
                    child: Text(
                  data.titleText,
                  style: TextStyle(color: data.titleColor),
                ))
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              data.descriptionTitle,
              style: const TextStyle(
                  color: black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  height: 1.5),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              data.descriptionContent,
              style: TextStyle(
                  color: black.withOpacity(0.6),
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  height: 1.5),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }
}
