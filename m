Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F632FAF2
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 14:52:24 +0100 (CET)
Received: from localhost ([::1]:40088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIXLy-0004NG-PA
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 08:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIXKs-0003qb-65
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 08:51:14 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIXKo-0003b4-SC
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 08:51:13 -0500
Received: by mail-wm1-x341.google.com with SMTP id
 a25-20020a1cf0190000b029010b1cbe2dd0so985822wmb.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y98ghVA/8l6Ehw8Ou9jb1xCfwEjeasLK0R1A40ezA0Q=;
 b=JFziYtJBdMbCHaYb82RwawZgBWp9hd8SrO/+40MBvjvbqPdBL2vFONVo7e4Wkwk2bJ
 c9RKHPptD8q1lRtvrw6eS4yhadF9/19Hf+LILPG6qWociJL72rMwB2VpEwGbFpycdOrY
 O6ygaBPZgtDUBFBA4BBeD2ywV4I4oStd1QeNH4MUiPFQe9O2qAmkMz0ycMJhdXeMPP2M
 EJcmDWXfPjvueJZtiG6sqYNIhUJQ/0HpXaCGPEcifCZNsVuV4gjSG9JqeL1FHnmwDxKu
 XNMdYlwVv8r1nyXs1eeBeYiK73X/v2/aXWncKoN3tC1gpmUEDH5dNj+GQRphLrDLPDKW
 afcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y98ghVA/8l6Ehw8Ou9jb1xCfwEjeasLK0R1A40ezA0Q=;
 b=momRoqxToDI7IbW1dm5qQ6i+1MX23JaRJwMCxhEElJKoDLlWGRi6GVQQYfl9vc+BWv
 eugnJAx+7SEoYmC/glvpO73nLiXd4+/wvIPXT25hCcEu2wreHuyNOdtHkDHkudBv2+QT
 UZnK8usA2FPquQgc15G77XUWSKHekszslWVrSsIHhEmYqMz+LXNugcsVmXAYGYEHgUyz
 Zp7O0GEEPwSPoPCO3hFNct4hNaH60tp0DP1GwFAKS/DuTcrBFz7tcZNVyzRYCpFquqke
 WhK6fRbTCXj7SEN6u9zb/J7E3OdaD/1TzoctJeLbz53lXHGrb7G/IDnNUrA3w+zTYB2b
 f0cg==
X-Gm-Message-State: AOAM533wsWHxT5kmrKflrKuKAstZ4tpdOEtCQ8CzgxFMThpxFZFSmYHA
 aZhS+/DkYaS9pNDPamqa9V4YZWtY3GoSJg==
X-Google-Smtp-Source: ABdhPJzBs/5iq7RWzZ+pTsBZ+zV8YUfwccbAcJ6jW+QS95v4AFY4E4U0H+MiWiTxPyiRBgZRUOaoRg==
X-Received: by 2002:a1c:a791:: with SMTP id q139mr13389589wme.20.1615038669374; 
 Sat, 06 Mar 2021 05:51:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l4sm2560679wrt.60.2021.03.06.05.51.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 05:51:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/49] target-arm queue
Date: Sat,  6 Mar 2021 13:51:06 +0000
Message-Id: <20210306135106.4961-1-peter.maydell@linaro.org>
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

v2: don't delete is_surface_bgr() definition, the ppc patches
that drop use of it from sm501 haven't hit master yet.

-- PMM

The following changes since commit 9a7beaad3dbba982f7a461d676b55a5c3851d312:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210304' into staging (2021-03-05 10:47:46 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210306

for you to fetch changes up to d2d837d68f7c493e4bc306a237d7f72db88a0201:

  hw/arm/mps2: Update old infocenter.arm.com URLs (2021-03-06 13:30:40 +0000)

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
 48 files changed, 3098 insertions(+), 618 deletions(-)
 delete mode 100644 hw/display/omap_lcd_template.h
 delete mode 100644 hw/display/tc6393xb_template.h
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 hw/net/npcm7xx_emc.c
 create mode 100644 tests/qtest/npcm7xx_emc-test.c

