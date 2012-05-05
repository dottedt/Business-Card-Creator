prawn_document(:page_size => [190, 308] , :page_layout => :landscape) do |pdf|


  pdf.bounding_box([-36, 154], :width => 308, :height => 190) do

    pdf.transparent(0.5) { pdf.stroke_bounds }

    pdf.bounding_box([0, 151], :width => 308, :height => 11) do


      pdf.text "<Spring_2012_Class>", :align => :center, :size => 11,:color => [65, 56,52,7]

    end


    pdf.bounding_box([0, 141], :width => 308, :height => 77) do


      pdf.formatted_text_box(

        [
          { :text => "#{@user.first_name} #{@user.last_name}",
            :align => :center,
            :color => [80, 38,3,2]
          }
        ], :width => 208,
        :height => 25,
        :align => :center,
        :valign => :center,
        :size => 24,
        :at => [50, 50],
        :overflow => :shrink_to_fit,


      )
    end



      pdf.bounding_box([90, 50], :width => 130, :height => 50) do


      pdf.transparent(0.5) { pdf.stroke_bounds }

      if
        @user.email.length > 18
        x_position = 0
      else
        user_length = 55 - @user.email.length
        # pdf.text "user_length #{user_length}"
        user_lengthFont = user_length / 2
         #pdf.text "user_lengthFont #{user_lengthFont}"


         #pdf.text "user_final #{user_final}"

      end



      y_position = pdf.cursor
      pdf.image "#{Rails.root}/app/assets/images/email.png", :at => [ user_lengthFont  , y_position]


      pdf.formatted_text_box.new(

        [
           { #:text => ""
             :text => "#{@user.email}"
          }
        ],
        :width => 110,
        :height => 10,
        :align => :center,
        :valign => :center,
        :at => [15, 50],
        :overflow => :shrink_to_fit



      )



    end


  end
end
