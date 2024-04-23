#!/usr/bin/env bash

messageContent="Github workflow Notify "

# 通知slack

# 先通知给默认 channel
SLACK_CHANNEL_PATI_CLIENT_BOT="C045TT24JRJ"


# 再通知到其他 channel
if [ $slack_channel = $SLACK_CHANNEL_PATI_CLIENT_BOT ]; then
    # 最多重复5遍，直到成功
    for i in {1..5}; do
        curl --location "https://slack.com/api/chat.postMessage" \
        --header "Content-Type: application/json; charset=utf-8" \
        --header "Authorization: Bearer ${SLACK_BOT_TOKEN}" \
        --data "{\"channel\": \"${SLACK_CHANNEL_PATI_CLIENT_BOT}\",\"blocks\": \"[{\\\"type\\\":\\\"section\\\",\\\"text\\\":{\\\"type\\\":\\\"mrkdwn\\\",\\\"text\\\":\\\"${messageContent}\\\"}}]\"}"
        if [ $? -eq 0 ]; then
            break
        fi
        sleep 2
    done
else
    # 最多重复5遍，直到成功
    for i in {1..5}; do
        curl --location "https://slack.com/api/chat.postMessage" \
        --header "Content-Type: application/json; charset=utf-8" \
        --header "Authorization: Bearer ${SLACK_BOT_TOKEN}" \
        --data "{\"channel\": \"${SLACK_CHANNEL_PATI_CLIENT_BOT}\",\"blocks\": \"[{\\\"type\\\":\\\"section\\\",\\\"text\\\":{\\\"type\\\":\\\"mrkdwn\\\",\\\"text\\\":\\\"${messageContent}\\\"}}]\"}"
        if [ $? -eq 0 ]; then
            break
        fi
        sleep 2
    done
    for i in {1..5}; do
          curl --location "https://slack.com/api/chat.postMessage" \
          --header "Content-Type: application/json; charset=utf-8" \
          --header "Authorization: Bearer ${SLACK_BOT_TOKEN}" \
          --data "{\"channel\": \"${slack_channel}\",\"blocks\": \"[{\\\"type\\\":\\\"section\\\",\\\"text\\\":{\\\"type\\\":\\\"mrkdwn\\\",\\\"text\\\":\\\"${messageContent}\\\"}}]\"}"
          if [ $? -eq 0 ]; then
              break
          fi
          sleep 2
      done
fi

# 最多重复5遍，直到成功
#for i in {1..5}; do
#    curl -X POST -H 'Content-type: application/json' --data "$payload" $SLACK_NOTIFY_HOOK_URL
#    if [ $? -eq 0 ]; then
#        break
#    fi
#    sleep 2
#done