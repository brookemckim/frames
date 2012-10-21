# Internal: Converts raw output from ffprobe into an Array of Frames.
#
# Examples
#
#   fc = FrameConstructor.new(`ffprobe -show_frames /path/to/video.mp4`)
#   fc.frames # => [<Frame>,<Frame>]
module Frames
  class FrameConstructor
    def initialize(ffprobe_output)
      @raw_output = ffprobe_output
    end

    # Internal: Maps Array of hashes from output into Array Frame objects.
    def frames
      frame_hashes.map { |h| Frame.new(h) }
    end

    # Internal: Converts each raw frame into Hash.
    #
    # Returns Array of Hashes.
    def frame_hashes
      hashes = []

      split_raw_frames.each do |frame|
        hashes << raw_frame_to_hash(frame)
      end

      hashes
    end

    # Internal: Splits ffprobe output into seperate frames.
    #
    # Returns Array of raw ffprobe frames.
    def split_raw_frames
      @raw_output.split('[/FRAME]').take_while { |f|
        f['[FRAME']
      }
    end

    private

      # Internal: Parses ffprobe frame metadata into hash.
      #
      # Returns Hash of frame attributes.
      def raw_frame_to_hash(raw_frame)
        hash_of_raw_frames = {}

        raw_frame
          .split("\n")
          .delete_if { |value| !value['='] }
          .each do |attribute|
            attribute_array = attribute.split('=')
            key = attribute_array[0]
            value = attribute_array[1]

            hash_of_raw_frames.merge!(key.to_sym => value)
          end

        hash_of_raw_frames
      end
  end
end

