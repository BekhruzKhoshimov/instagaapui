import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';

import '../models/post_model.dart';
import '../models/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Story> _stories = [
    Story(
      name: "Jasmin",
      image: "assets/images/user_1.jpeg"
    ),
    Story(
        name: "Lavina",
        image: "assets/images/user_2.jpeg"
    ),
    Story(
        name: "Sylvester",
        image: "assets/images/user_1.jpeg"
    ),
    Story(
        name: "Jasmin",
        image: "assets/images/user_1.jpeg"
    ),
    Story(
        name: "Lavina",
        image: "assets/images/user_2.jpeg"
    ),
    Story(
        name: "Sylvester",
        image: "assets/images/user_1.jpeg"
    ),

  ];
  final List<Post> _posts = [
    Post(
      userName: "Brianne",
      userImage: "assets/images/user_1.jpeg",
      postImage: "assets/images/feed_1.jpeg",
      caption: "Нет подключения к интернету"
    ),
    Post(
        userName: "Henri",
        userImage: "assets/images/user_2.jpeg",
        postImage: "assets/images/feed_2.jpeg",
        caption: "Нет подключения к интернету"
    ),
    Post(
        userName: "Brianne",
        userImage: "assets/images/user_3.jpeg",
        postImage: "assets/images/feed_3.jpeg",
        caption: "Нет подключения к интернету"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),

            ///Stories
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Stories", style: TextStyle(color: Colors.grey),),
                  Text("Watch All", style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _stories.map((story) {
                  return _itemOfStory(story);
                }).toList(),
              ),
            ),
            ///Post
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                  itemBuilder: (context, index){
                    return _itemOfPost(_posts[index]);
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemOfStory(Story story){
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.purple,
              width: 3
            )
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image!),
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Text(story.name!),
      ],
    );
  }

  Widget _itemOfPost(Post post){
    return Column(
      children: [
        ///acatar
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                      image: AssetImage(post.userImage!),
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(post.userName!),
                ],
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),
        ),
        ///Post_Image
        FadeInImage(
          width: MediaQuery.of(context).size.width,
          placeholder: const AssetImage("assets/images/placeholder.png"),
          image: AssetImage(post.postImage!),
        ),
        ///Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Linecons.heart),
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Linecons.comment),
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Linecons.paper_plane),
                ),
              ],
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(CupertinoIcons.bookmark),
            ),
          ],
        ),
        ///Tags
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          width: double.infinity,
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Liked By ",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: "Sigmund, ",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                ),
                TextSpan(
                    text: "Yesseina, ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                ),
                TextSpan(
                    text: "Sigmund, ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: "and ",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                    text: "1263 others ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                ),

              ]
            ),
          ),
        ),
        ///Caption
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${post.userName} ",
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: post.caption,
                  style: const TextStyle(color: Colors.black)
                )
              ]
            ),
          ),
        ),
        ///Past_Data
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          alignment: Alignment.centerLeft,
          child: const Text("December 8 2022", style: TextStyle(color: Colors.grey),),
        )
      ],
    );
  }

}
