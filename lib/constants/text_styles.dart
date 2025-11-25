import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/constants/app_colors.dart';
import 'package:simple_text_widget/simple_text_widget.dart';

class TextStyles {
  // Hero Section
  static SimpleTextWidget heroWelcomeText() {
    return SimpleTextWidget(
      text: 'Hi, I\'m Ousama 👋',
      size: 23,
      color: AppColors.primaryGold,
      fontWeight: FontWeight.w500,
    );
  }

  static SimpleTextWidget heroTitleText() {
    return SimpleTextWidget(
      text: 'Flutter Developer &\nMobile App Specialist',
      size: 48,
      color: AppColors.darkGray,
      fontWeight: FontWeight.bold,
      height: 1.1,
    );
  }

  static SimpleTextWidget heroDescriptionText() {
    return SimpleTextWidget(
      text:
          'I specialize in creating beautiful, high-performance mobile applications using Flutter framework. '
          'With over 3 years of experience, I transform complex ideas into seamless digital experiences '
          'that users love. Passionate about clean code, pixel-perfect design, and cutting-edge technology.',
      size: 18,
      color: AppColors.mediumGray,
      height: 1.6,
    );
  }

  // Section Titles
  static SimpleTextWidget sectionTitle(String text) {
    return SimpleTextWidget(
      text: text,
      size: 28,
      color: AppColors.darkGray,
      fontWeight: FontWeight.bold,
    );
  }

  static SimpleTextWidget sectionDescription(String text) {
    return SimpleTextWidget(
      text: text,
      size: 16,
      color: AppColors.mediumGray,
      height: 1.5,
      textAlign: TextAlign.center,
    );
  }

  // Navigation
  static SimpleTextWidget navItem(String text, bool isSelected) {
    return SimpleTextWidget(
      text: text,
      size: 14,
      color: isSelected ? AppColors.primaryGold : AppColors.mediumGray,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
    );
  }

  // Buttons
  static SimpleTextWidget primaryButton(String text) {
    return SimpleTextWidget(
      text: text,
      size: 18,
      color: AppColors.white,
      fontWeight: FontWeight.w600,
    );
  }

  static SimpleTextWidget secondaryButton(String text) {
    return SimpleTextWidget(
      text: text,
      size: 17,
      maxLines: 1,
      color: AppColors.white,
      fontWeight: FontWeight.w600,
    );
  }

  // Cards
  static SimpleTextWidget cardTitle(String text) {
    return SimpleTextWidget(
      text: text,
      size: 23,
      maxLines: 2,
      minFontSize: 10,
      color: AppColors.darkGray,
      fontWeight: FontWeight.bold,
    );
  }

  static SimpleTextWidget cardDescription(String text) {
    return SimpleTextWidget(
      text: text,
      size: 13,
      color: AppColors.mediumGray,
      // height: 1.4,
      maxLines: 4,
      minFontSize: 10,
      overflow: TextOverflow.ellipsis,
    );
  }

  static SimpleTextWidget cardTech(String text) {
    return SimpleTextWidget(
      text: text,
      size: 10,
      color: AppColors.primaryBrown,
      fontWeight: FontWeight.w500,
    );
  }

  // Contact
  static SimpleTextWidget contactTitle(String text) {
    return SimpleTextWidget(
      text: text,
      size: 14,
      color: AppColors.darkGray,
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.center,
    );
  }

  static SimpleTextWidget contactSubtitle(String text) {
    return SimpleTextWidget(
      text: text,
      size: 11,
      color: AppColors.mediumGray,
      textAlign: TextAlign.center,
      maxLines: 1,
      height: 1.2,
    );
  }

  // Footer
  static SimpleTextWidget footerTitle(String text) {
    return SimpleTextWidget(
      text: text,
      size: 20,
      color: AppColors.darkGray,
      fontWeight: FontWeight.bold,
    );
  }

  static SimpleTextWidget footerSubtitle(String text) {
    return SimpleTextWidget(text: text, size: 16, color: AppColors.mediumGray);
  }

  static SimpleTextWidget footerCopyright(String text) {
    return SimpleTextWidget(text: text, size: 14, color: AppColors.lightGray);
  }

  // Experience & Education
  static SimpleTextWidget experienceTitle(String text) {
    return SimpleTextWidget(
      text: text,
      size: 16,
      color: AppColors.darkGray,
      fontWeight: FontWeight.w600,
    );
  }

  static SimpleTextWidget experiencePeriod(String text) {
    return SimpleTextWidget(
      text: text,
      size: 11,
      color: AppColors.primaryBrown,
      fontWeight: FontWeight.w600,
    );
  }

  static SimpleTextWidget experienceDescription(String text) {
    return SimpleTextWidget(
      text: text,
      size: 13,
      color: AppColors.mediumGray,
      height: 1.4,
    );
  }

  static SimpleTextWidget educationTitle(String text) {
    return SimpleTextWidget(
      text: text,
      size: 14,
      color: AppColors.darkGray,
      fontWeight: FontWeight.w600,
    );
  }

  static SimpleTextWidget educationPeriod(String text) {
    return SimpleTextWidget(
      text: text,
      size: 10,
      color: AppColors.primaryBrown,
      fontWeight: FontWeight.w600,
    );
  }

  static SimpleTextWidget educationDescription(String text) {
    return SimpleTextWidget(
      text: text,
      size: 12,
      color: AppColors.mediumGray,
      height: 1.4,
    );
  }
}
