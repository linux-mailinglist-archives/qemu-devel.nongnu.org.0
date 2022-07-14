Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0F0575460
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:05:36 +0200 (CEST)
Received: from localhost ([::1]:38082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3DS-0004fz-Sf
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3uFnQYggKCskB9wp387wv33v0t.r315t19-stAt0232v29.36v@flex--wuhaotsh.bounces.google.com>)
 id 1oC38f-0007G3-Cf
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:38 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:38486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3uFnQYggKCskB9wp387wv33v0t.r315t19-stAt0232v29.36v@flex--wuhaotsh.bounces.google.com>)
 id 1oC38X-0005ao-94
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:34 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 x123-20020a626381000000b005254d5e6a0fso1477395pfb.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=gV+TyTQO6jOPvTt4hw3npsX3ehauWxm2nzUt3iPAaNg=;
 b=MvySl8C1NHIQBdh3Egmkb8GQbedYYU6ki20sljq77xQlEW+IyDIdgeEjoE+Vm8VStD
 G6yhRe5YiB5eAtS3kMsTmlLxcLqklgpZQMDXalZJ0uZ6ABSNeOPKBzxpguQCBFPjmNG+
 yGFqIwYq6NECUtU386Fkpc3rNcEZf6kW4xkOC7LDv0eKouBzIt1FQCOCZONYKnGJelfx
 lhH6vjP6IViQPyEUKTi3+zghHShmpbWun/Se4LL0dwyVEihzc+DbPqkgpE18r5whcx2D
 EVR8Py3rxfFmC2pWzIYaH05xUDlE4RgRfmbUIO0eoTdFd+qCUtvbYu+2xtJb2jtFZGD9
 Bbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=gV+TyTQO6jOPvTt4hw3npsX3ehauWxm2nzUt3iPAaNg=;
 b=AR5c5nEYWhAElVeB4UOJqHFDjQfqJQLAO7Xv/BKRaqT4GX4XETwTk7i/cAzqYWcJz1
 PG2tmEMI+sOE6V75SGgPNYlBs5sCaG/d6C2kfu++pUdeOptr08WP5r/nU5L8IwuPM8hs
 6HIAUMFk32e77qgCPqsYERxtp9JAYu2MERaFmPF9vG2U2vdzzADfzFQW2vMHo2ZP39vv
 t9Ad7UMIkFi/kUFor92VyRjFzs4Fvg8Py1Tv0+mDsxPJgA49pV/GSuCIKBCNPZNQWmTm
 Mh449+W0injdMcXPM74lryIzdwm18jSboAY/t4FsOJmCiRlN9FISNTpiDTnNaunP9xVX
 KNDQ==
X-Gm-Message-State: AJIora9U2Isx9uRnuyM4oVRoHOLqFzrhyvD/pmesL8WlZL2V1Uk1LgPC
 S7CswUMaRrlaiQv85cvmI42B4Ucby2E+nQ==
X-Google-Smtp-Source: AGRyM1sdAAxJfmceNSNoCL5j63kLiFcef2VB0RUfYL5UYyOUwIrp87SSZXtuJfEzrwfV0VgzlR2CXClHILhyNg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr626971pje.0.1657821624029; Thu, 14 Jul
 2022 11:00:24 -0700 (PDT)
Date: Thu, 14 Jul 2022 10:59:58 -0700
Message-Id: <20220714180006.77360-1-wuhaotsh@google.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3uFnQYggKCskB9wp387wv33v0t.r315t19-stAt0232v29.36v@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
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


