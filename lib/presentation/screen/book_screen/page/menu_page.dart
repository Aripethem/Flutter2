import 'package:flutter/material.dart';
import './book_page.dart' as bookpage;
import 'home_page.dart' as menupage;

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = new TabController(length: 10, vsync: this);
    void initState() {
      super.initState();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Books"),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          bookpage.BookPage(),
          menupage.HomePage(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              text: "Books",
              icon: new Icon(Icons.list_sharp),
            ),
            new Tab(
              text: "About",
              icon: new Icon(Icons.people_alt_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
