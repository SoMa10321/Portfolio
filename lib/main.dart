import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'portfolio_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ousama Abdel Wahab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryBrown,
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const PortfolioScreen(),
    );
  }
}
