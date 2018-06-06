require('pg')
require_relative('db/sql_runner.rb')


class Album

attr_accessor :title, :genre, :artist_id
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)
    return Artist.new(artist[0])
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE albums SET genre = $1 WHERE id = $2"
    values = [@genre, @id]
    SqlRunner.run(sql, values)
  end

  # def find_album_by_id()
  #   sql = "SELECT * FROM albums WHERE id = $1"
  #   values = [@id]
  #   album = SqlRunner.run(sql, values).first
  #   return Album.new(album)
  # end
end
