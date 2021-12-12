import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_acou/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.googleAcocount.value == null) {
            return builLoginButton();
          } else {
            return builProfileView();
          }
        }),
      ),
    );
  }

  Column builProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(controller.googleAcocount.value?.photoUrl ?? '')
                  .image,
          radius: 100,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          controller.googleAcocount.value?.displayName ?? '',
          style: Get.textTheme.headline6,
        ),
        Text(
          controller.googleAcocount.value?.email ?? '',
          style: Get.textTheme.bodyText2,
        ),
        const SizedBox(
          height: 16,
        ),
        ActionChip(
            avatar: const Icon(Icons.logout),
            label: const Text('Logout'),
            onPressed: () {
              controller.logout();
            })
      ],
    );
  }

  FloatingActionButton builLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.login();
      },
      icon: Image.asset(
        "images/gogle.png",
        height: 28,
        width: 28,
      ),
      label: const Text('Sign in with Google'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }
}
