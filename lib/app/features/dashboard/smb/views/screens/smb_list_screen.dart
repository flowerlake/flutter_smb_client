library home;

import 'package:file_manager/app/constans/app_constants.dart';
import 'package:file_manager/app/features/dashboard/home/views/screens/home_screen.dart';
import 'package:file_manager/app/features/dashboard/smb/views/screens/smb_detail.dart';
import 'package:file_manager/app/shared_components/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

part '../../controllers/SmbListController.dart';

part '../../bindings/smb_binding.dart';

class SmbListScreen extends GetView<SmbListController> {
  const SmbListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.all(kDefaultSpacing),
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
                                return SmbDetailScreen();
                              }));
                            }),
                        IconButton(
                            icon: const Icon(Icons.plus_one),
                            onPressed: () {
                              _openPopup(context);
                            }),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(kDefaultSpacing),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderText("????????????"),
                          SizedBox(height: kDefaultSpacing),
                          Card(
                              margin: const EdgeInsets.all(2),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadowColor: Colors.white,
                              child: ListTile(
                                leading: Icon(Icons.map),
                                title: Text(
                                  "windows-snkpty",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                tileColor: Colors.white,
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios_rounded),
                                  tooltip: "more",
                                ),
                              )),
                        ])),
              ]),
              hasScrollBody: false,
            )
          ],
        ),
      ),
    );
  }

  _openPopup(context) {
    var alertStyle = AlertStyle(
      // animationType: AnimationType.fromTop,
      isCloseButton: false,
      constraints: BoxConstraints.expand(width: 400),
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.start,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.grey,
      ),
      alertAlignment: Alignment.topCenter,
    );
   Alert(
      style: alertStyle,
       context: context,
       title: "??????SMB??????",
       content: Column(
         children: <Widget>[
           TextField(
             decoration: InputDecoration(
               icon: Icon(Icons.account_circle),
               labelText: '????????????IP??????',
             ),
           ),
           TextField(
             obscureText: true,
             decoration: InputDecoration(
               icon: Icon(Icons.lock),
               labelText: '?????????',
             ),
           ),
           TextField(
             obscureText: true,
             decoration: InputDecoration(
               icon: Icon(Icons.lock),
               labelText: '??????',
             ),
           ),
           TextField(
             obscureText: true,
             decoration: InputDecoration(
               icon: Icon(Icons.lock),
               labelText: 'Password',
             ),
           ),
           
         ],
       ),
       buttons: [
         DialogButton(
           onPressed: () => Navigator.pop(context),
           child: Text(
             "??????",
             style: TextStyle(color: Colors.white, fontSize: 20),
           ),
         ),
         DialogButton(
           onPressed: () => Navigator.pop(context),
           child: Text(
             "??????",
             style: TextStyle(color: Colors.white, fontSize: 20),
           ),
         )
       ]).show();
 }
}
