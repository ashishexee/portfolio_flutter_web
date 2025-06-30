import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/chathelper.dart';

class ChatBotWindow extends StatefulWidget {
  final bool isCollapsed;
  const ChatBotWindow({super.key, required this.isCollapsed});

  @override
  State<ChatBotWindow> createState() => _ChatBotWindowState();
}

class _ChatBotWindowState extends State<ChatBotWindow> {
  TextEditingController messageController = TextEditingController();
  List<_ChatMessage> messages = [];
  bool _isloading = false;
  late bool collapsed;

  @override
  void initState() {
    super.initState();
    collapsed = widget.isCollapsed;
  }

  @override
  void didUpdateWidget(ChatBotWindow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCollapsed != widget.isCollapsed) {
      setState(() {
        collapsed = widget.isCollapsed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 20,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 390,
        height: collapsed ? 72 : MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A1F29), Color(0xFF3A3F49)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: SvgPicture.asset(
                          'assets/chatbot.svg',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Chat with me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      collapsed ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        collapsed = !collapsed;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (!collapsed) ...[
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child:
                      messages.isEmpty
                          ? Center(
                            child: Column(
                              children: [
                                Text('You can ask anything about me below'),
                                SizedBox(height: 5),
                                Text(
                                  'Try asking : What does Ashish do?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.5,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(
                                  height: 170,
                                  width: 170,
                                  child: LottieBuilder.asset(
                                    'assets/chatbox.json',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )
                          : Column(children: messages),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF222733), Color(0xFF3A3F49)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                          hintStyle: TextStyle(color: Colors.white54),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFF1A1F29),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                        ),
                        onSubmitted: (value) => _sendMessage(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF6C7A89),
                      ),
                      child: InkWell(
                        focusColor: Colors.grey,
                        hoverColor: Colors.black,
                        onTap: _sendMessage,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child:
                              _isloading == true
                                  ? Center(
                                    child: SizedBox(
                                      height: 14,
                                      width: 14,
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                  : Icon(Icons.send, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    if (messageController.text.isEmpty) return;
    final userMessage = messageController.text;
    messageController.clear();
    setState(() {
      _isloading = true;
      messages.add(_ChatMessage(text: userMessage, isMe: true));
    });
    String reply = await getResponse(userMessage);
    setState(() {
      messages.add(_ChatMessage(text: reply, isMe: false));
      _isloading = false;
    });
  }
}

class _ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;

  const _ChatMessage({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF6C7A89) : const Color(0xFF222733),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.white70,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
