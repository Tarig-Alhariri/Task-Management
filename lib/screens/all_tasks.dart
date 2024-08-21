import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/colors/app_colors.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:task_management/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = ['Try harder', 'Try smarter'];

    final leftEditIcon = Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Color(0xFF2e3253).withOpacity(0.5),
      child: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );

    final rightDeleteIcon = Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: Get.back,
              child: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              ),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/header1.jpg'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.5),
                      color: Colors.black),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.calendar_month_sharp,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '2',
                  style:
                      TextStyle(fontSize: 20, color: AppColors.secondaryColor),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: leftEditIcon,
                  secondaryBackground: rightDeleteIcon,
                  onDismissed: (DismissDirection direction) {},
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (_) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                color: Color(0xFF2e3253).withOpacity(0.4),
                              ),
                              height: 500,
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ButtonWidget(
                                        backgroundColor: AppColors.mainColor,
                                        text: 'View',
                                        textColor: Colors.white),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ButtonWidget(
                                        backgroundColor: AppColors.mainColor,
                                        text: 'Edit',
                                        textColor: Colors.blue),
                                  ],
                                ),
                              )),
                            );
                          });
                      return false;
                    } else {
                      return Future.delayed(Duration(seconds: 1),
                          () => direction == DismissDirection.endToStart);
                    }
                  },
                  key: ObjectKey(index),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child:
                        TaskWidget(text: myData[index], color: Colors.blueGrey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
