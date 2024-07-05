import 'package:flutter/material.dart';
import 'package:notes_app/components/drawer_tile.dart';
import 'package:notes_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(children: [
          //header
          const DrawerHeader(child: Icon(Icons.note)),
          //note tile
          DrawerTile(title: 'Notes', leading: const Icon(Icons.home) ,onTap: () {
            Navigator.of(context).pop();
          }),
          //settimg tile
          DrawerTile(title: 'Settings', leading: const Icon(Icons.settings) ,onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=>const SettingsPage())
            );
          }),
        ],),
      ),
    );
  }
}