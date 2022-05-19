Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7E52DB85
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:43:24 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkBF-00011I-J5
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk54-00061l-AU
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:36:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk51-0000oe-Ix
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:36:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id h14so8223524wrc.6
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pu3PGXHIw4yczAbnbKnFKBdpJfWd9TM/Fm6NP128j4Y=;
 b=u+faNHHt9kNTI61B5fwVuUOrRCgCIE+Y5x/W54pnPpJMMjeaxgb1QEszYISIjoQKPt
 gdPFTDXzaO4cUwYcDKwcI2TbCv1c0As+SDKZAdDcsqgOCd5AwdD85NJdoT/RMMsTXPUl
 GRoGBrMl4e9A/dMwX2Bit/Bem0Dxs5D7URF5iiCeIf70ZEqD1hKTnnswU5d7sO1JyGty
 ng2HZXUuJtZUdbwhVGmv3hZ+7StmfXw5JiSfcSV+zmyQ2639yPv0P+ng/f7LY1IxQ+3s
 uGO/FUCZpI9NXGSfKYCfYzIM5GkG+s652AmUzzsJrsSKseEemLUgbcwsxZFFcKi3oNnw
 9Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pu3PGXHIw4yczAbnbKnFKBdpJfWd9TM/Fm6NP128j4Y=;
 b=KpEJYgUd5P8mFKQe9I2qKQO394d5NzFU592pEdSMHb5rBi87MorO6BCgN3djCfaHZF
 CFMzP754wEtbH3CASv057/VS73mrhBfooUzy0mYxyoCCOOuaJbnzbGq68NguKDy9A3yL
 YXzctNleSeXZeEHmcze27ZPDU/3esTqJHeHK8RGTaY36/C6tfozLR/1QG3eQ8XA9x2ur
 0w6STY4w6sUuVZ5dzXxEeaZunhSMQzuXaUNuA3rw80Fx44OfiPBV+eT+blAPp+HFsleJ
 E/3tshqNq5xa/WMsWvp0+86pAMoZtwwqWWaBNscDCtt153Xe+t+pkq17j/5JblNL3I8P
 siuA==
X-Gm-Message-State: AOAM531v/fy0LKZ5L8xI/T4Xn0dPsD+tbycW850nXpn0EuUfXtnH4Qyq
 ydZ6wlxmVRodF0dYzaALJuBQUn7YhPzuqw==
X-Google-Smtp-Source: ABdhPJwqyv7gZHzu0TQMnx5k+kwQgQfUWwZhfutjD/EKmqS4eytjmKtsh/AD+GWFXvNgaQDqBZQhbg==
X-Received: by 2002:a5d:680b:0:b0:20d:932:8d55 with SMTP id
 w11-20020a5d680b000000b0020d09328d55mr5164867wru.389.1652981813576; 
 Thu, 19 May 2022 10:36:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.36.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:36:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/22] target-arm queue
Date: Thu, 19 May 2022 18:36:29 +0100
Message-Id: <20220519173651.399295-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

target-arm queue: mostly patches from me this time round.
Nothing too exciting.

-- PMM

The following changes since commit 78ac2eebbab9150edf5d0d00e3648f5ebb599001:

  Merge tag 'artist-cursor-fix-final-pull-request' of https://github.com/hdeller/qemu-hppa into staging (2022-05-18 09:32:15 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220519

for you to fetch changes up to fab8ad39fb75a0d9f097db67b2a334444754e88e:

  target/arm: Use FIELD definitions for CPACR, CPTR_ELx (2022-05-19 18:34:10 +0100)

----------------------------------------------------------------
target-arm queue:
 * Implement FEAT_S2FWB
 * Implement FEAT_IDST
 * Drop unsupported_encoding() macro
 * hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
 * Fix aarch64 debug register names
 * hw/adc/zynq-xadc: Use qemu_irq typedef
 * target/arm/helper.c: Delete stray obsolete comment
 * Make number of counters in PMCR follow the CPU
 * hw/arm/virt: Fix dtb nits
 * ptimer: Rename PTIMER_POLICY_DEFAULT to PTIMER_POLICY_LEGACY
 * target/arm: Fix PAuth keys access checks for disabled SEL2
 * Enable FEAT_HCX for -cpu max
 * Use FIELD definitions for CPACR, CPTR_ELx

----------------------------------------------------------------
Chris Howard (1):
      Fix aarch64 debug register names.

Florian Lugou (1):
      target/arm: Fix PAuth keys access checks for disabled SEL2

Peter Maydell (17):
      target/arm: Postpone interpretation of stage 2 descriptor attribute bits
      target/arm: Factor out FWB=0 specific part of combine_cacheattrs()
      target/arm: Implement FEAT_S2FWB
      target/arm: Enable FEAT_S2FWB for -cpu max
      target/arm: Implement FEAT_IDST
      target/arm: Drop unsupported_encoding() macro
      hw/intc/arm_gicv3_cpuif: Handle CPUs that don't specify GICv3 parameters
      hw/intc/arm_gicv3: report correct PRIbits field in ICV_CTLR_EL1
      hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
      hw/intc/arm_gicv3: Support configurable number of physical priority bits
      hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
      hw/intc/arm_gicv3: Provide ich_num_aprs()
      target/arm/helper.c: Delete stray obsolete comment
      target/arm: Make number of counters in PMCR follow the CPU
      hw/arm/virt: Fix incorrect non-secure flash dtb node name
      hw/arm/virt: Drop #size-cells and #address-cells from gpio-keys dtb node
      ptimer: Rename PTIMER_POLICY_DEFAULT to PTIMER_POLICY_LEGACY

Philippe Mathieu-Daudé (1):
      hw/adc/zynq-xadc: Use qemu_irq typedef

Richard Henderson (2):
      target/arm: Enable FEAT_HCX for -cpu max
      target/arm: Use FIELD definitions for CPACR, CPTR_ELx

 docs/system/arm/emulation.rst      |   2 +
 include/hw/adc/zynq-xadc.h         |   3 +-
 include/hw/intc/arm_gicv3_common.h |   8 +-
 include/hw/ptimer.h                |  16 +-
 target/arm/cpregs.h                |  24 +++
 target/arm/cpu.h                   |  76 +++++++-
 target/arm/internals.h             |  11 +-
 target/arm/translate-a64.h         |   9 -
 hw/adc/zynq-xadc.c                 |   4 +-
 hw/arm/boot.c                      |   2 +-
 hw/arm/musicpal.c                  |   2 +-
 hw/arm/virt.c                      |   4 +-
 hw/core/machine.c                  |   4 +-
 hw/dma/xilinx_axidma.c             |   2 +-
 hw/dma/xlnx_csu_dma.c              |   2 +-
 hw/intc/arm_gicv3_common.c         |   5 +
 hw/intc/arm_gicv3_cpuif.c          | 225 +++++++++++++++++-------
 hw/intc/arm_gicv3_kvm.c            |  16 +-
 hw/m68k/mcf5206.c                  |   2 +-
 hw/m68k/mcf5208.c                  |   2 +-
 hw/net/can/xlnx-zynqmp-can.c       |   2 +-
 hw/net/fsl_etsec/etsec.c           |   2 +-
 hw/net/lan9118.c                   |   2 +-
 hw/rtc/exynos4210_rtc.c            |   4 +-
 hw/timer/allwinner-a10-pit.c       |   2 +-
 hw/timer/altera_timer.c            |   2 +-
 hw/timer/arm_timer.c               |   2 +-
 hw/timer/digic-timer.c             |   2 +-
 hw/timer/etraxfs_timer.c           |   6 +-
 hw/timer/exynos4210_mct.c          |   6 +-
 hw/timer/exynos4210_pwm.c          |   2 +-
 hw/timer/grlib_gptimer.c           |   2 +-
 hw/timer/imx_epit.c                |   4 +-
 hw/timer/imx_gpt.c                 |   2 +-
 hw/timer/mss-timer.c               |   2 +-
 hw/timer/sh_timer.c                |   2 +-
 hw/timer/slavio_timer.c            |   2 +-
 hw/timer/xilinx_timer.c            |   2 +-
 target/arm/cpu.c                   |  11 +-
 target/arm/cpu64.c                 |  30 ++++
 target/arm/cpu_tcg.c               |   6 +
 target/arm/helper.c                | 348 ++++++++++++++++++++++++++++---------
 target/arm/kvm64.c                 |  12 ++
 target/arm/op_helper.c             |   9 +
 target/arm/translate-a64.c         |  36 +++-
 tests/unit/ptimer-test.c           |   6 +-
 46 files changed, 697 insertions(+), 228 deletions(-)

