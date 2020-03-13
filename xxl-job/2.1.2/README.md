### 说明

xxl-job的2.1.2版本的docker部署

### 操作流程

+ 1.自定义网络

`docker network create xxl-net`

+ 2.创建mysql

`docker run -d --name xxl-job-mysql --network=xxl-net  -v $(pwd):/opt -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql:5.7.29`

+ 3.初始化数据库

```								  
docker exec -it xxl-job-mysql /bin/bash
mysql -u root -p
source tables_xxl_job.sql;
```

+ 4.启动xxl-job

```
docker run --name xxl-job --network xxl-net  -e PARAMS="-Dspring.datasource.url=jdbc:mysql://xxl-job-mysql:3306/xxl_job?Unicode=true&characterEncoding=UTF-8 -Dspring.datasource.password=root"  -p 8080:8080  secondriver/xxl-job:2.1.2
``` 

+ 5.访问首页, 注意ip需要根据实际情况替换

`wget http://172.19.0.3:8080/xxl-job-admin`

