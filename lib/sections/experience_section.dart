import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'package:simple_text_widget/simple_text_widget.dart';
import '../constants/text_styles.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryGold.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedWorkHistory,
                  color: AppColors.primaryGold.withValues(alpha: 0.1),
                  strokeWidth: 2.3,
                  size: 24,
                ),
              ),
              const SizedBox(height: 12),
              TextStyles.sectionTitle('Professional Journey'),
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
          const SizedBox(height: 25),

          // Experience Items
          Column(
            children: [
              _buildExperienceItem(
                'Mobile App Architect',
                '2022 - 2023',
                'I worked for 6 months with (A-Quality-Scope-Ltd) as a Flutter Application Developer and UI/UX Designer.',
              ),
              const SizedBox(height: 20),
              _buildExperienceItem(
                'Mobile App Architect',
                '2024 - 2025',
                'I also worked with (EasyPay) for a year as a Flutter Application Developer.',
              ),
              const SizedBox(height: 20),
              _buildExperienceItem(
                'Senior Flutter Developer',
                '2021 - Present',
                'Leading cross-platform app development with Flutter, specializing in scalable architecture and modern state management.',
              ),
              const SizedBox(height: 20),
              _buildExperienceItem(
                'UI/UX Engineering Lead',
                '2021 - Present',
                'Transformed design concepts into functional interfaces while ensuring optimal user experience across platforms.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(String title, String period, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SimpleTextWidget(
                  text: title,
                  size: 16,
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryGold.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SimpleTextWidget(
                  text: period,
                  size: 11,
                  color: AppColors.primaryBrown,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SimpleTextWidget(
            text: description,
            size: 13,
            color: AppColors.mediumGray,
            height: 1.4,
          ),
        ],
      ),
    );
  }
}
