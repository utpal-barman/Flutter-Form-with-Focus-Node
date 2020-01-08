import 'package:flutter/material.dart';
import 'package:form_with_focus_node/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formGlobalKey = GlobalKey<FormState>();
  String _selectedText = "";
  List<String> _favoriteColor = [
    "Red",
    "Blue",
    "White",
    "Green",
    "Black",
    "Orange",
    "Yellow",
    "Violet",
    "Other"
  ];

  FocusNode _phoneFocusNode, _emailFocusNode, _nameFocusNode;

  // Initialize Focus Node Objects in initState
  @override
  void initState() {
    super.initState();

    _phoneFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
  }

  // Focus nodes are long living objects, so dispose it
  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _nameFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formGlobalKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  focusNode: _nameFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_phoneFocusNode);
                  },
                  decoration: InputDecoration(
                    hintText: "Name",
                    icon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (inputText) {
                    if (inputText.isEmpty) return "Please Enter your name";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: _phoneFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_emailFocusNode);
                  },
                  decoration: InputDecoration(
                    hintText: "Phone",
                    icon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (inputText) {
                    if (inputText.isEmpty)
                      return "Please Enter your phone number";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (_) {
                    _emailFocusNode.unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    icon: Icon(Icons.mail),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (inputText) {
                    if (inputText.isEmpty)
                      return "Please Enter your email";
                    else if (!inputText.contains('@'))
                      return "Not a valid email address";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                  ),
                  hint: _selectedText == ""
                      ? Text("Choose color...")
                      : Text(_selectedText),
                  items: _favoriteColor
                      .map((eachItem) => DropdownMenuItem(
                            value: eachItem,
                            child: Text(eachItem),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      // Will unfocus other fields, otherwise after selecting
                      // a value last active focus node will be focued
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _selectedText = value;
                    });

                    print(_selectedText);
                  },
                  validator: (value) {
                    if (value == null) return "Select an option";
                    return null;
                  },
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 17),
                    ),
                    onPressed: () {
                      if (_formGlobalKey.currentState.validate()) {
                        //TODO: do some http action on submission

                        Navigator.of(context).pushNamed(SecondScreen.routeName);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
