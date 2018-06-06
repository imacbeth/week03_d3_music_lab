require('pry')
require_relative('../artist.rb')
require_relative('../album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new ({'name' => 'Marvin Gaye'})
artist2 = Artist.new ({'name' => 'Fleetwood Mac'})
artist3 = Artist.new ({'name' => 'Haim'})


artist1.save()
artist2.save()
artist3.save()

album1 = Album.new ({
  'title' => 'Whats going on',
  'genre' => 'R&B',
  'artist_id' => artist1.id()
})
album2 = Album.new ({
  'title' => 'Rumours',
  'genre' => 'Rock',
  'artist_id' => artist2.id()
})

album3 = Album.new({
  'title' => 'Tango in the Night',
  'genre' => 'Rock',
  'artist_id' => artist2.id()
  })

album4 = Album.new({
  'title' => 'Something to Tell You',
  'genre' => 'Rock',
  'artist_id' => artist3.id()
    })

album1.save()
album2.save()
album3.save()
album4.save()


binding.pry

nil
