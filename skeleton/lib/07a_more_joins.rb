# == Schema Information
#
# Table name: albums
#
#  asin        :string       not null, primary key
#  title       :string
#  artist      :string
#  price       :float
#  rdate       :date
#  label       :string
#  rank        :integer
#
# Table name: styles
#
# album        :string       not null
# style        :string       not null
#
# Table name: tracks
# album        :string       not null
# disk         :integer      not null
# posn         :integer      not null
# song         :string

require_relative './sqlzoo.rb'

def alison_artist
  # Select the name of the artist who recorded the song 'Alison'.
  execute(<<-SQL)
  SELECT
    alison_albums.artist
  FROM
    tracks AS alison_tracks
  INNER JOIN
    albums AS alison_albums ON alison_tracks.album = alison_albums.asin
  WHERE
    alison_tracks.song = 'Alison'

  SQL
end

def exodus_artist
  # Select the name of the artist who recorded the song 'Exodus'.
  execute(<<-SQL)
  SELECT
    alison_albums.artist
  FROM
    tracks AS alison_tracks
  INNER JOIN
    albums AS alison_albums ON alison_tracks.album = alison_albums.asin
  WHERE
    alison_tracks.song = 'Exodus'

  SQL
end

def blur_songs
  # Select the `song` for each `track` on the album `Blur`.
  execute(<<-SQL)
  SELECT
    blur_tracks.song
  FROM
    albums AS blur_albums
  INNER JOIN
    tracks AS blur_tracks ON blur_tracks.album = blur_albums.asin
  WHERE
    blur_albums.title = 'Blur'
  SQL
end

def heart_tracks
  # For each album show the title and the total number of tracks containing
  # the word 'Heart' (albums with no such tracks need not be shown). Order first by
  # the number of such tracks, then by album title.
  execute(<<-SQL)
  SELECT
    heart_albums.title, COUNT(heart_tracks.song)
  FROM
    tracks AS heart_tracks
  INNER JOIN
    albums AS heart_albums ON heart_albums.asin = heart_tracks.album
  WHERE
    heart_tracks.song LIKE '%Heart%'
  GROUP BY
    heart_albums.title
  ORDER BY COUNT(heart_tracks.song) DESC, heart_albums.title ASC
  SQL
end

def title_tracks
  # A 'title track' has a `song` that is the same as its album's `title`. Select
  # the names of all the title tracks.
  execute(<<-SQL)
    SELECT
      tracks.song
    FROM
      tracks
    INNER JOIN
      albums ON albums.asin = tracks.album
    WHERE
      tracks.song = albums.title
  SQL
end

def eponymous_albums
  # An 'eponymous album' has a `title` that is the same as its recording
  # artist's name. Select the titles of all the eponymous albums.
  execute(<<-SQL)
    SELECT
      albums.title
    FROM
      albums
    WHERE
      albums.artist = albums.title
  SQL
end

def song_title_counts
  # Select the song names that appear on more than two albums. Also select the
  # COUNT of times they show up.
  execute(<<-SQL)
  SELECT
    tracks.song, COUNT(tracks.song)
  FROM
    tracks
  GROUP BY
    tracks.song
  HAVING
    COUNT(tracks.song) > 2
  SQL
end

def best_value
  # A "good value" album is one where the price per track is less than 50
  # pence. Find the good value albums - show the title, the price and the number
  # of tracks.
  execute(<<-SQL)
  SELECT
    albums.title, albums.price, COUNT(tracks.song)
  FROM
    albums
  INNER JOIN
    tracks ON albums.asin = tracks.album
  GROUP BY
    albums.title, albums.price
  HAVING
    ( albums.price / COUNT(tracks.song) ) < 00.50

  SQL
end

def top_track_counts
  # Wagner's Ring cycle has an imposing 173 tracks, Bing Crosby clocks up 101
  # tracks. List the top 10 albums. Select both the album title and the track
  # count, and order by both track count and title (descending).
  execute(<<-SQL)
  SELECT
    albums.title, COUNT(tracks.song)
  FROM
    albums
  INNER JOIN
    tracks ON albums.asin = tracks.album
  GROUP BY
    albums.title
  ORDER BY
    COUNT(tracks.song) DESC, albums.title DESC
  LIMIT
  10
  SQL
end

def rock_superstars
  # Select the artist who has recorded the most rock albums, as well as the
  # number of albums. HINT: use LIKE '%Rock%' in your query.
  execute(<<-SQL)

  SQL
end

def expensive_tastes
  # Select the five styles of music with the highest average price per track,
  # along with the price per track. One or more of each aggregate functions,
  # subqueries, and joins will be required.
  #
  # HINT: Start by getting the number of tracks per album. You can do this in a
  # subquery. Next, JOIN the styles table to this result and use aggregates to
  # determine the average price per track.

  execute(<<-SQL)
  SQL
end
