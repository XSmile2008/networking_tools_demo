import 'package:flutter/material.dart';

/// Designs: https://www.figma.com/file/uvGKqfXQ0osqdsDBnpVzPo/%F0%9F%93%90-Design-System-%E2%80%93%C2%A0LifeMD-Care?node-id=3867%3A23411&t=YbBmA6VuDu1LYjeN-1
class CommonTextArea extends StatelessWidget {
  final TextStyle? style;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;

  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final int? minLines;
  final int? maxLines;

  final EdgeInsets? contentPadding;

  final ValueChanged<String>? onChanged;

  const CommonTextArea({
    super.key,
    this.style,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.textInputAction,
    this.minLines,
    this.maxLines,
    this.contentPadding,
    this.onChanged,
  });

  CommonTextArea.small({
    Key? key,
    String? labelText,
    String? hintText,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    int? minLines,
    int? maxLines,
    ValueChanged<String>? onChanged,
  }) : this(
          key: key,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
          ),
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          minLines: minLines,
          maxLines: maxLines,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          onChanged: onChanged,
        );

  CommonTextArea.medium({
    Key? key,
    String? labelText,
    String? hintText,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    int? minLines,
    int? maxLines,
    ValueChanged<String>? onChanged,
  }) : this(
          key: key,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          minLines: minLines,
          maxLines: maxLines,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          onChanged: onChanged,
        );

  CommonTextArea.large({
    Key? key,
    String? labelText,
    String? hintText,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    int? minLines,
    int? maxLines,
    ValueChanged<String>? onChanged,
  }) : this(
          key: key,
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade700,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade700,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade500,
          ),
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          minLines: minLines,
          maxLines: maxLines,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 13,
          ),
          onChanged: onChanged,
        );

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            Text(
              labelText!,
              style: labelStyle ??
                  TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade700,
                  ),
            ),
            const SizedBox(height: 8),
          ],
          TextFormField(
            style: style,
            minLines: minLines,
            maxLines: maxLines,
            textCapitalization: textCapitalization,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            cursorColor: Colors.grey.shade700,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              contentPadding: contentPadding,
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: Colors.blue.shade500,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            ),
          ),
        ],
      );
}
