import 'package:flutter/material.dart';
import 'package:flutter_booking_app/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF0F3F5),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFF0F3F5),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/category.png"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/explore.png"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/people.png"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/bookmark.png"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/settings.png"),
              label: "",
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Current",
                            style: subTitleStyle,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Executed",
                            style: subTitleStyle.copyWith(
                              color: kTextPrimaryColor.withOpacity(.6),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "All",
                            style: subTitleStyle.copyWith(
                              color: kTextPrimaryColor.withOpacity(.6),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            VillaSpecsCard(),
                            VillaSpecsCard(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular Stays",
                                style: subTitleStyle,
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/icons/filter.png"),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                      spreadRadius: .5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  VillaCard(
                                    index: 1,
                                    title: "Villa Goanok\nKomang",
                                    rating: "4.9",
                                    price: "78",
                                    image: "assets/images/image1.png",
                                  ),
                                  VillaCard(
                                    index: 3,
                                    title: "Banny`s\nAppartements",
                                    rating: "5.0",
                                    price: "150",
                                    image: "assets/images/image3.png",
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 55),
                                child: Column(
                                  children: [
                                    VillaCard(
                                      index: 2,
                                      title: "Villa Parttes\nUbud",
                                      rating: "4.8",
                                      price: "112",
                                      image: "assets/images/image2.png",
                                    ),
                                    VillaCard(
                                      index: 4,
                                      title: "Villa Bancon\nKuta Utara",
                                      rating: "4.9",
                                      price: "82",
                                      image: "assets/images/image4.png",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class VillaCard extends StatelessWidget {
  VillaCard({
    Key? key,
    required this.index,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
  }) : super(key: key);

  int index;
  String image, title, price, rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: index.isOdd ? 15 : 0, bottom: 15),
      child: Stack(
        children: [
          Container(
            width: 166,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
          Container(
            width: 166,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.6),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFF9B917),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            rating,
                            style: textStyleVillaRating,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: textStyleVillaTitle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        "\$${price}",
                        style: textStyleVillaTitle.copyWith(fontSize: 24),
                      ),
                      Text(
                        "per night",
                        style: textStyleVillaTitle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VillaSpecsCard extends StatelessWidget {
  const VillaSpecsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14, bottom: 10, top: 10),
      width: 320,
      height: 154,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: .5,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Villa for 16 guests in Ubud",
                  style: textStyle1,
                ),
                SizedBox(width: 42),
                Image.asset("assets/icons/fire.png"),
                SizedBox(width: 8),
                Text(
                  "Offers",
                  style: textStyle1.copyWith(fontSize: 12),
                ),
              ],
            ),
            Text(
              "Dec 20, 2022 - Dec 30, 2022",
              style: textStyle1.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Wrap(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 7, top: 6),
                  alignment: Alignment.center,
                  width: 68,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xFF1EC5AA),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "16 guests",
                    style: textStyle2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 7, top: 6),
                  alignment: Alignment.center,
                  width: 84,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xFF5733F4),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "5 bedrooms",
                    style: textStyle2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 7, top: 6),
                  alignment: Alignment.center,
                  width: 93,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xFF4FBF16),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "\$1400 - \$1800",
                    style: textStyle2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 7, top: 6),
                  alignment: Alignment.center,
                  width: 74,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xFF206FE5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "Open Pool",
                    style: textStyle2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 7, top: 6),
                  alignment: Alignment.center,
                  width: 59,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xFFDC3410),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "Kitchen",
                    style: textStyle2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 7, top: 6),
                  alignment: Alignment.center,
                  width: 46,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xFFAB28EA),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "Wi-Fi",
                    style: textStyle2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Applications",
          style: titleStyle,
        ),
        Stack(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFF9B917),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ],
        )
      ],
    );
  }
}
