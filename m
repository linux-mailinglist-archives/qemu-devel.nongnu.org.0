Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B903C32F218
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:03:59 +0100 (CET)
Received: from localhost ([::1]:36378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEnu-0006wL-Oy
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE31-0006Zz-RS
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:31 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2r-0007Og-Lf
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:31 -0500
Received: by mail-wr1-x444.google.com with SMTP id f12so2875959wrx.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IOsrdQC1yrQKM9UX/L9+YVUR80PMcwuX0Jm131QL3/0=;
 b=ZaltlWrPJulLLi0sc9G2q2qP8oLOFs4s729THs0l/WdgEl9KYExrbhNQ9Kj+CRIWig
 tFDYe257P72st81C1ceawMqU4Jp/DHjt9mRaenWcFB+ouGi5odypGshdC3qFFZ6jZQFe
 MymKydGSmsij6PA9Tm5vS9HDWFRiQRM7WnyU1QxCzn0z0nfMQRuRWSuVzggQG5DW9PYT
 r3JX2pcCWpjYIXk7oZT34r73o9cNEmpx+Dj/oQgBfHl3bXmklho7k+LwYFtdo1ckrgfn
 kQ23Q+vRXktntKT6Bz9VCVHBr6ogIPINDwzJ0AF2uj4ojwP5V4t3VC9RddPhYYT/gi68
 tecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IOsrdQC1yrQKM9UX/L9+YVUR80PMcwuX0Jm131QL3/0=;
 b=Ds3qHi0TJyN8GlIe5jN01YTrGTuY4fjuqBJM44jBNRQsAwUgliCZBGCOsDZiMk0tZL
 ddtgBxmSoRoeT6yZQaY8VTO/Fig9w+wVzZZvPQNwJaU9YrBCEYPFjlUNgZs69Tx0d28H
 U6WLYcaVUTU51X4xCA8dW6mVVgNqoqdji4NQN8JCfmVh2R7/r2KzX8BxaKHgRxCY6Yai
 W3FtiuxqdSD71WsxkQI//d//Iu9th8/jJhJ1o1XIFMeZsA0BqDOiGOX8VGeSiTlynXoQ
 qjB5XSBmYZqcMHafzz5PT/89bCoBkbIyZNm3pybElDMQTcJy1+MxtFhNbbbe2DOJXr7k
 dJ6Q==
X-Gm-Message-State: AOAM532Ml1Af+XCKswz/rQ0JeB38H1hgqvQD08i4JS2m3S8poEuzNNTh
 eSWyu+8CbsDrPGBkuBzYbXVyfLi89OYgqg==
X-Google-Smtp-Source: ABdhPJxsuwkVjje0gXboKtcicb0Th4dgsxYdthsyawClIPGUiuJyI3z7NbIahUdhB+0tDG1PqTMJvA==
X-Received: by 2002:adf:b609:: with SMTP id f9mr9976498wre.223.1614964517498; 
 Fri, 05 Mar 2021 09:15:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/49] target-arm queue
Date: Fri,  5 Mar 2021 17:14:26 +0000
Message-Id: <20210305171515.1038-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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

target-arm queue: I have a lot more still in my to-review
queue, but my rule of thumb is when I get to 50 patches or
so to send out what I have.

thanks
-- PMM

The following changes since commit 9a7beaad3dbba982f7a461d676b55a5c3851d312:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210304' into staging (2021-03-05 10:47:46 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210305

for you to fetch changes up to 2c669ff88ec6733420a000103a2b8b9e93df4945:

  hw/arm/mps2: Update old infocenter.arm.com URLs (2021-03-05 15:17:38 +0000)

----------------------------------------------------------------
 * sbsa-ref: remove cortex-a53 from list of supported cpus
 * sbsa-ref: add 'max' to list of allowed cpus
 * target/arm: Add support for FEAT_SSBS, Speculative Store Bypass Safe
 * npcm7xx: add EMC model
 * xlnx-zynqmp: Remove obsolete 'has_rpu' property
 * target/arm: Speed up aarch64 TBL/TBX
 * virtio-mmio: improve virtio-mmio get_dev_path alog
 * target/arm: Use TCF0 and TFSRE0 for unprivileged tag checks
 * target/arm: Restrict v8M IDAU to TCG
 * target/arm/cpu: Update coding style to make checkpatch.pl happy
 * musicpal, tc6393xb, omap_lcdc, tcx: drop dead code for non-32-bit-RGB surfaces
 * Add new board: mps3-an524

----------------------------------------------------------------
Doug Evans (3):
      hw/net: Add npcm7xx emc model
      hw/arm: Add npcm7xx emc model
      tests/qtests: Add npcm7xx emc model test

Marcin Juszkiewicz (2):
      sbsa-ref: remove cortex-a53 from list of supported cpus
      sbsa-ref: add 'max' to list of allowed cpus

Peter Collingbourne (1):
      target/arm: Use TCF0 and TFSRE0 for unprivileged tag checks

Peter Maydell (34):
      hw/arm/musicpal: Remove dead code for non-32-bit-RGB surfaces
      hw/display/tc6393xb: Remove dead code for handling non-32bpp surfaces
      hw/display/tc6393xb: Expand out macros in template header
      hw/display/tc6393xb: Inline tc6393xb_draw_graphic32() at its callsite
      hw/display/omap_lcdc: Expand out macros in template header
      hw/display/omap_lcdc: Drop broken bigendian ifdef
      hw/display/omap_lcdc: Fix coding style issues in template header
      hw/display/omap_lcdc: Inline template header into C file
      hw/display/omap_lcdc: Delete unnecessary macro
      hw/display/tcx: Drop unnecessary code for handling BGR format outputs
      hw/arm/mps2-tz: Make SYSCLK frequency board-specific
      hw/misc/mps2-scc: Support configurable number of OSCCLK values
      hw/arm/mps2-tz: Correct the OSCCLK settings for mps2-an505 and mps2-an511
      hw/arm/mps2-tz: Make the OSCCLK settings be configurable per-board
      hw/misc/mps2-fpgaio: Make number of LEDs configurable by board
      hw/misc/mps2-fpgaio: Support SWITCH register
      hw/arm/mps2-tz: Make FPGAIO switch and LED config per-board
      hw/arm/mps2-tz: Condition IRQ splitting on number of CPUs, not board type
      hw/arm/mps2-tz: Make number of IRQs board-specific
      hw/misc/mps2-scc: Implement CFG_REG5 and CFG_REG6 for MPS3 AN524
      hw/arm/mps2-tz: Correct wrong interrupt numbers for DMA and SPI
      hw/arm/mps2-tz: Allow PPCPortInfo structures to specify device interrupts
      hw/arm/mps2-tz: Move device IRQ info to data structures
      hw/arm/mps2-tz: Size the uart-irq-orgate based on the number of UARTs
      hw/arm/mps2-tz: Allow boards to have different PPCInfo data
      hw/arm/mps2-tz: Make RAM arrangement board-specific
      hw/arm/mps2-tz: Set MachineClass default_ram info from RAMInfo data
      hw/arm/mps2-tz: Support ROMs as well as RAMs
      hw/arm/mps2-tz: Get armv7m_load_kernel() size argument from RAMInfo
      hw/arm/mps2-tz: Add new mps3-an524 board
      hw/arm/mps2-tz: Stub out USB controller for mps3-an524
      hw/arm/mps2-tz: Provide PL031 RTC on mps3-an524
      docs/system/arm/mps2.rst: Document the new mps3-an524 board
      hw/arm/mps2: Update old infocenter.arm.com URLs

Philippe Mathieu-Daudé (4):
      hw/arm/xlnx-zynqmp: Remove obsolete 'has_rpu' property
      hw/i2c/npcm7xx_smbus: Simplify npcm7xx_smbus_init()
      target/arm: Restrict v8M IDAU to TCG
      target/arm/cpu: Update coding style to make checkpatch.pl happy

Rebecca Cran (3):
      target/arm: Add support for FEAT_SSBS, Speculative Store Bypass Safe
      target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
      target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU

Richard Henderson (1):
      target/arm: Speed up aarch64 TBL/TBX

schspa (1):
      virtio-mmio: improve virtio-mmio get_dev_path alog

 docs/system/arm/mps2.rst         |  24 +-
 docs/system/arm/nuvoton.rst      |   3 +-
 hw/display/omap_lcd_template.h   | 169 --------
 hw/display/tc6393xb_template.h   |  72 ----
 include/hw/arm/armsse.h          |   4 +-
 include/hw/arm/npcm7xx.h         |   2 +
 include/hw/arm/xlnx-zynqmp.h     |   2 -
 include/hw/misc/armsse-cpuid.h   |   2 +-
 include/hw/misc/armsse-mhu.h     |   2 +-
 include/hw/misc/iotkit-secctl.h  |   2 +-
 include/hw/misc/iotkit-sysctl.h  |   2 +-
 include/hw/misc/iotkit-sysinfo.h |   2 +-
 include/hw/misc/mps2-fpgaio.h    |   8 +-
 include/hw/misc/mps2-scc.h       |  10 +-
 include/hw/net/npcm7xx_emc.h     | 286 +++++++++++++
 include/ui/console.h             |  10 -
 target/arm/cpu.h                 |  15 +-
 target/arm/helper-a64.h          |   2 +-
 target/arm/internals.h           |   6 +
 hw/arm/mps2-tz.c                 | 632 +++++++++++++++++++++++-----
 hw/arm/mps2.c                    |   5 +
 hw/arm/musicpal.c                |  64 ++-
 hw/arm/npcm7xx.c                 |  50 ++-
 hw/arm/sbsa-ref.c                |   2 +-
 hw/arm/xlnx-zynqmp.c             |   6 -
 hw/display/omap_lcdc.c           | 129 +++++-
 hw/display/tc6393xb.c            |  48 +--
 hw/display/tcx.c                 |  31 +-
 hw/i2c/npcm7xx_smbus.c           |   1 -
 hw/misc/armsse-cpuid.c           |   2 +-
 hw/misc/armsse-mhu.c             |   2 +-
 hw/misc/iotkit-sysctl.c          |   2 +-
 hw/misc/iotkit-sysinfo.c         |   2 +-
 hw/misc/mps2-fpgaio.c            |  43 +-
 hw/misc/mps2-scc.c               |  93 ++++-
 hw/net/npcm7xx_emc.c             | 857 ++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-mmio.c          |  13 +-
 target/arm/cpu.c                 |  23 +-
 target/arm/cpu64.c               |   5 +
 target/arm/cpu_tcg.c             |   8 +
 target/arm/helper-a64.c          |  32 --
 target/arm/helper.c              |  39 +-
 target/arm/mte_helper.c          |  13 +-
 target/arm/translate-a64.c       |  70 +---
 target/arm/vec_helper.c          |  48 +++
 tests/qtest/npcm7xx_emc-test.c   | 862 +++++++++++++++++++++++++++++++++++++++
 hw/net/meson.build               |   1 +
 hw/net/trace-events              |  17 +
 tests/qtest/meson.build          |   3 +-
 49 files changed, 3098 insertions(+), 628 deletions(-)
 delete mode 100644 hw/display/omap_lcd_template.h
 delete mode 100644 hw/display/tc6393xb_template.h
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 hw/net/npcm7xx_emc.c
 create mode 100644 tests/qtest/npcm7xx_emc-test.c

