import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import '../constants/text_styles.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        children: [
          TextStyles.footerTitle('Ousama Abdel Wahab'),
          const SizedBox(height: 8),
          TextStyles.footerSubtitle('Flutter Application Developer'),
          const SizedBox(height: 20),
          TextStyles.footerCopyright(
            '2025 Ousama Abdel Wahab | All rights reserved.',
          ),
        ],
      ),
    );
  }
}
