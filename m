Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A053EBEC9
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:36:37 +0200 (CEST)
Received: from localhost ([::1]:39516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgj5-0006fy-QA
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gwEXYQgKCvAomZSglkZYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh6-0003ZU-Hk
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:32 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:55072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gwEXYQgKCvAomZSglkZYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh3-0005s5-Qh
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:32 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 w200-20020a25c7d10000b02905585436b530so10647760ybe.21
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=5s+o1TXqGwSl9K0mTlvFrCxk1BgY+M7oLFuEuHiZMIE=;
 b=Hyf0epYat0y9ikTQhtwD9FCcq/vA2IjERay+gGsMWCQ7QrY9noh3xfRNYyglP2aIYH
 30o6M4n09aEgfegiLjvnfF6rOFBNhX16wzSbZVaRVkMZjRLJXFhNE7W7VR94JUnsPkjB
 4t2uFhh+WQ7WBdhoEDWuDaX2dHDaqwB7GN8OtwG1DiSDytJ048MDNlAl5RC17vHtqDov
 eIb6Sh6fN3hcD4HdSTNxs+vS597vmrugfAHIzi26u/ztzc6eh/YnrEcY70Tv8YiP6aNZ
 0V5yqcdHITTi/d5WJmXBoIkLZMseDOw17BK19FrpmWCXgXEjmuFfznRhOecA0OzE6k/j
 6z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=5s+o1TXqGwSl9K0mTlvFrCxk1BgY+M7oLFuEuHiZMIE=;
 b=XXBwqAaI5fzQDj+HE4o8r10pJAvfBMP+LusAelkE2tFSIajiF+31n5Zg76NDWHjlpq
 5jRvcvdOjVCc61gYIhMLa9O3iIV3bjuM2fUhdSvSxTOCu/40nuIVwOvRQhrnek2MV2Dh
 zsnbcjDXlGEHH/6WD1KSMGFt3heTS9EawQEyLzISOzvH2ndKq45r0+nYf0zi9qzFz45o
 TMfOaawaSlQjvtBrJ7GmtCTmQHXws64GB2xrcyG3IMNtUzvu/IkYTQ1X9RtS/Z/pJu54
 J+18eeZm0C1vZIHSdnDFaSnGpXt3AHmxjX0iZ1VY7lKmBP+Ikbg5KVfr692xu4QDp324
 FALQ==
X-Gm-Message-State: AOAM533a/tlS1B/+oo/ADmpod7vTwmhOCD53jsLS5ozgBrDoKC//s9xS
 hExTNSAlqUixj/lppNcuI7yJa7RZuN/NlA==
X-Google-Smtp-Source: ABdhPJykq/TF175dA9Qc48/Xr0oSBysdFKIQ7jg32BQFEgHE7tGqJlX7Hyns4FPoOs9uRS0x4PBs9e1GHxja+Q==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:2783:: with SMTP id
 n125mr5820983ybn.99.1628897667371; Fri, 13 Aug 2021 16:34:27 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:46 -0700
Message-Id: <20210813233353.2099459-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 0/7] Misc NPCM7XX patches
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3gwEXYQgKCvAomZSglkZYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Patch 5 adds a new aux function for at24c EEPROM. It allows us to attach
a drive to an at24c EEPROM device that is used as the initialized content
of that device.

Patch 6 uses the function defined in patch 5 to add the EEPROM and other
I2C devices for Quanta GBS board.

Patch 7 modifies the Quanta GSJ board to use the new function defined in
patch 5.

Hao Wu (6):
  hw/i2c: Clear ACK bit in NPCM7xx SMBus module
  hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
  hw/adc: Fix CONV bit in NPCM7XX ADC CON register
  hw/adc: Make adci[*] R/W in NPCM7XX ADC
  hw/nvram: Add a new auxiliary function to init at24c eeprom
  hw/arm: Use unit number in quanta-gsj eeprom files

Patrick Venture (1):
  hw/arm: quanta-gbs-bmc add i2c devices

 hw/adc/npcm7xx_adc.c            |  4 +-
 hw/arm/npcm7xx_boards.c         | 94 ++++++++++++++++-----------------
 hw/i2c/npcm7xx_smbus.c          |  8 +--
 hw/nvram/eeprom_at24c.c         | 18 +++++++
 include/hw/nvram/eeprom_at24c.h | 13 +++++
 tests/qtest/npcm7xx_adc-test.c  |  2 +-
 6 files changed, 85 insertions(+), 54 deletions(-)
 create mode 100644 include/hw/nvram/eeprom_at24c.h

-- 
2.33.0.rc1.237.g0d66db33f3-goog


