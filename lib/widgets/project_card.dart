import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/text_styles.dart';

class ProjectCard extends StatelessWidget {
  final int index;

  const ProjectCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final projects = ListProjects().getProjects();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          // Project Image
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  scale: 1,
                  image: AssetImage(projects[index]['image']),
                ),
              ),
              // child: Image.asset(projects[index]['image']),
            ),
          ),
          // Project Content
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: AppColors.cardShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //--------------------------//
                  // ----Title----//
                  //--------------------------//
                  TextStyles.cardTitle(projects[index]['title'] as String),
                  const SizedBox(height: 8),
                  //--------------------------//
                  // ---- Description ----//
                  //--------------------------//
                  TextStyles.cardDescription(
                    projects[index]['description'] as String,
                  ),
                  const SizedBox(height: 12),
                  //--------------------------//
                  // ---- Tech ----//
                  //--------------------------//
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGold.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextStyles.cardTech(
                      projects[index]['tech'] as String,
                    ),
                  ),
                  const SizedBox(height: 12),
                  //--------------------------//
                  //---- Button ----//
                  //--------------------------//
                  if (projects[index]['buttonName'] != '')
                    GestureDetector(
                      onTap: () =>
                          _handleProjectAction(projects[index]['action']),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextStyles.secondaryButton(
                          projects[index]['buttonName'],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleProjectAction(String action) {
    switch (action) {
      case 'EasyPay':
        _launchUrl(
          'https://play.google.com/store/apps/details?id=com.easyerps.easypay',
        );
        break;
      case 'Digital guide':
        _launchUrl(
          'https://play.google.com/store/apps/details?id=sa.awonteck.digital',
        );
        break;
      case 'Birthday Calculator':
        _launchUrl('https://github.com/SoMa-10/calculator-App');
        break;
      case 'My library in Flutter pub.dev':
        _launchUrl('https://pub.dev/packages/simple_text_widget');
        break;
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (e) {
      log('Could not launch $url: $e');
    }
  }
}

class ListProjects {
  ListProjects._internal();
  static final ListProjects instance = ListProjects._internal();
  factory ListProjects() => instance;

  List<Map<String, dynamic>> getProjects() {
    return [
      {
        'title': 'EasyPay Application (developed for EasyPay Company)',
        'description':
            'Mobile payment app with Nearpay API integration for secure transactions and real-time processing.',
        'tech': 'Flutter • Nearpay API',
        'image': 'assets/images/EasyPay Logo-01.png',
        'buttonName': 'Project presentation',
        'action': 'EasyPay',
      },
      {
        'title': 'Easykiosk Application (developed for EasyPay Company)',
        'description':
            'I was the primary developer of the Easykiosk interfaces.',
        'tech': 'Flutter • Nearpay API ',
        'image': 'assets/images/EasyPay Logo-01.png',
        'buttonName': '',
        'action': '',
      },
      {
        'title': 'Easy Fuel Application (developed for EasyPay Company)',
        'description':
            'I was also the lead developer for the Easy Fuel interfaces.',
        'tech': 'Flutter • Nearpay API',
        'image': 'assets/images/EasyPay Logo-01.png',
        'buttonName': '',
        'action': '',
      },
      {
        'title': 'Digital guide application (Special for Aoun Association)',
        'description':
            'Collaborating with the team in implementing Firebase authentication and data management, while contributing to the design and development of all user interfaces.',
        'tech': 'Flutter • Firebase • UI/UX',
        'image': 'assets/images/الدليل الرقمي.png',
        'buttonName': 'Project presentation',
        'action': 'Digital guide',
      },
      {
        'title': 'Helpings Needlys',
        'description':
            'As a developer, I contributed to the graduation project, and participated in the design and implementation of the application\'s main features.',
        'tech': 'Flutter • Firebase • localizations',
        'image': 'assets/images/Helpings_Needlys.png',
        'buttonName': '',
      },
      {
        'title': 'Productive Families',
        'description':
            'As a developer, I contributed to this application, using Firebase for backend services and Figma for user interface, user experience, and prototyping.',
        'tech': 'Figma • Firebase • Payment',
        'image': 'assets/images/دراسة-جدوى-تطبيق-جوال.png.webp',
        'buttonName': '',
      },
      {
        'title': 'Birthday Calculator',
        'description':
            'Developed a personal application as part of my learning and skill development process.',
        'tech': 'Flutter • Dart • GitHub',
        'image': 'assets/images/دراسة-جدوى-تطبيق-جوال.png.webp',
        'buttonName': 'Project presentation',
        'action': 'Birthday Calculator',
      },
      {
        'title': 'My library in Flutter pub.dev (SimpleTextWidget)',
        'description':
            'SimpleTextWidget is a ready-to-use widget based on AutoSizeText that provides a rich and highly customizable text experience in Flutter apps.',
        'tech': 'Dart • Flutter • Pub.dev',
        'image': 'assets/images/pub-dev-icon-cover-image.png',
        'buttonName': 'Library Showcase',
        'action': 'My library in Flutter pub.dev',
      },
    ];
  }
}
