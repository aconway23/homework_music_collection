require ('pg')
require_relative('artist.rb')
require_relative('../db/sql_runner.rb')

class Album
  attr_accessor :album_title, :year
  attr_reader :id



  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @album_title = options['album_title']
    @year = options['year'].to_i()
  end

  def save()
      db = PG.connect({
        dbname: 'music_collection',
        host: 'localhost'
        })

        sql = "INSERT INTO album( album_title, year )
        VALUES ( $1, $2 )
        RETURNING *
        "
        values = [@album_title, @year]
        db.prepare('save', sql)
        @id = db.exec_prepared('save', values)[0]['id'].to_i
        db.close()

      end

      def self.all()
      sql = "SELECT * FROM album"
      values = []
      album = SqlRunner.run(sql, values)
      album_as_objects = album.map {
        |album| Album.new(album)
      }
      return album_as_objects

    end

    def self.delete_all()
      sql = "DELETE FROM album"
      values = []
      album = SqlRunner.run(sql, values)

    end


end
