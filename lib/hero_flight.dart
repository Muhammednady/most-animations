import 'package:flutter/material.dart';

class HeroExample2 extends StatelessWidget {
  const HeroExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Sample')),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Hero(
              tag: 'hero-default-tween',
              child: BoxWidget(
                size: const Size(50.0, 50.0),
                color: Colors.red[700]!.withOpacity(0.5),
              ),
            ),
            title: const Text(
              'This red icon will use a default rect tween during the hero flight.',
            ),
          ),
          const SizedBox(height: 10.0),
          ListTile(
            leading: Hero(
              tag: 'hero-custom-tween',
              createRectTween: (Rect? begin, Rect? end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              child: BoxWidget(
                size: const Size(50.0, 50.0),
                color: Colors.blue[700]!.withOpacity(0.5),
              ),
            ),
            title: const Text(
              'This blue icon will use a custom rect tween during the hero flight.',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _gotoDetailsPage(context),
            child: const Text('Tap to trigger hero flight'),
          ),
        ],
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Stack(
          children: <Widget>[
            Hero(
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                      fromHeroContext, toHeroContext) =>
                  BoxWidget(
                size: const Size(400.0, 400.0),
                color: Colors.blue[700]!.withOpacity(0.5),
              ),
              tag: 'hero-custom-tween',
              createRectTween: (Rect? begin, Rect? end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              child: BoxWidget(
                size: const Size(400.0, 400.0),
                color: Colors.blue[700]!.withOpacity(0.5),
              ),
            ),
            Hero(
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                      fromHeroContext, toHeroContext) =>
                  BoxWidget(
                size: const Size(400.0, 400.0),
                color: Colors.red[700]!.withOpacity(0.5),
              ),
              tag: 'hero-default-tween',
              child: BoxWidget(
                size: const Size(400.0, 400.0),
                color: Colors.red[700]!.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    super.key,
    required this.size,
    required this.color,
  });

  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check Material'),),
      body: Material(
        color: Colors.red,
        
      ),
    );
  }
}


class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    super.key,
   required this.maxRadius,
   required  this.child,
  }) : clipRectSize = 2.0 * (maxRadius)
      ;

  final double maxRadius;
  final  clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ClipOval(
        child: Center(
          child: SizedBox(
            width: clipRectSize,
            height: clipRectSize,
            child: Container(
              color: Colors.red,
              child: ClipRect(
                child: child,  // Photo
              ),
            ),
          ),
        ),
      ),
    );
  }
}