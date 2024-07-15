import 'package:allia/res/colors/appColors.dart';
import 'package:allia/res/components/uihelper.dart';
import 'package:allia/viewModels/questions_viewModel.dart';
import 'package:allia/views/Questions/questionsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final questionController = Get.put(QuestionsViewmodel()); 
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UiHelper().textW(
                    text: 'Hi David, How are You?',
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ],
            ),
            UiHelper().sizedHeightW(20.0),
            UiHelper().containerW(
                144,
                Get.width,
                AppColors.brownColor,
                
                12,
                
                AppColors.brownColor,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiHelper().textW(
                          text:
                              'Help your Therapist know\n how to best support you',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secWhiteColor),
                      UiHelper().sizedHeightW(20.0),
                      InkWell(
                        onTap: () {
                          Get.to(QuestionsPage());
                        },
                        child: UiHelper().textW(
                            text: 'Take a Check in',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
