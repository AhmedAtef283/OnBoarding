import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AlarmBuilder(String time, date) => Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.label,
                  color: Colors.teal,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Alarm',
                ),
                SizedBox(
                  width: 160,
                ),
                Text(
                  date,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Row(
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget buildChatItem() => Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 35,
              backgroundImage: NetworkImage(
                  'https://www.pngmart.com/files/3/Man-PNG-Pic.png'),
            ),
            CircleAvatar(
              radius: 7,
              backgroundColor: Colors.red,
            ),
            CircleAvatar(
              radius: 7.5,
              backgroundColor: Colors.green,
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ziad Yasser',
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Hi , I am Waiting You  !??',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '21:13',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

Widget buildStoryItem() => Container(
      width: 60,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://www.pngmart.com/files/3/Man-PNG-Pic.png'),
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 7.5,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            'Ahmed Atef Saleh',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

void navigateAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false,
);
