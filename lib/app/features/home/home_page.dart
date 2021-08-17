import 'package:flutter/material.dart';

import 'package:todo_list/app/config/theme/app_colors.dart';
import 'package:todo_list/app/features/home/widgets/separator_widget.dart';
import 'package:todo_list/app/features/home/widgets/task_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 32),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          SafeArea(
            bottom: false,
            child: MediaQuery.removePadding(
              context: context,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TaskItemWidget(
                    groupColor: AppColors.green,
                    isCompleted: false,
                    decription: 'Start making a presentation',
                  ),
                ),
                separatorBuilder: (context, index) => const SeparatorWidget(),
                itemCount: 30,
                shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
