import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;
  List<String> texts = ["This", "is", "parallax", "scroll", "!"];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: size.height,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  transform: Matrix4.identity()
                    ..translate(
                        0.0,
                        scrollController.hasClients
                            ? (-(index * size.height) +
                                scrollController.position.pixels)
                            : 0.0),
                  width: size.width,
                  height: size.height,
                  child: Image.asset(
                    "assets/${index + 1}.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Text(
                    texts[index],
                    style: GoogleFonts.kaushanScript(
                      color: Colors.white,
                      fontSize: 100,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
