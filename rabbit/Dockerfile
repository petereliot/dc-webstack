FROM rabbitmq:3.6-management
LABEL hostname=rabbit
RUN apt-get update
RUN apt-get install -y python
ADD rabbitmqadmin /usr/local/bin/rabbitmqadmin
RUN chmod 755 /usr/local/bin/rabbitmqadmin
EXPOSE 15672 4369 5672 25672
CMD service rabbitmq-server start && /usr/local/bin/rabbitmqadmin declare queue name=my-new-queue durable=true && service rabbitmq-server stop && rabbitmq-server
