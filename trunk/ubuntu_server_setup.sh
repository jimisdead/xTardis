#!/bin/sh

#get the required debs
echo "Installing required system packages\n"
sudo apt-get install build-essential python-dev libxml2-dev libxslt1-dev libpq-dev libldap2-dev libsasl2-dev postgresql postgresql-client-common python-psycopg2 openjdk-6-jre-headless zip

echo "Creating libs directory\n"
mkdir libs; cd libs

echo "Downloading required python packages\n"
#download the required packages
wget http://pypi.python.org/packages/source/D/Django/Django-1.3.tar.gz
wget http://pypi.python.org/packages/source/d/django-extensions/django-extensions-0.6.tar.gz
wget http://pypi.python.org/packages/source/d/django-form-utils/django-form-utils-0.2.0.tar.gz
wget http://pypi.python.org/packages/source/d/django-registration/django-registration-0.7.tar.gz
wget http://pypi.python.org/packages/source/l/lxml/lxml-2.3.tar.gz
wget http://pypi.python.org/packages/source/s/setuptools/setuptools-0.6c11.tar.gz
wget http://pypi.python.org/packages/source/c/coverage/coverage-3.4.tar.gz                                                                                                                                                                                                     
wget http://pypi.python.org/packages/source/n/nose/nose-1.0.0.tar.gz                                                                                                                                                                                                           
wget http://pypi.python.org/packages/source/d/docutils/docutils-0.7.tar.gz                                                                                                                                                                                                     
wget http://effbot.org/media/downloads/elementtree-1.2.6-20050316.tar.gz                                                                                                                                                                                                       
wget http://pypi.python.org/packages/source/f/feedparser/feedparser-5.0.1.tar.gz                                                                                                                                                                                               
wget http://pypi.python.org/packages/source/J/Jinja2/Jinja2-2.5.5.tar.gz                                                                                                                                                                                                       
wget http://pypi.python.org/packages/source/n/nosexcover/nosexcover-1.0.5.tar.gz                                                                                                                                                                                               
wget http://pypi.python.org/packages/source/p/psycopg2/psycopg2-2.4.1.tar.gz                                                                                                                                                                                                   
wget http://pypi.python.org/packages/source/P/Pygments/Pygments-1.4.tar.gz                                                                                                                                                                                                     
wget http://pypi.python.org/packages/source/p/python-ldap/python-ldap-2.3.13.tar.gz                                                                                                                                                                                            
wget http://pypi.python.org/packages/source/p/python-magic/python-magic-0.4.0.tar.gz                                                                                                                                                                                           
wget http://spacemonkey.be/python-memcached-1.47.tar.gz
#wget ftp://ftp.tummy.com/pub/python-memcached/old-releases/python-memcached-1.47.tar.gz                                                                                                                                                                                        
wget http://pypi.python.org/packages/source/S/Sphinx/Sphinx-1.0.7.tar.gz                                                                                                                                                                                                       
wget http://downloads.sourceforge.net/project/ctypes/ctypes/1.0.2/ctypes-1.0.2.tar.gz  


#untar the required packages
for i in *.tar.gz; do tar -xvf $i; done

#run each of the setup.py install instructions
cd setuptools-0.6c11; sudo python setup.py install; cd ..
cd coverage-3.4; sudo python setup.py install; cd ..
cd ctypes-1.0.2; sudo python setup.py install; cd ..
cd Django-1.3; sudo python setup.py install; cd ..
cd django-extensions-0.6; sudo python setup.py install; cd ..
cd django-form-utils-0.2.0; sudo python setup.py install; cd ..
cd django-registration-0.7; sudo python setup.py install; cd ..
cd docutils-0.7; sudo python setup.py install; cd ..
cd elementtree-1.2.6-20050316; sudo python setup.py install; cd ..
cd feedparser-5.0.1; sudo python setup.py install; cd ..
cd Jinja2-2.5.5; sudo python setup.py install; cd ..
cd lxml-2.3; sudo python setup.py install; cd ..
cd nose-1.0.0; sudo python setup.py install; cd ..
cd nosexcover-1.0.5; sudo python setup.py install; cd ..
cd psycopg2-2.4.1; sudo python setup.py install; cd ..
cd Pygments-1.4; sudo python setup.py install; cd ..
cd python-ldap-2.3.13; sudo python setup.py install; cd ..
cd python-magic-0.4.0; sudo python setup.py install; cd ..
cd Sphinx-1.0.7; sudo python setup.py install; cd ..

cd ..