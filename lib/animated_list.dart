import 'package:flutter/material.dart';

class CustomAnimatedList extends StatefulWidget {
  const CustomAnimatedList({super.key});

  @override
  State<CustomAnimatedList> createState() => _CustomAnimatedListState();
}

class _CustomAnimatedListState extends State<CustomAnimatedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated List'),
        ),
        body: const CustomizedAnimatedList());
  }
}

class CustomizedAnimatedList extends StatefulWidget {
  const CustomizedAnimatedList({super.key});

  @override
  State<CustomizedAnimatedList> createState() => _CustomizedAnimatedListState();
}

class _CustomizedAnimatedListState extends State<CustomizedAnimatedList> {
  final List<String> items = [];
  final listKey = GlobalKey<AnimatedListState>();
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5.0,
        ),
        Expanded(
            child: AnimatedList(
          key: listKey,
          controller: scrollController,
          initialItemCount: items.length,
          itemBuilder: (context, index, animation) {
            return SlideTransition(
              position: animation
                  .drive(Tween<Offset>(begin:const Offset(1, 0), end: const Offset(0, 0))),
              child: AnimatedListItem(
                text: items[index],
                onpressed: () {
                  deleteListItem(index);
                },
              ),
            );
          },
        )),
        const SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: ElevatedButton(
              onPressed: () {
                int index = items.length;
                items.add('Item # ${index + 1}');
                listKey.currentState!.insertItem(index);

                Future.delayed(const Duration(milliseconds: 300),() {
                  scrollController.animateTo(scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                },);
              },
              child: const Text('Add new Item')),
        )
      ],
    );
  }

  void deleteListItem(index) {
    String deletedItem = items.removeAt(index);
    listKey.currentState!.removeItem(
        index,
        (context, animation) => SlideTransition(
              position: animation.drive(
                  Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))),
              child: AnimatedListItem(text: deletedItem, onpressed: () {}),
            ));
  }
}

class AnimatedListItem extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const AnimatedListItem(
      {super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('${text}'),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          IconButton(onPressed: onpressed, icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
