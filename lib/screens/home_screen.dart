import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktesst/blocs/post_bloc.dart';
import 'package:ktesst/blocs/post_event.dart';
import 'package:ktesst/blocs/post_state.dart';
import 'package:ktesst/model/post_model.dart';
import '../blocs/theme_bloc/theme_bloc.dart';
import '../blocs/theme_bloc/theme_event.dart';
import '../model/theme_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<PostModel> _post = [];

  _requestPost() async {
    BlocProvider.of<PostBloc>(context).add(const RequestGetPost());
  }

  @override
  void initState() {
    _requestPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
        builder: (context, state) => _buildUI(context),
        listener: (context, state) {
          if (state is PostLoading) {
            if (kDebugMode) {
              print('loading...');
            }
          } else if (state is PostLoadSuccess) {
            if (kDebugMode) {
              print('Success...');
            }
            _post = state.post;
          } else if (state is PostLoadError) {
            if (kDebugMode) {
              print('message Error: ${state.message}');
            }
          }
        });
  }

  Widget _buildUI(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            height: 180,
            child: Drawer(
              child: ListView.builder(
                itemCount: AppTheme.values.length,
                itemBuilder: (context, index) {
                  // Enums expose their values as a list - perfect for ListView
                  // Store the theme for the current ListView item
                  final itemAppTheme = AppTheme.values[index];
                  return Card(
                    // Style the cards with the to-be-selected theme colors
                    color: appThemeData[itemAppTheme]?.primaryColor,
                    child: ListTile(
                      title: Text(
                        itemAppTheme.toString(),
                        // To show light text with the dark variants...
                        style: appThemeData[itemAppTheme]?.textTheme.bodyText1,
                      ),
                      onTap: () {
                        // This will make the Bloc output a new ThemeState,
                        // which will rebuild the UI because of the BlocBuilder in main.dart
                        BlocProvider.of<ThemeBloc>(context)
                            .add(RequestGetTheme(theme: itemAppTheme));
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 330,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 300,
                      color: Colors.purple.shade300,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 60, left: 100),
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              "assets/image/circle.png",
                              scale: 8,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10, left: 60),
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              "assets/image/cloud.png",
                              scale: 10,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 40, right: 60),
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              "assets/image/cloud.png",
                              scale: 8,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              "assets/image/cloud.png",
                              scale: 8,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: Image.asset("assets/image/login_bottom.png"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      alignment: Alignment.bottomCenter,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.purple,
                              size: 30,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.purple, width: 2),
                                borderRadius: BorderRadius.circular(40))),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, right: 20),
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: const Icon(
                          Icons.format_list_bulleted,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, right: 20),
                      alignment: Alignment.topRight,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 50),
                      alignment: Alignment.centerLeft,
                      width: 220,
                      child: const Text(
                        "transformation_of_new_ideas",
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  "featured_&_recommended",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 500,
                margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                decoration: BoxDecoration(
                    color: Colors.lightGreen.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                    itemCount: _post.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = _post[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 10, 20, 10),
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Project name",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const <Widget>[
                                                  Text(
                                                    "id:",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.green),
                                                  ),
                                                  Text(
                                                    "title",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.green),
                                                  ),
                                                  Text(
                                                    "body",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.green),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    item.id.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.green),
                                                  ),
                                                  Text(
                                                    item.title.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.green,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  Text(
                                                    item.body.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.green,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                "assets/image/more.png",
                                color: Colors.grey,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: -20,
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.purple.shade500),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.star,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "4.5",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
