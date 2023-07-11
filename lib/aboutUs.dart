import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutus extends StatefulWidget {
  const aboutus({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<aboutus> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _opacityAnimation = Tween<double>(begin: 0.2, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: const Color.fromARGB(255, 209, 101, 228),
      ),
      body: AnimatedBuilder(
        animation: _opacityAnimation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 219, 153, 230)
                      .withOpacity(_opacityAnimation.value),
                  Color.fromARGB(255, 168, 104, 179)
                      .withOpacity(_opacityAnimation.value),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 100,
                    color: const Color.fromARGB(255, 159, 33, 243),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'NutriBase',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'An application devised to combat Obesity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight
                          .bold, // Add FontWeight.bold to make the text bold
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Developed by Satishwaran',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight
                          .bold, // Add FontWeight.bold to make the text bold
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'cctvwhat007@gmail.com',
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight
                            .bold, // Add FontWeight.bold to make the text bold
                        color:
                            Colors.blue, // Adjust the color to your preference
                        decoration: TextDecoration
                            .underline, // Add underline decoration to indicate it's a hyperlink
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle the tap event (e.g., open email client with the address pre-filled)
                          launch('mailto:cctvwhat007@gmail.com');
                        },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
