library home;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constans/app_constants.dart';
import '../../../home/views/screens/home_screen.dart';

// controller
part '../../bindings/smb_detail_binding.dart';

// bindings
part '../../controllers/smb_detail_controller.dart';

class SmbDetailScreen extends GetView<SmbDetailController> {
  @override
  Widget build(BuildContext context) {
    // TODO: 这里输入smb连接信息

    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
      SliverFillRemaining(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.all(kDefaultSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return HomeScreen();
                          }));
                        }),
                    Text(controller.title),
                    IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return HomeScreen();
                          }));
                        }),
                  ],
                )),
          ],
        ),
      )
    ])));
  }
}
