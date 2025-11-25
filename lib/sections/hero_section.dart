import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'package:simple_text_widget/simple_text_widget.dart';
import '../constants/text_styles.dart';

class HeroSection extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;
  final AnimationController controller;

  const HeroSection({
    super.key,
    required this.isTablet,
    required this.isDesktop,
    required this.fadeAnimation,
    required this.scaleAnimation,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 120
            : isTablet
            ? 60
            : 30,
      ),
      child: isDesktop ? _buildDesktopHero() : _buildMobileHero(isTablet),
    );
  }

  Widget _buildDesktopHero() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Text
              FadeTransition(
                opacity: fadeAnimation,
                child: TextStyles.heroWelcomeText(),
              ),
              const SizedBox(height: 20),

              // Main Heading
              SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(-0.5, 0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
                      ),
                    ),
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: TextStyles.heroTitleText(),
                ),
              ),
              const SizedBox(height: 25),

              // Description
              FadeTransition(
                opacity: fadeAnimation,
                child: TextStyles.heroDescriptionText(),
              ),
              const SizedBox(height: 35),

              // CTA Buttons
              Row(
                children: [
                  // Primary Button
                  // ScaleTransition(
                  //   scale: scaleAnimation,
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 35,
                  //       vertical: 16,
                  //     ),
                  //     decoration: BoxDecoration(
                  //       gradient: AppColors.primaryGradient,
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         const Icon(
                  //           Icons.work_outline,
                  //           color: Colors.white,
                  //           size: 22,
                  //         ),
                  //         const SizedBox(width: 12),
                  //         TextStyles.primaryButton('View My Work'),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(width: 20),

                  // Secondary Button
                  // ScaleTransition(
                  //   scale: scaleAnimation,
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 35,
                  //       vertical: 16,
                  //     ),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: AppColors.border),
                  //       gradient: AppColors.primaryGradient,
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         HugeIcon(
                  //           icon: HugeIcons.strokeRoundedDownload01,
                  //           color: Colors.white,
                  //           strokeWidth: 2,
                  //           size: 24,
                  //         ),

                  //         const SizedBox(width: 12),
                  //         TextStyles.secondaryButton('Download CV'),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),

        // Profile Image
        // const SizedBox(width: 60),
        ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryGold, width: 3),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGold.withValues(alpha: 0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/e623aed9-d593-45da-90a9-a28fb42cb563.jpeg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileHero(bool isTablet) {
    return Column(
      children: [
        // Profile Image
        ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: isTablet ? 280 : 200,
            height: isTablet ? 280 : 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryGold, width: 3),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGold.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/e623aed9-d593-45da-90a9-a28fb42cb563.jpeg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 35),

        // Text Content
        FadeTransition(
          opacity: fadeAnimation,
          child: TextStyles.heroWelcomeText(),
        ),
        const SizedBox(height: 15),

        SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
              .animate(
                CurvedAnimation(
                  parent: controller,
                  curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
                ),
              ),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: SimpleTextWidget(
              text: 'Flutter Developer &\nMobile App Specialist',
              size: isTablet ? 36 : 28,
              color: AppColors.darkGray,
              fontWeight: FontWeight.bold,
              height: 1.1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 20),

        FadeTransition(
          opacity: fadeAnimation,
          child: SimpleTextWidget(
            text:
                'I specialize in creating beautiful, high-performance mobile applications using Flutter framework. '
                'With over 4 years of experience, I transform complex ideas into seamless digital experiences.',
            size: 16,
            color: AppColors.mediumGray,
            height: 1.6,
            textAlign: TextAlign.center,
          ),
        ),

        // const SizedBox(height: 30),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          alignment: WrapAlignment.center,
          children: [
            // ScaleTransition(
            //   scale: scaleAnimation,
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 30,
            //       vertical: 14,
            //     ),
            //     decoration: BoxDecoration(
            //       gradient: AppColors.primaryGradient,
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         const Icon(
            //           Icons.work_outline,
            //           color: Colors.white,
            //           size: 20,
            //         ),
            //         const SizedBox(width: 10),
            //         TextStyles.primaryButton('View My Work'),
            //       ],
            //     ),
            //   ),
            // ),
            // ScaleTransition(
            //   scale: scaleAnimation,
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 30,
            //       vertical: 14,
            //     ),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: AppColors.border),
            //       gradient: AppColors.primaryGradient,

            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         HugeIcon(
            //           icon: HugeIcons.strokeRoundedDownload01,
            //           color: Colors.white,
            //           strokeWidth: 2,
            //           size: 24,
            //         ),

            //         const SizedBox(width: 12),
            //         TextStyles.secondaryButton('Download CV'),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
