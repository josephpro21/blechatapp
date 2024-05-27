import 'package:b_le/source/controller/auth_controller.dart';
import 'package:b_le/source/view/widgets/login_resister.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'device_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: ListTile(
                            title: const Text('Are you sure to Log out ?'),
                            trailing: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          content:
                              const ListTile(title: Text('Confirm Log out')),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Reject')),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.cyan)),
                                onPressed: () {
                                  _authController.signOut();
                                  // Future.delayed(const Duration(seconds: 5));
                                  Get.to(() => Home());
                                },
                                child: const Text(
                                  'Accept',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              children: [
                const Align(alignment: Alignment.center, child: LoginForm()),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const DevicePage());
                    },
                    child: const Text("Search nearby devices"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
