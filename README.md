# AWSMocks

This Dockerfile is a grouping of several mock-AWS services for use during testing.

These services usually take up a tiny footprint, so instead of running them in isolation, this runs them as part of the same container.

## To build
`docker build .`

## To run
`docker run -p 4567:4567 -p 4568:4568 -p 6379:6379 --rm -i -t awsmocks:0.01`

## Configuration
Env variables:
- REDIS_PORT to set redis' port (default 6379)
- KINESIS_PORT to set kinesis' port (default 4567)
- DYNAMODB_PORT to set dynamodb's port (default 4568)