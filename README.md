# BKActivityView

This is my first attempt at creating a CocoaPod

This is just a simple ActivityView that can replace a UIActivityIndicatorView

It's a set of concentric rings that start out in red, green, and blue, but when tapped change to three random colors.

The view is hidden when not animating

#Installation

pod 'ActivityView' or manually include ActivityView.swift

#Usage

Add a UIView to your storyboard or create with init(frame: CGRect)
It is wise to have the height and width match, but it will calculate the size of the rings based on the smallest of the two dimensions
