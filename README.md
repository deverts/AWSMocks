# AWSMocks

This Dockerfile is a grouping of several mock-AWS services for use during testing.

These services usually take up a tiny footprint, so instead of running them in isolation, this runs them as part of the same container.

## To build
`docker build .`

## To run a temporary instance
`docker run -p 4567:4567 -p 4568:4568 -p 6379:6379 --rm -i -t deverts/awsmocks:X.XX`

## Configuration
Env variables:
- REDIS_PORT to set redis' port (default 6379)
- KINESIS_PORT to set kinesis' port (default 4567)
- DYNAMODB_PORT to set dynamodb's port (default 4568)

## General usage
This is useful in two places.

1) In local development. I have a temporary script running the temporary instance commmand above. I leave this running whilst i'm in development. When testing, it spins up a fresh container, tests against the services, then spins it back down. The container super light, so this can be done without too much resource concern.

2) In CI workflows. Bitbucket pipelines enforces a limit on the amount of containers and a maximum memory amount. This can help reduce both of those. Especially given the amount of work they need to do, they really should be happy all being crammed into a single studio apartment.