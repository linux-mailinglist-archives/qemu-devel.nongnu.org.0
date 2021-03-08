Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F06330CDE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:59:05 +0100 (CET)
Received: from localhost ([::1]:36752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEXQ-0005Jp-7x
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJEVe-0003sV-VZ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:57:14 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJEVc-0003nC-OD
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:57:14 -0500
Received: by mail-wr1-x443.google.com with SMTP id 7so11172323wrz.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MIfRIt1hAilV28gy33HOVuvZTe40J4hcK5MC2Ki+9I8=;
 b=jCGcyzzi2/TXlUTIEOEqKcJhoud1a8Vw69jJ+lFbjtZX52V+eZ6XULNHQqY8cnO3cL
 4TAOLBUYSOO1VfKaqBxaDH1Rp7V7NzyQbWefLqGtPEDX13VM3elBmbXKvW2SuE5vjXzf
 +CPMj5FmvLzHsI5WM0Bt5VW3DGoli4RHNm2ogBemfu2JO5yzQakV8MtOSlYuT//pHGKh
 /uFHL/57kMwx1i2x4ohjoA4qlY6Nn7P9RgTsjIxrc287VLG6jbdDhE+U3i+fbk9+L3IA
 kmyZb/ikyVckJeK9Z2PTDWnrWLEYPKh3plTHU6ireqONl7TUy0bgz0EhseDcROn2t3lF
 JO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MIfRIt1hAilV28gy33HOVuvZTe40J4hcK5MC2Ki+9I8=;
 b=TB45ikptqVHaEU4rOjScCE3wheed/WjhzTIrt72LO2l+TZRu7vXNf6dpNJ6VACQ6px
 ByZJZIYsQtyxw3Cvzqquxn/ItrwxjDWh/m1SrpX5H8O4kr0DBn/5sQGKzxHSirfHVOn4
 y3IX7M8/N+uajXCCg1RMkqSEkwHCjtQRjnb6GVBq4l/e9+nSRUhM266LlVvVoreA/G1r
 1z/lDUO/jg/wBXuJbEp1W+svrWMEJUWV9O++ga3nFRvPiPV8Vqh+Vd7mgt78VTlSkKUa
 2VBZ8OK2dZz8jEsbC+TVVeb9D6En2e+Igd0vIw4/Jz30hkALuL3C5y9NFYXaCyrow/zU
 e63A==
X-Gm-Message-State: AOAM532m3KzOFULMam5cj19GhO7WNqrK5QyFbhOYwGOf4FzRdpqylk+g
 XiapPshztO0dESEgbhXJRrGhsy9ej9XOCg==
X-Google-Smtp-Source: ABdhPJxNs5H1oTf8j8hHpa9RoZvZYx+zLnq+hhwtdEg2nM6hchHRSHZIwOWbfQEKRpPhYkprlB6JZQ==
X-Received: by 2002:adf:d205:: with SMTP id j5mr12850642wrh.211.1615204631227; 
 Mon, 08 Mar 2021 03:57:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l22sm18987221wrb.4.2021.03.08.03.57.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 03:57:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/49] target-arm queue
Date: Mon,  8 Mar 2021 11:57:09 +0000
Message-Id: <20210308115709.8226-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
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

v3: fix test failure on 32-bit hosts due to new board defaulting to 2GB RAM.

-- PMM

The following changes since commit 9a7beaad3dbba982f7a461d676b55a5c3851d312:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210304' into staging (2021-03-05 10:47:46 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210308

for you to fetch changes up to 50b52b18cdb9294ce83dd49bb60b8e55a6526ea0:

  hw/arm/mps2: Update old infocenter.arm.com URLs (2021-03-08 11:54:16 +0000)

----------------------------------------------------------------
target-arm queue:
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
 target/arm/cpu.h                 |  15 +-
 target/arm/helper-a64.h          |   2 +-
 target/arm/internals.h           |   6 +
 hw/arm/mps2-tz.c                 | 642 ++++++++++++++++++++++++-----
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
 48 files changed, 3108 insertions(+), 618 deletions(-)
 delete mode 100644 hw/display/omap_lcd_template.h
 delete mode 100644 hw/display/tc6393xb_template.h
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 hw/net/npcm7xx_emc.c
 create mode 100644 tests/qtest/npcm7xx_emc-test.c

