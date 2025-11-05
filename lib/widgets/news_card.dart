import 'package:flutter/material.dart';
import 'package:football_news/screens/newslist_form.dart'; // for NewsFormPage
import 'package:football_news/screens/menu.dart'; // for navigating back to Home

class ItemHomepage {
  final String name;
  final IconData icon;
  ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          // feedback
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
            );

          // navigation
          if (item.name == "Add News") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NewsFormPage()),
            );
          } else if (item.name == "See Football News") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MyHomePage()),
            );
          } else if (item.name == "Logout") {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Logout clicked (not implemented)")),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
