import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'sections/navigation_bar.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBackgroundElements() {
    return Positioned.fill(
      child: Column(
        children: [
          // Top Right Gradient
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColors.primaryGold.withValues(alpha: 0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Bottom Left Gradient
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primaryBrown.withValues(alpha: 0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 768;
    final isDesktop = size.width > 1024;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            _buildBackgroundElements(),
            SingleChildScrollView(
              child: Column(
                children: [
                  NavigationBarSection(isDesktop: isDesktop),
                  HeroSection(
                    isTablet: isTablet,
                    isDesktop: isDesktop,
                    fadeAnimation: _fadeAnimation,
                    scaleAnimation: _scaleAnimation,
                    controller: _controller,
                  ),
                  const SizedBox(height: 40),
                  ProjectsSection(isTablet: isTablet, isDesktop: isDesktop),
                  const SizedBox(height: 40),
                  SkillsAndEducation(isTablet: isTablet, isDesktop: isDesktop),
                  const SizedBox(height: 40),
                  ExperienceAndContact(
                    isTablet: isTablet,
                    isDesktop: isDesktop,
                  ),
                  const SizedBox(height: 40),
                  const FooterSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Two Columns Sections
class SkillsAndEducation extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;

  const SkillsAndEducation({
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          bool showTwoColumns = screenWidth > 800;

          if (showTwoColumns) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SkillsSection()),
                const SizedBox(width: 30),
                const Expanded(child: EducationSection()),
              ],
            );
          } else {
            return const Column(
              children: [
                SkillsSection(),
                SizedBox(height: 30),
                EducationSection(),
              ],
            );
          }
        },
      ),
    );
  }
}

class ExperienceAndContact extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;

  const ExperienceAndContact({
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          bool showTwoColumns = screenWidth > 800;

          if (showTwoColumns) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: ExperienceSection()),
                const SizedBox(width: 30),
                const Expanded(child: ContactSection()),
              ],
            );
          } else {
            return const Column(
              children: [
                ExperienceSection(),
                SizedBox(height: 30),
                ContactSection(),
              ],
            );
          }
        },
      ),
    );
  }
}
