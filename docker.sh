sudo docker build -t="kdeweb" .
sudo docker run -i -t -p 4000:4000 kdeweb jekyll -w server -s src -d src/_site
