# SashaBank Notes
Work I didn’t do because of time constraints:

* Unit tests! They are essential but are often left to the last minute
* Better UI
* Complete support for different currencies

There are some practices that I adopted which I’m not 100% sure are best practices, for example: making the model inherit from `NSObject` simply so we can add a reference to it from the Storyboard.

However, I did this to show that it is an alternative and it is nice to see your files and objet at a glance in the Storyboard.

I also had to create custom initialisers for `Enums` because Xcode 9 throws an error when using `init(rawValue:)` when the `enum` declaration is in another file. This might be a bug or it might be a change in the Access Control for Xcode 9, will need to investigate further.

The method to retrieve remote data is reading data from a local, mock JSON file yet it is written to use a URL string and actually fetch remote data.

I would normally use `Alamofire` to do this, but I’ve left the method declaration as a remote fetch method to show the intent.
