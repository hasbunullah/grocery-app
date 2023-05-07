import 'package:flutter/material.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  List<String> itemList = [
    'Apple',
    'Strawberries',
    'Pineapple',
    'Tomato',
    'Orange',
    'Carrot',
  ];

  List<String>? itemListSearch;
  final FocusNode textFocusNode = FocusNode();
  final TextEditingController? _textEditingController = TextEditingController();

  @override
  void dispose() {
    textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            controller: _textEditingController,
            focusNode: textFocusNode,
            decoration: InputDecoration(
                hintText: 'Search.....',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            onChanged: (value) {
              setState(() {
                itemListSearch = itemList
                    .where((element) =>
                        element!.toLowerCase().contains(value.toLowerCase()))
                    .toList();
                if (_textEditingController!.text.isNotEmpty &&
                    itemListSearch!.isEmpty) {
                  print('Item Searched List Lenght${itemListSearch!.length}');
                }
              });
            },
          ),
        ),
      ),
      body: _textEditingController!.text.isNotEmpty && itemListSearch!.isEmpty
          ? Center(
              child: Text(
                'No result found',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3, crossAxisSpacing: 12),
              itemCount: _textEditingController!.text.isNotEmpty
                  ? itemListSearch!.length
                  : itemList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_textEditingController!.text.isNotEmpty
                        ? itemListSearch![index]
                        : itemList[index].toString()),
                  ),
                );
              }),
    );
  }
}
