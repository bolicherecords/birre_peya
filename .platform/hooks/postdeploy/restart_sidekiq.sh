#!/usr/bin/env bash
echo "" > /var/log/sidekiq.log > /dev/null 2>&1
echo "" > /var/app/current/log/sidekiq.log > /dev/null 2>&1
systemctl restart sidekiq
sleep 15
systemctl is-active sidekiq >/dev/null 2>&1 && exit 0 || exit 1