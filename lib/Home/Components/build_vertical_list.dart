import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../NewsDetails/Presentation/details_page.dart';
import '../Model/news_model.dart';
import '../Presentation/see_all_page.dart';

class BuildVerticalList extends StatelessWidget {
  const BuildVerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          //padding: EdgeInsets.all(16.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Todo: Heading
              const Text(
                "Today's Posts",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Todo: See All Button
              TextButton(
                style: TextButton.styleFrom(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SeeAllPage(), // Navigate to AllNewsPage
                    ),
                  );
                },
                child: const Text(
                  "See all",
                ),
              ),
            ],
          ),
        ),

        // Todo: Vertical News List
        ListView.separated(
          itemCount: newsList.length > 4 ? 4 : newsList.length,
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
          // Todo: Creating a thin line between newses
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.black.withAlpha(15),
          ),
        ),
      ],
    );
  }
}
