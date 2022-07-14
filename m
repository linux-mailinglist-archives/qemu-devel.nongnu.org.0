Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E155057550A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:33:48 +0200 (CEST)
Received: from localhost ([::1]:52234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3el-0001uO-Jq
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3L2DQYggKCk4CAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZD-0004II-4m
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:03 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:44000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3L2DQYggKCk4CAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZB-0007I0-KH
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:02 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 r6-20020a17090a2e8600b001f0768a1af1so4014429pjd.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=gV+TyTQO6jOPvTt4hw3npsX3ehauWxm2nzUt3iPAaNg=;
 b=kLGYQTOltKFMIWpKXDHPPMGzDvYNwzq0N+zsA07XjNzJemKSRW4jWvnDF1nc77z9sn
 8mx5tafTnJOuG39WxfAvI3JAPNfwuv+o2mZaks+tu2SmkuvXR2W2k0uGgTNvY4e2g2VT
 cpMgmgTOe0FwYQPgv9SygYJFNwpfPf2q+MjO7NmfF7JW4g43+ohvlWze8PlMGPEmLJFp
 VL66VpkZQj24+mRSKyUExeI4xWWZAlBbn6Jk384lQ0gFDF6KShh7HQG9rugmXiBaqR+I
 INDs7v69MQyaQ6MTvade7dDSxDfu8RTDTq1q1mDWsG/iQF8NnecNkI3Jjp3c/2HxoqWw
 MPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=gV+TyTQO6jOPvTt4hw3npsX3ehauWxm2nzUt3iPAaNg=;
 b=wK3VKRBLo43lwFvD6WBkcp+1bIPUXb/cJQsD4qq/YMkhu6CQQTGkDfeSO5NoJzsG+f
 ze2K5RiHmTMxBli/RoORFFlVnLdor0lmev6kK//Q262wYCtG6Ae93FBfeFIru39pWZbF
 G0UPMrPWiDpfuLTgKI7aMRzDixEQ7NauOHAzS/qzWXjDby1tHLNtH3sE2tRO+/zhvaSp
 GzCI102U+vGpQt8xTRBUbOo8L4rIqhfv0BdXZ7ZPiD4HCN3BJgBEUvsU3ekzsHCWSZUG
 8g4XJjr/dsmtt0NpWAksbrZQ7h791bGjEhFfjLRpMHBXhVp38dlTZzkqStr90W+hWiiq
 /xuA==
X-Gm-Message-State: AJIora/vAqGJVYbHrwWbzjy69HcYjwyvgo0inXquWUPI74DAEVNERKwu
 HyBaCQpak4C1f2KjYesTtMP5ri5+DYdcqQ==
X-Google-Smtp-Source: AGRyM1sLpBp/xPnpicYpHkE1w+gMusu/wlS4p3daslE+7mnCn2tx0cVpyJtws+OcykATxrpmLMCG1SM18W7wMw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:903:2301:b0:16c:58a3:639f with SMTP
 id d1-20020a170903230100b0016c58a3639fmr9608024plh.122.1657823279143; Thu, 14
 Jul 2022 11:27:59 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:39 -0700
Message-Id: <20220714182756.85664-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 0/8] Misc NPCM7XX patches
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3L2DQYggKCk4CAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

[NOTE: I'm reviving a bunch of patches that was in the process of
upstreaming a while ago but paused.]

This patch set contains a few bug fixes and I2C devices for some
NPCM7XX boards.

Patch 1~2 fix a problem that causes the SMBus module to behave
incorrectly when it's in FIFO mode and trying to receive more than
16 bytes at a time.

Patch 3 fixes a error in a register for ADC module.

Patch 4 makes the ADC input to be R/W instead of write only. It allows
a test system to read these via QMP and has no negative effect.

Patch 5 adds a new blockdev IF type IF_OTHER.

Patch 6 allows at24c_eeprom_init to take a bus as parameter so it can
be used by more use cases (e.g. behind an I2C mux.)

Patch 7 allows at24c_eeprom_init to take a drive as property, similar
to sdhci_attach_device().

Patch 8 uses the function defined in patch 5 to add the EEPROM and other
I2C devices for Quanta GBS board.

-- Changes since v4:
1. Add comments to patch 5.
2. Split patch 6 into 2 patches according to the feedback.  Each patch does it own task.

-- Changes since v3:
1. Add a new blockdev IF type IF_OTHER.
2. Use IF_OTHER instead of IF_NONE.

-- Changes since v2:
1. Dropped patch 7.
2. Drop an extra variable in patch 5.

-- Changes since v1:
1. Rewrote patch 5 to implement the function in NPCM7xx board file instead
   of the EEPROM device file.
2. Slightly modify patch 6 to adapt to the changes and QEMU comment style.
3. Squash patch 7 into patch 5 to make it compile.
4. Add a new patch 7.

Hao Wu (7):
  hw/i2c: Clear ACK bit in NPCM7xx SMBus module
  hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
  hw/adc: Fix CONV bit in NPCM7XX ADC CON register
  hw/adc: Make adci[*] R/W in NPCM7XX ADC
  blockdev: Add a new IF type IF_OTHER
  hw/arm: npcm8xx_boards: EEPROMs can take bus as parameter
  hw/arm: Set drive property for at24c eeprom

Patrick Venture (1):
  hw/arm: quanta-gbs-bmc add i2c devices

 blockdev.c                     |   4 +-
 hw/adc/npcm7xx_adc.c           |   4 +-
 hw/arm/npcm7xx_boards.c        | 102 ++++++++++++++++++++-------------
 hw/i2c/npcm7xx_smbus.c         |   8 +--
 include/sysemu/blockdev.h      |   1 +
 tests/qtest/npcm7xx_adc-test.c |   2 +-
 6 files changed, 73 insertions(+), 48 deletions(-)

-- 
2.37.0.170.g444d1eabd0-goog


