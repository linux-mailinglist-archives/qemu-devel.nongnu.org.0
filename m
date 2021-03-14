Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B095033A4F9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 14:20:42 +0100 (CET)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLQff-0004H3-JQ
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 09:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLQdf-0003Nm-A9
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:18:35 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLQdd-0004JG-AR
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:18:35 -0400
Received: by mail-wm1-x341.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso18608934wma.4
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rlZnoS2sCAo+26WnpiCpYE961MtbPW4bBKTcyX7SLxw=;
 b=gsY2Gcp4uDnpIWRTFW+nF29+Cu9d4DQZ7E4lfMZq/6OKdj/Ekg8gq3KstM+sfj0flP
 j7yw29CfdPlB3Xaa3VZZ9HWVTFnReJLsaZPc1ZYTBy8m+RORCqnD3QADDgwnXvDesW3T
 bR8p8x6umUOlYjzDBZxMKy0IaeUnBHvpm7MoHSQU99mLA0w99JzqBngWyQrE2msXXfXv
 S+sOBK+lGdrq3LqAIZBtAbYMXjs1R51O5RsIEK5OuQ6LUd1wuPvvh+LkiMKIfLS56UDs
 gKsyz4+dJ79ahmLYAiW4aFHh+1uXHmm6HMQbGxoaLOMCFRpNLEu2GceO3DtiTHQeXAPB
 HVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rlZnoS2sCAo+26WnpiCpYE961MtbPW4bBKTcyX7SLxw=;
 b=fCwX68Czy5xb1Wqf5lRoFJkdbQc5zK/W07ZGkq+LXbZaw5YHIh/AhiGw7c0YVNRdfb
 MBCSxVGTPRSCFYc3u1VIbYH3b+SxZqjC4LEnfk7EEdwKd56P8PGFIWUYG+ulE8+PT6LZ
 YkUC/TYKTsUkcsoxGncYLmkMXoZMapD/RnL5ZLaQ7++Z9ndF9Ph1KHkFVyFBev6ERgL5
 zcj3CN+hJ+P1g1z5GFoppc8Os6H14r5b3MWggoIqOoX2D/TfT1oPMaG5LhGT+FGLRNHM
 LSRGr3ib2ONNhGlCGyXKxmAFJwPa+1LPf0Plor8Q8SUr+cV4wudhMKwLzanCfEpzli2a
 IeYw==
X-Gm-Message-State: AOAM533wHylvFZv4Ti5NOG/nBccmGiBiUAox6Vx/AYhRqV8qiCXsbMIK
 yjQwKNBcq++cC8wubbtaXiODWSt/AsX5AfNT
X-Google-Smtp-Source: ABdhPJzhf/qp3MjWFcs7prLEwboX9Tn81fRz1rKG/8LMHsvyZC5mqC8G1uIxveeLVyF1Ui2/A0UzEg==
X-Received: by 2002:a05:600c:2053:: with SMTP id
 p19mr21833726wmg.87.1615727911284; 
 Sun, 14 Mar 2021 06:18:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e1sm16258867wrd.44.2021.03.14.06.18.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 06:18:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/39] target-arm queue
Date: Sun, 14 Mar 2021 13:18:29 +0000
Message-Id: <20210314131829.8430-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
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

v2: fix format-string issue in a test case.

-- PMM

The following changes since commit 6f34661b6c97a37a5efc27d31c037ddeda4547e2:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-03-11 18:55:27 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210314

for you to fetch changes up to 6500ac13ff8e5c64ca69f5ef5d456028cfda6139:

  hw/display/pxa2xx: Inline template header (2021-03-14 13:14:56 +0000)

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

