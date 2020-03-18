JDBC_PING

JDBC_PING use TCP protocol with 7600 port which is similar as TCPPING, but the difference between them is, TCPPING requires you configure the IP and port of all instances, for JDBC_PING you just need to configure the IP and port of current instance, this is because in JDBC_PING solution each instance insert its own information into database and the instances discover peers by the ping data read from database.

