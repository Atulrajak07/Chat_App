import 'package:chat_app/core/routes.dart';
import 'package:chat_app/feature/profile/binding/profile_binding.dart';
import 'package:chat_app/feature/profile/view/profile_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../feature/home/binding/home_binding.dart';
import '../feature/home/view/home_view.dart';
import '../feature/login/binding/login_binding.dart';
import '../feature/login/view/login_view.dart';
import '../feature/splash/binding/splash_binding.dart';
import '../feature/splash/view/splash_view.dart';

List<GetPage> allpages =[
GetPage(name: Routes.splash,
    page: ()=> SplashView(),
    binding:SplashBinding()),

  GetPage(name: Routes.home,
      page: ()=> HomeView(),
      binding: HomeBinding()),

  GetPage(name: Routes.login,
      page: ()=> LoginView(),
      binding: LoginBinding()),

  GetPage(name: Routes.profile,
      page: ()=> ProfileView(),
      binding: ProfileBinding()),

  ];