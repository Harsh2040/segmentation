# Binary Image Segmentation

_By Joshua Antonishen_

## Description
Given a binary image (stored as an array of arrays)...

    0 1 0 1 0 0 0 0 1 1
    0 1 1 1 0 0 0 0 1 1
    0 1 1 1 0 1 1 0 1 1
    0 0 0 0 0 1 0 0 0 0
    0 0 0 0 0 0 0 0 0 0

Find the "segments" and label them by changing all the numbers belonging
to a single segment to the same unique number. The segmented version of
the above image would be...

    0 1 0 1 0 0 0 0 3 3
    0 1 1 1 0 0 0 0 3 3
    0 1 1 1 0 2 2 0 3 3
    0 0 0 0 0 2 0 0 0 0
    0 0 0 0 0 0 0 0 0 0

## Neighbor Strategies
You can use the following 3 strategies to determine which neighbors of
any given spot are considered to be the same object. The default
strategy is four neighbor.

#### Four Neighbor
      0
    0 X 0
      0

#### Six Neighbor
    0 0
    0 X 0
      0 0

#### Eight Neighbor
    0 0 0
    0 X 0
    0 0 0

## Usage
See program.rb in the example folder...

## Tested On...
Ruby 1.9.3-p125
