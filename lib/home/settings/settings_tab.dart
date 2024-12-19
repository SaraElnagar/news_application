import 'package:flutter/material.dart';

import '../../app_colors.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Language", style: Theme.of(context).textTheme.titleMedium),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.primaryLightColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("English",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 15, color: AppColors.primaryLightColor)),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.primaryLightColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
