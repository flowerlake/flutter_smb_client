part of home;


class SmbDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SmbDetailController());
  }
}