import 'package:file_manager/app/features/dashboard/cloud/views/screens/cloud_screen.dart';
import 'package:file_manager/app/features/dashboard/home/views/screens/home_screen.dart';
import 'package:file_manager/app/features/dashboard/index/views/screens/dashboard_screen.dart';
import 'package:file_manager/app/features/dashboard/smb/views/screens/smb_detail.dart';
import 'package:file_manager/app/features/dashboard/smb/views/screens/smb_list_screen.dart';
import 'package:file_manager/app/features/splash/views/screens/splash_screen.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened this page will be the first to be shown
  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
        HomeBinding(),
        CloudBinding(),
        SmbBinding(),
        SmbDetailBinding(),
      ],
    ),
    GetPage(name: _Paths.smb_list,
        page: () => SmbListScreen(),
        bindings: [
          SmbBinding(),
          SmbDetailBinding(),
          ],
    ),
    GetPage(name: _Paths.smb_connection_detail,
        page: () => SmbDetailScreen(),
        binding: SmbDetailBinding(),
    ),
  ];
}
