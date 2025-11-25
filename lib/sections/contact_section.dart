import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'package:my_portfolio_flutter/widgets/contact_card.dart';
import '../constants/text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: AppColors.cardShadow,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryGold.withValues(alpha: 0.15),
                      AppColors.primaryBrown.withValues(alpha: 0.1),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedContact,
                  color: AppColors.primaryGold.withValues(alpha: 0.1),
                  strokeWidth: 2.3,
                  size: 24,
                ),
              ),
              const SizedBox(height: 15),
              TextStyles.sectionTitle('Contact me'),
              const SizedBox(height: 10),
              Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryGold.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Contact Description
          TextStyles.sectionDescription(
            'Let\'s build your ideas together. I always love hearing about your new projects, and I look forward to any opportunity where we can work together and achieve strong results.',
          ),
          const SizedBox(height: 35),

          // Contact Cards
          LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              double spacing;
              double runSpacing;
              WrapAlignment alignment;

              if (screenWidth > 1200) {
                spacing = 20;
                runSpacing = 20;
                alignment = WrapAlignment.center;
              } else if (screenWidth > 900) {
                spacing = 18;
                runSpacing = 18;
                alignment = WrapAlignment.center;
              } else if (screenWidth > 768) {
                spacing = 16;
                runSpacing = 16;
                alignment = WrapAlignment.center;
              } else if (screenWidth > 600) {
                spacing = 15;
                runSpacing = 15;
                alignment = WrapAlignment.spaceEvenly;
              } else if (screenWidth > 480) {
                spacing = 12;
                runSpacing = 12;
                alignment = WrapAlignment.spaceEvenly;
              } else if (screenWidth > 360) {
                spacing = 10;
                runSpacing = 10;
                alignment = WrapAlignment.spaceEvenly;
              } else {
                spacing = 8;
                runSpacing = 8;
                alignment = WrapAlignment.spaceEvenly;
              }

              return Wrap(
                spacing: spacing,
                runSpacing: runSpacing,
                alignment: alignment,
                children: List.generate(
                  4,
                  (index) => ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: screenWidth > 600 ? 180 : 150,
                      maxWidth: screenWidth > 600 ? 200 : 170,
                    ),
                    child: ContactCard(index: index),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
