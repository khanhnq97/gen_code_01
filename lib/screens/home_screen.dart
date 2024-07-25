import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/suggest_cache_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestCacheState = ref.watch(suggestCacheProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Suggest Cache')),
      body: suggestCacheState.when(
        data: (suggestItems) => ListView.builder(
          itemCount: suggestItems.length,
          itemBuilder: (context, index) {
            final item = suggestItems[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.symbol),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(suggestCacheProvider.notifier).generateSuggestCache(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
