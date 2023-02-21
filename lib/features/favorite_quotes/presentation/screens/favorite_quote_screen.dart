import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';

class FavoriteQuotesScreen extends StatelessWidget {
  const FavoriteQuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Quotes'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Favorite Quotes'),
          ),
          Center(
            child: Image.asset(ImageAssets.quote),
          ),
        ],
      ),
    );
  }
}
