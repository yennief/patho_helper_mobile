import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Icd10SubcategoriesScreen extends StatelessWidget {
  const Icd10SubcategoriesScreen(
      {super.key, required this.subcategories, required this.title});
  final List subcategories;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subcategories[index]["code"]),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 10),
              Text(subcategories[index]["name"]),
              const Divider(
                height: 20,
                thickness: 0.5,
                indent: 0,
                endIndent: 0,
              ),
            ]),
            trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            onTap: () {
              context.pushNamed('icd_10_diseases',
                  pathParameters: {
                    'title': subcategories[index]["name"],
                  },
                  extra: subcategories[index]["subcategories"]);
            },
          );
        },
      ),
    );
  }
}
