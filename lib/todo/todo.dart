import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  String title="";
  final List<Widget> todo = [];
  final TextEditingController TextEditingController1 = TextEditingController();
  final TextEditingController TextEditingController2 = TextEditingController();

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
                        controller: TextEditingController1,
                        decoration: InputDecoration(
                          hintText: '할일',
                          filled: true,
                          fillColor: Color(0xffF5F5F5),
                          prefixIcon: Icon(Icons.add),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              TextEditingController1.clear();
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
                          controller: TextEditingController2,
                          decoration: InputDecoration(
                            hintText: '구체적인 내용',
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                            prefixIcon: Icon(Icons.add),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                TextEditingController2.clear();
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
                      setState((
                          ) {
                        todo.add(
                            Container(
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                          ),
                          height: 100,
                          width: 100,
                        child: Column(
                          children: [
                            Text(
                              TextEditingController1.text
                            ),
                            Text(
                              TextEditingController2.text
                            )
                          ],
                        ),

                        ));
                        TextEditingController1.clear();
                        TextEditingController2.clear();
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
        itemBuilder: (context,_TodoState) {
          return InkWell(
            child: ListTile(
              title: Text('wow'),
            ),
          );
        },
        itemCount: todo.length,
      ),
    );
  }
}
