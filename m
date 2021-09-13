Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE03D409DF1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 22:10:39 +0200 (CEST)
Received: from localhost ([::1]:59850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPsHm-0000MU-Se
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 16:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPsDA-00075g-ML
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:05:52 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPsD8-0006so-Io
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:05:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso238858wme.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 13:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIcj1hgiZyqDMsGQ6jO4HcM16dBq9ozIL/ZSfyDi0Oo=;
 b=nErP+ofpjduDeuSzk9GzflADblq2LSthEoVHrSS+/p96Qz6CpxM2DGXUUTOYIumt6w
 ZxH22kzLmYUQn67g2hdeIfo4IJwl/IvIT5rY3wbliF78mDhVbqlSDepGEiTZaw1v3sUW
 Uy8u/70zGa2oIfagJ6Quz8NOnTVh6fnZ6SA/FrTltIL/BqB8r7JOF0c1xkap/lP+ep/d
 xRhMsB+/JUrS3s2qynkqElJgaBFWklVQat5W0q3oCnTZehdgH4LTHP6OuaWUO1C0iBzr
 3XQYDmhhTLLICoPaiMHYabsiZnd6luKUD4d5qQ7efS5NoESO3uJj7hiqKJYtrf2hGf+W
 td/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIcj1hgiZyqDMsGQ6jO4HcM16dBq9ozIL/ZSfyDi0Oo=;
 b=tJ9DxaGcGDIQCtHNgUluX66+No4lcq7rJK0j7s5v/bLUylDRAAaQiIlR+YAbk1vNhH
 tp/GQxLSZpgaTnpe78bcloJ3VwxGUJ+uWv1LmYvdOhNKfMX5qUQ6pFcU2tHDv2UsB2Bl
 qpeSSPgJTINva7BagbXeOla0ZJhUAyP2wMs+pKO6KHfEQx80qQXtMc5MWPD+vabZIfff
 IlNipStCMiQc761/vJ1VWSDC0n0gGPCByJrhG5hXvnNL6LtexH/2hqhNlGa9PmTIAXDa
 zV00P8RrNUohX4awjKusku/9xEjCoyfmG6IoDGL/tbPMNPuB4ZIiTrxMS6PlK+FIt70d
 p4Ag==
X-Gm-Message-State: AOAM5333saAV4XOGWil4ReVjDXprlPI8kDEf8qn9K3LO9g79ycElQ6h4
 kZV/6H4ljSyRKF79iewjZ0LXxlij9WwPuQ==
X-Google-Smtp-Source: ABdhPJw5xLEP/T1s45N3uIJD2lPX7skmlgQauGra4MZzRfOvo0ZlIAzJ73fDFwQnPPzbUQYnYrFa4g==
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr13015049wme.146.1631563548727; 
 Mon, 13 Sep 2021 13:05:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a25sm6957wmj.34.2021.09.13.13.05.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 13:05:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v4 00/23] target-arm queue
Date: Mon, 13 Sep 2021 21:05:46 +0100
Message-Id: <20210913200546.9338-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

v3->v4: Windows headers define an INT type which clashed
with an enum value name in arm_gicv3_its.c...

The following changes since commit eae587e8e3694b1aceab23239493fb4c7e1a80f5:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-13' into staging (2021-09-13 11:00:30 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210913-3

for you to fetch changes up to 28e987a7e7edaa3ca7feeac65edca26145df8814:

  hw/arm/mps2.c: Mark internal-only I2C buses as 'full' (2021-09-13 21:01:08 +0100)

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

