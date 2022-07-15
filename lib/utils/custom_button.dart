import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final BorderRadius? borderRadius;
  final String? text;
  final Widget? child;
  final bool isfill;
  final bool isEnable;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final GestureTapCallback? onTap;

  const CustomButton({
    Key? key,
    this.borderRadius,
    this.text,
    this.child,
    this.isfill = true,
    this.isEnable = true,
    this.fillColor,
    this.borderColor,
    this.textStyle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(10),
      child: Material(
        child: InkWell(
          onTap: isEnable ? onTap ?? () {} : null,
          highlightColor: isfill
              ? Colors.white.withOpacity(0.2)
              : Colors.grey.withOpacity(0.2),
          splashColor: isfill
              ? Colors.white.withOpacity(0.2)
              : Colors.grey.withOpacity(0.2),
          child: Ink(
            height: 50,
            decoration: BoxDecoration(
              color: isEnable
                  ? (isfill ? fillColor ?? Colors.purple : Colors.transparent)
                  : Colors.black12,
              borderRadius: borderRadius ?? BorderRadius.circular(10),
              border: isfill
                  ? const Border.symmetric()
                  : Border.all(color: borderColor ?? Colors.white),
            ),
            child: Container(
              alignment: Alignment.center,
              child: child ??
                  Text(
                    text ?? "Text",
                    style: textStyle ??
                        TextStyle(color: isfill ? Colors.white : Colors.black),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
