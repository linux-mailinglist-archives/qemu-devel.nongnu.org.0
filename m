Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63DB3048C2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 20:37:13 +0100 (CET)
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4U9I-0006XI-CU
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 14:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZG4QYAgKCok97un165ut11tyr.p1z3rz7-qr8ry010t07.14t@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5E-0004V4-PB
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:33:01 -0500
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZG4QYAgKCok97un165ut11tyr.p1z3rz7-qr8ry010t07.14t@flex--wuhaotsh.bounces.google.com>)
 id 1l4U59-00045y-Lz
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:32:59 -0500
Received: by mail-qt1-x849.google.com with SMTP id n22so9856710qtv.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 11:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=/JN1lLN3S8bni2bQFj3ryjv5Yrpf4V6ED6Yz/THzn/I=;
 b=S/h35lygBa8LOjiZFqhtQYoAExcr9YMxB/0ZxMAHF+umcEUt0SqPXOfJJZ5apslxBi
 aDZDK8K6aHB0waTBqJtUgv3GCG/KjAlI6aRcEDGVmN++p6FViJJ8ue5X3fOikRHFqlOt
 uPoWO9KwGOFOrfFJBJ38oZ/sCvSYJ4oMo6DKyaLhkZpTiUjihw6WZnhwaia6LDM21Elu
 zqOl3X8rm/CqJDU+lFtlGUWxhxQq3fIoDnF5bgO70n4LuiQjE+JJwCrduiVWNQI55FO6
 D+qCRf72MAAaNc9auWhzWz8XlnABgh8pDkuBcOo0AZGsCaL7YoUQJY3N7iO71xxIDIFI
 JXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=/JN1lLN3S8bni2bQFj3ryjv5Yrpf4V6ED6Yz/THzn/I=;
 b=gGA204fDQb8STHyAawB+7G0bkODt/yByLMgkyucQttFf0RYJa4zeZatWzucNAJoTW4
 OzZzXFvcmjKd7e24K0KdgRDWeGJHvpn824aGTtNEYNrobjV7Q+g7Nh5u8GkmmUuBUBaY
 +ruFeM3+ZQvROBD9K+jxj4/r3iZ5ZZhcW7nTa1tyXHwQIabg4NNA54b5hYpArqusnZod
 7QKDpIi70d5CrS9Pw8khNHAue8KGCGyLs0nyzc8v/uKE+yslA902sF3Yh7izDd9tDZh8
 f3EmOyRBWaC0f+2vbZQ5nP5SmiTBGRkeg0AdVElw+5FvXW0ry63LFSUlmzhBptuHJSrJ
 DsLA==
X-Gm-Message-State: AOAM532rzwtj6Mjuetaai36KNvInDBYsurJ0QY1JIVinBfJT1JYw44eO
 IAEuadE0yNDXpIJ6Y6YNqEKPE0lXOjQUJw==
X-Google-Smtp-Source: ABdhPJyeePfjJIMAgx5WryzSRlGl1dLA7U0JqTfkU6SRbDghaFQUG57nlD1c8M3Yf6XopIPjkgki7TI7/dvdVQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:bf12:: with SMTP id
 m18mr7138242qvi.40.1611689572143; Tue, 26 Jan 2021 11:32:52 -0800 (PST)
Date: Tue, 26 Jan 2021 11:32:31 -0800
Message-Id: <20210126193237.1534208-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH 0/6] hw/i2c: Add NPCM7XX SMBus Device
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3ZG4QYAgKCok97un165ut11tyr.p1z3rz7-qr8ry010t07.14t@flex--wuhaotsh.bounces.google.com;
 helo=mail-qt1-x849.google.com
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 wuhaotsh@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-devel@nongnu.org>

This patch set implements the System manager bus (SMBus) module in NPCM7XX
SoC. Basically, it emulates the data transactions of the module, not the
SDA/SCL levels. We have also added a QTest which contains read and write
operations for both single-byte and FIFO mode, and added basic I2C device
trees for npcm750-evb and quanta-gsj boards.

We also cleaned up the unimplemented GPIO devices in npcm7xx.c since they
are already implemented.

Hao Wu (6):
  hw/arm: Remove GPIO from unimplemented NPCM7XX
  hw/i2c: Implement NPCM7XX SMBus Module Single Mode
  hw/arm: Add I2C device tree for NPCM750 eval board
  hw/arm: Add I2C device tree for Quanta GSJ
  hw/i2c: Add a QTest for NPCM7XX SMBus Device
  hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode

 docs/system/arm/nuvoton.rst      |    2 +-
 hw/arm/npcm7xx.c                 |   76 ++-
 hw/arm/npcm7xx_boards.c          |   32 +
 hw/i2c/meson.build               |    1 +
 hw/i2c/npcm7xx_smbus.c           | 1071 ++++++++++++++++++++++++++++++
 hw/i2c/trace-events              |   12 +
 include/hw/arm/npcm7xx.h         |    2 +
 include/hw/i2c/npcm7xx_smbus.h   |  113 ++++
 tests/qtest/meson.build          |    1 +
 tests/qtest/npcm7xx_smbus-test.c |  495 ++++++++++++++
 10 files changed, 1780 insertions(+), 25 deletions(-)
 create mode 100644 hw/i2c/npcm7xx_smbus.c
 create mode 100644 include/hw/i2c/npcm7xx_smbus.h
 create mode 100644 tests/qtest/npcm7xx_smbus-test.c

-- 
2.30.0.365.g02bc693789-goog


