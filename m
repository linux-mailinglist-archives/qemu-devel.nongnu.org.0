Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B883444A9F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 23:05:16 +0100 (CET)
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miONf-0000Af-5c
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 18:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3awaDYQgKCpYMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1miOIq-0000nE-Kw
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:00:16 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:38455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3awaDYQgKCpYMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1miOIo-0001FR-Ez
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:00:16 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 u22-20020a170902a61600b00141ab5dd25dso1762218plq.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 15:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=bKJei08DT04/YwixoaO1f72n6dow55G1ly6RMX+KkRA=;
 b=CZdkbcv09Nhd1JEi2RpTedvL0tiiNo4ZczzURICOPvG5sQjzkSpILkGZd0TNkDyBmM
 ffus8UTz6cVAViTcSc0933HQpDnqtLyfiVRkiAt/fGL0RydlMB30DBRx5Kuc4lXeBPVg
 GuYzfG2kxmjKn9Kx1A92QN7iHp1X7mnW5jyPXpzefi5edB4dQahW0ryzMIrMyaUeGxDO
 gduVWmS8oNFIQzkdbZ4rLi2wRrGkHustoebzn4+X4s0TRuMqLBJNnj7wdVIuwf7mfGQW
 Q137fKo1ceFH2Ukqmsimry9amy+DNVru25/ofciDLY3fTHexvFysxGhVfzO01f6TP/PO
 dKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=bKJei08DT04/YwixoaO1f72n6dow55G1ly6RMX+KkRA=;
 b=XHOSFXFkuQAUJvBYumJit0Ud1SfS9VKUAoUOXtXcuY522/QAZaxA7VP/GuD5e4h83B
 AiXfz0hZZKB9kf1x3ehcsbie7WjWlEov/YN9HETshZPAVwG5dInSSotZjj33gUCmfq+N
 TArHsQ1YlFu3MEqu1u497LkNAqjssPpz6qzoRo3Y3gIp+5eqrtEocFs9ykUWhuH1xru5
 pgjJGKvTtGqHuPC8DwSMhi9pHUfPfwE0Ms4BlboiFdvniUEk+ZslHO5kFtcs7+AFHY5m
 Tfh+uMGvZsLJXdyVcmlB1sDz6T4TvEuDrBViIpLzCJgLVw7VAWDxYX41Fp9QrjiAyk3B
 lX+A==
X-Gm-Message-State: AOAM532Wf/VgrWnKUUXgW9FvweqnORC0TImYACc/PBIeOf3Z4h7GL5FC
 aXsk13+cJsD9x/gJ7VAtSkaRFKntPsfrIw==
X-Google-Smtp-Source: ABdhPJznxGB1Q54I0hYoAzusnn5tJGTVnW85chOtu2t7kI4+e1cEl7FbniBaZ3ju3NlJEcMNAjXnO3mlszwsGw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr214535pjh.1.1635976811312; Wed, 03 Nov 2021 15:00:11 -0700 (PDT)
Date: Wed,  3 Nov 2021 14:59:47 -0700
Message-Id: <20211103215954.1401805-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 0/7] Misc NPCM7XX patches
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3awaDYQgKCpYMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This patch set contains a few bug fixes and I2C devices for some
NPCM7XX boards.

Patch 1~2 fix a problem that causes the SMBus module to behave
incorrectly when it's in FIFO mode and trying to receive more than
16 bytes at a time.

Patch 3 fixes a error in a register for ADC module.

Patch 4 makes the ADC input to be R/W instead of write only. It allows
a test system to read these via QMP and has no negative effect.

Patch 5 adds a new blockdev IF type IF_OTHER.

Patch 6 modifies at24c_eeprom_init in NPCM7xx boards so that it can fit
more use cases.

Patch 7 uses the function defined in patch 5 to add the EEPROM and other
I2C devices for Quanta GBS board.

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

Hao Wu (6):
  hw/i2c: Clear ACK bit in NPCM7xx SMBus module
  hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
  hw/adc: Fix CONV bit in NPCM7XX ADC CON register
  hw/adc: Make adci[*] R/W in NPCM7XX ADC
  blockdev: Add a new IF type IF_OTHER
  hw/nvram: Update at24c EEPROM init function in NPCM7xx boards

Patrick Venture (1):
  hw/arm: quanta-gbs-bmc add i2c devices

 blockdev.c                     |  3 +-
 hw/adc/npcm7xx_adc.c           |  4 +-
 hw/arm/npcm7xx_boards.c        | 96 ++++++++++++++++++++--------------
 hw/i2c/npcm7xx_smbus.c         |  8 +--
 include/sysemu/blockdev.h      |  1 +
 meson                          |  2 +-
 tests/qtest/npcm7xx_adc-test.c |  2 +-
 7 files changed, 69 insertions(+), 47 deletions(-)

-- 
2.33.1.1089.g2158813163f-goog


