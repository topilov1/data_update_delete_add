import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // data
  List data = [
    'flutter',
    'php',
    'paythn',
    'C++',
    'C#',
    'java',
    'dotnet',
    'js',
    'htme',
    'css',
    'reakt',
    'android',
    'ios',
    'ui/ux',
  ];

  String? text;
  String? newText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return container(index);
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: addPost(context),
          )
        ],
      ),
    );
  }

// add new post
  Container addPost(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[700],
      child: IconButton(
        onPressed: (() {
          // showDialog
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // text new  add text
                title: TextFormField(
                  onChanged: (value) {
                    newText = value;
                    setState(() {});
                  },
                ),

                actions: [
                  // new post
                  IconButton(
                    onPressed: () {
                      data.add(newText);
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    icon: const Icon(Icons.done),
                  ),

                  // no pop
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              );
            },
          );
        }),

        // add new post
        icon: const Icon(Icons.add, size: 40),
      ),
    );
  }

// post
  Container container(int index) {
    return Container(
        // decoration
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 2, color: Colors.black),
        ),
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // data
            Text(data[index].toString(), style: const TextStyle(fontSize: 20)),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // update in data
                IconButton(
                  onPressed: (() {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              onChanged: (value) {
                                text = value;
                                setState(() {});
                              },
                            ),
                          ),

                          // true
                          IconButton(
                            onPressed: (() {
                              data[index] = text;
                              setState(() {});
                              Navigator.of(context).pop();
                            }),
                            icon: const Icon(Icons.done),
                          )
                        ],
                      ),
                    );
                  }),
                  icon: const Icon(Icons.edit),
                ),

                // delete in data
                IconButton(
                  onPressed: (() async {
                    await data.removeAt(index);
                    setState(() {});
                  }),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ))
          ],
        ));
  }
}
