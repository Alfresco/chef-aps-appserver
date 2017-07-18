default['appserver']['log4j-properties']['log4j.rootLogger'] = 'INFO, CA, File'

###### File appender definition #######
default['appserver']['log4j-properties']['log4j.appender.File'] = 'org.apache.log4j.DailyRollingFileAppender'
default['appserver']['log4j-properties']['log4j.appender.File.File'] = 'logs/activiti.log'
default['appserver']['log4j-properties']['log4j.appender.File.Append'] = 'true'
default['appserver']['log4j-properties']['log4j.appender.File.DatePattern'] = "'.'yyyy-MM-dd"
default['appserver']['log4j-properties']['log4j.appender.File.layout'] = 'org.apache.log4j.PatternLayout'
default['appserver']['log4j-properties']['log4j.appender.File.layout.ConversionPattern'] = '%d{yyyy-MM-dd} %d{ABSOLUTE} %-5p [%c] [%t] %m%n'

# ConsoleAppender
default['appserver']['log4j-properties']['log4j.appender.CA'] = 'org.apache.log4j.ConsoleAppender'
default['appserver']['log4j-properties']['log4j.appender.CA.layout'] = 'org.apache.log4j.PatternLayout'
default['appserver']['log4j-properties']['log4j.appender.CA.layout.ConversionPattern'] = '%d{hh:mm:ss,SSS} [%t] %-5p %c %x - %m%n'

# Custom tweaks
default['appserver']['log4j-properties']['log4j.logger.org.apache.ibatis.level'] = 'INFO'
default['appserver']['log4j-properties']['log4j.logger.javax.activation.level'] = 'INFO'
default['appserver']['log4j-properties']['log4j.logger.com.codahale.metrics'] = 'WARN'
default['appserver']['log4j-properties']['log4j.logger.com.ryantenney'] = 'WARN'
default['appserver']['log4j-properties']['log4j.logger.com.zaxxer'] = 'WARN'
default['appserver']['log4j-properties']['log4j.logger.org.apache'] = 'WARN'
default['appserver']['log4j-properties']['log4j.logger.org.hibernate'] = 'WARN'
default['appserver']['log4j-properties']['log4j.logger.org.hibernate.engine.internal'] = 'WARN'
default['appserver']['log4j-properties']['log4j.logger.org.hibernate.validator'] = 'WARN'
default['appserver']['log4j-properties']['log4j.logger.org.springframework'] = 'WARN'
default['appserver']['log4j-properties']['log4j.logger.org.springframework.web'] = 'WARN'
default['appserver']['log4j-properties']['log4j.logger.org.springframework.security'] = 'WARN'

default['appserver']['log4j-properties']['log4j.logger.springfox.documentation.spring.web.readers.operation.CachingOperationNameGenerator'] = 'WARN'
