#! /bin/sh

echo "Running..."
echo "Redis ::$REDIS_PORT"
echo "Kinesis ::$KINESIS_PORT"
echo "DynamoDB ::$DYNAMODB_PORT"

supervisord -n -c /etc/supervisor/conf.d/services.conf