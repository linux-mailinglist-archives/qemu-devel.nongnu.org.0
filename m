Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F930CFDD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:30:00 +0100 (CET)
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l757P-0000g2-Cz
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3NeAZYAMKCmQFLGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--dje.bounces.google.com>)
 id 1l756P-000097-47
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:28:57 -0500
Received: from mail-vs1-xe4a.google.com ([2607:f8b0:4864:20::e4a]:52575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3NeAZYAMKCmQFLGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--dje.bounces.google.com>)
 id 1l756N-0000H6-FA
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:28:56 -0500
Received: by mail-vs1-xe4a.google.com with SMTP id u29so253792vsj.19
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 15:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=Q0l2T/OhfjTV+tU7HPW+DH5m7ZecUpMic63h9ZQB+4s=;
 b=HR3Gennc2Pmgvip6NUTBHN5RYVsNNz62jVLJVUBHb8MJ5/Z8tTRhz0Q1LzdSHyeLX1
 jE6vxeBjDfps0wWabYt9+l4yWPyMl/u6m9R1viKxH9FsjUJWv2NhetHOR90ghGV0GgWg
 tT7Zqv3Gpq9ydRKcIH1sniC7cEOEBToMUnl53WeW/ZoOPL4wE7jc+5cNi+tVXQq55M01
 gQmYL0RyUPYAxifCNUhSdHz9f54BFtiAmTbzEGwDcLeF1JHhvEn/bIw+54C5GEN2cO6S
 rbG3uM+3qlJ7SDtilhOqRj1RzZqfOH/4VyzfWxj3gVxjMOoaFtBAAoHCSk8qMS5F4h/z
 KzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=Q0l2T/OhfjTV+tU7HPW+DH5m7ZecUpMic63h9ZQB+4s=;
 b=ax5W4a+e0OH3uUYFB4wpOdlTCgs/z2kLtEAzkT0kCQ3L2jMHsybgoLa1xA/hXqQsbS
 V58dhol1nP0ivZLS6szRmSC7fIqOXV+KFbplJSqHDl5K/pza1gSt3OEOzHb8IJ+RqJ/8
 JW9Od4Dw/QdIqpJSi5VW5faXdVD6r8JUdPH6vyGqQ7bqSHA2aY0ZHkA/XbKlDM5bZd6n
 XgASFFZFdq6jzLhVuL6ycLfpV0DiUnf+NiFKJdVopkiYSYAOD4tESaFtBevnlnNZX6qt
 q5hBPEcZL0fIVLMwmnA672KFIKzrnuE89mqGugpnffPFMcj6sWiyp3a7A+8idTrfLYjj
 +Kew==
X-Gm-Message-State: AOAM533gwAPvxw7s2kxvurf0WuSvnWERKpZuTFTd1QQv7YeOO2Oetf60
 pH/YwyXpuctcTaPstp5eLTZjBoIrJtGJJ7ntO8rYGwTP5AEq3HlHDJcw+BWIkY2nWHxxk4Tl6wi
 YuKXXurRSPZL/G5hgl3m/NE/UFZXdQR1RI4V3uMf8W8rq05ScE7HD
X-Google-Smtp-Source: ABdhPJwwgR6agy5KkjwfIBsuj6f6sgCZchNkPmRZ/Z4v7vUqNCZPN41hWoF4dw/X+R8FJhtyRkAErF8=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:306e:8f0c:3be0:7750])
 (user=dje job=sendgmr) by 2002:a1f:1d0e:: with SMTP id
 d14mr234026vkd.14.1612308533174; 
 Tue, 02 Feb 2021 15:28:53 -0800 (PST)
Date: Tue,  2 Feb 2021 15:28:35 -0800
Message-Id: <20210202232838.1641382-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 0/3] Add npcm7xx emc model
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e4a;
 envelope-from=3NeAZYAMKCmQFLGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--dje.bounces.google.com;
 helo=mail-vs1-xe4a.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Avi Fishman <avi.fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From: dje--- via <qemu-devel@nongnu.org>

This is a 10/100 ethernet device that has several features.
Only the ones needed by the Linux driver have been implemented.
See npcm7xx_emc.c for a list of unimplemented features.

Doug Evans (3):
  hw/net: Add npcm7xx emc model
  hw/arm: Add npcm7xx emc model
  tests/qtests: Add npcm7xx emc model test

 docs/system/arm/nuvoton.rst    |   3 +-
 hw/arm/npcm7xx.c               |  50 +-
 hw/net/meson.build             |   1 +
 hw/net/npcm7xx_emc.c           | 852 +++++++++++++++++++++++++++++++++
 hw/net/trace-events            |  17 +
 include/hw/arm/npcm7xx.h       |   2 +
 include/hw/net/npcm7xx_emc.h   | 286 +++++++++++
 tests/qtest/meson.build        |   1 +
 tests/qtest/npcm7xx_emc-test.c | 793 ++++++++++++++++++++++++++++++
 9 files changed, 2002 insertions(+), 3 deletions(-)
 create mode 100644 hw/net/npcm7xx_emc.c
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 tests/qtest/npcm7xx_emc-test.c

-- 
2.30.0.365.g02bc693789-goog


