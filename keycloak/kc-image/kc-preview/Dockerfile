# jboss/keycloak  原始镜像
FROM jboss/keycloak:9.0.0

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

#开启preview feature 
CMD ["-b", "0.0.0.0", "-Dkeycloak.profile=preview"]
