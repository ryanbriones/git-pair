# git-pair

* Code: [http://github.com/ryanbriones/git-pair](http://github.com/ryanbriones/git-pair)

# Description

I wanted a way for git to show me when a commit was made from a pair during pair programming. As usual, git provides a mechanism for the concept using the --author option on git commit. Inspired by [Bryan Helpkamp's git pairing script] [1] I wanted git-pair to have a list of authors that was loaded from outside the script. Git, being amazingly flexible, allowed me to store information about authors in the git config and access the information uniformly. And so it is.

[1]: http://www.brynary.com/2008/9/1/setting-the-git-commit-author-to-pair-programmers-names

# Install

## Using GitHub's gem repo
    sudo gem install ryanbriones-git-pair --source=http://gems.github.com

## From source
    git clone git://github.com/ryanbriones/git-pair.git
    cd git-pair
    rake
    sudo gem install --local pkg/git-pair-X.X.X.gem

# Usage

* Add an author: `git-pair add abbr 'Person <emailaddress>'`
  * example: `git-pair add js 'John Smith <jsmith@example.com>'`
* Show available authors: `git-pair show`
* Commit with a pair: `git-pair commit [abbr] [-m 'Commit Message']`

# Authors

* [Ryan Carmelo Briones &lt;ryan.briones@brionesandco.com&gt;](mailto:ryan.briones@brionesandco.com)