Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24CB409C88
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 20:51:31 +0200 (CEST)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPr3C-0002of-Qk
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 14:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPr1x-00028I-Tf
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 14:50:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPr1v-00016y-Pq
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 14:50:13 -0400
Received: by mail-wr1-x430.google.com with SMTP id u15so10157654wru.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttXUllj9z66I7xp6xEk4oR6487RPHjxIFqHWO699Mhg=;
 b=zVX6sPI7Cc3seOWR8eEC7Ph0w090jWMEMB+9DE3SIynNLU2yGtbD9zGLbHH4H9sMPH
 z8fnKfLB9tbVsj2UDh9uNmRKMmeCnIBRypOZcHCCwOJPnuTPgmErsntgMg2Ffvuwp/xq
 pRB2ZZHF2tT+Q/zKHv2z4mSR2rD6OvzuATFdCeU65Rid/VOliBPWZPWjDeFLVrFZqcGx
 hkOxA0FM/QK1PaWrLtMd8P08TjeFyE1QcrNFQGCWM50yTQfZI5hOoPswBdJ4futCeL/a
 3aCQ+sgYW8e2Emm2rn65s+H2I58re1TBrcJrNhVJqMSRCX4FwHAhe0K3vV67TvFoox/w
 QCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttXUllj9z66I7xp6xEk4oR6487RPHjxIFqHWO699Mhg=;
 b=3EONtBcV9RGWL+xi+W92Eis8/RJFaFI4MwO1tfKlP3aNWG0dmD5qr+OSqdutPiParz
 Z/TbOTZFMyuDdupS1avjVeFzNXp6Z6sJU2Wy9LlNSclIK33A4RTl4MQTbUk3LzsCrAvI
 VQNvdctzAGxz2/gJqLLjJSNQgyr+ry0u+5VbwleyWexR5n86qFHWPvkNHo/LeHIkg9qL
 JDL1spzqNGv1A1PSTFlGCnn5EFZt/5xYbR0CDRGcdw6TRx1/6pc1i+LJ/7pUHcTk+/un
 D2GflqcJjYjJNd5j877vtz2FAA8fkawReNJj73w5PjL66khc9fZXjIDpZWph8kFGB6tJ
 Waqg==
X-Gm-Message-State: AOAM5335teJQfZE2eptZLouCxSFdWZm0QRYJkRKHGkSekiIazLcJvTTo
 /9fSZ5hdH8uqW64In+VptRb2eK71YaHXdQ==
X-Google-Smtp-Source: ABdhPJyzst7tJ7C8dsjiWNPBj7o82ktc64VZws9X62KM3fLkm9zBh1da0aMzbeOL3DJRb/EMZReEHw==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr14139768wrq.58.1631559009809; 
 Mon, 13 Sep 2021 11:50:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r27sm8105341wrr.70.2021.09.13.11.50.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 11:50:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/23] target-arm queue
Date: Mon, 13 Sep 2021 19:50:08 +0100
Message-Id: <20210913185008.8321-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

v3: really fix the format string nit (oops)

The following changes since commit eae587e8e3694b1aceab23239493fb4c7e1a80f5:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-13' into staging (2021-09-13 11:00:30 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210913-2

for you to fetch changes up to eec607843ca81eccab238fce86222be9c78b3675:

  hw/arm/mps2.c: Mark internal-only I2C buses as 'full' (2021-09-13 19:45:02 +0100)

----------------------------------------------------------------
target-arm queue:
 * mark MPS2/MPS3 board-internal i2c buses as 'full' so that command
   line user-created devices are not plugged into them
 * Take an exception if PSTATE.IL is set
 * Support an emulated ITS in the virt board
 * Add support for kudo-bmc board
 * Probe for KVM_CAP_ARM_VM_IPA_SIZE when creating scratch VM
 * cadence_uart: Fix clock handling issues that prevented
   u-boot from running

----------------------------------------------------------------
Bin Meng (6):
      hw/misc: zynq_slcr: Correctly compute output clocks in the reset exit phase
      hw/char: cadence_uart: Disable transmit when input clock is disabled
      hw/char: cadence_uart: Move clock/reset check to uart_can_receive()
      hw/char: cadence_uart: Convert to memop_with_attrs() ops
      hw/char: cadence_uart: Ignore access when unclocked or in reset for uart_{read, write}()
      hw/char: cadence_uart: Log a guest error when device is unclocked or in reset

Chris Rauer (1):
      hw/arm: Add support for kudo-bmc board.

Marc Zyngier (1):
      hw/arm/virt: KVM: Probe for KVM_CAP_ARM_VM_IPA_SIZE when creating scratch VM

Peter Maydell (5):
      target/arm: Take an exception if PSTATE.IL is set
      qdev: Support marking individual buses as 'full'
      hw/arm/mps2-tz.c: Add extra data parameter to MakeDevFn
      hw/arm/mps2-tz.c: Mark internal-only I2C buses as 'full'
      hw/arm/mps2.c: Mark internal-only I2C buses as 'full'

Richard Henderson (1):
      target/arm: Merge disas_a64_insn into aarch64_tr_translate_insn

Shashi Mallela (9):
      hw/intc: GICv3 ITS initial framework
      hw/intc: GICv3 ITS register definitions added
      hw/intc: GICv3 ITS command queue framework
      hw/intc: GICv3 ITS Command processing
      hw/intc: GICv3 ITS Feature enablement
      hw/intc: GICv3 redistributor ITS processing
      tests/data/acpi/virt: Add IORT files for ITS
      hw/arm/virt: add ITS support in virt GIC
      tests/data/acpi/virt: Update IORT files for ITS

 docs/system/arm/nuvoton.rst            |    1 +
 hw/intc/gicv3_internal.h               |  188 ++++-
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |   13 +
 include/hw/intc/arm_gicv3_its_common.h |   32 +-
 include/hw/qdev-core.h                 |   24 +
 target/arm/cpu.h                       |    1 +
 target/arm/kvm_arm.h                   |    4 +-
 target/arm/syndrome.h                  |    5 +
 target/arm/translate.h                 |    2 +
 hw/arm/mps2-tz.c                       |   92 ++-
 hw/arm/mps2.c                          |   12 +-
 hw/arm/npcm7xx_boards.c                |   34 +
 hw/arm/virt.c                          |   29 +-
 hw/char/cadence_uart.c                 |   61 +-
 hw/intc/arm_gicv3.c                    |   14 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |    7 +-
 hw/intc/arm_gicv3_dist.c               |    5 +-
 hw/intc/arm_gicv3_its.c                | 1322 ++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |    7 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  153 +++-
 hw/misc/zynq_slcr.c                    |   31 +-
 softmmu/qdev-monitor.c                 |    7 +-
 target/arm/helper-a64.c                |    1 +
 target/arm/helper.c                    |    8 +
 target/arm/kvm.c                       |    7 +-
 target/arm/translate-a64.c             |  255 +++---
 target/arm/translate.c                 |   21 +
 hw/intc/meson.build                    |    1 +
 tests/data/acpi/virt/IORT              |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp        |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem      |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb          |  Bin 0 -> 124 bytes
 35 files changed, 2144 insertions(+), 210 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

