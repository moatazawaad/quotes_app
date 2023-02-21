import 'package:flutter/material.dart';
import 'package:quotes_clean_arch/core/utils/media_query_values.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';

class QuoteScreenTest extends StatelessWidget {
  const QuoteScreenTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes App'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Quotes'),
          ),
          // Center(
          //   child: Image.asset(ImageAssets.quote),
          // ),
          InkWell(
            /// this is anonymous route for simple and small projects
            // onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const FavoriteQuotesScreen())),

            /// this is named route for small n medium projects
            onTap: () =>
                Navigator.pushNamed(context, Routes.favoriteQuoteScreen),
            child: Image.asset(
              ImageAssets.quote,
              width: context.width / 2,
            ),
          ),
          InkWell(
            onTap: () => Constants.showErrorDialog(
              context: context,
              message: 'Error Occurred',
            ),
            child: const Text(
              'Testing Error Dialog',
            ),
          ),
          InkWell(
            onTap: () => Constants.showToast(
              message: 'Error Occurred',
              color: Colors.red,
            ),
            child: const Text(
              'Testing Toast Dialog',
            ),
          ),
        ],
      ),
    );
  }
}
