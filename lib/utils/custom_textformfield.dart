import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final bool? enable;
  final String? hintText;
  final String? labelText;
  final String? label;
  final Color? borderColor;
  final TextStyle? labelstyle;
  final bool? obscureText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry padding;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField(
      {Key? key,
      this.onSaved,
      this.onChanged,
      this.hintText,
      this.labelText,
      this.label,
      this.labelstyle,
      this.padding = const EdgeInsets.only(bottom: 20),
      this.controller,
      this.borderColor,
      this.obscureText,
      this.validator,
      this.enable,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(label ?? '', style: labelstyle),
                )
              : const SizedBox(),
          TextFormField(
            enabled: enable ?? true,
            validator: validator,
            obscureText: obscureText ?? false,
            controller: controller,
            onSaved: onSaved,
            onChanged: onChanged,
            inputFormatters: inputFormatters ?? [],
            decoration: InputDecoration(
              fillColor: Colors.black12,
              filled: true,
              hintText: hintText,
              labelText: labelText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: borderColor ?? Colors.white, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: borderColor ?? Colors.white, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
