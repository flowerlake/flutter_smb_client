part of home;

class _DiskList extends StatelessWidget{

  final List<LocationDetail> diskListName = [new LocationDetail(name: "本地存储"), new LocationDetail(name: "网上邻居")];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText("Location"),
        SizedBox(height: kDefaultSpacing),
        ...diskListName.map((e) => LocationListButton(
            data: e,
            onPressed: (){}
            )
        )
      ],
    );
  }
}