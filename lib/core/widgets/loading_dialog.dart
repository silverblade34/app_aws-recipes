import 'package:app_aws_recipes/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatelessWidget {
  final String message;
  final double? width;
  final double? widthPercentage;

  const LoadingDialog({
    super.key,
    required this.message,
    this.width,
    this.widthPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dialogWidth = width ??
        (widthPercentage != null ? screenWidth * widthPercentage! : screenWidth * 0.8);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dialogWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SpinKitFadingCircle(
                color: AppColors.darkGrey,
                size: 50.0,
              ),
              const SizedBox(height: 20.0),
              Text(
                message,
                style: const TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
