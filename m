Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65C92EF7F4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:14:06 +0100 (CET)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxD3-0002Q5-GG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Cq74XwgKCk8DByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9D-0000ua-E0
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:10:07 -0500
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:42607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Cq74XwgKCk8DByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9A-00078z-Ua
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:10:07 -0500
Received: by mail-qk1-x749.google.com with SMTP id p185so10056716qkc.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=nHvdj59Ch2nmxrN2pE7SpwLDq8+oyR7alTPwtuKq8zk=;
 b=ICYEggskogiqhQPO+dRrONig2qf/wuOO6Hyfc5e8i0kweIMWAyMN4K7qkWN8hJj7gq
 Utk7DmX+Z3/0/BhjdzR08b0I2xtzySjRqJTB8leb6mosku6ON2QQkujw8LX7Ifr7mc4c
 YZ4FlatTebmWeSGZigPCzMJ0pINeKDpL8aedcYEqAyTSdy89Evq0/Vfgy+4NneDmmPgF
 YwRAgRDKVYr/vq+BBhctEK13SKVQxH6JVm0lQ/VNGKfySnlRBzJDLpIDYRR6AmFoS9Ry
 IpDd3u+ktPFmii23T/oFPCHc5UImQTalqHHXODzOVrCIyhkZF0NjDFMTWz0UlUj/4exh
 hjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=nHvdj59Ch2nmxrN2pE7SpwLDq8+oyR7alTPwtuKq8zk=;
 b=ZkanFtBxTjKNXhbAmjLBGMD3vrvraJbt+TLP946Mo4vEDOd3WlXtCxtlFR/zawDRks
 Kda1gBu5X+ydNZzgXLrk2qIHzU8s6ikgLO1vCvwg/LVFGMk/+s6Wmdfm76sR4V2ZDktI
 Ml+6mzlsd292nw+f4KmjXzBC9iQA+LNgJINtSDkYTcENeGihMIvG8N8mPN3SIv43bCzm
 pLkHwryJWPdhnvOWd1fI3Wi9//75t/5YghI3XhyZ8c+ngQcS3tZluwsDm32p+/fwWFm/
 zglUjsr2Ik8Unv0yYRrAs3T3Pw4wzJMoGqJ8WJUpbw8ypGMFdMJgTdizqT/ZZBjeWU/t
 VVfA==
X-Gm-Message-State: AOAM531g24tIOiHroDPIG38ca56NUYshJTo2da/5BbN+nOJ6jz4QLj5w
 1yfBoRS5VPSjIEGEsvK/YgXEKMQAW66oHA==
X-Google-Smtp-Source: ABdhPJyO0P8T5+J8H0cKDZvp4scnplV5z9iYKr63PAlvcr4CP2PygqOEywp+Yh0iYbCjCIEg4El/gRzKN4KFKA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:ad4:46cb:: with SMTP id
 g11mr4883888qvw.42.1610133002990; Fri, 08 Jan 2021 11:10:02 -0800 (PST)
Date: Fri,  8 Jan 2021 11:09:39 -0800
Message-Id: <20210108190945.949196-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v5 0/6] Additional NPCM7xx devices
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3Cq74XwgKCk8DByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
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

Changes since v4:
- Use clock_ticks_to_ns to compute clock time in nanoseconds.
    (Didn't apply to PWM patch since it requires a frequency as output.)
- Removed reset_timer and resets immediately in ADC patch.
- Removed "qemu/osdep.h" from headers and include them in .c files.
- Use REG32 for register fields.
- Fix a g_assert that a guest can trigger with incorrect input.

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
 hw/adc/npcm7xx_adc.c             | 301 ++++++++++++
 hw/adc/trace-events              |   5 +
 hw/arm/npcm7xx.c                 |  55 ++-
 hw/arm/npcm7xx_boards.c          |   2 +-
 hw/mem/npcm7xx_mc.c              |   2 +-
 hw/misc/meson.build              |   1 +
 hw/misc/npcm7xx_clk.c            | 797 ++++++++++++++++++++++++++++++-
 hw/misc/npcm7xx_gcr.c            |   2 +-
 hw/misc/npcm7xx_pwm.c            | 550 +++++++++++++++++++++
 hw/misc/npcm7xx_rng.c            |   2 +-
 hw/misc/trace-events             |   6 +
 hw/nvram/npcm7xx_otp.c           |   2 +-
 hw/ssi/npcm7xx_fiu.c             |   2 +-
 hw/timer/npcm7xx_timer.c         |  39 +-
 include/hw/adc/npcm7xx_adc.h     |  69 +++
 include/hw/arm/npcm7xx.h         |   4 +
 include/hw/misc/npcm7xx_clk.h    | 146 +++++-
 include/hw/misc/npcm7xx_pwm.h    | 105 ++++
 include/hw/timer/npcm7xx_timer.h |   1 +
 meson.build                      |   1 +
 tests/qtest/meson.build          |   4 +-
 tests/qtest/npcm7xx_adc-test.c   | 377 +++++++++++++++
 tests/qtest/npcm7xx_pwm-test.c   | 490 +++++++++++++++++++
 25 files changed, 2920 insertions(+), 48 deletions(-)
 create mode 100644 hw/adc/npcm7xx_adc.c
 create mode 100644 hw/adc/trace-events
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 include/hw/adc/npcm7xx_adc.h
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 tests/qtest/npcm7xx_adc-test.c
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c

-- 
2.29.2.729.g45daf8777d-goog


