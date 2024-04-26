
import 'package:flutter/material.dart';
import 'package:planet_app/screen/home/provider/home_provider.dart';
import 'package:planet_app/utils/app_routs.dart';
import 'package:planet_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()),
      ],
      child: Consumer<HomeProvider>(
          builder: (context, value, child) {
             value.changeTheme();

            return
              MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: app_routs,
                theme:value.isLight?darkTheme :lightTheme,
              );
          }
      ),
    ),
  );
}