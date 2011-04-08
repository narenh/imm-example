# Simple Collaboration Project
### BIOS 15120, Game-Based Instruction in Immunology
#### Spring Quarter 2011
#### The University of Chicago

This project builds a simple iOS application that stacks views in a `UIScrollView`. It is built around a minimal framework that loads the views by way of controller classes named in an `NSArray` of class names. 

Each controller (derived from `ImExController`, and _not_ from `UIViewController`) has its own view, instantiated from a NIB, and its own model object, ideally also instantiated from the view NIB. 

The idea is to provide well-defined "silos" in which students can work on discrete subprojects with (I hope) minimal interference between them. They will push their work up to Github, and send pull requests to me.

Pull requests will be entertained only from students enrolled in BIOS 15120.

