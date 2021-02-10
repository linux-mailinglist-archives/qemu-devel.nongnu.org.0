Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AD63172E8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:08:05 +0100 (CET)
Received: from localhost ([::1]:40722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xeW-0002eb-HO
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dlgkYAgKCr81zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbb-0000lY-AS
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:03 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:34590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dlgkYAgKCr81zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbF-0000j8-4q
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:04:58 -0500
Received: by mail-pg1-x54a.google.com with SMTP id o11so2720644pgn.1
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=2IsBkrOmO2LpeVhzut2Dk8QiICKrVg3gpFNLnyKo2x4=;
 b=plSyZvgq3Wxxf+0zS/Xh7FLs7dn+17vZ1hXUQEZdOb14CRxZbOfzeGwW1uRLuhgRzo
 nXUha/qt5Q22EHTgPp1s9xmOyMunbEusiyfP+MLytk8vPOrmCQiVCPob51cKyH+voMkn
 7PNC/i0gndg9rzjFcHRzAcMH2sPrgEF5a2LmwuPWdEy0FLNrbhH2Z+j7tnCvEMJMaHup
 VOLbZgMypxkEVYyHnw6sdxChN+SeCgjG5b7uKYl6CrkSExZMqUz7x/ogmJpA8l+avnwR
 71nRRxCtzui20Z/6fCf2ibqlNIkqLGh4m+bp+33MrlLHILb84oFkBdhZawKM+z37GdlU
 AoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=2IsBkrOmO2LpeVhzut2Dk8QiICKrVg3gpFNLnyKo2x4=;
 b=DQdGZzbKp6LWoAt/6zMTkR4hT1rzBhRslu9hbz3oVX+pH73qJGN1ctp/DqPKbYxPLW
 B4EN5y9Z+GPUf+tGZxitmB9jrFR+Hj7t5zL8i28s8ONbBtWFebmtJwFuYdfB8o8zDTN4
 Kkty+YwNHP2dKjCLiqgxcOAJdXnP2yLuX9QwL7evVIBf+FYRpL0qDD7yiiWL54fvnHo5
 aFh1pU81zm7hjkyMPYmPTLFA25TDxULcAIfsMvIywLYXJCVdBhEYH0iTGqR78TYoMbec
 1Ubd1jwcFh2AUEN/G/qAvoK9Gxm+oMoKob1C/GGP5tuCr/l6eftKA4j+FrVoLSKP15gF
 Gk7w==
X-Gm-Message-State: AOAM5329V8B/a5IPoT/x+rJlDulVO3qDMm48U9HRXRj8rD6hUAnPa+FM
 8tK9jMAeEHJRe/JOo6odxfO0NIga/Azcag==
X-Google-Smtp-Source: ABdhPJz6pB4YYDohTy+ZVBI9Q5QjGuWVFNPN06v1v3Qet2pU9bqbCGLjI91F9iNjrsE21hKdyYxaSX5JJEIF1Q==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:464:b029:e2:ebb4:9251 with SMTP
 id 91-20020a1709020464b02900e2ebb49251mr4861698ple.29.1612994678979; Wed, 10
 Feb 2021 14:04:38 -0800 (PST)
Date: Wed, 10 Feb 2021 14:04:21 -0800
Message-Id: <20210210220426.3577804-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3 0/5] hw/i2c: Add NPCM7XX SMBus Device
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com, cminyard@mvista.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3dlgkYAgKCr81zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-devel@nongnu.org>

This patch set implements the System manager bus (SMBus) module in NPCM7XX
SoC. Basically, it emulates the data transactions of the module, not the
SDA/SCL levels. We have also added a QTest which contains read and write
operations for both single-byte and FIFO mode, and added basic I2C devices
for npcm750-evb and quanta-gsj boards.

Changes since v2:
- Remove first patch (GPIO) since it's already applied to target-arm.next
- Rename NPCM7XX_SMBUS_FIFO_EN to NPCM7XX_SMBUS_VERSION_FIFO_SUPPORTED
  to indicate it's a register field of the VERSION reg.
- Add select AT24C in hw/arm/Kconfig.
- Minor additional commit messages and comments to clarify things.

Changes since v1:
- Fix errors for i2c device addresses for temperature sensors in GSJ machine
- Use at24c device to emulate GSJ EEPROM. It supports more than 256 bytes.
- Fill in VMState in npcm7xx_smbus.c
- Change commit message in patch 3 and 4
- Fix order in npcm7xx.c IRQ list
- Add a few extra comments to make things clearer

Hao Wu (5):
  hw/i2c: Implement NPCM7XX SMBus Module Single Mode
  hw/arm: Add I2C sensors for NPCM750 eval board
  hw/arm: Add I2C sensors and EEPROM for GSJ machine
  hw/i2c: Add a QTest for NPCM7XX SMBus Device
  hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode

 docs/system/arm/nuvoton.rst      |    2 +-
 hw/arm/Kconfig                   |    1 +
 hw/arm/npcm7xx.c                 |   68 +-
 hw/arm/npcm7xx_boards.c          |   46 ++
 hw/i2c/meson.build               |    1 +
 hw/i2c/npcm7xx_smbus.c           | 1099 ++++++++++++++++++++++++++++++
 hw/i2c/trace-events              |   12 +
 include/hw/arm/npcm7xx.h         |    2 +
 include/hw/i2c/npcm7xx_smbus.h   |  113 +++
 tests/qtest/meson.build          |    1 +
 tests/qtest/npcm7xx_smbus-test.c |  495 ++++++++++++++
 11 files changed, 1823 insertions(+), 17 deletions(-)
 create mode 100644 hw/i2c/npcm7xx_smbus.c
 create mode 100644 include/hw/i2c/npcm7xx_smbus.h
 create mode 100644 tests/qtest/npcm7xx_smbus-test.c

-- 
2.30.0.478.g8a0d178c01-goog


