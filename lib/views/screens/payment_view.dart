import 'package:flutter/material.dart';
import 'package:pizza_animation/views/constants/ui_color.dart';
import 'package:pizza_animation/views/widget/ui_text.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  bool isVisible = false;
  bool position = false;
  double opacityLevel = 1.0;
  double turn = 0.0;
  bool scale = true;
  double opacity = 1.0;
  bool rectangle = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        position = true;
        opacityLevel = 0;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isVisible = true;
        turn = 1 / 20;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        turn = -1 / 20;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        turn = 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(rectangle);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'assets/images/box_bottom.png',
                width: 300,
                height: 300,
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 10,
            right: 0,
            child: isVisible
                ? Container()
                : Hero(
                    tag: 'image_1 ${widget.index}',
                    child: Image.asset(
                      'assets/images/pizza_1.png',
                      width: 250,
                      height: 250,
                    ),
                  ),
          ),
          AnimatedPositioned(
            top: position ? 30 : -250,
            left: 0,
            right: 0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: AnimatedRotation(
              turns: turn,
              duration: const Duration(milliseconds: 700),
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset('assets/images/box_top.png'),
              ),
            ),
          ),
          scale
              ? AnimatedPositioned(
                  bottom: position ? 0 : -320,
                  right: 0,
                  left: 0,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    height: 320,
                    decoration: BoxDecoration(
                        color: UIColors.backgroundBold,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Image.asset(
                            'assets/images/ic_sucess.png',
                            width: 36,
                            height: 36,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const UIText(
                          text: 'Your Pizza is Ready !',
                          color: Colors.white,
                          size: 22,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: 230,
                          child: UIText(
                            text:
                                'Yay. It looks beatiful. You can always check your order in the "Orders section under profile',
                            color: Colors.white24,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                position = false;
                              });
                              Future.delayed(const Duration(seconds: 1), () {
                                scale = false;
                              });
                              Future.delayed(const Duration(milliseconds: 2500), () {
                                setState(() {
                                  rectangle = true;
                                });
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: UIColors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 15)),
                            child: const UIText(
                              text: 'Tracking Order',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                )
              : rectangle
                  ? TweenAnimationBuilder(
                      tween: Tween<double>(
                          begin: MediaQuery.of(context).size.width,
                          end: MediaQuery.of(context).size.height),
                      duration: const Duration(seconds: 1),
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        print(value);
                        return Positioned(
                          bottom: 0,
                          child: Container(
                            height: value,
                            width: value,
                            decoration: BoxDecoration(
                              color: UIColors.backgroundBold,
                              borderRadius: value == MediaQuery.of(context).size.height ? BorderRadius.circular(0) : BorderRadius.circular(value),
                            ),
                          ),
                        );
                      })
                  : TweenAnimationBuilder(
                      tween: Tween<double>(begin: 30, end: MediaQuery.of(context).size.width),
                      duration: const Duration(seconds: 2),
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return Positioned(
                          bottom: 0,
                          child: Container(
                            height: value,
                            width: value,
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                              color: UIColors.backgroundBold,
                              borderRadius: BorderRadius.circular(value),
                            ),
                          ),
                        );
                      },
          )
        ],
      ),
    );
  }
}
