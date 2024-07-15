import 'dart:ui';

import 'package:allia/res/colors/appColors.dart';
import 'package:allia/viewModels/level_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderLevel {
  sliderW(context) {
    final levelController=Get.put(LevelViewModel());
    
    return RotatedBox(
      quarterTurns: -1,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 22.0, // Set the thickness of the slider
          thumbShape: CustomThumbShape(), // Use the custom thumb shape
        ),
        child: Obx(
          ()=> Slider(
            activeColor: AppColors.blueColor,
            value: levelController.currentValue.value,
            min: 1,
            max: 10,
            divisions: 9,
            label: levelController.currentValue.value.round().toString(),
            onChanged: (double value) {
              levelController.currentValue.value = value;
            },
          ),
        ),
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  final double thumbRadius = 20.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
     final Canvas canvas = context.canvas;
    final ImageProvider image = AssetImage('assets/images/Excited.png'); // Path to your image
    final ImageStream stream = image.resolve(ImageConfiguration());
    stream.addListener(ImageStreamListener((ImageInfo info, bool syncCall) {
      final  image = info.image;
      final double imageWidth = thumbRadius * 2;
      final double imageHeight = thumbRadius * 2;
      final Rect imageRect = Rect.fromCenter(
        center: center,
        width: imageWidth,
        height: imageHeight,
      );
      final paint = Paint()..filterQuality = FilterQuality.high;
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(1.5708); // Rotate thumb back to original position
      canvas.translate(-center.dx, -center.dy);
      canvas.drawImageRect(image, Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), imageRect, paint);
      canvas.restore();
    }));
  }
}
