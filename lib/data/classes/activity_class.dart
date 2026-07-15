class Activity {
  final String activity;
  final String type;
  final String duration;
  final String accessibility;
  final String link;
  final String key;
  final double availability;
  final double price;
  final int participants;
  final bool kidFriendly;

  const Activity({
    required this.activity,
    required this.availability,
    required this.accessibility,
    required this.duration,
    required this.key,
    required this.kidFriendly,
    required this.link,
    required this.participants,
    required this.price,
    required this.type,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'activity': String activity,
        'availability': num availability,
        'type': String type,
        'participants': int participants,
        'price': num price,
        'accessibility': String accessibility,
        'duration': String duration,
        'kidFriendly': bool kidFriendly,
        'link': String link,
        'key': String key,
      } =>
        Activity(
          availability: availability.toDouble(),
          activity: activity,
          type: type,
          participants: participants,
          price: price.toDouble(),
          accessibility: accessibility,
          duration: duration,
          key: key,
          kidFriendly: kidFriendly,
          link: link,
        ),
      _ => throw const FormatException('Failed to load activity.'),
    };
  }
}
