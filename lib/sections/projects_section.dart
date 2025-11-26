import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import '../constants/text_styles.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;

  const ProjectsSection({
    super.key,
    required this.isTablet,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 60
            : isTablet
            ? 30
            : 30,
      ),
      child: Column(
        children: [
          // Section Card with Title Inside
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40),
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
                        icon: HugeIcons.strokeRoundedWork,
                        color: AppColors.primaryGold.withValues(alpha: 0.1),
                        strokeWidth: 2.3,
                        size: 24,
                      ),
                    ),

                    const SizedBox(height: 12),
                    TextStyles.sectionTitle('Featured Projects'),
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
                const SizedBox(height: 40),

                // Projects Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    final screenWidth = constraints.maxWidth;
                    int crossAxisCount;
                    double childAspectRatio;

                    if (screenWidth > 1200) {
                      crossAxisCount = 3;
                      childAspectRatio = 0.8;
                    } else if (screenWidth > 900) {
                      crossAxisCount = 3;
                      childAspectRatio = 0.5;
                    } else if (screenWidth > 600) {
                      crossAxisCount = 2;
                      childAspectRatio = 0.5;
                    } else if (screenWidth > 500) {
                      crossAxisCount = 2;
                      childAspectRatio = 0.4;
                    } else {
                      crossAxisCount = 1;
                      childAspectRatio = 0.6;
                    }

                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: childAspectRatio,
                        mainAxisExtent: screenWidth > 900 ? 500 : 470,
                      ),
                      itemCount: ListProjects.instance.getProjects().length,
                      itemBuilder: (context, index) =>
                          ProjectCard(index: index),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
