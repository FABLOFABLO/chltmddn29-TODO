import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  String title = "";
  final List<Widget> todo = [];
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Center(child: Text('TODO List', style: TextStyle(fontSize: 30))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('제목', style: TextStyle(fontSize: 30)),
                titlePadding: EdgeInsets.symmetric(
                  horizontal: 135,
                  vertical: 2,
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: textEditingController1,
                        decoration: InputDecoration(
                          hintText: '할일',
                          filled: true,
                          fillColor: Color(0xffF5F5F5),
                          prefixIcon: Icon(Icons.add),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              textEditingController1.clear();
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      Text('내용', style: TextStyle(fontSize: 30)),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: textEditingController2,
                          decoration: InputDecoration(
                            hintText: '구체적인 내용을 입력하세요',
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                            prefixIcon: Icon(Icons.add),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                textEditingController2.clear();
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        todo.add(
                          Container(
                            decoration: BoxDecoration(color: Colors.lightBlue),
                            height: 100,
                            width: 100,
                            child: Column(
                              children: [
                                Text(textEditingController1.text),
                                Text(textEditingController2.text),
                              ],
                            ),
                          ),
                        );
                        textEditingController1.clear();
                        textEditingController2.clear();
                      });
                    },
                    child: const Text('추가하기', style: TextStyle(fontSize: 20)),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: todo.length,
        itemBuilder: (context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('할일', style: TextStyle(fontSize: 40)),
              IconButton(
                icon: Icon(Icons.delete),
                iconSize: 40,
                onPressed: () {
                setState(() {
                  todo.removeAt(index);
                });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
