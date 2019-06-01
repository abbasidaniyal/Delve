import 'package:flutter/material.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';

class CollabPage extends StatefulWidget {
  @override
  _CollabPageState createState() => _CollabPageState();
}

class _CollabPageState extends State<CollabPage> {
  bool isConnected = false;
  String text = '';
  final _controller = TextEditingController(text: '');
  SocketIOManager manager;
  SocketIO socket;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text;
      if (isConnected) {
        socket.emit('collab', [text]);
      }
    });
    initSocket();
  }

  void initSocket() async {
    socket = await manager.createInstance('http://168.61.208.104/');

    socket.onConnect((data) {
      print('Connected');
      setState(() {
        isConnected = true;
      });
    });

    socket.on('collab', (data) {
      setState(() {
        text = data.toString();
      });
      _controller.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collaborate'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(isConnected ? 'Connected' : 'Not Connected'),
            TextField(
              autocorrect: true,
              autofocus: true,
              decoration:
                  InputDecoration(hintText: 'Collaorate in real time here'),
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
