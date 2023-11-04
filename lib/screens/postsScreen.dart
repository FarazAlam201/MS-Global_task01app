import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task1_app/constants/colors.dart';
import 'package:task1_app/main.dart';
import 'package:task1_app/models/postmodel.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<PostModel> posts = [];
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      getPosts();
    });
    getPosts();
    super.initState();
  }

  Future<void> getPosts() async {
    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      final List<PostModel> getPosts = postModelFromJson(response.body);
      setState(() {
        posts = getPosts;
      });
    } else {
      Fluttertoast.showToast(
          msg: "Failed to load posts",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: secondaryred,
          textColor: white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: posts.length,
                separatorBuilder: (context, index) => const Divider(
                  indent: 15,
                  endIndent: 15,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        posts[index].title,
                        style: posts[index].userId == user.id
                            ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: primaryred, fontWeight: FontWeight.bold)
                            : Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: black),
                        maxLines: 1,
                      ),
                    ),
                    subtitle: Text(
                      posts[index].body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: posts[index].userId == user.id
                          ? Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold, color: black)
                          : Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            child: Icon(Icons.add, color: white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
