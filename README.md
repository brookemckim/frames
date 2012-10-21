# Frames

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/brookemckim/frames)
[![Build Status](https://travis-ci.org/[brookemckim]/[frames].png)](https://travis-ci.org/[brookemckim]/[frames])


Uses ffprobe to analyze video files frame by frame. 

Use Cases:

* List all P/B/I frames of a video file.
* List all key frames of a video file.
* Analyze DTS/PTS of each frame.

## Prerequisites

[ffprobe](http://ffmpeg.org/ffprobe.html)

## Installation

Add this line to your application's Gemfile:

    gem 'frames'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install frames

## Usage

```
# Point the analyzer to your video file.
frame_analyzer = Frames::Anaylzer.new("/Users/bmckim/Desktop/sample.avi")

# Get an Array of each frame.
frame_analyzer.frames

# Want the raw ffprobe output?
frame.probe
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
