require('pry')
require_relative('../artist.rb')
require_relative('../album.rb')


artist1 = Artist.new ({'name' => 'Bob Dylan'})
artist2 = Artist.new ({'name' => 'Fleetwood Mac'})


artist1.save()
artist2.save()

album1 = Album.new ({
  'title' => 'Blood',
  'genre' => 'Dad Rock',
  'artist_id' => artist1.id()
})
album2 = Album.new ({
  'title' => 'Rumours',
  'genre' => 'Rock',
  'artist_id' => artist2.id()
})

album1.save()
album2.save()

binding.pry

nil
