#!/usr/bin/env bash
set -e

# 1) 자동 업데이트 체크/자동 설치 끄기
tee /etc/apt/apt.conf.d/20auto-upgrades >/dev/null <<'EOF'
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "0";
EOF

# 2) apt 관련 타이머 비활성화
systemctl disable --now apt-daily.timer apt-daily-upgrade.timer || true

# 3) 로그인 세션에서 update-notifier 자동 실행 막기
sed -i '/^Hidden=/d;$aHidden=true' /etc/xdg/autostart/update-notifier.desktop

# 4) 새 Ubuntu 버전 업그레이드 팝업 끄기
sed -i 's/^Prompt=.*/Prompt=never/' /etc/update-manager/release-upgrades

# 5) 현재 떠 있는 notifier 종료
pkill update-notifier || true

echo "Done."
