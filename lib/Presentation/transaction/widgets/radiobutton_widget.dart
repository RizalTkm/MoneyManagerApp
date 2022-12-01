import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:money_manager_app/Presentation/controllers/button_controller.dart';
import 'package:money_manager_app/core/decorated_text.dart';
import 'package:money_manager_app/data/data_models/category/category_model.dart';

class RadioButtonWidget extends StatelessWidget {
  RadioButtonWidget({super.key, required this.type, required this.label});

  final CategoryType type;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: buttonController(),
        builder: (controller) {
          return Row(
            children: [
              Obx(() {
                return Radio<CategoryType>(
                  value: type,
                  groupValue: controller.categorytypenotifier.value,
                  onChanged: (value) {
                    controller.categorytypenotifier.value = value!;
                  },
                );
              }),
              DecoratedText(label: label)
            ],
          );
        });
  }
}
