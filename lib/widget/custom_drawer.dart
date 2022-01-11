import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final BoxConstraints? constraints;
  const CustomDrawer({Key? key, this.constraints}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: const Color(0xff11162a),
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
      child: SizedBox(
        child: Column(
            children: List.generate(drawerItems.length, (i) {
          final e = drawerItems[i];
          return MouseRegion(
            onEnter: (v) => setState(() => e.color = Colors.white),
            onExit: (v) => setState(() => e.color = Colors.grey),
            child: ListTile(
              title: Text(e.text!, style: TextStyle(color: e.color)),
              onTap: () => onItemSelected(context, i),
              leading: Icon(e.icon, color: e.color),
            ),
          );
        })),
        height: widget.constraints!.maxHeight,
        width: 300,
      ),
    );
  }

  void onItemSelected(BuildContext context, int i) {
    switch (i) {
      case 0:
        print('Hello');
    }
  }
}

final drawerItems = [
  DrawerItems(
    icon: Icons.dashboard,
    text: 'Dashboard',
    onTap: () {},
  ),
  DrawerItems(
    icon: Icons.money,
    text: 'Coin',
    onTap: () {},
  ),
  DrawerItems(
    icon: Icons.bar_chart,
    text: 'Currency',
    onTap: () {},
  ),
];

class DrawerItems {
  final String? text;
  Color? color;
  final IconData? icon;
  final VoidCallback? onTap;
  DrawerItems({
    this.text,
    this.color = Colors.grey,
    this.icon,
    this.onTap,
  });
}
