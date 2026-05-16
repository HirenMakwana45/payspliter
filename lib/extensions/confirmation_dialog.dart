import 'package:flutter/material.dart';
import 'package:payspliter/extensions/extension_util/string_extensions.dart';
import '../utils/app_colors.dart';
import 'extension_util/context_extensions.dart';

import 'app_button.dart';
import 'common.dart';
import 'constants.dart';
import 'decorations.dart';
import 'extension_util/int_extensions.dart';
import 'extension_util/widget_extensions.dart';
import 'loader_widget.dart';
import 'system_utils.dart';
import 'text_styles.dart';

/// Enum for Dialog Type
enum DialogType { cONFIRMATION, aCCEPT, dELETE, uPDATE, aDD, rETRY }

/// Enum for Dialog Animation
enum DialogAnimation { dEFAULT, rOTATE, sLIDETOPBOTTOM, sLIDEBOTTOMTOP, sLIDELEFTRIGHT, sLIDERIGHTLEFT, sCALE }

/// dialog primary color
Color getDialogPrimaryColor(
  BuildContext context,
  DialogType dialogType,
  Color? primaryColor,
) {
  if (primaryColor != null) return primaryColor;
  Color color;

  switch (dialogType) {
    case DialogType.dELETE:
      color = Colors.red;
      break;
    case DialogType.uPDATE:
      color = Colors.amber;
      break;
    case DialogType.cONFIRMATION:
    case DialogType.aDD:
    case DialogType.rETRY:
      color = Colors.blue;
      break;
    case DialogType.aCCEPT:
      color = Colors.green;
      break;
  }
  return color;
}

/// build positive text for dialog
String getPositiveText(DialogType dialogType) {
  String positiveText = "";

  switch (dialogType) {
    case DialogType.cONFIRMATION:
      positiveText = "Yes";
      break;
    case DialogType.dELETE:
      positiveText = "Delete";
      break;
    case DialogType.uPDATE:
      positiveText = "Update";
      break;
    case DialogType.aDD:
      positiveText = "Add";
      break;
    case DialogType.aCCEPT:
      positiveText = "Accept";
      break;
    case DialogType.rETRY:
      positiveText = "Retry";
      break;
  }
  return positiveText;
}

/// Build title
String getTitle(DialogType dialogType) {
  String titleText = "";

  switch (dialogType) {
    case DialogType.cONFIRMATION:
      titleText = "Are you sure want to perform this action?";
      break;
    case DialogType.dELETE:
      titleText = "Do you want to delete?";
      break;
    case DialogType.uPDATE:
      titleText = "Do you want to update?";
      break;
    case DialogType.aDD:
      titleText = "Do you want to add?";
      break;
    case DialogType.aCCEPT:
      titleText = "Do you want to accept?";
      break;
    case DialogType.rETRY:
      titleText = "Click to retry";
      break;
  }
  return titleText;
}

/// get icon for dialog
Widget getIcon(DialogType dialogType, {double? size}) {
  Icon icon;

  switch (dialogType) {
    case DialogType.cONFIRMATION:
    case DialogType.rETRY:
    case DialogType.aCCEPT:
      icon = Icon(Icons.done, size: size ?? 20, color: Colors.white);
      break;
    case DialogType.dELETE:
      icon = Icon(Icons.delete_forever_outlined, size: size ?? 20, color: Colors.white);
      break;
    case DialogType.uPDATE:
      icon = Icon(Icons.edit, size: size ?? 20, color: Colors.white);
      break;
    case DialogType.aDD:
      icon = Icon(Icons.add, size: size ?? 20, color: Colors.white);
      break;
  }
  return icon;
}

/// Build center image for dialog
Widget? getCenteredImage(
  BuildContext context,
  DialogType dialogType,
  Color? primaryColor,
) {
  Widget? widget;

  switch (dialogType) {
    case DialogType.cONFIRMATION:
      widget = Container(
        decoration: BoxDecoration(
          color: getDialogPrimaryColor(context, dialogType, primaryColor).withValues(red:0.2),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.warning_amber_rounded,
          color: getDialogPrimaryColor(context, dialogType, primaryColor),
          size: 40,
        ),
      );
      break;
    case DialogType.dELETE:
      widget = Container(
        decoration: BoxDecoration(
          color: getDialogPrimaryColor(context, dialogType, primaryColor).withValues(red:0.2),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(16),
        child: Icon(Icons.close, color: getDialogPrimaryColor(context, dialogType, primaryColor), size: 40),
      );
      break;
    case DialogType.uPDATE:
      widget = Container(
        decoration: BoxDecoration(
          color: getDialogPrimaryColor(context, dialogType, primaryColor).withValues(red:0.2),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.edit_outlined,
          color: getDialogPrimaryColor(context, dialogType, primaryColor),
          size: 40,
        ),
      );
      break;
    case DialogType.aDD:
    case DialogType.aCCEPT:
      widget = Container(
        decoration: BoxDecoration(
          color: getDialogPrimaryColor(context, dialogType, primaryColor).withValues(red:0.2),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.done_outline,
          color: getDialogPrimaryColor(context, dialogType, primaryColor),
          size: 40,
        ),
      );
      break;
    case DialogType.rETRY:
      widget = Container(
        decoration: BoxDecoration(
          color: getDialogPrimaryColor(
            context,
            dialogType,
            primaryColor,
          ).withValues(red:0.2),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(16),
        child: Icon(Icons.refresh_rounded,
            color: getDialogPrimaryColor(
              context,
              dialogType,
              primaryColor,
            ),
            size: 40),
      );
      break;
  }
  return widget;
}

/// placeholder for dialog
Widget defaultPlaceHolder(
  BuildContext context,
  DialogType dialogType,
  double? height,
  double? width,
  Color? primaryColor, {
  Widget? child,
  ShapeBorder? shape,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: getDialogPrimaryColor(context, dialogType, primaryColor).withValues(red:0.2),
    ),
    alignment: Alignment.center,
    child: child ?? getCenteredImage(context, dialogType, primaryColor),
  );
}

/// title for dialog
Widget buildTitleWidget(
  BuildContext context,
  DialogType dialogType,
  Color? primaryColor,
  Widget? customCenterWidget,
  double height,
  double width,
  String? centerImage,
  ShapeBorder? shape,
) {
  if (customCenterWidget != null) {
    return Container(
      constraints: BoxConstraints(maxHeight: height, maxWidth: width),
      child: customCenterWidget,
    );
  } else {
    if (centerImage != null) {
      return Image.network(
        centerImage,
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder: (_, object, stack) {
          log(object.toString());
          return defaultPlaceHolder(
            context,
            dialogType,
            height,
            width,
            primaryColor,
            shape: shape,
          );
        },
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return defaultPlaceHolder(
            context,
            dialogType,
            height,
            width,
            primaryColor,
            shape: shape,
            child: Loader(
              value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
            ),
          );
        },
      );
    } else {
      return defaultPlaceHolder(
        context,
        dialogType,
        height,
        width,
        primaryColor,
        shape: shape,
      );
    }
  }
}

/// show confirm dialog box
Future<bool?> showConfirmDialogCustom(
  BuildContext context, {
  required Function(BuildContext) onAccept,
  String? title,
  String? subTitle,
  String? positiveText,
  String? negativeText,
  String? centerImage,
  Widget? customCenterWidget,
  Color? primaryColor = primaryColor,
  Color? positiveTextColor,
  Color? negativeTextColor,
  Color? iconColor,
  ShapeBorder? shape,
  String? image,
  Function(BuildContext)? onCancel,
  bool barrierDismissible = true,
  double? height,
  double? width,
  bool cancelable = true,
  Color? barrierColor,
  DialogType dialogType = DialogType.cONFIRMATION,
  DialogAnimation dialogAnimation = DialogAnimation.dEFAULT,
  Duration? transitionDuration,
  Curve curve = Curves.easeInBack,
}) async {
  hideKeyboard(context);

  return await showGeneralDialog(
    context: context,
    barrierColor: barrierColor ?? Colors.black54,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: '',
    transitionDuration: transitionDuration ?? 400.milliseconds,
    transitionBuilder: (_, animation, secondaryAnimation, child) {
      return dialogAnimatedWrapperWidget(
        animation: animation,
        dialogAnimation: dialogAnimation,
        curve: curve,
        child: AlertDialog(
          shape: shape ?? dialogShape(),
          titlePadding: EdgeInsets.zero,
          //backgroundColor: _.cardColor,
          elevation: defaultElevation.toDouble(),
          title: buildTitleWidget(
            context,
            dialogType,
            primaryColor,
            customCenterWidget,
            height ?? customDialogHeight,
            width ?? customDialogWidth,
            centerImage,
            shape,
          ).cornerRadiusWithClipRRectOnly(topLeft: defaultRadius.toInt(), topRight: defaultRadius.toInt()),
          content: Container(
            width: width ?? customDialogWidth,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container(
                //   padding: EdgeInsets.all(18),
                //   decoration: boxDecorationWithRoundedCorners(borderRadius: radius(150), backgroundColor: primaryOpacity),
                //   child: Image.asset(image.isEmptyOrNull ? ic_splash : image!, color: iconColor ?? primaryColor, height: 28, width: 28),
                // ).center(),
                14.height,
                Text(
                  title ?? getTitle(dialogType),
                  style: boldTextStyle(size: 16),
                  textAlign: TextAlign.center,
                ),
                8.height.visible(subTitle.validate().isNotEmpty),
                Text(
                  subTitle.validate(),
                  style: secondaryTextStyle(size: 16),
                  textAlign: TextAlign.center,
                ).visible(subTitle.validate().isNotEmpty),
                20.height,
                Row(
                  children: [
                    AppButton(
                      elevation: 0,
                      width: 358,
                      height: 48,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: radius(defaultAppButtonRadius),
                        side: BorderSide(color: primaryColor!, width: 1),
                      ),
                      color: context.cardColor,
                      child: Text(
                        negativeText ??'Cancel',
                        style: boldTextStyle(color: primaryColor),
                        // style: boldTextStyle(color: negativeTextColor ?? textPrimaryColorGlobal),
                      ).fit(),
                      onTap: () {
                        if (cancelable) finish(context, false);

                        onCancel?.call(context);
                      },
                    ).center().expand(),
                    16.width,
                    AppButton(
                      width: 358,
                      height: 48,
                      elevation: 0,
                      color: getDialogPrimaryColor(context, dialogType, primaryColor),
                      child: Text(
                        positiveText ?? getPositiveText(dialogType),
                        style: boldTextStyle(color: positiveTextColor ?? Colors.white),
                      ).fit(),
                      onTap: () {
                        onAccept.call(context);

                        if (cancelable) finish(context, true);
                      },
                    ).center().expand(),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
