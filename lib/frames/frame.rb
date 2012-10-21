# Internal: Takes a hash of video/audio frame attributes and makes them 
# getters on an object.
module Frames
  class Frame
    def initialize(attrs = {})
      attrs.each do |k,v|
        self.instance_variable_set(:"@#{k}", v)
      end
    end

    attr_reader :media_type, :key_frame, :pkt_pts, :pkt_pts_time, :pkt_dts,
      :pkt_dts_time, :pkt_duration, :pkt_duration_time, :pkt_pos,
      :sample_fmt, :nb_samples, :channels, :channel_layout, :width, :height,
      :sample_aspect_ratio, :pict_type, :coded_picture_number,
      :display_picture_number, :interlaced_frame, :top_field_first,
      :repeat_pict, :reference
  end
end

