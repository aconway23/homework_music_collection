require('pry')
require_relative('models/artist.rb')
require_relative('models/album.rb')

 Artist.delete_all()
 Album.delete_all()


song_1 = Artist.new({
  'composer' => 'red hot chili peppers',
  'song_title' => 'californication'

  })

  song_1.save()



  song_2 = Artist.new({
    'composer' => 'bonobo',
    'song_title' => 'no reason'
    })

    song_2.save()



    song_3 = Artist.new({
      'composer' => 'daft punk',
      'song_title' => 'around the world'
      })

      song_3.save()


      album_1 = Album.new({
        'album_title' => 'californication',
        'year' => '1999'
        })

        album_1.save()

        album_2 = Album.new({
          'album_title' => 'migration',
          'year' => '2017'
          })

          album_2.save()

          album_3 = Album.new({
            'album_title' => 'homework',
            'year' => '1997'
            })

            album_3.save()





            binding.pry
            nil
