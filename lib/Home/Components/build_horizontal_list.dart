import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import '../../NewsDetails/Presentation/details_page.dart';
import '../Model/news_model.dart';

class BuildHorizontalList extends StatefulWidget {
  const BuildHorizontalList({super.key});

  @override
  State<BuildHorizontalList> createState() => _BuildHorizontalListState();
}

class _BuildHorizontalListState extends State<BuildHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          //padding: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          //padding: EdgeInsets.only(top: 8.0, bottom: 8.0,left: 25.0,right: 38.0 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Main News",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                style: const TextStyle(fontSize: 12, color: Colors.black),
                DateFormat('EEEE, MMMM, d, y').format(DateTime.now()),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 190,
          child: ListView.builder(
            itemCount: newsList.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            // Todo: On-tap opening News Model
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        newsModel: newsList[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      // Todo: NewsList Image
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.8,
                        margin: const EdgeInsets.only(right: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            newsList[index].imageUrl,
                            fit: BoxFit.cover,
                            //color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      // Todo: NewsList Date and Time
                      Positioned(
                        top: 8.0,
                        left: 15.0,
                        child: Text(
                          newsList[index].dateAndTime,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      // Todo: NewsList Title
                      Positioned(
                        width: MediaQuery.of(context).size.width * 0.8,
                        bottom: 40.0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            newsList[index].title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      // Todo: Avatar Picture and Avatar Name
                      Positioned(
                        bottom: 10.0,
                        left: 18.0,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                newsList[index].personAvatar,
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              newsList[index].personName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      // Todo: Bookmark Button
                      Positioned(
                        top: 8.0,
                        right: 22.0,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              newsList[index].bookmark =
                                  !newsList[index].bookmark;
                            });
                          },
                          icon: newsList[index].bookmark == true
                              ? const Icon(
                                  Icons.bookmarks,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.bookmarks_outlined,
                                  color: Colors.white,
                                ),
                        ),
                      ), //BookMark
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
