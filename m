Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A61833153D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:51:58 +0100 (CET)
Received: from localhost ([::1]:33346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJK2v-00023m-7S
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkR-0006IE-3A
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:51 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkO-0006zO-EZ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:50 -0500
Received: by mail-wr1-x442.google.com with SMTP id l11so8933264wrp.7
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ub1KYaAwQbAxGdTfogaRplLVglu2mnOQYUftS0MCTJQ=;
 b=w/H1wvy+BpdMrEAdOCrsKBXc32jPlaPadZvgP9F7vR1DAO27j24qesVnPK/im5vIqg
 7fXkKTWitcrmi73zJX5f9zOUGrgYma5Zc9d1Tc7yIfM/ISXTAhCLuhQMCFfJp+a7Az9q
 Nri7CabaDa9jI1cmfOVvE9u9NZ4xzczbml+C7iSlqkzSeqyOz5Zn0yQxFuIfYV2d5dvg
 wzmjR22qO7RfwkzJ6tMEpkvhUSMZ/MV3K2qp2SuXOAfQtK9hzg+UfssoqlBUxs6zMVdC
 CNHOezQ4UbZAWRx0xA3gEhCkts2DVoEPp/sRHTgPoRFpRQgUuZBjmEqq0UlxrHmEmbTR
 66mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ub1KYaAwQbAxGdTfogaRplLVglu2mnOQYUftS0MCTJQ=;
 b=mJUWfYVM/E2ugh6AzuuBRv87lt4BrKvxe+FrmhqjwYF/yirrDFZ2J/iCrbdKAvoa31
 RYE1j2d1CaNfmXCAhzvVC4A4ShH3FZWCqiyXLbMD3O7dJo+kJC477TyImdtaCt5S1OKW
 rR0unQVl1OPPNgDUcj4qmofftQfe689tQLST34C0XsiwoX7ec1SUs0ha5TgzsuaLF676
 TI+9bTk2A2coEhxYjedhZdp3fMlT/XequJfnkrfmut4Lh+H28PQJUXF7yMoIP5Iq0AjJ
 OzKVY7sJjFHMkh26Mhw+BLqSCoeHEnR/uFjDWCVLWrjbBWOgLUAF6rLwsGjiaGgy/FuH
 z11A==
X-Gm-Message-State: AOAM531Aw0bEN7eW3cSFYEKmYFHSImZrobIiNgXdXosUjC6cf+iFWEOn
 Jh4KzNVSw6+Vmpnc5DuAoO7IcPE95i8ZWA==
X-Google-Smtp-Source: ABdhPJwx4Gp86ditN2RT+qsULcAjxhQz7JIS6Qmp48LNvnyO2TP9Ig3RAcel/HzAlN959n4LyhX5SQ==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr24390218wrr.12.1615224766610; 
 Mon, 08 Mar 2021 09:32:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/54] target-arm queue
Date: Mon,  8 Mar 2021 17:31:50 +0000
Message-Id: <20210308173244.20710-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
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

This is almost all the mps3-an547 series, but there are a few
other bits in there too.

thanks
-- PMM


The following changes since commit 0436c55edf6b357ff56e2a5bf688df8636f83456:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-08 13:51:41 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210308-1

for you to fetch changes up to da2140183ac3a04b1ccb861aeac1f2c048c71b66:

  hw/timer/renesas_tmr: Fix use of uninitialized data in read_tcnt() (2021-03-08 17:20:04 +0000)

----------------------------------------------------------------
 * Add new mps3-an547 board
 * target/arm: Restrict v7A TCG cpus to TCG accel
 * Implement a Xilinx CSU DMA model
 * hw/timer/renesas_tmr: Fix use of uninitialized data in read_tcnt()

----------------------------------------------------------------
Peter Maydell (48):
      clock: Add ClockEvent parameter to callbacks
      clock: Add ClockPreUpdate callback event type
      clock: Add clock_ns_to_ticks() function
      hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
      hw/arm/armsse: Introduce SSE subsystem version property
      hw/misc/iotkit-sysctl: Remove is_sse200 flag
      hw/misc/iotkit-secctl.c: Implement SSE-300 PID register values
      hw/misc/iotkit-sysinfo.c: Implement SSE-300 PID register values
      hw/arm/armsse.c: Use correct SYS_CONFIG0 register value for SSE-300
      hw/misc/iotkit-sysinfo.c: Implement SYS_CONFIG1 and IIDR
      hw/timer/sse-counter: Model the SSE Subsystem System Counter
      hw/timer/sse-timer: Model the SSE Subsystem System Timer
      hw/misc/iotkit-sysctl: Add SSE-300 cases which match SSE-200 behaviour
      hw/misc/iotkit-sysctl: Handle CPU_WAIT, NMI_ENABLE for SSE-300
      hw/misc/iotkit-sysctl: Handle INITSVTOR* for SSE-300
      hw/misc/iotkit-sysctl: Implement dummy version of SSE-300 PWRCTRL register
      hw/misc/iotkit-sysctl: Handle SSE-300 changes to PDCM_PD_*_SENSE registers
      hw/misc/iotkit-sysctl: Implement SSE-200 and SSE-300 PID register values
      hw/arm/Kconfig: Move ARMSSE_CPUID and ARMSSE_MHU stanzas to hw/misc
      hw/misc/sse-cpu-pwrctrl: Implement SSE-300 CPU<N>_PWRCTRL register block
      hw/arm/armsse: Use an array for apb_ppc fields in the state structure
      hw/arm/armsse: Add a define for number of IRQs used by the SSE itself
      hw/arm/armsse: Add framework for data-driven device placement
      hw/arm/armsse: Move dual-timer device into data-driven framework
      hw/arm/armsse: Move watchdogs into data-driven framework
      hw/arm/armsse: Move s32ktimer into data-driven framework
      hw/arm/armsse: Move sysinfo register block into data-driven framework
      hw/arm/armsse: Move sysctl register block into data-driven framework
      hw/arm/armsse: Move PPUs into data-driven framework
      hw/arm/armsse: Add missing SSE-200 SYS_PPU
      hw/arm/armsse: Indirect irq_is_common[] through ARMSSEInfo
      hw/arm/armsse: Add support for SSE variants with a system counter
      hw/arm/armsse: Add support for TYPE_SSE_TIMER in ARMSSEDeviceInfo
      hw/arm/armsse: Support variants with ARMSSE_CPU_PWRCTRL block
      hw/arm/armsse: Add SSE-300 support
      hw/arm/mps2-tz: Make UART overflow IRQ board-specific
      hw/misc/mps2-fpgaio: Fold counters subsection into main vmstate
      hw/misc/mps2-fpgaio: Support AN547 DBGCTRL register
      hw/misc/mps2-scc: Implement changes for AN547
      hw/arm/mps2-tz: Support running APB peripherals on different clock
      hw/arm/mps2-tz: Make initsvtor0 setting board-specific
      hw/arm/mps2-tz: Add new mps3-an547 board
      docs/system/arm/mps2.rst: Document the new mps3-an547 board
      tests/qtest/sse-timer-test: Add simple test of the SSE counter
      tests/qtest/sse-timer-test: Test the system timer
      tests/qtest/sse-timer-test: Test counter scaling changes
      hw/timer/renesas_tmr: Prefix constants for CSS values with CSS_
      hw/timer/renesas_tmr: Fix use of uninitialized data in read_tcnt()

Philippe Mathieu-Daudé (1):
      target/arm: Restrict v7A TCG cpus to TCG accel

Xuzhou Cheng (5):
      hw/dma: Implement a Xilinx CSU DMA model
      hw/arm: xlnx-zynqmp: Clean up coding convention issues
      hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA module for QSPI
      hw/ssi: xilinx_spips: Clean up coding convention issues
      hw/ssi: xilinx_spips: Remove DMA related dead codes from zynqmp_spips

 docs/devel/clocks.rst                |   71 ++-
 docs/system/arm/mps2.rst             |    6 +-
 include/hw/arm/armsse-version.h      |   42 ++
 include/hw/arm/armsse.h              |   40 +-
 include/hw/arm/xlnx-zynqmp.h         |    5 +-
 include/hw/clock.h                   |   63 ++-
 include/hw/dma/xlnx_csu_dma.h        |   52 ++
 include/hw/misc/armsse-cpu-pwrctrl.h |   40 ++
 include/hw/misc/iotkit-secctl.h      |    2 +
 include/hw/misc/iotkit-sysctl.h      |   13 +-
 include/hw/misc/iotkit-sysinfo.h     |    2 +
 include/hw/misc/mps2-fpgaio.h        |    2 +
 include/hw/qdev-clock.h              |   17 +-
 include/hw/ssi/xilinx_spips.h        |    2 +-
 include/hw/timer/sse-counter.h       |  105 ++++
 include/hw/timer/sse-timer.h         |   53 ++
 hw/adc/npcm7xx_adc.c                 |    2 +-
 hw/arm/armsse.c                      | 1008 +++++++++++++++++++++++++---------
 hw/arm/mps2-tz.c                     |  168 +++++-
 hw/arm/xlnx-zynqmp.c                 |   21 +-
 hw/char/cadence_uart.c               |    4 +-
 hw/char/ibex_uart.c                  |    4 +-
 hw/char/pl011.c                      |    5 +-
 hw/core/clock.c                      |   24 +-
 hw/core/qdev-clock.c                 |    8 +-
 hw/dma/xlnx_csu_dma.c                |  745 +++++++++++++++++++++++++
 hw/mips/cps.c                        |    2 +-
 hw/misc/armsse-cpu-pwrctrl.c         |  149 +++++
 hw/misc/bcm2835_cprman.c             |   23 +-
 hw/misc/iotkit-secctl.c              |   50 +-
 hw/misc/iotkit-sysctl.c              |  522 +++++++++++++++---
 hw/misc/iotkit-sysinfo.c             |   51 +-
 hw/misc/mps2-fpgaio.c                |   52 +-
 hw/misc/mps2-scc.c                   |   15 +-
 hw/misc/npcm7xx_clk.c                |   26 +-
 hw/misc/npcm7xx_pwm.c                |    2 +-
 hw/misc/zynq_slcr.c                  |    5 +-
 hw/ssi/xilinx_spips.c                |   33 +-
 hw/timer/cmsdk-apb-dualtimer.c       |    5 +-
 hw/timer/cmsdk-apb-timer.c           |    4 +-
 hw/timer/npcm7xx_timer.c             |    6 +-
 hw/timer/renesas_tmr.c               |   33 +-
 hw/timer/sse-counter.c               |  474 ++++++++++++++++
 hw/timer/sse-timer.c                 |  470 ++++++++++++++++
 hw/watchdog/cmsdk-apb-watchdog.c     |    5 +-
 target/arm/cpu.c                     |  335 -----------
 target/arm/cpu_tcg.c                 |  318 +++++++++++
 target/mips/cpu.c                    |    2 +-
 tests/qtest/sse-timer-test.c         |  240 ++++++++
 MAINTAINERS                          |    7 +
 hw/arm/Kconfig                       |   10 +-
 hw/dma/Kconfig                       |    4 +
 hw/dma/meson.build                   |    1 +
 hw/misc/Kconfig                      |    9 +
 hw/misc/meson.build                  |    1 +
 hw/misc/trace-events                 |    4 +
 hw/timer/Kconfig                     |    6 +
 hw/timer/meson.build                 |    2 +
 hw/timer/trace-events                |   12 +
 tests/qtest/meson.build              |    1 +
 60 files changed, 4537 insertions(+), 846 deletions(-)
 create mode 100644 include/hw/arm/armsse-version.h
 create mode 100644 include/hw/dma/xlnx_csu_dma.h
 create mode 100644 include/hw/misc/armsse-cpu-pwrctrl.h
 create mode 100644 include/hw/timer/sse-counter.h
 create mode 100644 include/hw/timer/sse-timer.h
 create mode 100644 hw/dma/xlnx_csu_dma.c
 create mode 100644 hw/misc/armsse-cpu-pwrctrl.c
 create mode 100644 hw/timer/sse-counter.c
 create mode 100644 hw/timer/sse-timer.c
 create mode 100644 tests/qtest/sse-timer-test.c

