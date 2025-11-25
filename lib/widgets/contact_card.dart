import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/text_styles.dart';

class ContactCard extends StatefulWidget {
  final int index;

  const ContactCard({super.key, required this.index});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final contacts = _getContacts();
    final contact = contacts[widget.index];

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => _handleContactAction(contact['action'] as String),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? (contact['color'] as Color)
                  : AppColors.border,
              width: _isHovered ? 1.5 : 1.0,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: (contact['color'] as Color).withValues(alpha: 0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Icon Container
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (contact['color'] as Color).withValues(
                    alpha: _isHovered ? 0.2 : 0.1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  contact['icon'] as IconData,
                  color: contact['color'] as Color,
                  size: 20,
                ),
              ),
              const SizedBox(height: 12),
              TextStyles.contactTitle(contact['title'] as String),
              const SizedBox(height: 4),
              TextStyles.contactSubtitle(contact['subtitle'] as String),
              const SizedBox(height: 8),
              // Animated Hover Indicator
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _isHovered ? 30.0 : 0.0,
                height: 2,
                decoration: BoxDecoration(
                  color: contact['color'] as Color,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getContacts() {
    return [
      {
        'icon': Icons.phone_rounded,
        'title': 'Call Me',
        'subtitle': '+966 530195610',
        'color': AppColors.primaryGold,
        'action': 'call',
      },
      {
        'icon': Icons.email_rounded,
        'title': 'Email Me',
        'subtitle': 'osmaa10321@gmail.com',
        'color': AppColors.primaryBrown,
        'action': 'email',
      },
      {
        'icon': Icons.link_rounded,
        'title': 'LinkedIn',
        'subtitle': 'Professional Network',
        'color': AppColors.linkedIn,
        'action': 'linkedin',
      },
      {
        'icon': Icons.code_rounded,
        'title': 'GitHub',
        'subtitle': 'Code Portfolio',
        'color': AppColors.github,
        'action': 'github',
      },
    ];
  }

  void _handleContactAction(String action) {
    switch (action) {
      case 'call':
        _launchUrl('tel:+966530196610');
        break;
      case 'email':
        _launchUrl('mailto:osmaa10321@gmail.com');
        break;
      case 'linkedin':
        _launchUrl('https://www.linkedin.com/in/اسامة-عبد-الوهاب-b51324266/');
        break;
      case 'github':
        _launchUrl('https://github.com/soma10321');
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
