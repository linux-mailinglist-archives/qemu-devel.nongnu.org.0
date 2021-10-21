Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B53436AC1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 20:43:48 +0200 (CEST)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdd2Y-0008GA-JK
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 14:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ErRxYQgKClMHF2v9ED219916z.x97Bz7F-yzGz689818F.9C1@flex--wuhaotsh.bounces.google.com>)
 id 1mdczH-0005D8-1f
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:24 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:39672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ErRxYQgKClMHF2v9ED219916z.x97Bz7F-yzGz689818F.9C1@flex--wuhaotsh.bounces.google.com>)
 id 1mdczF-0002uF-0J
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:22 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 d6-20020a63d646000000b00268d368ead8so589338pgj.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 11:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=XySEhkJlNcR3diZ58Nj8hN3phEiW/3CrFyOD9IYp7uY=;
 b=VlGzyzoY41XkXXDtt2c3YpLs6i/YCAgqjrjnoa2yePRrO3/ft+yqxIgTejMqCSch1c
 En47UgEwSJlhBld1TAGcD43AnWXyU6TPClwzwUYyZHE1+kHDcroqwkLq3CQIbsr5zYNE
 13wISK7B72jLpZM6WJf/yzWK0q6054b34KSJpnm9n0ucuBFzdKeM7l1A4mXkeC1DmvCV
 04FCq884+fg6hUixDrBgblG3J26XOViml0myqVFMAOVgJtNuYupzCsFKAZlG6uTQKbhj
 1Sdz1cypV5tcqYuUA9U41XBss2t3n8BTeOW5CTmXq7pkmZUhl7+gG0UtrWIdrDxrWbvn
 EbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=XySEhkJlNcR3diZ58Nj8hN3phEiW/3CrFyOD9IYp7uY=;
 b=mChQcAXyhbqptPH+bix+BE+JfrASwgBOpqkswHFVJSZOCOW1rSCl7olAoWnkSiHKgw
 HkFjTVDrvfLjnzQXVgj2sFiC8mg+h9W4hkuttvOQ/Ug6D8vxxfDS6Aq2jwZj500LIJGb
 uJ2AKUIZCcBxvmj9vGWf26ZhHOnIV0vePD6Uu6ahHcfWDKlUbT86H/6oE1NhA5d8apSR
 QV+zpabVU5HdEa/frii2F612vfYH8+AYyo5ngrDUJbnXdxWLmY5NBqRMpW/xyHBRljDh
 twRJBiM7htEkzRQQzW3hS593VLlTu31asMEHyj3j5goCbeNZijVu2KGCOG2HaErHoJ6a
 Javg==
X-Gm-Message-State: AOAM5327xcT+SZNChpJa5wiyOssTtiXAGUvB+7xxG+bt35/NjRiYaX+9
 JC/A4OkI3kktV/V5pUELM+OZcpC4HdOgcw==
X-Google-Smtp-Source: ABdhPJxwA2GmP3TbEDQ4298QkhGZR0NwmLoAa2M74AEDCxUBYCGml1X2wI16Oi9amSaYTPpF4C9HnGws1dKUQw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:1354:b0:44c:eb65:8570 with SMTP
 id k20-20020a056a00135400b0044ceb658570mr7562672pfu.34.1634841618298; Thu, 21
 Oct 2021 11:40:18 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:49 -0700
Message-Id: <20211021183956.920822-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 0/7] Misc NPCM7XX patches
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3ErRxYQgKClMHF2v9ED219916z.x97Bz7F-yzGz689818F.9C1@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Patch 5 modifies at24c_eeprom_init in NPCM7xx boards so that it can fit
more use cases.

Patch 6 uses the function defined in patch 5 to add the EEPROM and other
I2C devices for Quanta GBS board.

Patch 7 adds an ID for SMBus devices in NPCM7xx boards. This allows us to
add device to these buses using "-device" parameter.

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
  hw/nvram: Update at24c EEPROM init function in NPCM7xx boards
  hw/arm: Add ID for NPCM7XX SMBus

Patrick Venture (1):
  hw/arm: quanta-gbs-bmc add i2c devices

 hw/adc/npcm7xx_adc.c           |  4 +-
 hw/arm/npcm7xx.c               |  1 +
 hw/arm/npcm7xx_boards.c        | 97 +++++++++++++++++++++-------------
 hw/i2c/npcm7xx_smbus.c         |  8 +--
 tests/qtest/npcm7xx_adc-test.c |  2 +-
 5 files changed, 67 insertions(+), 45 deletions(-)

-- 
2.33.0.1079.g6e70778dc9-goog


