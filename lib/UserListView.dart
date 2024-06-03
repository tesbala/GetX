import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UserViewModel.dart';


class UserListView extends StatelessWidget {
  final UserViewModel userViewModel = Get.put(UserViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Obx(() {
        if (userViewModel.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: userViewModel.users.length,
            itemBuilder: (context, index) {
              final user = userViewModel.users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
              );
            },
          );
        }
      }),
    );
  }
}
