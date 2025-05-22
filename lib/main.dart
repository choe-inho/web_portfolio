import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_portfolio/helper/App_Theme.dart';
import 'package:web_portfolio/provider/Theme_Provider.dart';
import 'package:web_portfolio/router/Router_Manager.dart';

import 'helper/App_Colors.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ThemeProvider())
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) => MaterialApp.router(
          title: 'Iconoding...',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: RouterManager.router,
        ),
      ),
    );
  }

}