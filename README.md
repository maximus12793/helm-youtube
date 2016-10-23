[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)

#Youtube-this
Youtube-this is a simple plugin to quickly search and watch youtube from within emacs. 

## Installation 
1. Obtain new google API key 

2. Modify file in /youtube-this.el
    Insert key from step 1 here.
    ```el
    ("key" . "ENTER KEY HERE"));; INSERT YOUR KEY FROM GOOGLE ACCOUNT!!!
    ```
3. Add to .emacs
    bind to key of choice 
    ```el
    (autoload 'youtube-this "youtube-this" nil t)
    (global-set-key (kbd "C-c y") 'youtube-this)
    ```
4. Enjoy :) 