import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Home/Model/news_model.dart';
import '../NewsDetails/Presentation/details_page.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmarks"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                itemCount: newsList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    // Todo: On tap new page open
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
                    // Todo: Vertical News
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Todo: News Headline
                                Text(
                                  newsList[index].title,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    // Todo: Avatar image
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
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Todo: Avatar Name
                                          Text(
                                            newsList[index].personName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          // Todo: Time
                                          Text(
                                            DateFormat("MMM, dd, yyyy '•' hh:mm a")
                                                .format(DateTime.now()),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          // Todo: News Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              newsList[index].imageUrl,
                              width: 130,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                // Todo: Creating a thin line between news's
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.black.withAlpha(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
