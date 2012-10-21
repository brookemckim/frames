require 'spec_helper'

describe Frames::FrameConstructor do
  before do
    @single_raw_output = <<EOF
[FRAME]\nmedia_type=video\nkey_frame=0\npkt_pts=N/A\npkt_pts_time=N/A\npkt_dts=N/A\npkt_dts_time=N/A\npkt_pos=6218536\nwidth=522\nheight=282\npix_fmt=yuv420p\nsample_aspect_ratio=1:1\npict_type=P\ncoded_picture_number=860\ndisplay_picture_number=0\ninterlaced_frame=0\ntop_field_first=0\nrepeat_pict=0\nreference=3\n[/FRAME]\n
EOF

    @multiple_raw_output = <<EOF
[FRAME]\nmedia_type=video\nkey_frame=0\npkt_pts=N/A\npkt_pts_time=N/A\npkt_dts=N/A\npkt_dts_time=N/A\npkt_pos=6218536\nwidth=522\nheight=282\npix_fmt=yuv420p\nsample_aspect_ratio=1:1\npict_type=P\ncoded_picture_number=860\ndisplay_picture_number=0\ninterlaced_frame=0\ntop_field_first=0\nrepeat_pict=0\nreference=3\n[/FRAME]\n
[FRAME]\nmedia_type=video\nkey_frame=0\npkt_pts=855\npkt_pts_time=35.660625\npkt_dts=855\npkt_dts_time=35.660625\npkt_pos=6196580\nwidth=522\nheight=282\npix_fmt=yuv420p\nsample_aspect_ratio=1:1\npict_type=B\ncoded_picture_number=855\ndisplay_picture_number=0\ninterlaced_frame=0\ntop_field_first=0\nrepeat_pict=0\nreference=0\n[/FRAME]
EOF
    @frame_constructor = Frames::FrameConstructor.new(@multiple_raw_output)
  end

  describe '#frames' do
    it 'converts raw output to Array of frames' do
      frames = @frame_constructor.frames

      frames.must_be_instance_of(Array)

      frames.size.must_equal 2
      frames.each { |f| f.must_be_instance_of(Frames::Frame) }
    end
  end

  describe '#from_hashes' do
    it 'returns Array of formatted frames' do
      @frame_constructor.stubs(:raw_frame_to_hash).returns({})

      @frame_constructor.frame_hashes.must_equal [{},{}]
    end
  end

  describe '#split_raw_frames' do
    it 'splits the raw frames' do
      @frame_constructor.split_raw_frames.size.must_equal 2
    end
  end

  describe '#raw_frame_to_hash' do
    it 'converts raw output frame to hash' do
      frame_hash = @frame_constructor.send('raw_frame_to_hash', @single_raw_output)
      expected_frame_hash = {
        media_type: 'video',
        key_frame: '0',
        pkt_pts: 'N/A',
        pkt_pts_time: 'N/A',
        pkt_dts: 'N/A',
        pkt_dts_time: 'N/A',
        pkt_pos: '6218536',
        width: '522',
        height: '282',
        pix_fmt: 'yuv420p',
        sample_aspect_ratio: '1:1',
        pict_type: 'P',
        coded_picture_number: '860',
        display_picture_number: '0',
        interlaced_frame: '0',
        top_field_first: '0',
        repeat_pict: '0',
        reference: '3'
      }

      frame_hash.must_equal expected_frame_hash
    end
  end
end
