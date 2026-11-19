import 'package:flutter/material.dart';

// 1. Enums required by the instructions
enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom buttons'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.secondary,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// 2. The CustomButton StatelessWidget
class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  // Helper getter to match ButtonType with its specific color
  Color get backgroundColor {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPosition == IconPosition.left
            ? [
                Icon(icon, size: 18, color: Colors.black54),
                const SizedBox(width: 8),
                Text(label, style: const TextStyle(color: Colors.black54)),
              ]
            : [
                Text(label, style: const TextStyle(color: Colors.black54)),
                const SizedBox(width: 8),
                Icon(icon, size: 18, color: Colors.black54),
              ],
      ),
    );
  }
}