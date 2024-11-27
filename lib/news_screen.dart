import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_56/cubit/logic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicCubit()..getDataWithQuery("en"),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "News Screen",
                style: TextStyle(fontSize: 24, color: Colors.brown),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.changeLang();
                    },
                    icon: const Icon(
                      Icons.language_outlined,
                      color: Colors.brown,
                    ))
              ],
            ),
            body: state is GetNewsSuccess
                ? ListView.separated(
                    itemBuilder: (context, index) => Container(
                          height: 150,
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl:
                                  state.newsModel.articles![index].urlToImage ??
                                      "",
                              placeholder: (context, url) => Center(
                                  child: const CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              height: 100,
                              width: 100,
                            ),
                            title: Text(
                              state.newsModel.articles![index].title ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.newsModel.articles![index].content ??
                                      "",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  state.newsModel.articles![index].author ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          color: Colors.brown,
                        ),
                    itemCount: state.newsModel.articles!.length)
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
