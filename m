Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8614338F30
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:54:35 +0100 (CET)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiFO-0004hz-SI
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCg-0002jc-U7
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:46 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCe-0001uK-Lt
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:46 -0500
Received: by mail-wm1-x343.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so4597941wmq.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ijGs+AtHaUPnN3zpp7FwKr2JYmXdKSPvvkjlw/LNLvU=;
 b=QzXUAzw7MoLFIlMW8gzDRdR3AsheMpOgX8q1ALpd1nM/c1hmbeV+fuxOzgDGqr1bwg
 QwchUGoyiNSo94MLPztXCoJ40c17MbimiuGS+MzGpFyDo8EsB+wmW5F2AD+jMHP+b4ah
 7aBhVF8KRgqTclIb0H2rjwcahPK5wD25Um61PRp+fg8k0PukvQULuvD0m1FkrlUdZxmm
 EHVVtBgAaclJoyjUi5nTILE3fFXqKSPBhCUlRHOLYuYRJVx7opkcCNiUrJeTtA3BUzFc
 hIp9Joh2TxBA0WexvRUOYkwQ0GguD+A+BN9ZbecZQBkweL+kieFrJEKcpxzCBGbzA8GC
 X1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ijGs+AtHaUPnN3zpp7FwKr2JYmXdKSPvvkjlw/LNLvU=;
 b=S5vANxrXUZZ/3vClSEwfCHc0VqcOiTDr5ONmthW311rpz+/8E08Ndb5vsfmS4+O2FH
 Bc/TyiyYPfN9B9i0HuYqydQkYiRJgyihy582Mt7rFm8xaHfYqbpB5v4C/506499uMWIZ
 t0X38kODMPBEp2ft/oEWMWcq1E6cYYg/mRU5oH0SiBVptmnaT3sqhaOTq4p/9wyTn7rX
 nNBTTd1EGzahs/KHYrjVCPXOgFZRUQZG96ebCh0SbSL9NWUkMWWTAPvKgwmRvPE/D2D2
 pqnKiA3GKoPGCiTm1tQL7AKVPCekxjRhtLyPAWzZUIPZ+Qcx25GOxQThe072f9+Pazbk
 J33w==
X-Gm-Message-State: AOAM531W9iyiVYJ4gnTiWPEMGVYZS+bF/j5lHJUiVm0IOawJe5V2Sz7F
 3b2CFBRv5txcg1W9ngLmh4tIzhStloIgfaOE
X-Google-Smtp-Source: ABdhPJwraCd9qe8maeJBi/DJPzcEtLeQq6sfcU65S/z9LmCjG9uASTQTU98VhnjSlK3ACr05Doye7Q==
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr13261210wmk.101.1615557102929; 
 Fri, 12 Mar 2021 05:51:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/39] target-arm queue
Date: Fri, 12 Mar 2021 13:51:01 +0000
Message-Id: <20210312135140.1099-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Last pullreq before 6.0 softfreeze: a few minor feature patches,
some bugfixes, some cleanups.

-- PMM

The following changes since commit 6f34661b6c97a37a5efc27d31c037ddeda4547e2:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-03-11 18:55:27 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210312-1

for you to fetch changes up to 41f09f2e9f09e4dd386d84174a6dcb5136af17ca:

  hw/display/pxa2xx: Inline template header (2021-03-12 13:26:08 +0000)

----------------------------------------------------------------
target-arm queue:
 * versal: Support XRAMs and XRAM controller
 * smmu: Various minor bug fixes
 * SVE emulation: fix bugs handling odd vector lengths
 * allwinner-sun8i-emac: traverse transmit queue using TX_CUR_DESC register value
 * tests/acceptance: fix orangepi-pc acceptance tests
 * hw/timer/sse-timer: Propagate eventual error in sse_timer_realize()
 * hw/arm/virt: KVM: The IPA lower bound is 32
 * npcm7xx: support MFT module
 * pl110, pxa2xx_lcd: tidy up template headers

----------------------------------------------------------------
Andrew Jones (2):
      accel: kvm: Fix kvm_type invocation
      hw/arm/virt: KVM: The IPA lower bound is 32

Edgar E. Iglesias (2):
      hw/misc: versal: Add a model of the XRAM controller
      hw/arm: versal: Add support for the XRAMs

Eric Auger (7):
      intel_iommu: Fix mask may be uninitialized in vtd_context_device_invalidate
      dma: Introduce dma_aligned_pow2_mask()
      virtio-iommu: Handle non power of 2 range invalidations
      hw/arm/smmu-common: Fix smmu_iotlb_inv_iova when asid is not set
      hw/arm/smmuv3: Enforce invalidation on a power of two range
      hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
      hw/arm/smmuv3: Uniformize sid traces

Hao Wu (5):
      hw/misc: Add GPIOs for duty in NPCM7xx PWM
      hw/misc: Add NPCM7XX MFT Module
      hw/arm: Add MFT device to NPCM7xx Soc
      hw/arm: Connect PWM fans in NPCM7XX boards
      tests/qtest: Test PWM fan RPM using MFT in PWM test

Niek Linnenbank (5):
      hw/net/allwinner-sun8i-emac: traverse transmit queue using TX_CUR_DESC register value
      tests/acceptance/boot_linux_console: remove Armbian 19.11.3 bionic test for orangepi-pc machine
      tests/acceptance/boot_linux_console: change URL for test_arm_orangepi_bionic_20_08
      tests/acceptance: update sunxi kernel from armbian to 5.10.16
      tests/acceptance: drop ARMBIAN_ARTIFACTS_CACHED condition for orangepi-pc, cubieboard tests

Peter Maydell (9):
      hw/display/pl110: Remove dead code for non-32-bpp surfaces
      hw/display/pl110: Pull included-once parts of template header into pl110.c
      hw/display/pl110: Remove use of BITS from pl110_template.h
      hw/display/pxa2xx_lcd: Remove dead code for non-32-bpp surfaces
      hw/display/pxa2xx_lcd: Remove dest_width state field
      hw/display/pxa2xx: Remove use of BITS in pxa2xx_template.h
      hw/display/pxa2xx: Apply brace-related coding style fixes to template header
      hw/display/pxa2xx: Apply whitespace-only coding style fixes to template header
      hw/display/pxa2xx: Inline template header

Philippe Mathieu-Daudé (1):
      hw/timer/sse-timer: Propagate eventual error in sse_timer_realize()

Richard Henderson (8):
      target/arm: Fix sve_uzp_p vs odd vector lengths
      target/arm: Fix sve_zip_p vs odd vector lengths
      target/arm: Fix sve_punpk_p vs odd vector lengths
      target/arm: Update find_last_active for PREDDESC
      target/arm: Update BRKA, BRKB, BRKN for PREDDESC
      target/arm: Update CNTP for PREDDESC
      target/arm: Update WHILE for PREDDESC
      target/arm: Update sve reduction vs simd_desc

 docs/system/arm/nuvoton.rst            |   2 +-
 docs/system/arm/xlnx-versal-virt.rst   |   1 +
 hw/arm/smmu-internal.h                 |   5 +
 hw/display/pl110_template.h            | 120 +-------
 hw/display/pxa2xx_template.h           | 447 ---------------------------
 include/hw/arm/npcm7xx.h               |  13 +-
 include/hw/arm/xlnx-versal.h           |  13 +
 include/hw/boards.h                    |   1 +
 include/hw/misc/npcm7xx_mft.h          |  70 +++++
 include/hw/misc/npcm7xx_pwm.h          |   4 +-
 include/hw/misc/xlnx-versal-xramc.h    |  97 ++++++
 include/sysemu/dma.h                   |  12 +
 target/arm/kvm_arm.h                   |   6 +-
 accel/kvm/kvm-all.c                    |   2 +
 hw/arm/npcm7xx.c                       |  45 ++-
 hw/arm/npcm7xx_boards.c                |  99 ++++++
 hw/arm/smmu-common.c                   |  32 +-
 hw/arm/smmuv3.c                        |  58 ++--
 hw/arm/virt.c                          |  23 +-
 hw/arm/xlnx-versal.c                   |  36 +++
 hw/display/pl110.c                     | 123 +++++---
 hw/display/pxa2xx_lcd.c                | 520 ++++++++++++++++++++++++++-----
 hw/i386/intel_iommu.c                  |  32 +-
 hw/misc/npcm7xx_mft.c                  | 540 +++++++++++++++++++++++++++++++++
 hw/misc/npcm7xx_pwm.c                  |   4 +
 hw/misc/xlnx-versal-xramc.c            | 253 +++++++++++++++
 hw/net/allwinner-sun8i-emac.c          |  62 ++--
 hw/timer/sse-timer.c                   |   1 +
 hw/virtio/virtio-iommu.c               |  19 +-
 softmmu/dma-helpers.c                  |  26 ++
 target/arm/kvm.c                       |   4 +-
 target/arm/sve_helper.c                | 107 ++++---
 target/arm/translate-sve.c             |  26 +-
 tests/qtest/npcm7xx_pwm-test.c         | 205 ++++++++++++-
 hw/arm/trace-events                    |  24 +-
 hw/misc/meson.build                    |   2 +
 hw/misc/trace-events                   |   8 +
 tests/acceptance/boot_linux_console.py | 120 +++-----
 tests/acceptance/replay_kernel.py      |  10 +-
 39 files changed, 2235 insertions(+), 937 deletions(-)
 delete mode 100644 hw/display/pxa2xx_template.h
 create mode 100644 include/hw/misc/npcm7xx_mft.h
 create mode 100644 include/hw/misc/xlnx-versal-xramc.h
 create mode 100644 hw/misc/npcm7xx_mft.c
 create mode 100644 hw/misc/xlnx-versal-xramc.c

