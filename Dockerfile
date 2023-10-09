############
### MAIN ###
############

FROM pabrojast/ckan:2.9.9-theme20

# Switch to the root user
USER root
#already installed and working
#RUN pip install -e git+https://github.com/pabrojast/ckan-unesco-theme#egg=ckanext-theme-ejemplo
#RUN pip install -e git+https://github.com/ckan/ckanext-pdfview#egg=ckanext-pdfview
#RUN pip install -e git+https://github.com/ckan/ckanext-geoview#egg=ckanext-geoview
#RUN pip install -e git+https://github.com/ckan/ckanext-pages#egg=ckanext-pages
RUN pip install -e git+https://github.com/pabrojast/ckanext-terria_view#egg=ckanext-terria_view
# not working CKANEXT-SPATIAL
#RUN apt update
#RUN apt install python-dev libxml2-dev libxslt1-dev libgeos-c1
#RUN pip install -e git+https://github.com/ckan/ckanext-spatial.git#egg=ckanext-spatial
#RUN pip install -r /srv/app/src/ckanext-spatial/requirements.txt

LABEL maintainer="Pablo Rojas <projas@cazalac.org>"

# Add the custom extensions to the plugins list, for some motive, this dont work
ENV CKAN__PLUGINS envvars image_view text_view recline_view datastore datapusher acme theme_ejemplo pdf_view geo_view ckanext-pages

# Switch to the ckan user
USER ckan
