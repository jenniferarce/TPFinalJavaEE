# Configurations

## Glassfish ##
### JDBC Resources ###
- JNDI Name: jdbc/sample
- Pool Name: SamplePool

JDBC Connection Pool 

General
- Pool Name: SamplePool
- Resource Type: javax.sql.DataSource
- Datasource Classname: com.mysql.jdbc.jdbc2.optional.MysqlDataSource

Additional Properties
- User: javaee
- DatabaseName: tpfinal
- serverName: localhost
- PortNumber: 3306
- URL: jdbc:mysql://localhost:3306/tpfinal
- Password: 1234

## MySQL ##
- User: javaee
- Password: 1234

Database 
- tpfinal