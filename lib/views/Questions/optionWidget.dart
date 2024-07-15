import 'package:allia/res/colors/appColors.dart';
import 'package:allia/res/components/uihelper.dart';
import 'package:allia/viewModels/questions_viewModel.dart';
import 'package:allia/viewModels/submit_viewModel.dart';
import 'package:allia/views/levelPage/levelWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class QuestionWidgets {
  Widget optionW(options) {
    final controller = Get.put(SubmitViewModel());
    return Container(
      height: 292,
      child: ListView.builder(
          itemCount: options.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (builder, index) {
            return InkWell(onTap: () {
              controller.selectedOption.value = index;
            }, child: Obx(() {
              return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    color: AppColors.whiteColor,
                    child: UiHelper().containerW(
                        291,
                        266,
                        AppColors.whiteColor,
                        10,
                        controller.selectedOption.value == index
                            ? AppColors.blueColor
                            : AppColors.whiteColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/${options[index].option}.png',
                              height: 100,
                              width: 100,
                            ),
                            UiHelper().sizedHeightW(30),
                            UiHelper().textW(
                                text: options[index].option,
                                color: AppColors.brownColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w600)
                          ],
                        )),
                  ));
            }));
          }),
    );
  }

  Widget optionW2(context) {
    return Container(
      height: 215,
      width: 215,
      child: Container(
          width: 215, height: 22, child: SliderLevel().sliderW(context)),
    );
  }
}
