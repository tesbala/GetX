import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:task1/user.dart';



class UserViewModel extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var usersList = (data['data'] as List).map((user) => User.fromJson(user)).toList();
        users.assignAll(usersList);
      } else {
        // Handle error
      }
    } finally {
      isLoading(false);
    }
  }
}
