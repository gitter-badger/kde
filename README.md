KDE Taiwan website
===

第一次執行時
------------
### 安裝所需套件 ###
    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install nodejs npm rubygems
    sudo npm install -g grunt-cli

### 安裝 jekyll ###
    sudo gem install jekyll

### 建立網站 template(不需要再做這一步) ###
    <del>jekyll new</del>

### 編輯 package.json 下載需要的 module ###
    npm install

後續編輯
--------
### 修改檔案 ###

### grunt ###
    grunt

### 測試站台用(-w 參數會自動更新異動的檔案) ###
    jekyll -w server

完成品
------
### 最後完成的站台資料在 ###
    _site/
