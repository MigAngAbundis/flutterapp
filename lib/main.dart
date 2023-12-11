import 'package:para/screens/navigation_screen.dart';
import 'package:para/theme/style.dart';
//****************************************
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/add_post_controller.dart';
import 'controllers/drawer_view_model_controller.dart';
import 'screens/Home/home_page.dart';
import 'screens/Popular/popular_page.dart';
import 'screens/add_post/add_post_screen_one.dart';

import 'controllers/community_controller.dart';
import 'controllers/community_model_controller.dart';
import 'controllers/create_community_controller.dart';
import 'controllers/home_controller.dart';
import 'controllers/internet_controller.dart';
import 'controllers/sign_in_controller.dart';

import 'models/user_model.dart';
/*import 'screens/Home/home_page.dart';
import 'screens/Popular/popular_page.dart';
import 'screens/add_post/add_post_screen_three.dart';
import 'screens/add_post/add_post_screen_two.dart';
import 'screens/authentication/email_signup_w.dart';
import 'screens/create_community/create_community_screen.dart';
import 'screens/search/search_screen_one.dart';
import 'screens/search/search_screen_two.dart';
*/
import 'controllers/search_controller.dart' as searchCtrl;
import 'package:para/screens/home_screen.dart';

import 'models/post_model.dart';
import 'controllers/profile_controller.dart';
import 'controllers/profile_model_controller.dart';
import 'screens/add_post/add_post_screen_three.dart';
import 'screens/add_post/add_post_screen_two.dart';
import 'screens/authentication/about_you.dart';
import 'screens/authentication/choose_profilepicture.dart';
import 'screens/authentication/choose_username.dart';
import '/screens/authentication/email_login.dart';
import 'screens/authentication/email_signup.dart';

//import 'screens/authentication/email_signup_w.dart';
import 'screens/authentication/email_signup_w_2.dart';
import 'screens/authentication/forget_username.dart';
import 'screens/authentication/interests.dart';
import 'screens/authentication/forget_password.dart';
import 'screens/authentication/sign_up_page.dart';
import 'screens/authentication/splash_screen.dart';
import 'controllers/mobile_settings_view_controller.dart';
import 'screens/create_community/create_community_screen.dart';
import 'screens/search/search_screen_one.dart';
import 'screens/search/search_screen_two.dart';
import 'screens/settings/account_setting_screen.dart';
import 'screens/settings/setting_menu.dart';
import './screens/settings/change_password_screen.dart';
import './screens/settings/manage_emails.dart';
import './screens/settings/update_email_screen.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'firebase_options.dart';

//import 'screens/temphome.dart';
UserModel? currentUser = UserModel(
    username: "guest",
    type: "not bare email",
    email: "mamdouhteachertraining@gmail.com",
    createdAt: DateTime(2022));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  (kIsWeb)
      ? null
      : await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Providers from Reddit clone's main.dart added here
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => DrawersViewModelController()),
        ),
        ChangeNotifierProvider(
            create: (context) =>
                ProfileProvider(profileService: ProfileService())),
        ChangeNotifierProvider(
            create: ((context) => ProfileModelProvider()
              ..getProfileAbout("t2_hamada")
              ..getProfileComments("t2_hamada")
              ..getProfilePosts("t2_hamada")
              ..getUserSavedPosts()
              ..getUserUpVotedPosts('t2_hamada'))),
        ChangeNotifierProvider(create: ((context) => SignInController())),
        ChangeNotifierProvider(create: ((context) => AddPostController())),
        ChangeNotifierProvider(create: ((context) => InternetController())),
        ChangeNotifierProvider(
            create: (context) => CommunityModelProvider()
              ..getCommunityPosts("t5_imagePro235", "hot", [], 2, 40)
              ..getCommunityAbout("t5_imagePro235")
              ..getCommunityInfo("t5_imagePro235")
              ..getCommunityFlairs("t5_imagePro235")),
        ChangeNotifierProvider(
            create: (context) =>
                CommunityProvider(communityService: CommunityService())),
        ChangeNotifierProvider(
          create: (context) => searchCtrl.SearchController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsViewModelMobileController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateCommunityViewModelController(),
        ),
        ChangeNotifierProvider(
            create: (context) =>
                HomeController()), //... (List of providers from the Reddit clone project)
      ],
      child: MaterialApp(
        title: 'Para',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Style.secundaryBackgroundColor,
          primaryColor: Style.primaryColor,
          fontFamily: 'Roboto',
          primarySwatch: Colors.deepPurple,
          splashColor: Colors.black,
        ),
        home: NavigationScreen(
            // userName: currentUser!.username!,
            ), // Adjusted to use the NavigationScreen
        // CommunityHome(commName: 't5_imagePro45',userName: currentUser!.username!,posts: communityPostsList,),
        //     ProfilePage(
        //   userID: 't2_hamada',
        //   context: context,
        // ),
        // (kIsWeb) ? const EmailSignupW() : const SplashScreen(),

        routes: {
          Popular.routeName: (ctx) => const Popular(),
          //HomePage.routeName: (ctx) => const HomePage(),
          SignUpPage.routeName: (ctx) => const SignUpPage(),
          EmailLogin.routeName: (ctx) => const EmailLogin(),
          EmailSignup.routeName: (ctx) => const EmailSignup(),
          EmailSignupW2.routeName: (ctx) => const EmailSignupW2(),
          ForgetPassword.routeName: (ctx) => const ForgetPassword(),
          ForgetUserName.routeName: (ctx) => const ForgetUserName(),
          ChooseUserName.routeName: (ctx) => const ChooseUserName(),
          Interests.routeName: (ctx) => const Interests(),
          ChooseProfilePicture.routeName: (ctx) => const ChooseProfilePicture(),
          AboutYou.routeName: (ctx) => const AboutYou(),
          SplashScreen.routeName: (ctx) => const SplashScreen(),
          // CommunityHome.routeName: (ctx) => const CommunityHome(),
          SearchScreenTwo.routeName: (ctx) => const SearchScreenTwo(),
          SearchScreenOne.routeName: (ctx) => const SearchScreenOne(),
          SettingsHomePage.routeName: (context) => const SettingsHomePage(),
          AccountSettingsScreen.routeName: (context) =>
              const AccountSettingsScreen(),
          ManageEmailsScreen.routeName: (context) => const ManageEmailsScreen(),
          UpdateEmailAddress.routeName: (context) => UpdateEmailAddress(),
          ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
          CreateCommunityScreen.routeName: (context) => CreateCommunityScreen(),
          AddPostScreenOne.routeName: (context) => const AddPostScreenOne(),
          AddPostScreenTwo.routeName: (context) => const AddPostScreenTwo(),
          AddPostScreenThree.routeName: (context) => const AddPostScreenThree(),
          //ProfilePage.routeName: (context) => const ProfilePage(),
          // AddComment.routeName: (context) => AddComment(),
          //... (All routes from the Reddit clone project)
        },
      ),
    );
  }
}
