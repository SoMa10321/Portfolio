import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'package:simple_text_widget/simple_text_widget.dart';

class NavigationBarSection extends StatelessWidget {
  final bool isDesktop;

  const NavigationBarSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 30,
        vertical: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.primaryGold,
                  shape: BoxShape.circle,
                ),
              ),

              // Lottie.asset('assets/icons/Icon_code.json'),
              const SizedBox(width: 10),
              SimpleTextWidget(
                text: 'Ousama Abdel Wahab',
                size: 34,
                color: AppColors.darkGray,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),

          // Navigation Menu (يمكن إضافته لاحقًا إذا كان needed)
          // if (isDesktop)
          //   Row(
          //     children: [
          //       _buildNavItem('Home', 0),
          //       _buildNavItem('Projects', 1),
          //       _buildNavItem('Skills', 2),
          //       _buildNavItem('Education', 3),
          //       _buildNavItem('Experience', 4),
          //       _buildNavItem('Contact', 5),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
