import 'package:allia/res/colors/appColors.dart';
import 'package:allia/res/components/uihelper.dart';
import 'package:allia/views/homePage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SubmitPage extends StatelessWidget {
  const SubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/done.png',height: 224,width: 224,),
            UiHelper().sizedHeightW(10.0),
            UiHelper().textW(
                  text: 'Self Report Completed',  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
                UiHelper().sizedHeightW(10.0),
                InkWell(
                  onTap: () {
                    Get.to(HomePage());
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: UiHelper().textW(
                        text: 'Go to Home',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),

          ],
        ),
      )
    );
  }
}