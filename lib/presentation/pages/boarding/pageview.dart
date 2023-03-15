import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../companent/zoom_tab_animation.dart';
import '../homepages/home.dart';
import 'boarding1.dart';
import 'boarding2.dart';

class pageWiev extends StatefulWidget {
  const pageWiev({Key? key}) : super(key: key);

  @override
  State<pageWiev> createState() => _pageWievState();
}

class _pageWievState extends State<pageWiev> {
   late PageController _controller;
  bool isLoading = false;
  @override
  void initState() {
    _controller=PageController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              isLoading = (index == 1);
            });
          },
          children: const [Boarding1(), Boarding2()],
        ),
        Container(
            alignment: const Alignment(0, 0.75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: const SwapEffect(),
                ),
                20.verticalSpace,
                isLoading
                    ? GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>home()), (route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Animations(
                        child: Container(
                            width: double.infinity,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:  Center(
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.r,
                                      fontWeight: FontWeight.w700),
                                ))),
                      ),
                    ))
                    : GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeIn);
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 24.w),
                      child: Animations(
                        child: Container(
                            width: double.infinity,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child:  Center(
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.r,
                                      fontWeight: FontWeight.w700),
                                ))),
                      ),
                    )),
                50.verticalSpace,
              ],
            ))
      ]),
    );
  }
}
