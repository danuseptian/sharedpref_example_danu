import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpref_danu/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.changeTheme();
        },
        child: Icon(Icons.color_lens),
      ),
      appBar: AppBar(
        title: Text('Shared Preference Example'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: 50),
          GetBuilder<HomeController>(
            builder: (_) {
              return FutureBuilder<int>(
                  future: controller.counter,
                  builder: (context, snapshot) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${snapshot.data}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  });
            },
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    controller.decrement();
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.reset();
                  },
                  icon: Icon(
                    Icons.replay,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.increment();
                  },
                  icon: Icon(
                    Icons.add,
                    size: 30,
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
