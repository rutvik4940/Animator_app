
import 'package:flutter/material.dart';
import 'package:planet_app/screen/bookmark/view/bookmark_screen.dart';
import 'package:planet_app/screen/details/details_screen.dart';
import 'package:planet_app/screen/home/view/home_screen.dart';
import 'package:planet_app/screen/splash/splash_screen.dart';

Map<String,WidgetBuilder>app_routs={
   "/":(context) => const SplashScreen(),
   "home":(context) => const HomeScreen(),
   "detail":(context) => DetailsScreen(),
   "bookmark":(context) => BookmarkScreen(),

};