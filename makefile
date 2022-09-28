build-MySQSQueueFunction:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o main src/main.go
	cp ./main $(ARTIFACTS_DIR)/
build-sam:
	sam build -u

debug-with-sam: build-sam
	sam local generate-event sqs receive-message --body 'Test message' | sam local invoke -d 9999 \
	--debug-args="-delveAPI=2" \
	--debugger-path $${HOME}/go/bin/linux_amd64  MySQSQueueFunction --event -




