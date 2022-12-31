terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "cem" {
  artist = "Cem Adrian"
  limit = 20
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}

data "spotify_search_track" "mosso" {
  artist = "Melek Mosso"
  limit = 20
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}

data "spotify_search_track" "manusbaba" {
  artist = "Manuş Baba"
  limit = 20
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}


resource "spotify_playlist" "playlist" {
  name        = "Terraform Paul Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = flatten([
    data.spotify_search_track.mosso.tracks[*].id,
    data.spotify_search_track.cem.tracks[*].id,
    data.spotify_search_track.manusbaba.tracks[*].id,
    
    # data.spotify_search_track.by_artist.tracks[1].id,
    # data.spotify_search_track.by_artist.tracks[2].id,
    # data.spotify_search_track.by_artist.tracks[3].id,
    # data.spotify_search_track.by_artist.tracks[4].id
  ])
}

data "spotify_track" "mosso" {
  url = "https://open.spotify.com/track/0HQun5E7ZmSN0XdIfUAquu?si=054a1fa3b7a6484a"

  ## Computed
  # name = "Overkill"
  # artists = ["0qPGd8tOMHlFZt8EA1uLFY"]
  # album = "64ey3KHg3uepidKmJrb4ka"
}

data "spotify_track" "adele" {
  url = "https://open.spotify.com/track/46IZ0fSY2mpAiktS3KOqds?si=c3c8803f2956422d"

  ## Computed
  # name = "Overkill"
  # artists = ["0qPGd8tOMHlFZt8EA1uLFY"]
  # album = "64ey3KHg3uepidKmJrb4ka"
}

resource "spotify_playlist" "playlist1" {
  name        = "Terraform Pauls Mix Playlist"
  description = "This playlist was created by Terraform"
  public      = true

    tracks = [
    data.spotify_track.adele.id,
    data.spotify_track.mosso.id,
  ]
}


data "spotify_album" "aslan" {
  spotify_id = "5AHsw2t2RTuKpO8Qjegblb"
}

data "spotify_album" "yllaraffetmez" {
  url = "https://open.spotify.com/album/5wYDSylUFCSQkuj0vOBNn6?si=4qEJfpd0SFWBXzpvyDMmNQ"
}

resource "spotify_library_albums" "my_album" {
  albums = [
    data.spotify_album.aslan.id,
    data.spotify_album.yllaraffetmez.id,
  ]
}


data "spotify_search_track" "adele" {
  artist = "Adele"
  limit = 20
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}

data "spotify_search_track" "taylor" {
  artist = "Taylor Swift"
  limit = 20
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}


resource "spotify_playlist" "playlist2" {
  name        = "Terraform Foreign Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = flatten([
    data.spotify_search_track.adele.tracks[*].id,
    data.spotify_search_track.taylor.tracks[*].id,
   
    
    # data.spotify_search_track.by_artist.tracks[1].id,
    # data.spotify_search_track.by_artist.tracks[2].id,
    # data.spotify_search_track.by_artist.tracks[3].id,
    # data.spotify_search_track.by_artist.tracks[4].id
  ])
}