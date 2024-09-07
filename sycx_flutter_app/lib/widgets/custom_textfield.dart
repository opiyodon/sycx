import 'package:flutter/material.dart';
import 'package:sycx_flutter_app/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final bool obscureText;
  final String? Function(String?) validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    required this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.bodyTextStyle.copyWith(
          color: AppColors.secondaryTextColor,
        ),
        filled: true,
        fillColor: AppColors.textFieldFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor.withOpacity(0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
          borderSide: const BorderSide(
            color: AppColors.textFieldBorderColor,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppColors.secondaryTextColor)
            : null,
        suffixIcon: suffixIcon,
        // Add a border to separate the input area from icons
        prefixIconConstraints: const BoxConstraints(minWidth: 60),
        suffixIconConstraints: const BoxConstraints(minWidth: 60),
      ),
      style: AppTextStyles.bodyTextStyle,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
