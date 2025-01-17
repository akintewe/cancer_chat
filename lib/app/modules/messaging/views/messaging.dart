// import 'package:cancer_chat/core/theme/colors.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MessagingPage extends StatefulWidget {
//   const MessagingPage({super.key});

//   @override
//   State<MessagingPage> createState() => _MessagingPageState();
// }

// class _MessagingPageState extends State<MessagingPage> {
//   TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         elevation: 0,
//         backgroundColor: AppColors.white,
//         leading: IconButton(
//             iconSize: 26,
//             onPressed: () {
//               context.go('/myAppointmentPage');
//             },
//             icon: Icon(
//               Icons.arrow_back_rounded,
//               color: AppColors.primary,
//             )),
//         title: Text(
//           'Messaging',
//           style: GoogleFonts.roboto(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 23,
//           ),
//         ),
//         actions: [

//         ],
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [

//                     const SizedBox(
//                       width: 13,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Dr. Mary Steward',
//                           style: GoogleFonts.roboto(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16.sp,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.sp,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           '10:00 - 10:30AM',
//                           style: GoogleFonts.roboto(color: Colors.black),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       width: 18,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),

//             SizedBox(
//               height: 10,
//             ),

//             SizedBox(
//               height: 10,
//             ),

//             SizedBox(
//               height: 100,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TextFormField(
//                 controller: _controller,
//                 decoration: InputDecoration(
//                   hintText: 'Type message....',
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       Icons.send,
//                       color: AppColors.primary,
//                     ),
//                     onPressed: () {
//                       // handle send button press here
//                       print('Send button pressed!');
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cancer_chat/core/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  final _textController = TextEditingController();
  List<Widget> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(Message(text: text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () {
              context.go('/myAppointmentPage');
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.primary,
            )),
        title: Text(
          'Messaging',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary100),
                child: Icon(
                  Icons.more_vert_rounded,
                  color: AppColors.primary,
                  size: 26,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.grey90)),
            child: Row(
              children: [
                Stack(
                  children: [
                    Positioned(
                        child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: SizedBox(
                        height: 100,
                        width: 90,
                        child: Image.asset(
                          'assets/images/doctor3.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                  ],
                ),
                SizedBox(
                  width: 13,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Dr. Mary Steward',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      '10:00 - 10:30AM',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Hello ${FirebaseAuth.instance.currentUser!.displayName!}, I am Dr Mary Steward.\nI will help you solve your disease\ncomplaints.',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('10:00')],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'First, can you tell me about your\nillness so far..',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('10:00')],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'This is very important so that i can\nhelp identify your disease and the\nsolution 😁',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('10:00')],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onSubmitted: _handleSubmitted,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Send a message',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String text;

  const Message({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}


// Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 height: 100,
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(
//                       color: AppColors.grey90,
//                     )),
//                 child: Row(
//                   children: [
//                     Stack(
//                       children: [
//                         Positioned(
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(20),
//                               bottomLeft: Radius.circular(20),
//                             ),
//                             child: SizedBox(
//                                 height: 100,
//                                 width: 90,
//                                 child: Image.asset(
//                                   'assets/images/doctor3.jpg',
//                                   fit: BoxFit.cover,
//                                 )),
//                           ),
//                         ),
//                       ],
//                     ),