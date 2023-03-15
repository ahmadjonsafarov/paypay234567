import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paypay/aplication/card/card_cubit.dart';
import 'package:paypay/aplication/controller/card_controller.dart';
import 'package:paypay/aplication/controller/tolov_controller.dart';
import 'package:paypay/infastuctura/theme/theme_constants.dart';
import 'package:paypay/infastuctura/theme/theme_manager.dart';
import 'package:paypay/presentation/pages/splash/splash.dart';
import 'package:provider/provider.dart';

ThemeManager _themeManager=ThemeManager();

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CardController()),
        ChangeNotifierProvider(create: (context)=>TolovController()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: _themeManager.themeMode,
            debugShowCheckedModeBanner: false,
            home: Splash(),
          );
        },),
    );
  }
}
