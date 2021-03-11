Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07031337C2D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:12:35 +0100 (CET)
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPnO-0002As-Ni
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3uVxKYAgKCqQaYLESXWLKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--wuhaotsh.bounces.google.com>)
 id 1lKPk7-00074l-JN
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:09:03 -0500
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:40900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3uVxKYAgKCqQaYLESXWLKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--wuhaotsh.bounces.google.com>)
 id 1lKPk3-0000Yk-UI
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:09:03 -0500
Received: by mail-qk1-x74a.google.com with SMTP id i188so16183417qkd.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=4HbhmuBPeJFPt9NDBoP2ION/NHr/UUnClVCqpOydOEs=;
 b=J/ZmDugZzYO47GeNXT9j6SMiZ6ILg3+uF3BqldhYAnmWmiEL/SLNYjotpRnjeGTURh
 nLTWPKIfk8v+Ptp6nUtP/zTitg2KV6hTvMkwdaV7r45a9U0gdKtKoVKCjddCZkrXwvXp
 +xLs893KDeLyW68X1lIXZPRK+c75WXCDqUYbxnGAITHB5jLbbGJgOzGwLL4BoZmEpHI/
 iZHMnny4/QDRYhgwomYU4RQyTAaNRTaQwf9VsB9wCl5jqapZgMQzJFA4zkkXjBe68iMw
 y2skJMyDWbOTBTI2Z5jVEQKmPV7lTVXtAu/u94tda0Bw5Wx64VwF2YMcI9p15J8dLvrX
 zf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=4HbhmuBPeJFPt9NDBoP2ION/NHr/UUnClVCqpOydOEs=;
 b=OYMyn4QS8G/GWVk9oZK3Sx66wQEbG03/q6QPCDQ1/rRZw22yZU31qDvpaOjbHYeD+s
 2Vr8NEc5YTChDuMsKGYvBTEJTvljlsaeTL3RQkmby3YsgHV9DXudPFvuNwQPKAw5kN9z
 h8PIrGY3oXeUwcR7TKoDEYnRyDDqmT48pjqzoZLfYyMuVMbblimCGYfNxkZkYPYipSvE
 qK6ks11xOyb+6EGlaGmog+K731rus7ZMSlU2P5tbS/6sBO4N3QGkx0XBdUYhz8G74QPT
 ndtn0j615N+/GJSnYhQj5zFDgC89rLkX76REw9AvLJTqvUiey125Pf2tW9mOfBdfJtBo
 RNuA==
X-Gm-Message-State: AOAM533Mxf3hlJFN3BJN2nuwFr/3BxCJY9rjklGqOshol8ONplNVM/ZI
 OLCJRKExCnnka99o5VAeAMy+gKIvVFSnkA==
X-Google-Smtp-Source: ABdhPJySFeEcsMqBXVYyPKrKMzbJv3JcVv0Pan9t3GFdJq4Ni79Lu+qgxUAAnzg5T+L224zSaaigkSsDOhKMpw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:a425:: with SMTP id
 w34mr8374442qvw.2.1615486137661; Thu, 11 Mar 2021 10:08:57 -0800 (PST)
Date: Thu, 11 Mar 2021 10:08:50 -0800
Message-Id: <20210311180855.149764-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3uVxKYAgKCqQaYLESXWLKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--wuhaotsh.bounces.google.com;
 helo=mail-qk1-x74a.google.com
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

This patch set implements the Tachometer (a.k.a Multi Functional Timer/MFT)
device in NPCM7XX SoC. This device is used by NPCM7XX boards to measure
the RPM of PWM fans.

To provide the RPM of a certain fan, since RPM = MAX_RPM * duty_percentage.
We convert the duty output in NPCM7XX PWM module into GPIOs and feed them
into the MFT module.

The connection of PWM modules and fan modules are derived from their specific
Linux device trees and coded in hw/arm/npcm7xx_boards.c.

We amend the QTest for the PWM module to include verifying the reading from
the Tachometer is correct.

Changes since v1:
- Split implementation of device and addition to board file to separate patches
- Adapt to new Clock API and address conflicts
- Use the new clock_ns_to_ticks API to calculate tachometer counts

Hao Wu (5):
  hw/misc: Add GPIOs for duty in NPCM7xx PWM
  hw/misc: Add NPCM7XX MFT Module
  hw/arm: Add MFT device to NPCM7xx Soc
  hw/arm: Connect PWM fans in NPCM7XX boards
  tests/qtest: Test PWM fan RPM using MFT in PWM test

 docs/system/arm/nuvoton.rst    |   2 +-
 hw/arm/npcm7xx.c               |  45 ++-
 hw/arm/npcm7xx_boards.c        |  99 ++++++
 hw/misc/meson.build            |   1 +
 hw/misc/npcm7xx_mft.c          | 540 +++++++++++++++++++++++++++++++++
 hw/misc/npcm7xx_pwm.c          |   4 +
 hw/misc/trace-events           |   8 +
 include/hw/arm/npcm7xx.h       |  13 +-
 include/hw/misc/npcm7xx_mft.h  |  70 +++++
 include/hw/misc/npcm7xx_pwm.h  |   4 +-
 tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++-
 11 files changed, 974 insertions(+), 17 deletions(-)
 create mode 100644 hw/misc/npcm7xx_mft.c
 create mode 100644 include/hw/misc/npcm7xx_mft.h

-- 
2.31.0.rc2.261.g7f71774620-goog


