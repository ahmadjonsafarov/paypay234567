import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paypay/aplication/card/card_cubit.dart';
import 'package:paypay/presentation/pages/homepages/add_card.dart';
import 'package:paypay/presentation/pages/homepages/cardPay.dart';
import 'package:paypay/presentation/pages/homepages/homePay.dart';
import 'package:paypay/presentation/pages/homepages/profilPay.dart';
import 'package:paypay/presentation/pages/homepages/stats.dart';
import '../../companent/zoom_tab_animation.dart';
import '../../style/style.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _bottomNavIndex = 0;
  List<Widget> HomeWidget = [HomePay(), Stats(), CardPay(), ProfilPay()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeWidget[_bottomNavIndex],
      floatingActionButton: Animations(
        child: FloatingActionButton(
          splashColor: Styles.blueDark,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                BlocProvider(
                  create: (context) => CardCubit(),
                  child: AddCard(),
                )));
          },
          child: const Icon(
            size: 35,
            Icons.add,
            color: Styles.white,
          ),
          //params
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        iconSize: 35,
        splashColor: Styles.primary,
        backgroundColor: Styles.white,
        activeColor: Styles.blueDark,
        inactiveColor: Styles.stroke,
        icons: const [
          Icons.home_filled,
          Icons.analytics_outlined,
          Icons.credit_card,
          Icons.person],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        height: 75,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
