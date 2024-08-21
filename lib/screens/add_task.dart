import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/colors/app_colors.dart';
import 'package:task_management/screens/all_tasks.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:task_management/widgets/textfield_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 17, right: 17),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/addtask1.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.secondaryColor,
                  ),
                )
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                  textController: nameController,
                  hinitText: "Task Name",
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  textController: detailController,
                  hinitText: "Task Detail",
                  borderRadius: 17,
                  maxLine: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => AllTasks(),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 500));
                  },
                  child: ButtonWidget(
                      backgroundColor: AppColors.mainColor,
                      text: "Add",
                      textColor: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            )
          ],
        ),
      ),
    );
  }
}
