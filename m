Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F92DCA21
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 01:49:12 +0100 (CET)
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kphTi-0007jb-Mx
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 19:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JKraXwgKCucfdQJXcbQPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--wuhaotsh.bounces.google.com>)
 id 1kphQA-000697-M0
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 19:45:30 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:52635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JKraXwgKCucfdQJXcbQPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--wuhaotsh.bounces.google.com>)
 id 1kphQ7-0006pp-7W
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 19:45:30 -0500
Received: by mail-qt1-x84a.google.com with SMTP id t7so1726267qtn.19
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 16:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=4YuCO3xnumkMk4n7ONOP0d547khMrm9sg+a9lN20uV4=;
 b=j21hStY5IpEbTPbxL7SIkKh12jluLLUdnnAuYB34Ccy1hJVUUqEW0TXq+gzPA7SJHV
 Ip6R6ur9Cfzi+It6NTXmCSKwb1o5uYmJxMuLhcq5+OY1qI6VneXMRCDDANnbo6SGc7YD
 TxT4owqCAQiHq1HYGmHCAiNRSElecTb68iIyYBpx2wnQzJiEIDq70UT0S1MPcZICF8Pm
 uvs2B1EQoN0WUuZ9uVDkmcuzYN3koXm0Spvm6133drqsABo/KObA4PAbS2TKeY8XbsEN
 yQ9QcfIVjuJ7wV2JlKncFATyWgP/cim9KxgpsN7rjbSnnXrBTQEaYGVU1dJ6hy+hRgHJ
 AyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=4YuCO3xnumkMk4n7ONOP0d547khMrm9sg+a9lN20uV4=;
 b=EEz+iQeCeOiQYLPEHIhAPlXjh/0GEASgPLARMYnLS9p/xtCNPzO3xlB4/fUfb3NpC/
 cLfBxOmU22ySnlZ52eqD90NaX45aOP46tM92jm+GWJGeWXMC3SuoifWOMZZAZyOvD0Fe
 23C07MF9kPVEQqy06MdPf7giauTL2yOd62P7jNdH3X2fJSSh0l2Vko3wC7NBxfxEpxt5
 MDJJ6wT81vEdgGt9ZDVFAGDDLTCKbGeUjQcN9yo9E6vUy+4AOHEVWQ5RssaiUtkUhNJ+
 PZyMxe+FkFMHDPbK25dEgvkYwzsB4bPIzpkzfowCLlGpaomUze3eZqqb5XMeI4JLtbVc
 Yb2Q==
X-Gm-Message-State: AOAM531dGc8kZEdkdu+APbtzqcezbwY8H2gaFopCsavLYK3sPJuF/vC3
 ZiSnM2JAFMHTqykvdHFy/ESPBn3DFnJEaw==
X-Google-Smtp-Source: ABdhPJwtsfgdJABOTgY79xg9gK4B9YTFtZrFbIJMrsNnCNjmq/XSEP5ERjdq2wjzgBKXHABjtXH8dSofBbXCfQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:9121:: with SMTP id
 q30mr46512244qvq.17.1608165924794; Wed, 16 Dec 2020 16:45:24 -0800 (PST)
Date: Wed, 16 Dec 2020 16:43:43 -0800
Message-Id: <20201217004349.3740927-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v4 0/6] Additional NPCM7xx devices
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3JKraXwgKCucfdQJXcbQPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--wuhaotsh.bounces.google.com;
 helo=mail-qt1-x84a.google.com
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

This patch series include a few more NPCM7XX devices including

- Analog Digital Converter (ADC)
- Pulse Width Modulation (PWM)

We also modified the CLK module to generate clock values using qdev_clock.
These clocks are used to determine various clocks in NPCM7XX devices.

Thank you for your review.

Changes since v3:
- Use type casting instead of accessing parent object in all devices.

Changes since v2:
- Split PWM test into a separate patch in the patch set
- Add trace events for PWM's update_freq/update_duty
- Add trace events for ioread/iowrite in ADC and PWM
- Use timer_get_ns in hw/timer/npcm7xx_timer.c
- Update commit message in ADC/PWM to mention qom-get/set method for usage
- Fix typos

Changes since v1:
- We removed the IPMI and KCS related code from this patch set.

Hao Wu (6):
  hw/misc: Add clock converter in NPCM7XX CLK module
  hw/timer: Refactor NPCM7XX Timer to use CLK clock
  hw/adc: Add an ADC module for NPCM7XX
  hw/misc: Add a PWM module for NPCM7XX
  hw/misc: Add QTest for NPCM7XX PWM Module
  hw/*: Use type casting for SysBusDevice in NPCM7XX

 docs/system/arm/nuvoton.rst      |   4 +-
 hw/adc/meson.build               |   1 +
 hw/adc/npcm7xx_adc.c             | 321 +++++++++++++
 hw/adc/trace-events              |   5 +
 hw/arm/npcm7xx.c                 |  55 ++-
 hw/arm/npcm7xx_boards.c          |   2 +-
 hw/mem/npcm7xx_mc.c              |   2 +-
 hw/misc/meson.build              |   1 +
 hw/misc/npcm7xx_clk.c            | 797 ++++++++++++++++++++++++++++++-
 hw/misc/npcm7xx_gcr.c            |   2 +-
 hw/misc/npcm7xx_pwm.c            | 559 ++++++++++++++++++++++
 hw/misc/npcm7xx_rng.c            |   2 +-
 hw/misc/trace-events             |   6 +
 hw/nvram/npcm7xx_otp.c           |   2 +-
 hw/ssi/npcm7xx_fiu.c             |   2 +-
 hw/timer/npcm7xx_timer.c         |  25 +-
 include/hw/adc/npcm7xx_adc.h     |  72 +++
 include/hw/arm/npcm7xx.h         |   4 +
 include/hw/misc/npcm7xx_clk.h    | 146 +++++-
 include/hw/misc/npcm7xx_pwm.h    | 106 ++++
 include/hw/timer/npcm7xx_timer.h |   1 +
 meson.build                      |   1 +
 tests/qtest/meson.build          |   4 +-
 tests/qtest/npcm7xx_adc-test.c   | 400 ++++++++++++++++
 tests/qtest/npcm7xx_pwm-test.c   | 490 +++++++++++++++++++
 25 files changed, 2972 insertions(+), 38 deletions(-)
 create mode 100644 hw/adc/npcm7xx_adc.c
 create mode 100644 hw/adc/trace-events
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 include/hw/adc/npcm7xx_adc.h
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 tests/qtest/npcm7xx_adc-test.c
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c

-- 
2.29.2.684.gfbc64c5ab5-goog


