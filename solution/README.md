docker container run -d infracloudio/csvserver:latest 

docker ps

docker ps -a

docker logs <container_id>
          
          error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

Created the script gencsv.sh and created a Dockerfile to build the image so that the new image contains the inputdata . 

docker build . -t infracloudio/csvserver:1.0

docker container run -d infracloudio/csvserver:1.0

docker container exec -it 61b7a21a2375 bash 

          netstat -plant

          Active Internet connections (servers and established)
          Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
          tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver    


docker container run -d -e CSVSERVER_BORDER=Orange -p 9393:9300 infracloudio/csvserver:0.0.1
