FROM infracloudio/csvserver:latest
COPY gencsv.sh /csvserver
RUN chmod +x /csvserver/gencsv.sh && sh /csvserver/gencsv.sh
ADD inputFile inputdata
