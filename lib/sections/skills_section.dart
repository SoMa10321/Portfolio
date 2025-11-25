import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'package:simple_text_widget/simple_text_widget.dart';
import '../constants/text_styles.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
                  Icons.code_rounded,
                  color: AppColors.primaryGold,
                  size: 24,
                ),
              ),
              const SizedBox(height: 12),
              TextStyles.sectionTitle('Technical Skills'),
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

          // Skills Description
          TextStyles.sectionDescription(
            'Modern technologies for scalable mobile applications with expertise in frontend, backend, and UI/UX design.',
          ),
          const SizedBox(height: 25),

          // Skills List
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              _buildSkillChip('Flutter/Dart'),
              _buildSkillChip('Firebase'),
              _buildSkillChip('REST API'),
              _buildSkillChip('UI/UX Design'),
              _buildSkillChip('State Management'),
              _buildSkillChip('Git & GitHub'),
              _buildSkillChip('Java'),
              _buildSkillChip('Python'),
              _buildSkillChip('Figma'),
              _buildSkillChip('Google Play Console'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryGold.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primaryGold.withValues(alpha: 0.3)),
      ),
      child: SimpleTextWidget(
        text: skill,
        size: 14,
        color: AppColors.primaryBrown,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
