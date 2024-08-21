import 'package:flutter/material.dart';
import 'package:task_management/colors/app_colors.dart';
import 'package:task_management/screens/add_task.dart';
import 'package:task_management/screens/all_tasks.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 22, right: 22),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: "Hello\n",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 65,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "start your Beautiful day..",
                        style: TextStyle(
                          color: AppColors.smallTextColor,
                          fontSize: 14,
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => AddTask(),
                      transition: Transition.zoom,
                      duration: Duration(milliseconds: 500));
                },
                child: ButtonWidget(
                    backgroundColor: AppColors.mainColor,
                    text: "Add Task",
                    textColor: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => AllTasks(),
                      transition: Transition.fade,
                      duration: Duration(seconds: 1));
                },
                child: ButtonWidget(
                    backgroundColor: Colors.white,
                    text: "View All",
                    textColor: AppColors.smallTextColor),
              ),
            ]),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/welcome.jpg'),
          ),
        ),
      ),
    );
  }
}
