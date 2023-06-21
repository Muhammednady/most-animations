import 'package:animations/clip_path/color_model.dart';
import 'package:flutter/material.dart';

class ClipPathView extends StatelessWidget {
  const ClipPathView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clip Path'),
        ),
        body: const AnimatedClipPath());
  }
}

class CustomClip extends CustomClipper<Path> {
  final double value;
  final Alignment alignment;

  CustomClip(this.value, this.alignment);
  @override
  Path getClip(Size size) {
    Path path = Path();

    if (alignment == Alignment.topLeft) {
      path = drawOval(size);
    } else if (alignment == Alignment.topCenter) {
      path = drawOval(size,dx: size.width/2);
    }else if (alignment == Alignment.topRight) {
      path = drawOval(size,dx: size.width);
    }else if (alignment == Alignment.centerLeft) {
      path = drawOval(size,dy: size.height/2);
    }else if (alignment == Alignment.centerRight) {
      path = drawOval(size,dx: size.width,dy: size.height/2);
    }else if (alignment == Alignment.bottomLeft) {
      path = drawOval(size,dy: size.height);
    } else if (alignment == Alignment.bottomCenter) {
      path = drawOval(size,dx: size.width/2,dy: size.height);
    }else if (alignment == Alignment.bottomRight) {
      path = drawOval(size,dx: size.width,dy: size.height);
    }

    return path;
  }

  Path drawOval(Size size, {double dx = 0, double dy = 0}) {
    Path path = Path();
    path.addOval(Rect.fromCenter(
        center:  Offset(dx, dy),
        width: size.width * 3 * value,
        height: size.height * 3 * value));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class AnimatedClipPath extends StatefulWidget {
  const AnimatedClipPath({super.key});

  @override
  State<AnimatedClipPath> createState() => _AnimatedClipPathState();
}

class _AnimatedClipPathState extends State<AnimatedClipPath>
    with SingleTickerProviderStateMixin {
  List<ColorModel> items = [
    ColorModel(Colors.red, Alignment.topLeft),
    ColorModel(Colors.green, Alignment.topCenter),
    ColorModel(Colors.purple, Alignment.topRight),
    ColorModel(Colors.blue, Alignment.centerLeft),
    ColorModel(Colors.yellow, Alignment.centerRight),
    ColorModel(Colors.indigo, Alignment.bottomLeft),
    ColorModel(Colors.teal, Alignment.bottomCenter),
    ColorModel(Colors.grey, Alignment.bottomRight),
  ];
  AnimationController? animationController;
  Animation<double>? animation;
  Color? currentColor;
  Color? prevColor;
  Alignment alignment = Alignment.topLeft;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: prevColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            AnimatedBuilder(
                animation: animationController!,
                builder: (context, child) {
                  return ClipPath(
                    clipper: CustomClip(animation!.value, alignment),
                    child: Container(
                      color: currentColor,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.6,
                    ),
                  );
                }),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12),
                itemCount: items.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      currentColor = items[index].color;
                      alignment = items[index].alignment;
                      animationController!.forward(from: 0.0).whenComplete(() {
                        setState(() {
                          prevColor = currentColor;
                        });
                      });
                    },
                    child: GridViewItem(color: items[index].color))),
          ),
        )
      ],
    );
  }
}

class GridViewItem extends StatelessWidget {
  final Color color;

  const GridViewItem({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: color,
    );
  }
}
