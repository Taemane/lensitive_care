import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lensitive_care/presentation/cart_screen.dart';
import 'package:lensitive_care/widgets/custom_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<bool> isTileOpen = [
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
        leading: Container(),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 30),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_pic.jpeg'),
              ),
              const SizedBox(height: 10),
              Text(
                'Dev LoFty',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 5),
              const Text('dev.lofty@gmail.com'),
              const Divider(),
              const SizedBox(height: 10),
              ExpansionPanelList(
                expandedHeaderPadding: const EdgeInsets.all(0),
                dividerColor: Colors.black12,
                elevation: 0,
                expansionCallback: (int i, bool isExpanded) {
                  setState(() {
                    isTileOpen[i] = !isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                    isExpanded: isTileOpen[0],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: const Text('Password'),
                        leading: Icon(
                          FluentIcons.lock_closed_24_regular,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        minLeadingWidth: 0,
                      );
                    },
                    body: Container(
                      child: Text('body'),
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: isTileOpen[1],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: const Text('Rewards'),
                        leading: Icon(
                          FluentIcons.gift_24_regular,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        minLeadingWidth: 0,
                      );
                    },
                    body: Container(
                      child: Text('body'),
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: isTileOpen[2],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: const Text('App Testing'),
                        leading: Icon(
                          FluentIcons.app_folder_24_regular,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        minLeadingWidth: 0,
                      );
                    },
                    body: Container(
                      child: Text('body'),
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: isTileOpen[3],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: const Text('FAQ'),
                        leading: Icon(
                          FluentIcons.info_24_regular,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        minLeadingWidth: 0,
                      );
                    },
                    body: Container(
                      child: Text('body'),
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: isTileOpen[4],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: const Text('Logout'),
                        leading: Icon(
                          FluentIcons.arrow_exit_20_regular,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        minLeadingWidth: 0,
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        label: 'Log out',
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
