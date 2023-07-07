import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pizza_animation/views/constants/ui_color.dart';
import 'package:pizza_animation/views/screens/payment_view.dart';
import 'package:pizza_animation/views/widget/ui_text.dart';
class DetailView extends StatefulWidget {
  final int index;
  const DetailView({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  double _turn = 0.0;
  bool showMessage = false;
  bool visibleAdd = true;
  bool visibleOrder = false;
  int rotation = 0;

  @override
  void initState() {
    // setState(() {
    //   _turn += 0.1;
    // });
    Future.delayed(const Duration(microseconds: 500), () {
      setState(() {
        showMessage = true;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Positioned(
              left: 10,
              top: 50,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)
              )
          ),
          Positioned(
            left: 150,
            top: -100,
            child: Hero(
                tag: 'image_1 ${widget.index}',
                flightShuttleBuilder: (_, Animation<double> animation, __, ___, _____) {
                  return RotationTransition(
                    turns: animation.drive(Tween(begin: 0, end: 1)),
                    child: Image.asset('assets/images/pizza_1.png'),
                  );
                },
                child: Image.asset('assets/images/pizza_1.png')
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            top: 200,
            left: showMessage? 20 : 200,
            child: Row(
              children: const [
                Text(
                  '\$19',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2
                  ),
                ),
                SizedBox(width: 5,),
                Text(
                  '.45',
                  style: TextStyle(
                      color: Colors.black54,
                      letterSpacing: 2
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 220,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: const [
                    Icon(Icons.circle, size: 3, color: Colors.teal,),
                    SizedBox(width: 5),
                    UIText(text: 'NON - VEG', fontWeight: FontWeight.w500, color: Colors.black54,)
                  ],
                ),
                const SizedBox(height: 10,),
                const UIText(text: 'Chicken Legend Ranch & Jalapeno Pizza', fontWeight: FontWeight.bold, size: 28,),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      itemSize: 18,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: UIColors.orange,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(width: 10,),
                    UIText(text: '4.0', color: UIColors.orange, fontWeight: FontWeight.bold,),
                    const UIText(text: ' (40)', color: Colors.black54,)
                  ],
                )
              ],
            ),
          ),
          AnimatedPositioned(
              bottom: showMessage? 0 : -100,
              right: 0,
              left: 0,
              duration: const Duration(seconds: 1),
              child: Visibility(
                visible: visibleAdd,
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                    ),
                    color: Colors.black12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/ic_percent.png', width: 24, height: 24,),
                      Column(
                        children: const [
                          UIText(text: '20% off on orders above \$20', fontWeight: FontWeight.w500, size: 18,),
                          SizedBox(height: 10,),
                          UIText(text: 'Use cupon code: HANGRYCURLS', color: Colors.black54,)
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleAdd = false;
                              visibleOrder = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: UIColors.orange,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Icon(Icons.add),
                      )
                    ],
                  ),
                ),
              ),

          ),
          AnimatedPositioned(
            bottom: visibleOrder? 0 : -230,
            right: 0,
            left: 0,
            duration: const Duration(seconds: 1),
              child: Visibility(
                visible: visibleOrder,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    ),
                    color: UIColors.backgroundSecond
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          UIText(text: '1 item added', color: Colors.white,),
                          Text.rich(
                            TextSpan(
                              text: '\$19',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '.45',
                                  style: TextStyle(
                                    color: Colors.white24,
                                    fontSize: 12
                                  )
                                )
                              ]
                            )
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Divider(color: Colors.white, height: 30,),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              flex: 1,
                                child: Icon(Icons.location_on_outlined, color: Colors.white24)
                            ),
                            const Flexible(
                                flex: 8,
                                child: UIText(text: '123 Nguyễn Văn Linh', color: Colors.white24,)
                            ),
                            const Spacer(
                              flex: 3,
                            ),
                            Flexible(
                                flex: 2,
                                child: Image.asset('assets/images/ic_master_card.png', width: 36, height: 36,)
                            ),
                            const Flexible(
                                flex: 4,
                                child: UIText(text: '*******00404', color: Colors.white24,)
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => PaymentView(index: widget.index),
                                transitionDuration: const Duration(seconds: 1)
                              )
                          );
                        },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 120,
                              vertical: 15
                            )
                          ),
                          child: UIText(text: 'Order Now', color: UIColors.backgroundSecond, fontWeight: FontWeight.bold, size: 18,)
                      )
                    ],
                  ),
                ),
              ),

          )
        ],
      ),
    );
  }
}
