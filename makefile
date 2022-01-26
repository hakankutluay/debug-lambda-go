build-sam:
	sam build

debug-with-sam: build-sam
	sam local generate-event sqs receive-message --body 'Test message' | sam local invoke -d 9999 \
	--debug-args="-delveAPI=2" \
	--debugger-path $${HOME}/go/bin/linux_amd64  MySQSQueueFunction --event -




