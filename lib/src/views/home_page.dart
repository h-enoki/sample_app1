import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final rowItems = _rowItems(context);

    String country = "Italy";
    String city = "Venice";
    double rating = 4.2;
    String description =
        "イタリア共和国北東部に位置する都市で、その周辺地域を含む人口約250,000人の基礎自治体（コムーネ）。ヴェネト州の州都、ヴェネツィア県の県都である。中世にはヴェネツィア共和国の首都として栄えた都市で、「アドリア海の女王」「水の都」などの別名を持つ。";

    return Scaffold(
      appBar: AppBar(
        // AppBarの影を0にする
        elevation: 0,
        // AppBarを透過
        backgroundColor: Colors.transparent,
        // AppBar右上のアイコンボタン
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share,
              size: 30,
            ),
            onPressed: () => {},
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              size: 30,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      // Bodyの描画領域がAppBarを無視するように設定
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              // 画面上部の画像部分
              // 下側のみ各丸
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(30)),
                child: Image.asset(
                  "assets/images/SampleImage.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              // 画像左下のテキストなどの表示部分
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 都市名の表示部分
                    Text(
                      city,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // 国名の表示部分
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          country,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    // レビューの表示部分
                    // TODO パッケージを使ったほうが良さそう
                    Row(
                      children: [
                        for (int i = 0; i < rating.floor(); i++) ...{
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.white,
                          ),
                        },
                        for (int i = 0; i < 5 - rating.floor(); i++) ...{
                          const Icon(
                            Icons.star_border,
                            size: 20,
                            color: Colors.white,
                          ),
                        },
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // 画面中央のアイコン部分
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: rowItems,
          ),
          const SizedBox(height: 20),
          // 画面下部の"詳細"テキスト部分
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "詳細",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // 画面下部のテキスト表示部分
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
            ),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: const Alignment(0.0, 0.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      // 画面最下部のボタン
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(
          "ホテルを予約する",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  // 画面中央に並べるアイコンの配列
  // TODO 表示するアイコンは可変にした方が良さそう
  List<Widget> _rowItems(BuildContext context) {
    return [
      _iconContainer(context, Icons.wifi, "WiFi"),
      _iconContainer(context, Icons.flatware, "キッチン"),
      _iconContainer(context, Icons.beach_access, "ビーチ"),
      _iconContainer(context, Icons.more_horiz, "その他"),
    ];
  }

  // 画面中央に並べるアイコン
  Widget _iconContainer(BuildContext context, IconData icon, String text) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 60,
          width: 60,
          alignment: const Alignment(0.0, 0.0),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
