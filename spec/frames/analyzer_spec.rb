require 'spec_helper'

describe Frames::Analyzer do
  describe 'when video file is valid' do
    before do
      @analyzer = Frames::Analyzer.new('/path/to_video.mp4')

      constructor = mock('constructor', :frames => 'framesgohere')
      @analyzer.stubs(:probe)
      @analyzer.stubs(:constructor).returns(constructor)
    end

    describe '#analyze' do
      it 'sets frames to value from the frame constructor' do
        @analyzer.analyze.must_equal 'framesgohere'
        @analyzer.frames.must_equal 'framesgohere'
      end
    end
  end
end
