class MatchController < ApplicationController
  private
    helper_method def first_snail
      @first_snail ||= Snail.find(params[:first_snail])
    end

    helper_method def second_snail
      @second_snail ||= Snail.find(params[:second_snail])
    end

    helper_method def winner
      @first_result ||= (@first_snail.speed*1.5 + @first_snail.endurance*1.2 + @first_snail.motivation*1.33) / 2 + Random.new.rand(1..10)
      @second_result ||= (@second_snail.speed*1.5 + @second_snail.endurance*1.2 + @second_snail.motivation*1.33) / 2 + Random.new.rand(1..10)

      if @first_result > @second_result

        @first_snail.increment(:win, by=1).save
        @second_snail.increment(:lose, by=1).save

        @winner = @first_snail

      elsif @first_result < @second_result

        @second_snail.increment(:win, by=1).save
        @first_snail.increment(:lose, by=1).save

        @winner = @second_snail

      else

        @winner = nil

      end

    end

    helper_method def loser
      @first_result ||= (@first_snail.speed*1.5 + @first_snail.endurance*1.2 + @first_snail.motivation*1.33) / 2
      @second_result ||= (@second_snail.speed*1.5 + @second_snail.endurance*1.2 + @second_snail.motivation*1.33) / 2

      if @first_result > @second_result

        @loser = @second_snail

      elsif @first_result < @second_result

        @loser = @first_snail

      else

        @loser = nil

      end

    end
end
