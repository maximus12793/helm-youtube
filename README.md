[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)

#YouTube-this
<p align="center">
  <img src="https://github.com/maximus12793/youtube-this.el/blob/master/demo_2.gif">
</p>

YouTube-this is a simple plugin to query YouTube via emacs and play videos in your browser. 

## Installation 
1. M-x package-install: youtube-this

2. Obtain new google API key 
    [here](https://console.developers.google.com/ "Google Developer Console")

    ![Screenshot](https://github.com/maximus12793/youtube-this.el/blob/master/api.png)

3. Modify file in /youtube-this.el, Insert key from step 1 here


    ``` el
    ("key" . "ENTER KEY HERE"));; INSERT YOUR KEY FROM GOOGLE ACCOUNT!!!
    ```
4. Set browse-url-generic and add to .emacs

 
    ``` el
    ;;start youtube-this.el
    (autoload 'youtube-this "youtube-this" nil t)
    (global-set-key (kbd "C-c y") 'youtube-this)

    ;;set default browser for you will use to play videos/default generic
    (setq browse-url-browser-function 'browse-url-generic)
    (setq browse-url-generic-program "google-chrome-open-url")
    ```
5. Enjoy :) 