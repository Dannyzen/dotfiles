#PYTHON_LOCAL_SITE_PACKAGES is defined in my .zshrc
pip install --user pyradio
wget -q https://raw.github.com/Dannyzen/pyradio/master/pyradio/stations.csv -O $PYTHON_LOCAL_SITE_PACKAGES/pyradio/stations.csv
