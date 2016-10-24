[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)

#Youtube-this
Youtube-this is a simple plugin to quickly search and watch youtube from within emacs. 
![Screenshot](https://github.com/maximus12793/youtube-this.el/blob/master/screen.png)

## Installation 
1. Obtain new google API key 
[here](https://console.developers.google.com/ "Google Developer Console")

![Screenshot](https://github.com/maximus12793/youtube-this.el/blob/master/api.png)

2. Modify file in /youtube-this.el, Insert key from step 1 here


    ``` el
    ("key" . "ENTER KEY HERE"));; INSERT YOUR KEY FROM GOOGLE ACCOUNT!!!
    ```
3. Add to .emacs and bind to key of choice

 
    ``` el
    ;;start youtube-this.el
    (autoload 'youtube-this "youtube-this" nil t)
    (global-set-key (kbd "C-c y") 'youtube-this)

    ;;set default browser for you will use to play videos/default generic
    (setq browse-url-browser-function 'browse-url-generic)
    (setq browse-url-generic-program "google-chrome-open-url")
    ```
4. Enjoy :) 