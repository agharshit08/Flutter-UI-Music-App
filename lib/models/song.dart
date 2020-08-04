class Song {
  final String songName;
  final String artist;
  final String image;
  final int id;

  Song({this.id, this.songName, this.artist, this.image});
}

List<Song> songs = [
  Song(
    id: 1,
    songName: 'Back to Life',
    image: "assets/images/meditation.jpg",
    artist: 'DubVision'
  ),
  Song(
    id: 2,
    songName: 'Help me lose my mind',
    image: "assets/images/party.jpg",
    artist: 'Disclosure'
  ),
  Song(
    id: 3,
    songName: 'A million dreams',
    image: "assets/images/colors.jpg",
    artist: 'Ziv Zaifman'
  ),
  Song(
    id: 4,
    songName: 'Treat you better',
    image: "assets/images/love.jpg",
    artist: 'Paperwhite'
  ),
];
