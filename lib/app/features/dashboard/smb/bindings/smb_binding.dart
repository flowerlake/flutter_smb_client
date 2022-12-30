part of home;

class SmbBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SmbListController());
  }
}