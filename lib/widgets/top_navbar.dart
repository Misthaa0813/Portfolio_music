
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 88,
      color: AppTheme.background,
      alignment: Alignment.center,
      child: const Text(
        'Misthaa',
        style: TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 19,
          fontWeight: FontWeight.w700,
          letterSpacing: 3,
        ),
      ),
    );
  }
}
