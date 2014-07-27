# far

Project-wide find and replace. Far will recursively fix your current directory.

#### Dry run the output of a replace
```
far 's/Fun\:\:Stuff/Cool\:\:Things/'
```
#### To actually run, pass the "please" and "replace" options
```
far --please --replace 's/Fun\:\:Stuff/Cool\:\:Things/'
far -pr 's/Fun\:\:Stuff/Cool\:\:Things/'
```
#### Ignore directory
```
far --ignore-dir=spec -pr 's/Fun\:\:Stuff/Cool\:\:Things/'
```

#### Ignore file
```
far --ignore-file=cats.rb -pr 's/Fun\:\:Stuff/Cool\:\:Things/'
```

## Contributing to far
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Brett Shollenberger & Zach MacHardy. See LICENSE.txt for
further details.
