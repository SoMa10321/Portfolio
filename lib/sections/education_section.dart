import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'package:simple_text_widget/simple_text_widget.dart';
import '../constants/text_styles.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

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
                child: const Icon(
                  Icons.school_rounded,
                  color: AppColors.primaryGold,
                  size: 24,
                ),
              ),
              const SizedBox(height: 12),
              TextStyles.sectionTitle('Education & Courses'),
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

          // Education Items
          Column(
            children: [
              _buildEducationItem(
                'High School - Scientific',
                '2008 - 2019',
                'Mathematics and physics focus with strong analytical skills.',
              ),
              const SizedBox(height: 15),
              _buildEducationItem(
                'Digital Days',
                'Flutter | May31th ,2021',
                'Week 21 | GDE Series week',
              ),
              const SizedBox(height: 15),
              _buildEducationItem(
                'Digital Days',
                'Pixel Perfect | March15th,2022',
                'Week 10 | GDE Series week',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(String title, String period, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
                  size: 14,
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primaryGold.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: SimpleTextWidget(
                  text: period,
                  size: 10,
                  color: AppColors.primaryBrown,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          SimpleTextWidget(
            text: description,
            size: 12,
            color: AppColors.mediumGray,
            height: 1.4,
          ),
        ],
      ),
    );
  }
}
