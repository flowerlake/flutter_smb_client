import 'package:file_manager/app/features/dashboard/smb/views/screens/smb_list_screen.dart';
import 'package:file_manager/app/features/dashboard/smb/views/screens/smb_list_status.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class LocationDetail {
  final String name;

  const LocationDetail({
    required this.name,
  });
}

class LocationListButton extends StatelessWidget {
  const LocationListButton({
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final LocationDetail data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(2),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.white,
      child: ListTile(
        leading: Icon(Icons.phone_android),
        title: Text(
          data.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        tileColor: Colors.white,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
          return SmbListDeviceScreen();
        }));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios_rounded),
          tooltip: "more",
        ),
      ),
    );
    // return GFListTile(
    //     avatar:GFAvatar(),
    //     titleText: this.data.name,
    //     icon: Icon(Icons.favorite)
    // );
  }
}
