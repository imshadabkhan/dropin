import 'package:dropin/core/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../constants/color_constants.dart';

class EntryField extends StatelessWidget {
  final String? hint;
  final String? prefixIcon;
  final Color? color;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? initialValue;
  final Color? textColor;
  final bool? readOnly;
  final TextAlign? textAlign;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final String? Function(String? value)? validator;
  final Function(String? value)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final bool? maxLengthEnforced;
  final bool? obscureText;
  final String? trailingTitle;
  final TextCapitalization? textCapitalization;
  final BorderRadius? borderRadius;
  final Function()? onTrailingTap;
  final Function()? onTap;
  final double? height;

  const EntryField({
    super.key,
    this.hint,
    this.prefixIcon,this.onTap,
    this.color,
    this.textColor,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.obscureText,
    this.trailingTitle,
    this.padding,
    this.validator,
    this.inputFormatter,
    this.onTrailingTap,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChange,
    this.textCapitalization,
    this.borderRadius,
    this.fillColor,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Texts.textNormal(
                    label!,size: 12,color: Colors.white

                  ),
                  if (trailingTitle != null)
                    GestureDetector(
                      onTap: onTrailingTap,
                      child: Text(
                        trailingTitle ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 14, color: Colors.red),
                      ),
                    ),
                ],
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 5,
        ),
        Container(
alignment: Alignment.center,
          height: height??45,
          child: TextFormField(
            // enabled: readOnly,
            onTap:onTap ,
            obscureText: obscureText ?? false,
            controller: controller,
            validator: validator,
            onChanged: onChange,
            initialValue: initialValue,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            readOnly: readOnly ?? false,
            maxLines: maxLines ?? 1,
            inputFormatters: inputFormatter,
            maxLength: maxLength,
            maxLengthEnforcement: maxLengthEnforced ?? false
                ? MaxLengthEnforcement.enforced
                : MaxLengthEnforcement.none,
            textAlign: textAlign ?? TextAlign.left,
            style:  TextStyle(
                fontFamily: "MontserratRegular",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color:textColor ?? Colors.black),
            keyboardType: textInputType,
            decoration: InputDecoration(


filled: true,

              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              prefixIconConstraints: BoxConstraints(
                minWidth: 15, // Set minimum width for the icon
                minHeight: 15, // Set minimum height for the icon
              ),
              prefixIcon: prefixIcon != null
                  ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(width: 17,height: 17,
                    child: Image.asset(prefixIcon??"",fit: BoxFit.contain,color: Colors.white)),
                  )
                  : null,
              suffixIcon: InkWell(
                  onTap: onTrailingTap,

                  child: Icon(suffixIcon,size: 17,color: Colors.white,)),
              hintText: hint,
              hintStyle: TextStyle(
                  fontFamily: "MontserratRegular",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color:Colors.white),
              counterStyle: const TextStyle(
                height: double.minPositive,
              ),
              counterText: "",
              fillColor:fillColor??Colors.white ,
              border: OutlineInputBorder(
                borderSide:  BorderSide(color: ColorConstants.greyBgColor),
                borderRadius:
                    borderRadius ?? BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: ColorConstants.greyBgColor),
                borderRadius:
                    borderRadius ?? BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: ColorConstants.greyBgColor),
                borderRadius:
                    borderRadius ?? BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
class EntrySearchField extends StatelessWidget {
  final String? hint;
  final String? prefixIcon;
  final Color? color;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? readOnly;
  final TextAlign? textAlign;
  final String? suffixIcon;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final String? Function(String? value)? validator;
  final Function(String? value)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final bool? maxLengthEnforced;
  final bool? obscureText;
  final String? trailingTitle;
  final TextCapitalization? textCapitalization;
  final BorderRadius? borderRadius;
  final Function()? onTrailingTap;
  final Function()? onTap;
  const EntrySearchField({
    super.key,
    this.hint,
    this.prefixIcon,this.onTap,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.obscureText,
    this.trailingTitle,
    this.padding,
    this.validator,
    this.inputFormatter,
    this.onTrailingTap,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChange,
    this.textCapitalization,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label!,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black87,
                  fontSize: 13,
                  fontFamily: "Montserrat"),
            ),
            if (trailingTitle != null)
              GestureDetector(
                onTap: onTrailingTap,
                child: Text(
                  trailingTitle ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 14, color: Colors.red),
                ),
              )
          ],
        )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.center,
          height: 45,
          child: TextFormField(onTap:onTap ,
            obscureText: obscureText ?? false,
            controller: controller,
            validator: validator,
            onChanged: onChange,
            initialValue: initialValue,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            readOnly: readOnly ?? false,
            maxLines: maxLines ?? 1,
            inputFormatters: inputFormatter,
            maxLength: maxLength,
            maxLengthEnforcement: maxLengthEnforced ?? false
                ? MaxLengthEnforcement.enforced
                : MaxLengthEnforcement.none,
            textAlign: textAlign ?? TextAlign.left,
            style: const TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black),
            keyboardType: textInputType,
            decoration: InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              prefixIconConstraints: BoxConstraints(
                minWidth: 15, // Set minimum width for the icon
                minHeight: 15, // Set minimum height for the icon
              ),
              prefixIcon: prefixIcon != null
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(width: 17,height: 17,
                    child: Image.asset(prefixIcon??"",fit: BoxFit.contain,color: ColorConstants.blackColor)),
              )
                  : null,
              suffixIcon: suffixIcon!=null?InkWell(
                  onTap: onTrailingTap,

                  child:  Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(width: 15,height: 15,
    child: Image.asset(suffixIcon??"",fit: BoxFit.contain,color: Colors.black54)),
    )):SizedBox(),
              hintText: hint,
              hintStyle: const TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black45),
              counterStyle: const TextStyle(
                height: double.minPositive,
              ),
              counterText: "",fillColor:Colors.white ,
              border: OutlineInputBorder(
                borderSide:  BorderSide(color: ColorConstants.greyBgColor),
                borderRadius:
                borderRadius ?? BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:ColorConstants.greyBgColor),
                borderRadius:
                borderRadius ?? BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color:  ColorConstants.greyBgColor),
                borderRadius:
                borderRadius ?? BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class EntryBigField extends StatelessWidget {
  final String? hint;
  final IconData? prefixIcon;
  final Color? color;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? readOnly;
  final TextAlign? textAlign;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? padding;
  final String? Function(String? value)? validator;
  final Function(String? value)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final bool? maxLengthEnforced;
  final bool? obscureText;
  final String? trailingTitle;
  final Iterable<String>? autoFillType;
  final TextCapitalization? textCapitalization;
  final Function()? onTrailingTap;
  final double? vertical;

  const EntryBigField({

    super.key,
    this.vertical,
    this.hint,
    this.prefixIcon,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.autoFillType,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.obscureText,
    this.trailingTitle,
    this.padding,
    this.validator,
    this.inputFormatter,
    this.onTrailingTap,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChange,
    this.minLines,
    this.textCapitalization,
    this.fillColor
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Texts.textNormal(
                    label!,


                      size: 12,
                        fontFamily: "Montserrat"),

                  if (trailingTitle != null)
                    GestureDetector(
                      onTap: onTrailingTap,
                      child: Text(
                        trailingTitle ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 14, color: Colors.red),
                      ),
                    )
                ],
              )
            : const SizedBox.shrink(),
        label != null? const SizedBox(
          height: 5,
        ):const SizedBox.shrink(),
        TextFormField(
          obscureText: obscureText ?? false,
          autofillHints: autoFillType,
          controller: controller,
          validator: validator,
          onChanged: onChange,
          minLines: minLines,
          initialValue: initialValue,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          readOnly: readOnly ?? false,
          maxLines: null,
          inputFormatters: inputFormatter,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforced ?? false
              ? MaxLengthEnforcement.enforced
              : MaxLengthEnforcement.none,
          textAlign: textAlign ?? TextAlign.left,
          style: const TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black),          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: vertical ?? 25),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: Theme.of(context).disabledColor,
                    size: 17,
                  )
                : null,
            suffixIcon: InkWell(
                onTap: onTrailingTap,
                child: Icon(
                  suffixIcon,
                  color: Theme.of(context).disabledColor,
                  size: 20,
                )),
            hintText: hint,
            hintStyle: const TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.black45),
            filled: true,
            fillColor:fillColor?? Colors.white,
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            counterText: "",
            border:  OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.greyBgColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.greyBgColor),
              borderRadius: const BorderRadius.all(Radius.circular(10)),

            ),
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.greyBgColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
