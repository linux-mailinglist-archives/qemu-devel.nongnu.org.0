Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3174438C6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 23:53:12 +0100 (CET)
Received: from localhost ([::1]:38822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2eV-0003Xf-1C
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 18:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3fMCBYQgKChcJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1mi2b3-0000bs-0m
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:49:37 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:33621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3fMCBYQgKChcJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1mi2b1-0001FC-Gv
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:49:36 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 z8-20020a170903018800b0013f23528cb6so456458plg.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=HB9TzWrPr0bZl6VptBim/Wm/IzhVsNI0xW1PH18/wJ4=;
 b=spLzW4rXT2pk/jwKrQJW9fMPlFqwFb4Zr9YvX75wumSIj6H8TkcwQpoJQADi6GsJWD
 9Mu9TZ9gDzisPVLw+JX+zMf5tU4yUiZJT4IgfrRSkt1v7bw1a40rFzggUo+QozQhtD1z
 X1WFom5AJtzsF38FM0KTxkKLckGtmWMPLjIW7yrmfJZvP9TyuifoNVR79gVXGWto3qR+
 n5xIUkaMclsguu5ddM/9Knf0NMQSSJSkeVXLAG8UeMeds/ytjvevrm25i02Jkqbu7Yi8
 RnNLXA0e4IxUD4vuxKFpiWuTepbfMf4skGi2X2to52Au7EnZE8Lc1pNmFGNVcEhjNxQ1
 FQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=HB9TzWrPr0bZl6VptBim/Wm/IzhVsNI0xW1PH18/wJ4=;
 b=4K+n0K+AfL7AS1YTemMW+WtxvmbkroVzBivP7atSVDU3o47/6ya1p5cC45Y2vyWdrX
 6hupNORy70dYelBPIUq1Q2Dm/VGwX8khs7O6BPo+mAKxwoaxIHdppNeb4scPJ5qu7uoZ
 UfkYzy4KNlsOvys+W/E40DzQPm7w1582zZlAybALCYUXmW89vSJQDQa+/JdPr/XKznK9
 D5MC2ceZj95/IHgowiMzfaCTyxPhP1QwdyU+tyHytASSfO4nrTCPzCuafjNxaSnx11E/
 AvNzcCijaM/fOf7sP2mCLCKPTDJvvetT0waD2Gu1a1qcVU93g/+mKbUehQ7Jd1GjjDjA
 pwLg==
X-Gm-Message-State: AOAM531PpZsRahhNrqqRsBUGm71JmQuxgleqksMMod5QmjGc1XWJwLty
 SjxjoLyncHARdoKYOkrn4KywBpguPCvlxA==
X-Google-Smtp-Source: ABdhPJz2zXCqYV9fYLhG1C19gXSaogzXBLO+RQDnbV3nzmdvctcI8x0IOQxNzdu57J55jv5PazD1cIGJhf+1fA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr257806pjh.1.1635893372935; Tue, 02 Nov 2021 15:49:32 -0700 (PDT)
Date: Tue,  2 Nov 2021 15:49:19 -0700
Message-Id: <20211102224924.1244946-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 0/5] hw/arm: Add MMC device for NPCM7XX boards
From: Hao Wu <wuhaotsh@google.com>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, maoshengtan2011@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3fMCBYQgKChcJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set implements the Nuvoton MMC device
for NPCM7XX boards.

The MMC device is compatible with the SDHCI interface
in QEMU. It allows the user to attach an SD card image
to it.

Changes since v2:
1. Fix an error use of strcmp in qtest.

Changes since v1:
1. Rearrange the "add SDHCI commands" to just before when it's
   actually used.
2. Add standrad SDHCI MMIO as subregion, similar to cadence_sdhci.
e. Add a vmstate for NPCM7XX SDHCI.
4. Address various minor fixes suggested by Peter Maydell.

Shengtan Mao (5):
  hw/sd: add nuvoton MMC
  hw/arm: Add Nuvoton SD module to board
  hw/arm: Attach MMC to quanta-gbs-bmc
  tests/qtest/libqos: add SDHCI commands
  tests/qtest: add qtests for npcm7xx sdhci

 hw/arm/npcm7xx.c                 |  12 +-
 hw/arm/npcm7xx_boards.c          |  20 +++
 hw/sd/meson.build                |   1 +
 hw/sd/npcm7xx_sdhci.c            | 182 +++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h         |   2 +
 include/hw/sd/npcm7xx_sdhci.h    |  65 ++++++++++
 tests/qtest/libqos/meson.build   |   1 +
 tests/qtest/libqos/sdhci-cmd.c   | 116 +++++++++++++++++
 tests/qtest/libqos/sdhci-cmd.h   |  70 +++++++++++
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 209 +++++++++++++++++++++++++++++++
 11 files changed, 678 insertions(+), 1 deletion(-)
 create mode 100644 hw/sd/npcm7xx_sdhci.c
 create mode 100644 include/hw/sd/npcm7xx_sdhci.h
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

-- 
2.33.1.1089.g2158813163f-goog


