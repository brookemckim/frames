module Frames
  class FileError < StandardError; end

  # Public: Run ffprobe on a file and analyze the frames from the output.
  #
  # file - The file to be anaylzed
  #
  # Examples
  #
  #   analyzer = Anaylzer.new("/Users/bmckim/Desktop/sample.avi")
  #   analyzer.frames
  #   # => [...]
  class Analyzer
    def initialize(file)
      @file = String(file)
    end

    # Public: Returns the Array of Frames.
    def frames
      @frames ||= constructor.frames
    end

    # Public: Probe the video file.
    #
    # Returns String of raw output from ffprobe.
    def probe
      output = `ffprobe -show_frames "#{@file}" 2>/dev/null`

      if $? == 0
        output
      else
        raise FileError, "File does not exist or ffprobe was unable to read it"
      end
    end

    # Internal: Create FrameConstructor from ffprobe raw output.
    def constructor
      FrameConstructor.new(probe)
    end
  end
end
