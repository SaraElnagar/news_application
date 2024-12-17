import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;

  Source source;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLightColor : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.primaryLightColor, width: 2)),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isSelected
                ? AppColors.whiteColor
                : AppColors.primaryLightColor),
      ),
    );
  }
}
