import 'package:flutter/material.dart';
import 'package:pizza_animation/data/fake_data.dart';
import 'package:pizza_animation/views/constants/ui_color.dart';
import 'package:pizza_animation/views/screens/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _scrollController = ScrollController();
  double turns = 0.0;

  void _scrollListener() {
    if (_scrollController.offset > 0) {
      setState(() {
        turns = 0.1;
      });
    } else {
      setState(() {
        turns = 0;
      });
    }
  }

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: FakeData.title.length);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.background,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                    )),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Make Your \nOwn Pizza Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.5,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    decoration: BoxDecoration(
                        color: UIColors.backgroundBold,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'What are you looking for?',
                          hintStyle:
                              TextStyle(color: UIColors.grey, fontSize: 12),
                          suffixIcon: const Icon(
                            Icons.search,
                            size: 18,
                          ),
                          suffixIconColor: UIColors.grey,
                          border: InputBorder.none),
                    ),
                  ),
                  TabBar(
                    isScrollable: true,
                    tabs: FakeData.title,
                    controller: _tabController,
                    indicatorColor: Colors.transparent,
                    labelPadding: const EdgeInsets.only(right: 50, left: 10),
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              DetailView(index: index),
                                          transitionDuration:
                                              const Duration(seconds: 1)));
                                },
                                child: Container(
                                  width: 230,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        margin: const EdgeInsets.only(
                                            top: 50, right: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons
                                                  .favorite_border_outlined),
                                            ),
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: const [
                                                        Icon(
                                                          Icons.circle,
                                                          color: Colors.green,
                                                          size: 3,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'VEG',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    const Text(
                                                      'Chicken Legend Ranch & Jalapeno Pizza',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 50,
                                        bottom: 100,
                                        child: AnimatedRotation(
                                          turns: turns,
                                          duration: const Duration(seconds: 1),
                                          child: Hero(
                                            tag: 'image_1 $index',
                                            child: Image.asset(
                                              'assets/images/pizza_1.png',
                                              width: 200,
                                              height: 200,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                        Container(),
                        Container(),
                        Container(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
