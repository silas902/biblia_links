import 'package:biblia_links/bible/iu_error_message/snackbar_error.dart';
import 'package:biblia_links/bible/screens/home_page/home_page_card_list_widget.dart';
import 'package:flutter/material.dart';

import '../../controllers/bible_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BibleLocalController bibleLocalController = BibleLocalController();

    void handlingUIError({required String massage}) {
      SnackBarError().call(context: context, massage: massage);
    }

    void bible() async {
      String response = await bibleLocalController.getBibleLocal(context: context);
      if (response.isNotEmpty) {
        handlingUIError(massage: response);
      }
    }

    MediaQueryData infoDevice = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: infoDevice.size.height * 0.30,
            decoration: const BoxDecoration(
              color: Color(0xFF87CEEB),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SafeArea(
              child: SizedBox(
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.perm_identity_rounded)),
                    const Text('Silas')
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: infoDevice.size.height),
          Positioned(
            top: infoDevice.size.height * 0.20,
            child: HomePageCardList(
              deviceInfo: infoDevice,
              onPressed: bible,
            ),
          )
        ],
      ),
    );
  }
}
