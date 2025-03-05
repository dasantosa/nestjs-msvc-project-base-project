#!/bin/bash

# if necessary install dependencies
# npm install --prefix ./nestjs-msvc-project-auth-msvc
# npm install --prefix ./nestjs-msvc-project-other-msvc
# npm install --prefix ./nestjs-msvc-project-api-gateway

# Start auth-svc
npm --prefix ./nestjs-msvc-project-auth-msvc run start:dev &
AUTH_SVC_PID=$!

echo "Started auth-svc with PID $AUTH_SVC_PID"

# Start other-svc
npm --prefix ./nestjs-msvc-project-other-msvc run start:dev &
OTHER_SVC_PID=$!

echo "Started other-svc with PID $OTHER_SVC_PID"

# Start api-gateway
npm --prefix ./nestjs-msvc-project-api-gateway run start:dev &
API_GATEWAY_PID=$!

echo "Started api-gateway with PID $API_GATEWAY_PID"

wait $AUTH_SVC_PID $OTHER_SVC_PID $API_GATEWAY_PID