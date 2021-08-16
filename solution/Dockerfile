FROM infracloudio/csvserver:latest
MAINTAINER Sam Roy
COPY gencsv.sh /csvserver
RUN chmod +x /csvserver/gencsv.sh && sh /csvserver/gencsv.sh
RUN cp /csvserver/inputFile /csvserver/inputdata
