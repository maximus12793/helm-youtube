[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)

#Helm-YouTube
<p align="center">
  <img src="https://github.com/maximus12793/helm-youtube/blob/master/demo.gif">
</p>

YouTube-this is a simple plugin to query YouTube via emacs and play videos in your browser. 

## Installation 
1. M-x package-install: helm-youtube

2. Obtain new google API key 
    [here](https://console.developers.google.com/ "Google Developer Console")

    ![Screenshot](https://github.com/maximus12793/helm-youtube/blob/master/api.png)

3. Modify file in /helm-youtube.el, Insert key from step 1 here


    ``` el
    ("key" . "ENTER KEY HERE"));; INSERT YOUR KEY FROM GOOGLE ACCOUNT!!!
    ```
4. Set browse-url-generic and add to .emacs

 
    ``` el
    ;;start helm-youtube.el
    (autoload 'helm-youtube "helm-youtube" nil t)
    (global-set-key (kbd "C-c y") 'helm-youtube)

    ;;set default browser for you will use to play videos/default generic
    (setq browse-url-browser-function 'browse-url-generic)
    (setq browse-url-generic-program "google-chrome-open-url")
    ```
5. Enjoy :) 
