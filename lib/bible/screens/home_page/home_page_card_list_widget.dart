import 'package:biblia_links/bible/controllers/bible_controller.dart';
import 'package:flutter/material.dart';

class HomePageCardList extends StatelessWidget {
  final VoidCallback onPressed;
  final MediaQueryData deviceInfo;
  const HomePageCardList({super.key, required this.deviceInfo, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    EdgeInsets spaceBetweenCards = const EdgeInsets.all(10);
    const Color cardColor = Color(0xFF60A8C4);
    const double cardsHeight = 110;
    BorderRadius borderRadiusCards = BorderRadius.circular(20);

    return SizedBox(
      width: deviceInfo.size.width * 0.90,
      height: deviceInfo.size.height,
      child: ListView(
        children: [
          SizedBox(
            height: cardsHeight,
            child: Ink(
              child: Card(
                color: cardColor,
                shape: RoundedRectangleBorder(borderRadius: borderRadiusCards),
                child: InkWell(
                  borderRadius: borderRadiusCards,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: deviceInfo.size.width * 0.30,
                        child: Center(child: Image.asset('assets/icons/biblia_(1).png')),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Biblia Offline',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () async  {
                    onPressed();
                  },
                ),
              ),
            ),
          ),
          //
          Padding(padding: spaceBetweenCards),
          //
          SizedBox(
            height: cardsHeight,
            child: Card(
              color: cardColor,
              shape: RoundedRectangleBorder(borderRadius: borderRadiusCards),
              child: InkWell(
                borderRadius: borderRadiusCards,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 90,
                      width: deviceInfo.size.width * 0.30,
                      child: Center(child: Image.asset('assets/icons/biblia (2).png')),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Biblia Online',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
          ),
          //
          Padding(padding: spaceBetweenCards),
          //
          SizedBox(
            height: cardsHeight,
            child: Card(
              color: cardColor,
              shape: RoundedRectangleBorder(borderRadius: borderRadiusCards),
              child: InkWell(
                borderRadius: borderRadiusCards,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 90,
                      width: deviceInfo.size.width * 0.30,
                      child: Center(child: Image.asset('assets/icons/pastor.png')),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Pastores Apoiadores',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
          ),
          //
          Padding(padding: spaceBetweenCards),
          //
          SizedBox(
            height: cardsHeight,
            child: Card(
              color: cardColor,
              shape: RoundedRectangleBorder(borderRadius: borderRadiusCards),
              child: InkWell(
                borderRadius: borderRadiusCards,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 85,
                      width: deviceInfo.size.width * 0.30,
                      child: Center(child: Image.asset('assets/icons/carrinho-de-compras.png')),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Loja Online',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
