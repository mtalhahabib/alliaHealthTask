import 'package:allia/res/colors/appColors.dart';
import 'package:allia/res/components/uihelper.dart';
import 'package:allia/viewModels/level_viewModel.dart';
import 'package:allia/viewModels/questions_viewModel.dart';
import 'package:allia/viewModels/submit_viewModel.dart';
import 'package:allia/views/Questions/optionWidget.dart';
import 'package:allia/views/submitPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionsPage extends StatelessWidget {
  QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionsViewmodel());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UiHelper().sizedHeightW(50.0),
                UiHelper().textW(
                  text: controller
                      .questions.value.body![controller.index.value].question!,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  textAlign: TextAlign.center,
                ),
                UiHelper().sizedHeightW(10),
                UiHelper().textW(
                    text:
                        'Select the number that best represents your Excitement level.',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.secblackColor,
                    textAlign: TextAlign.center
                    ),
                UiHelper().sizedHeightW(50),
                controller.questions.value.body![controller.index.value]
                                .answerType ==
                            'single_choice' &&
                        controller.questions.value.body![controller.index.value]
                                .options![0].isFreeForm !=
                            true
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: QuestionWidgets().optionW(controller
                          .questions.value.body![controller.index.value].options),
                    )
                    : QuestionWidgets().optionW2(context),
              ],
            ),
          ),
          UiHelper().sizedHeightW(50),
          InkWell(
            onTap: () {
              final submitController = Get.put(SubmitViewModel());
              final levelController = Get.put(LevelViewModel());

              if (controller.index.value <
                  controller.questions.value.body!.length - 1) {
                if (submitController.selectedOption.value == 100 &&
                    controller.questions.value.body![controller.index.value]
                            .answerType ==
                        'single_choice') {
                  Get.snackbar('Sorry', 'Please select an Option');
                } else {
                  controller.index.value++;
                }

                if (controller.questions.value.body![controller.index.value]
                        .options![0].isFreeForm ==
                    true) {
                  if (controller.index.value <
                      controller.questions.value.body!.length - 1) {
                    if (submitController.selectedOption.value == 100 &&
                        controller.questions.value.body![controller.index.value]
                                .answerType ==
                            'single_choice') {
                      Get.snackbar('Sorry', 'Please select an Option');
                    } else {
                      controller.index.value++;
                    }
                  } else {
                    controller.index.value = 0;
                    print(submitController.answers);
                    Get.to(SubmitPage());
                    
                submitController.simulateLoading();
                  }
                }
              } else {
                controller.index.value = 0;

                Get.to(SubmitPage());
                submitController.simulateLoading();
              }
//----------------------------------------------------------------
              if (controller.questions.value.body![controller.index.value]
                      .answerType ==
                  'single_choice') {
                submitController.answers.add({
                  'questionId': controller
                      .questions.value.body![controller.index.value].id,
                  'selectedOptionId': controller
                      .questions
                      .value
                      .body![controller.index.value]
                      .options![submitController.selectedOption.value]
                      .id,
                  'freeformValue': null
                });
              } else {
                submitController.answers.add({
                  'questionId': controller
                      .questions.value.body![controller.index.value].id,
                  'selectedOptionId': controller
                      .questions
                      .value
                      .body![controller.index.value]
                      .options![levelController.currentValue.value.toInt()]
                      .id,
                  'freeformValue': null
                });
              }
              
                
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blueColor,
              ),
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.whiteColor,
                size: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}
