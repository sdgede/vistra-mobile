import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DialogUtils {
  static Future<void> showError({
    required BuildContext context,
    required String text,
  }) {
    return _showDialogBase(
      context: context,
      animationPath: 'assets/json/err.json',
      title: 'Warning!',
      titleColor: Colors.redAccent,
      text: text,
    );
  }

  static Future<void> showSuccess({
    required BuildContext context,
    required String text,
  }) {
    return _showDialogBase(
      context: context,
      animationPath: 'assets/json/suc.json',
      title: 'Success',
      titleColor: Colors.green,
      text: text,
    );
  }

  static Future<void> _showDialogBase({
    required BuildContext context,
    required String animationPath,
    required String title,
    required Color titleColor,
    required String text,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder:
          (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            titlePadding: const EdgeInsets.only(top: 16),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  animationPath,
                  width: 100,
                  height: 100,
                  repeat: false,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            content: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text(
                  "OK",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
    );
  }
}
