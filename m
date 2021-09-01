Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDB93FD7CA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:39:34 +0200 (CEST)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNeX-00013t-Fi
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc6-0006ip-9K
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:02 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc1-0005aA-LW
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:02 -0400
Received: by mail-wr1-x433.google.com with SMTP id v10so3742314wrd.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qgVaYXf3HsO0RGe0hiE1n/5Yrl8NRFtENnTFmT8MISI=;
 b=qxkHl+ZbDPSlLv983jO8XiL6ismuoQSU8clwq8jZLQVYicuvaKwAXTJwW/OKcxmAPh
 /EQ4BmWEHbAr0Kq07XhmqERoCyjWhsGqJudbOk6rHtSD0bvkNLjadWj/WXACKWhBvVvF
 ziJObzjv0nb++DhTurGQ35hOaqDm1aUBA+UkEfDFKyBMM42BMCPwyNGC0fGzCEmp+Hlx
 IT73hKaq4NUiyOyXDwTZ7R4wjZ7D1yzdo7OY4BKbbrIFErlvB4Q55qnkJiK3UwMOJMGH
 o2AvwnZonSOP1vVu6kIBy+8W6D+hxTMwHLQQrC8nGJmSXosFniNszCk7PapK1bRnO8xd
 Wn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qgVaYXf3HsO0RGe0hiE1n/5Yrl8NRFtENnTFmT8MISI=;
 b=KLJxURwxUau8j3RRtnui7tGbpOXeZJ7vMGV+kCg8i78SBEJK292xjMHjxYNtL3O04u
 zFyL2w3ZLjIIafizT/q6RQKimkKckgHU1hi8bNAtsDBcvuRZqRrB2zbLs6bomnRKGeY0
 7Y4UiR8XG9r1gijg534iO2/knwaO3c3+CmVkfg8XyEkvBnfJoy/rNkAtKPgtLmlEFUe8
 hi5qhu3qdXBNmlcEUP4oRHNugJ1gRG+zKm7P8K8IdJ7lB9KwznN9BLrwkhY+VHTRKPV5
 BvOz9q1lXTWv2Yw8c3Uq+VLHI7BeK/jx+wUiVEh4EZr4Wna3vP/uDswPMsJD5iRAq5/F
 l97g==
X-Gm-Message-State: AOAM5328NfeAADcFY5y9P858p2weRMxKE7je2fUbu55o5HNhB9SHNmxP
 k0dN2oaX5B8mKg7kJUZrR2J1UoYWgVjC5Q==
X-Google-Smtp-Source: ABdhPJy3+wfypp3hTsqDBaca8flKYSRH7SNkterYm9YMJdDD/WTMOrr/jSP3c8i5y+eXXRI1psBeRg==
X-Received: by 2002:adf:82a8:: with SMTP id 37mr37513752wrc.123.1630492615852; 
 Wed, 01 Sep 2021 03:36:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.36.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:36:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/51] target-arm queue
Date: Wed,  1 Sep 2021 11:36:02 +0100
Message-Id: <20210901103653.13435-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

The following changes since commit ec397e90d21269037280633b6058d1f280e27667:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210901-2' into staging (2021-09-01 08:33:02 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210901

for you to fetch changes up to 683754c7b61f9e2ff098720ec80c9ab86c54663d:

  arm: Remove system_clock_scale global (2021-09-01 11:08:21 +0100)

----------------------------------------------------------------
 * Refactor M-profile systick to use Clocks instead of system_clock_scale global
 * clock: Provide builtin multiplier/divider
 * Add A64FX processor model
 * Enable MVE emulation in Cortex-M55
 * hw: Add compat machines for 6.2
 * hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by booleans
 * hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases

----------------------------------------------------------------
Peter Maydell (43):
      target/arm: Implement MVE VADD (floating-point)
      target/arm: Implement MVE VSUB, VMUL, VABD, VMAXNM, VMINNM
      target/arm: Implement MVE VCADD
      target/arm: Implement MVE VFMA and VFMS
      target/arm: Implement MVE VCMUL and VCMLA
      target/arm: Implement MVE VMAXNMA and VMINNMA
      target/arm: Implement MVE scalar fp insns
      target/arm: Implement MVE fp-with-scalar VFMA, VFMAS
      softfloat: Remove assertion preventing silencing of NaN in default-NaN mode
      target/arm: Implement MVE FP max/min across vector
      target/arm: Implement MVE fp vector comparisons
      target/arm: Implement MVE fp scalar comparisons
      target/arm: Implement MVE VCVT between floating and fixed point
      target/arm: Implement MVE VCVT between fp and integer
      target/arm: Implement MVE VCVT with specified rounding mode
      target/arm: Implement MVE VCVT between single and half precision
      target/arm: Implement MVE VRINT insns
      target/arm: Enable MVE in Cortex-M55
      arm: Move M-profile RAS register block into its own device
      arm: Move systick device creation from NVIC to ARMv7M object
      arm: Move system PPB container handling to armv7m
      hw/timer/armv7m_systick: Add usual QEMU interface comment
      hw/timer/armv7m_systick: Add input clocks
      hw/arm/armv7m: Create input clocks
      armsse: Wire up systick cpuclk clock
      hw/arm/mps2.c: Connect up armv7m clocks
      clock: Provide builtin multiplier/divider
      hw/arm: Don't allocate separate MemoryRegions in stm32 SoC realize
      hw/arm/stm32f100: Wire up sysclk and refclk
      hw/arm/stm32f205: Wire up sysclk and refclk
      hw/arm/stm32f405: Wire up sysclk and refclk
      hw/arm/stm32vldiscovery: Delete trailing blank line
      hw/arm/nrf51: Wire up sysclk
      hw/arm/stellaris: split stellaris_sys_init()
      hw/arm/stellaris: Wire sysclk up to armv7m
      hw/arm/msf2_soc: Don't allocate separate MemoryRegions
      hw/arm/msf2: Use Clock input to MSF2_SOC instead of m3clk property
      hw/arm/msf2-soc: Wire up refclk
      hw/timer/armv7m_systick: Use clock inputs instead of system_clock_scale
      hw/arm/stellaris: Fix code style issues in GPTM code
      hw/arm/stellaris: Split stellaris-gptm into its own file
      hw/timer/stellaris-gptm: Use Clock input instead of system_clock_scale
      arm: Remove system_clock_scale global

Philippe Mathieu-Daudé (4):
      tests: Remove uses of deprecated raspi2/raspi3 machine names
      hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
      hw/intc/arm_gicv3_dist: Rename 64-bit accessors with 'q' suffix
      hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by booleans

Shuuichirou Ishii (3):
      target-arm: Add support for Fujitsu A64FX
      hw/arm/virt: target-arm: Add A64FX processor support to virt machine
      tests/arm-cpu-features: Add A64FX processor related tests

Yanan Wang (1):
      hw: Add compat machines for 6.2

 docs/about/deprecated.rst               |   7 -
 docs/about/removed-features.rst         |   7 +
 docs/devel/clocks.rst                   |  23 ++
 docs/devel/qgraph.rst                   |  38 +-
 docs/system/arm/virt.rst                |   1 +
 include/hw/arm/armv7m.h                 |  24 ++
 include/hw/arm/msf2-soc.h               |   8 +-
 include/hw/arm/nrf51_soc.h              |   2 +
 include/hw/arm/stm32f100_soc.h          |   8 +
 include/hw/arm/stm32f205_soc.h          |   8 +
 include/hw/arm/stm32f405_soc.h          |   3 +
 include/hw/boards.h                     |   3 +
 include/hw/clock.h                      |  29 ++
 include/hw/i386/pc.h                    |   3 +
 include/hw/intc/armv7m_nvic.h           |   8 -
 include/hw/misc/armv7m_ras.h            |  37 ++
 include/hw/timer/armv7m_systick.h       |  36 +-
 include/hw/timer/stellaris-gptm.h       |  51 +++
 target/arm/helper-mve.h                 | 142 +++++++
 target/arm/translate.h                  |   6 +
 tests/qtest/libqos/qgraph.h             |   6 +-
 tests/qtest/libqos/qgraph_internal.h    |   2 +-
 target/arm/mve.decode                   | 297 +++++++++++++--
 hw/arm/armsse.c                         |  20 +-
 hw/arm/armv7m.c                         | 260 ++++++++++++-
 hw/arm/mps2.c                           |  17 +-
 hw/arm/msf2-soc.c                       |  68 ++--
 hw/arm/msf2-som.c                       |   7 +-
 hw/arm/netduino2.c                      |  12 +-
 hw/arm/netduinoplus2.c                  |  12 +-
 hw/arm/nrf51_soc.c                      |  20 +-
 hw/arm/raspi.c                          |   2 -
 hw/arm/stellaris.c                      | 396 +++----------------
 hw/arm/stm32f100_soc.c                  |  47 ++-
 hw/arm/stm32f205_soc.c                  |  47 ++-
 hw/arm/stm32f405_soc.c                  |  30 ++
 hw/arm/stm32vldiscovery.c               |  13 +-
 hw/arm/virt.c                           |  12 +-
 hw/core/clock-vmstate.c                 |  40 +-
 hw/core/clock.c                         |  31 +-
 hw/core/machine.c                       |   3 +
 hw/i386/pc.c                            |   3 +
 hw/i386/pc_piix.c                       |  14 +-
 hw/i386/pc_q35.c                        |  13 +-
 hw/intc/arm_gicv3_dist.c                | 205 +++++-----
 hw/intc/armv7m_nvic.c                   | 274 +-------------
 hw/misc/armv7m_ras.c                    |  93 +++++
 hw/ppc/spapr.c                          |  17 +-
 hw/s390x/s390-virtio-ccw.c              |  14 +-
 hw/timer/armv7m_systick.c               | 118 ++++--
 hw/timer/stellaris-gptm.c               | 332 ++++++++++++++++
 target/arm/cpu64.c                      |  48 +++
 target/arm/cpu_tcg.c                    |   7 +-
 target/arm/mve_helper.c                 | 650 ++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c              | 277 +++++++++++++-
 target/arm/translate-neon.c             |   6 -
 tests/qtest/arm-cpu-features.c          |  13 +
 tests/qtest/boot-serial-test.c          |   2 +-
 tests/qtest/libqos/arm-raspi2-machine.c |   8 +-
 tests/unit/test-qgraph.c                |   2 +-
 fpu/softfloat-specialize.c.inc          |   1 -
 MAINTAINERS                             |   2 +
 hw/arm/Kconfig                          |   1 +
 hw/core/trace-events                    |   1 +
 hw/misc/meson.build                     |   2 +
 hw/timer/Kconfig                        |   3 +
 hw/timer/meson.build                    |   1 +
 tests/acceptance/boot_linux_console.py  |   6 +-
 68 files changed, 2928 insertions(+), 971 deletions(-)
 create mode 100644 include/hw/misc/armv7m_ras.h
 create mode 100644 include/hw/timer/stellaris-gptm.h
 create mode 100644 hw/misc/armv7m_ras.c
 create mode 100644 hw/timer/stellaris-gptm.c

