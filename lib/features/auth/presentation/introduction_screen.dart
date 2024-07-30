import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ysb_furniture/assets/constants/icons.dart';
import 'package:ysb_furniture/assets/constants/images.dart';
import 'package:ysb_furniture/features/auth/domain/entities/introduction_pager_entity.dart';
import 'package:ysb_furniture/features/auth/presentation/widgets/introduction_widget.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  late final PageController _pageController;
  final List<IntroductionPagerEntity> _pages = [
    IntroductionPagerEntity(
      image: AppImages.introduction1,
      titleIcon: AppIcons.vrAr,
      titleText: "AR Furniture Setup",
      titleColor: const Color(0xffC1AD8B),
      descriptionTitle: "Experience Furniture With Augmented Reality",
      descriptionContent:
          "You can try furniture from the catalog in your home with AR.",
    ),
    IntroductionPagerEntity(
      image: AppImages.introduction2,
      titleIcon: AppIcons.cubic,
      titleText: "3d Product View",
      titleColor: const Color(0xff999C92),
      descriptionTitle: "Look at the Furniture on Each Side",
      descriptionContent:
          "You can try furniture from the catalog in your home with AR.",
    ),
    IntroductionPagerEntity(
      image: AppImages.introduction3,
      titleIcon: AppIcons.category,
      titleText: "More Explore",
      titleColor: const Color(0xffB68A41),
      descriptionTitle: "Explore Modern Furniture",
      descriptionContent:
          "You can try furniture from the catalog in your home with AR.",
    ),
  ];
  
  int _activePageIndex = 0;

  nextPage() {
    _pageController.animateToPage(++_activePageIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const CustomPageViewScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePageIndex = page;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return IntroductionWidget(
                  data: _pages[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Skip",
                  style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5),
                ),
                GestureDetector(
                    onTap: () {
                      if (_activePageIndex != _pages.length - 1) {
                        nextPage();
                      }
                    },
                    child: Container(
                      height: 114,
                      width: 114,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(57),
                          color: const Color(0xffff871c)),
                      child: Center(
                          child: SvgPicture.asset(
                        AppIcons.arrowRight,
                      )),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomPageViewScrollPhysics extends ScrollPhysics {
  const CustomPageViewScrollPhysics({super.parent});

  @override
  CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 50,
        stiffness: 100,
        damping: 0.8,
      );
}
