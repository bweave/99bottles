class Bottles
	def song
		verses
	end

	def verses(starting=99, ending=0)
		starting.downto(ending).reduce("") do |verses, bottles|
			verses << verse(bottles)
			verses << "\n" unless bottles == ending
			verses
		end
	end

	def verse(bottles)
		@bottles = bottles
		"#{first_line}#{second_line}"
	end

	private
		def first_line
			case @bottles
				when 2..99
					"#{@bottles} bottles of beer on the wall, #{@bottles} bottles of beer.\n"
				when 1
					"#{@bottles} bottle of beer on the wall, #{@bottles} bottle of beer.\n"
				when 0
					"No more bottles of beer on the wall, no more bottles of beer.\n"
			end
		end

		def second_line
			case @bottles
				when 3..99
					"Take one down and pass it around, #{@bottles - 1} bottles of beer on the wall.\n"
				when 2
					"Take one down and pass it around, #{@bottles - 1} bottle of beer on the wall.\n"
				when 1
					"Take it down and pass it around, no more bottles of beer on the wall.\n"
				when 0
					"Go to the store and buy some more, 99 bottles of beer on the wall.\n"
			end
		end
end
