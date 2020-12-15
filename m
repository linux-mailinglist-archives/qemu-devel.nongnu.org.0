Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58432DA490
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:14:53 +0100 (CET)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxzQ-0001uX-Gq
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3pP_XXwgKCgk53qjx21qpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1koxy3-0000Rz-N6
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:13:27 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:43048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3pP_XXwgKCgk53qjx21qpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1koxy2-00036P-1t
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:13:27 -0500
Received: by mail-yb1-xb49.google.com with SMTP id t187so20863505ybf.10
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 16:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=S4tbciDLXdHnTTms2a/xfml3e34Cth0kvYsqk3Pk5rc=;
 b=mqrXxcqv//E7MFcmfSkcGPEf7kI3/jmJVtCD57JtqiiUYzBKcbGcKnC1molhvlpOB5
 77hZVJ+dbHiy5cu+W/w5nnHRST0Xg1fZ2beuXiGRyilu75f4gcT5EZ6Gbi08FJlMByo0
 bwkrl8AVzHMDHRJ+SClQEywKC/58LJh2iEWi1AWN4Gxk1Xy7vMEBUXYKCK7KlQeHgu5R
 3DFFUyfxer1W6TAHeL6+KJ1h/oLkL9jvaMDEtZDYXBLU6K29SdcRZy7E50o2MmpBrtCn
 JRuRIHg+etxIXFk7JZYbBCJLTKcJLNFZh5RksfSCjHhZvk3qideA8J2K2vxLOxAMPfkj
 oukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=S4tbciDLXdHnTTms2a/xfml3e34Cth0kvYsqk3Pk5rc=;
 b=A5edC+tW7AXS6ynNGqGhuaM+MphuwQSbZmmjSj7FxVant8+x9rSbxVXCi0nZflvkDe
 rqOpo9o1agEuq/9dibQ9X/1c+9aYjs9aiaR4Nvxdo3eAwteNwMJXUzAAwpNBOROAtvuW
 zDqgKbrE3rrqfZhgx8rb21nLXoMwXRE88lN1nQGUA01MvNiT59m8C8tynjHrXa+jVLdR
 b9TFbwD8kf16l5LTfr1yZSSdBGDQD6yn8N9ttBf2fhBbqj0exnxUzMnkQXQIUwxUitap
 p6Q0oCCbKzTlCeG+0fsl7saMuzkUfax9hhUvhKoOn9UvmnPKmKjHDcytTe0lyLf7wtPW
 Grbw==
X-Gm-Message-State: AOAM533XvQ0xnPDQJfOsIQbe4fOUzzKPAcQrZIj+k2M03YI00NmoOXvG
 d9NSqnpA+XY74ggOZX2TA6HOXLgeUUMhIw==
X-Google-Smtp-Source: ABdhPJxjkLZs21pcncULc/llpy4ue4ueUIYkMBzG2R+ETFMLQVlLjy+dgGBosBa5QW2yignaHhnvY402xpWbVQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6902:6d4:: with SMTP id
 m20mr12622634ybt.434.1607991204270; Mon, 14 Dec 2020 16:13:24 -0800 (PST)
Date: Mon, 14 Dec 2020 16:13:07 -0800
Message-Id: <20201215001312.3120777-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 0/5] Additional NPCM7xx devices
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3pP_XXwgKCgk53qjx21qpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
 f4bug@armsat.org, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
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

Changes since v2:
- Split PWM test into a separate patch in the patch set
- Add trace events for PWM's update_freq/update_duty
- Add trace events for ioread/iowrite in ADC and PWM
- Use timer_get_ns in hw/timer/npcm7xx_timer.c
- Update commit message in ADC/PWM to mention qom-get/set method for usage
- Fix typos

Changes since v1:
- We removed the IPMI and KCS related code from this patch set.

Hao Wu (5):
  hw/misc: Add clock converter in NPCM7XX CLK module
  hw/timer: Refactor NPCM7XX Timer to use CLK clock
  hw/adc: Add an ADC module for NPCM7XX
  hw/misc: Add a PWM module for NPCM7XX
  hw/misc: Add QTest for NPCM7XX PWM Module

 docs/system/arm/nuvoton.rst      |   4 +-
 hw/adc/meson.build               |   1 +
 hw/adc/npcm7xx_adc.c             | 321 +++++++++++++
 hw/adc/trace-events              |   5 +
 hw/arm/npcm7xx.c                 |  55 ++-
 hw/misc/meson.build              |   1 +
 hw/misc/npcm7xx_clk.c            | 795 ++++++++++++++++++++++++++++++-
 hw/misc/npcm7xx_pwm.c            | 559 ++++++++++++++++++++++
 hw/misc/trace-events             |   6 +
 hw/timer/npcm7xx_timer.c         |  23 +-
 include/hw/adc/npcm7xx_adc.h     |  72 +++
 include/hw/arm/npcm7xx.h         |   4 +
 include/hw/misc/npcm7xx_clk.h    | 146 +++++-
 include/hw/misc/npcm7xx_pwm.h    | 106 +++++
 include/hw/timer/npcm7xx_timer.h |   1 +
 meson.build                      |   1 +
 tests/qtest/meson.build          |   4 +-
 tests/qtest/npcm7xx_adc-test.c   | 400 ++++++++++++++++
 tests/qtest/npcm7xx_pwm-test.c   | 490 +++++++++++++++++++
 19 files changed, 2964 insertions(+), 30 deletions(-)
 create mode 100644 hw/adc/npcm7xx_adc.c
 create mode 100644 hw/adc/trace-events
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 include/hw/adc/npcm7xx_adc.h
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 tests/qtest/npcm7xx_adc-test.c
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c

-- 
2.29.2.684.gfbc64c5ab5-goog


