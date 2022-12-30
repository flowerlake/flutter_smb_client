import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../../constans/app_constants.dart';
import '../../../../../shared_components/header_text.dart';
import '../../../home/views/screens/home_screen.dart';

import '../../../../../modules/smb/smb_functions.dart';

class SmbListDeviceScreen extends StatefulWidget {
  @override
  _SmbListDeviceScreen createState() => _SmbListDeviceScreen();
}

class _SmbListDeviceScreen extends State<StatefulWidget> {
  Icon liveIcon = Icon(Icons.map);

  final SmbFunctions _smbFunctions= new SmbFunctions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Column(children: [
                // 页面标题头
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
                        Text("SMB 设备列表"),
                        IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                liveIcon = Icon(
                                  Icons.map,
                                  color: Colors.green,
                                );
                              });
                            }),
                        IconButton(
                            icon: const Icon(Icons.plus_one),
                            onPressed: () {
                              _openPopup(context);
                            }),
                      ],
                    )),
                // 中间内容body
                Padding(
                    padding: const EdgeInsets.all(kDefaultSpacing),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderText("我的设备"),
                          SizedBox(height: kDefaultSpacing),
                          Card(
                              margin: const EdgeInsets.all(2),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadowColor: Colors.white,
                              child: ListTile(
                                leading: liveIcon,
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
    
    TextEditingController usernameController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController hostController = new TextEditingController();
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
        title: "添加SMB设备",
        content: Column(
          children: <Widget>[
            TextField(
              controller: hostController,
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: '主机名或IP地址',
              ),
            ),
            TextField(
              controller: usernameController,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: '用户名',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: '密码',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "取消",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: (){
              bool flag = _smbFunctions.testConnection(usernameController.text, passwordController.text, hostController.text);
              
            } ,
            child: Text(
              "确定",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
