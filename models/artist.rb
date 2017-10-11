require ('pg')
require_relative('album.rb')
require_relative('../db/sql_runner.rb')



class Artist
  attr_accessor :composer, :song_title
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @composer = options['composer']
    @song_title = options['song_title']

  end

  def save()
      db = PG.connect({
        dbname: 'music_collection',
        host: 'localhost'
        })

        sql = "INSERT INTO artist( composer, song_title )
        VALUES ( $1, $2 )
        RETURNING *
        "
        values = [@composer, @song_title]
        db.prepare('save', sql)
        @id = db.exec_prepared('save', values)[0]['id'].to_i
        db.close()

      end


      def self.all()
      sql = "SELECT * FROM artist"
      values = []
      artist = SqlRunner.run(sql, values)
      artist_as_objects = artist.map {
        |artist| Artist.new(artist)
      }
      return artist_as_objects

    end

    def self.delete_all()
      sql = "DELETE FROM artist"
      values = []
      artist = SqlRunner.run(sql, values)

    end


end
