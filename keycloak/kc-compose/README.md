## Keycloak安装完配置


### 1. 创建master realm超级管理员账号

+ 进入任意Keycloak实例的容器：`docker exec -it  <container name> /bin/bash`
+ 切换目录：`/opt/jboss/keycloak/bin`
+ 创建管理员：`./add-user-keycloak.sh -r master -u admin -p admin`


### 2. 关闭master realm的SSL Required

+ 认证客户端：`./kcadm.sh config credentials --server http://127.0.0.1:8080/auth --realm master --user admin` 提示输入密码
+ 禁用SSL：`./kcadm.sh update realms/master -s sslRequired=NONE`
