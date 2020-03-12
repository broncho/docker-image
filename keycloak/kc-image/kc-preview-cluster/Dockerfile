# jboss/keycloak  原始镜像
FROM jboss/keycloak:9.0.0

# 开启JDBC_PING TCP_PING  集群发现协议
ADD cli/TCPPING.cli /opt/jboss/tools/cli/jgroups/discovery/
ADD cli/JDBC_PING.cli /opt/jboss/tools/cli/jgroups/discovery/

# 开启JDBC_PING TCP_PING  集群发现协议
ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
#开启preview feature
CMD ["-b", "0.0.0.0", "-Dkeycloak.profile=preview"]
