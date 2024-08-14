import 'package:get/get.dart';

import '../modules/franchise/bindings/franchise_binding.dart';
import '../modules/franchise/views/franchise_view.dart';
import '../modules/franchise_detail/bindings/franchise_detail_binding.dart';
import '../modules/franchise_detail/views/franchise_detail_view.dart';
import '../modules/generate_pin/bindings/generate_pin_binding.dart';
import '../modules/generate_pin/views/generate_pin_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GENERATE_PIN,
      page: () => const GeneratePinView(),
      binding: GeneratePinBinding(),
    ),
    GetPage(
      name: _Paths.FRANCHISE,
      page: () => const FranchiseView(),
      binding: FranchiseBinding(),
    ),
    GetPage(
      name: _Paths.FRANCHISE_DETAIL,
      page: () => const FranchiseDetailView(),
      binding: FranchiseDetailBinding(),
    ),
  ];
}
