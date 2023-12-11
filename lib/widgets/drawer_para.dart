import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/drawer_view_model_controller.dart';
import '../../../screens/create_community/create_community_screen.dart';
import '../../../screens/profile/profile_mobile_screen.dart';
import '../../../screens/profile/profile_saved_posts.dart';
import '../../../screens/settings/setting_menu.dart';
import '../../../models/authentication.dart';
import '../../../models/user_model.dart';
import '../../screens/authentication/choose_profilepicture.dart';
import '../../screens/authentication/sign_up_page.dart';
import 'package:para/screens/perfil_screen.dart';
import 'package:para/theme/style.dart';
import '../screens/settings/account_setting_screen.dart';

class UnifiedDrawer extends StatelessWidget {
  const UnifiedDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? onlineStat =
        Provider.of<DrawersViewModelController>(context, listen: true)
            .onlineStatusControl;
    final bool isSignedIn = userauthentication?.isSignedIn ?? false;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          if (isSignedIn)
            UserAccountsDrawerHeader(
              accountName: Text('Nombre del Usuario'),
              accountEmail: Text('correo@ejemplo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('/assets/brain1.png'),
              ),
              decoration: BoxDecoration(
                color: Style.primaryColor,
              ),
            )
          else
            Column(
              children: [
                (userauthentication.isSignedIn)
                    ? Column(
                        children: [
                          const Divider(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Sign up to upvote the best content,\ncustomize your feed,share your\n interests,and more! ",
                                maxLines: 5,
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          InkWell(
                            child: ListTile(
                              leading: const Icon(Icons.person_pin),
                              title: const Text("Sign up / Log in"),
                              onTap: () => Navigator.of(context)
                                  .pushNamed(SignUpPage.routeName),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const Divider(
                            height: 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 100,
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/150'),
                              ),
                            ],
                          ),
                          const Divider(
                            height: 30,
                            thickness: 0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  child: Wrap(
                                    children: [
                                      Text("u/${'usuario1para'}"),
                                      const Icon(Icons.arrow_drop_down_rounded)
                                    ],
                                  ),
                                  onTap: () =>
                                      showSwitchAccountButtomSheet(context)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () =>
                                    Provider.of<DrawersViewModelController>(
                                            context,
                                            listen: false)
                                        .toggleOnlineStatus(),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            (true) ? Colors.green : Colors.grey,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "${(true) ? "🟢" : ""}Online Status:${(true) ? "On" : "Off"}",
                                      style: TextStyle(
                                        color:
                                            (true) ? Colors.green : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Divider(
                              height: 10,
                              thickness: 1,
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: const BorderSide(
                                              color: Colors.red)))),
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(ChooseProfilePicture.routeName),
                              child: Wrap(
                                children: const [
                                  Icon(Icons.person_pin_rounded),
                                  Text("    Change profile picture"),
                                ],
                              )),
                          Row(
                            children: [
                              Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: const [
                                      Icon(
                                        Icons.api_sharp,
                                        color: Colors.blue,
                                      )
                                    ]),
                                    Align(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  "                    ${'16'}") //currentUser.karma
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              Text("               Karma")
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                              const VerticalDivider(
                                thickness: 2,
                              ),
                              Column(children: [
                                Column(children: const [
                                  Icon(
                                    Icons.credit_card_outlined,
                                    color: Colors.blue,
                                  )
                                ]),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '14 meses', //"               ${DateTime.now().difference(currentUser.createdAt).inDays} day",
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Text("           Reddit ago")
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                            ],
                          ),
                          InkWell(
                            child: ListTile(
                              leading: const Icon(Icons.person_pin),
                              title: const Text("My Profile"),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileMobileScreen(
                                          userID:
                                              'joseluis', //currentUser.username,
                                          context: context))),
                            ),
                          ),
                          InkWell(
                            child: ListTile(
                              leading: const Icon(Icons.reddit),
                              title: const Text("Create a community"),
                              onTap: () => Navigator.of(context)
                                  .pushNamed(CreateCommunityScreen.routeName),
                            ),
                          ),
                          InkWell(
                            child: ListTile(
                              leading:
                                  const Icon(Icons.library_add_check_sharp),
                              title: const Text("Mis RAQ"),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserSavedPosts(
                                          userName:
                                              'joseluis' //currentUser.username,
                                          ))),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          // Añade aquí todas las opciones de menú necesarias
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_border),
            title: const Text('Guardados'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Sobre nosotros'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // ... Aquí van más opciones del menú
          // Código para la parte inferior del Drawer (si es necesario)
          Align(
            alignment: Alignment.bottomLeft,
            child: InkWell(
              child: ListTile(
                leading: const Icon(Icons.settings_sharp),
                title: const Text("Settings"),
                onTap: () =>
                    Navigator.of(context).pushNamed(SettingsHomePage.routeName),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Aquí puedes añadir métodos adicionales, como showSwitchAccountButtomSheet

  Future<dynamic> showSwitchAccountButtomSheet(BuildContext context) {
    return showModalBottomSheet(
      constraints: const BoxConstraints.tightFor(
        height: 2 * 80,
      ),
      context: context,
      builder: (context) => ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("ACCOUNTS"),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black26,
            indent: 20,
            endIndent: 20,
          ),
          for (int i = 0;
              i <
                  [
                    Text("u/${'joseluis'}"), //currentUser.username
                    const Text("Add account"),
                  ].length;
              i++)
            InkWell(
              onTap: [
                () => Navigator.pop(context),
                () => Navigator.pushNamed(context, SignUpPage.routeName),
              ][i],
              child: ListTile(
                leading: [
                  const Icon(Icons.person),
                  const Icon(Icons.add),
                ][i],
                title: [
                  Text("u/${'joseluis'}"), //currentUser.username
                  const Text("Add account"),
                ][i],
              ),
            ),
        ],
      ),
    );
  }
}
