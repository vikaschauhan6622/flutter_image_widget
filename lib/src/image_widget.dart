import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_widget/src/utils/image_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class FlutterImageWidget extends StatelessWidget {
  ///url is required parameter for fetching network image
  String? url;

  ///imagePath is required parameter for showing png,jpg,etc image
  String? imageAssetPath;

  ///svgPath is required parameter for showing svg image
  String? svgPath;

  ///file is required parameter for fetching image file
  File? pickerFilePath;

  double? height;
  double? width;
  Color? color;
  BoxFit? fit;
  final String placeHolder;
  Alignment? alignment;
  VoidCallback? onTap;
  EdgeInsetsGeometry? margin;
  BorderRadius? radius;
  BoxBorder? border;

  ///a FlutterImageWidget it can be used for showing any type of images it will shows the placeholder image if image is not found on network image
  FlutterImageWidget({
    super.key,
    this.url,
    this.imageAssetPath,
    this.svgPath,
    this.pickerFilePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = ImageConstant.imageNotFound,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment!,
      child: buildWidget(),
    )
        : buildWidget();
  }

  buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: buildCircleImage(),
      ),
    );
  }

  ///build the image with border radius
  buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius!,
        child: buildImageWithBorder(),
      );
    } else {
      return buildImageWithBorder();
    }
  }

  ///build the image with border and border radius style
  buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(
          border: border,
          borderRadius: radius,
        ),
        child: buildImageView(),
      );
    } else {
      return buildImageView();
    }
  }

  buildImageView() {
    if (svgPath != null && svgPath!.isNotEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          svgPath!,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          // color: color,
        ),
      );
    } else if (pickerFilePath != null && pickerFilePath!.path.isNotEmpty) {
      return Image.file(
        pickerFilePath!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    } else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        color: color,
        placeholder: (context, url) => Image.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
        ),
        errorWidget: (context, url, error) => Image.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
        ),
      );
    } else if (imageAssetPath != null && imageAssetPath!.isNotEmpty) {
      return Image.asset(
        imageAssetPath!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    }
    return const SizedBox();
  }
}



