Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7706F2D826A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:56:08 +0100 (CET)
Received: from localhost ([::1]:60160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrKZ-00048F-H9
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:56:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3U_HTXwgKCooA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com>)
 id 1knqot-0006D7-6H
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:23:23 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:49831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3U_HTXwgKCooA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com>)
 id 1knqon-0003JV-FP
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:23:22 -0500
Received: by mail-pg1-x549.google.com with SMTP id l7so7478446pgq.16
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 14:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=9NSSgVyMsNehXy1aebE3mq5QJtWaWYkOTKzqtbWIg5o=;
 b=IlaSc7thqnpWR3IsgTbf/9V1xeU6k3fm1FkxWuvD4Ds5X0UAU31qw+GRsZ2yhYFrUs
 OhlndBGPOLajm0jKAliCD1Ci2/lmhRMm2ra1hQjDXadEcAd3PtIJep5Z2oZR4QhneU7s
 P0G6V7KVnDu2y7hipPCh4rC82Owd8r+rDRJUj9B5PQHJqpgEOEmJUZKYNuytkPLepaYt
 QbhD6a5y8nzHcnOHXv+PHc9zvY4FB3fC8Vb+BXEGAXAHFI4PFRCwJ8WsqlLOjhvC6qps
 L2Vura4dnckr3bzsmteYIpgDs+0MJ+QJC+cqHNJykFTCBXoI3LMcmqdRWDiK7iwiHHMF
 txFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=9NSSgVyMsNehXy1aebE3mq5QJtWaWYkOTKzqtbWIg5o=;
 b=Diq2qm6IdzkJ5bq61XLx1G8tKBrRiqaT8dOrKlXkJrT0GKMS8SzwUWfY3i5I9/FTfH
 C+SfY68ZocuqujQEIoq7WYKb3ZPtVvmZL/iiWKtd1FjfmZvy50WqQqXKD9UzOfJx2jbf
 ZzLGSnGwEUzW1BN0JLepRZWxMaVfbDc0o5QqCOqCnTOcUFZih194ZnLAA/zawmuJghiY
 sbW006d6/v+ne9BSdo5ls87OlSIu+vkWoOpg1jsTBHlxEUt3SjnQYvjGpXY4P0n9RFcf
 NglO/QhAqq+QYdO98ezAjSnIZrmBcDk8XAL8ze/4dvnsNc0x6DGaC9xdVB+v8Ywf4dKy
 w9Gg==
X-Gm-Message-State: AOAM533UiMwBsLI4mTpIyEy5hYrgHMpeZxXYdfOfUGxVct+pmJds/zFe
 9PqJ+smLv1R+Y3ldHXR8MzOjAb6XujXzxQ==
X-Google-Smtp-Source: ABdhPJz4Kr6j16IFD8EBjlMtMFddb1wPV/lZQl74MTxpIig5GujLlQl++DbRhRsfPD8G31/BgqyUaZnH7cN23w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:7144:b029:da:7268:d730 with SMTP
 id u4-20020a1709027144b02900da7268d730mr12894554plm.20.1607725395116; Fri, 11
 Dec 2020 14:23:15 -0800 (PST)
Date: Fri, 11 Dec 2020 14:22:19 -0800
Message-Id: <20201211222223.2252172-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v2 0/4] Additional NPCM7xx devices
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3U_HTXwgKCooA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com;
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

This patch series include a few more NPCM7XX devices including

- Analog Digital Converter (ADC)
- Pulse Width Modulation (PWM)

We also modified the CLK module to generate clock values using qdev_clock.
These clocks are used to determine various clocks in NPCM7XX devices.

Thank you for your review!

Changes since v1:
We removed the IPMI and KCS related code from this patch set.

Hao Wu (4):
  hw/misc: Add clock converter in NPCM7XX CLK module
  hw/timer: Refactor NPCM7XX Timer to use CLK clock
  hw/adc: Add an ADC module for NPCM7XX
  hw/misc: Add a PWM module for NPCM7XX

 docs/system/arm/nuvoton.rst      |   4 +-
 hw/adc/meson.build               |   1 +
 hw/adc/npcm7xx_adc.c             | 318 +++++++++++++
 hw/arm/npcm7xx.c                 |  55 ++-
 hw/misc/meson.build              |   1 +
 hw/misc/npcm7xx_clk.c            | 795 ++++++++++++++++++++++++++++++-
 hw/misc/npcm7xx_pwm.c            | 535 +++++++++++++++++++++
 hw/timer/npcm7xx_timer.c         |  25 +-
 include/hw/adc/npcm7xx_adc.h     |  72 +++
 include/hw/arm/npcm7xx.h         |   4 +
 include/hw/misc/npcm7xx_clk.h    | 146 +++++-
 include/hw/misc/npcm7xx_pwm.h    | 106 +++++
 include/hw/timer/npcm7xx_timer.h |   1 +
 tests/qtest/meson.build          |   4 +-
 tests/qtest/npcm7xx_adc-test.c   | 400 ++++++++++++++++
 tests/qtest/npcm7xx_pwm-test.c   | 490 +++++++++++++++++++
 16 files changed, 2927 insertions(+), 30 deletions(-)
 create mode 100644 hw/adc/npcm7xx_adc.c
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 include/hw/adc/npcm7xx_adc.h
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 tests/qtest/npcm7xx_adc-test.c
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c

-- 
2.29.2.684.gfbc64c5ab5-goog


