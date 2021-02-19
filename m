Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E7A31FB4C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:50:49 +0100 (CET)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD77I-00047L-Jl
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD735-0001vE-0w
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:27 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD730-0003LI-4c
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:26 -0500
Received: by mail-wm1-x32e.google.com with SMTP id o24so7861341wmh.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lREToQQJQDyBKGGsfEif0MuYXiYU9SpghUojeNK6xSg=;
 b=zJUOPu6cw0cJfCofRDJdz20V+ZOTNMvP1/ZyLpFJtLdFZlyrxOa+8yLp6a57LIwm0M
 318BmrvV9IHnK/TzZ70X8vtNwB1P359cOPf3qR+z8hmx4YXWXHiiKHrqpCqfn0G44OAb
 oCSCfh1aT4v4M1Jr1e/Bn1Su83cHYfKkcdRW9zRSqSKVhnDem5EOqSebQtzHp/6iAgCW
 h/OfX73X168+Vc+zc4wEQxnwIM94wTRxPQ9av3MoXI1k4sTg42Y0kgGEGajE9yBr4Ssr
 9VZzn4d8rWn9j+qvcgUq27xtO3GlkdrFEC6SvNhTKmCLd4k2UK/ctbGm83zEJu5JYVF6
 YGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lREToQQJQDyBKGGsfEif0MuYXiYU9SpghUojeNK6xSg=;
 b=qt8yd45JceTqnz/nPr4PRmExfJlmva+PInHHMQACVjy8BTvu3DsMNfQ+RO/LKHjuN2
 M8+AzgGZtFwO95G5EzgcgbCeAtzAMBKB9ulHiThY7lO+FpZQveq/3i+2SMcRacJ3f0Zx
 u9N7XdDNA4mlHHQftP0notsFswEGWsiawJdvx1tnPN8uQIN3c/aBK6Ra0v39xtxEXiFn
 JkmcB0hsDvZKjbegE50Gy0xQRzIuGJPf9A10EMen2/5VsdO3y61VUePELR3zGHctBBNn
 wZKpzbuLVhJbjPoeSvCNNmpFFagiipos6D/XKKRn8bEMj/R1aT9tTpt6GlXsr8mjjVvE
 BSkg==
X-Gm-Message-State: AOAM530aNHYB+jgtDMfW2yWkrJjWH8tFuPMI8hFWX5i/elh9NcXZM+HP
 OCyZ3bubz6t1k3287FxlA47Iwj6agR0tWw==
X-Google-Smtp-Source: ABdhPJwVlS/lyzVf8Nu5ABZkuh4QO9G7kf7VDs5THcTR1pgClIppyXXoAQtQd2PI2KuYP0tEnT1Itw==
X-Received: by 2002:a1c:1f4d:: with SMTP id f74mr8926042wmf.12.1613745980205; 
 Fri, 19 Feb 2021 06:46:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/44] hw/arm: New board model mps3-an547
Date: Fri, 19 Feb 2021 14:45:33 +0000
Message-Id: <20210219144617.4782-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

This patchseries implements a model of the AN547 FPGA image for the
MPS3 board.  The main benefit of this new board is that it uses the
Cortex-M55 CPU and so it allows running guests which use a v8.1M CPU.

This FPGA image is based on the SSE-300, so most of the series is
really implementing the SSE-300 model.  The differences between the
SSE-200 and SSE-300 are mostly not very exciting, but there's a lot
of minor tweaking of things like ID register values.  We also need to
support the way the SSE-300 has rearranged the address map, so the
middle part of the series adds a framework for making the config of
the devices behind the PPUs data-driven.

The SSE-300 also has new counter and timer devices, so the series
includes models of those and tests for them.  The interesting feature
of these devices is that the SSE system counter device provides a
64-bit count to other timer devices in the system; those timer
devices do not run off a direct clock, but only off the count value. 
(In hardware, there is a 64-bit count value that's connected from the
counter to all the timers.) For QEMU I have implemented this by
giving the timers a QOM link property so they can be passed the
counter device they are connected to, plus some public functions
for the counter device for things like "get the count value"
and "tell me when the count will hit this value". The SSE-300
also has a system watchdog device which works off the counter in
the same way, but in this series I have not modelled the watchdog.

The first four patches in the series are the Clock API patches I put
out for review earlier.

Based-on: 20210215115138.20465-1-peter.maydell@linaro.org
("[PATCH v2 00/24] hw/arm: New board model mps3-an524")
which added most of the flexibility to the mps2-tz.c code
to support these new boards.

thanks
-- PMM

Peter Maydell (44):
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
  hw/misc/iotkit-sysctl: Implement dummy version of SSE-300 PWRCTRL
    register
  hw/misc/iotkit-sysctl: Handle SSE-300 changes to PDCM_PD_*_SENSE
    registers
  hw/misc/iotkit-sysctl: Implement SSE-200 and SSE-300 PID register
    values
  hw/arm/Kconfig: Move ARMSSE_CPUID and ARMSSE_MHU stanzas to hw/misc
  hw/misc/sse-cpu-pwrctrl: Implement SSE-300 CPU<N>_PWRCTRL register
    block
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
  tests/qtest/sse-timer-test: Add simple tests of the SSE timer and
    counter

 docs/devel/clocks.rst                |   71 +-
 docs/system/arm/mps2.rst             |    6 +-
 include/hw/arm/armsse-version.h      |   42 ++
 include/hw/arm/armsse.h              |   40 +-
 include/hw/clock.h                   |   63 +-
 include/hw/misc/armsse-cpu-pwrctrl.h |   40 +
 include/hw/misc/iotkit-secctl.h      |    2 +
 include/hw/misc/iotkit-sysctl.h      |   13 +-
 include/hw/misc/iotkit-sysinfo.h     |    2 +
 include/hw/misc/mps2-fpgaio.h        |    2 +
 include/hw/qdev-clock.h              |   17 +-
 include/hw/timer/sse-counter.h       |  105 +++
 include/hw/timer/sse-timer.h         |   53 ++
 hw/adc/npcm7xx_adc.c                 |    2 +-
 hw/arm/armsse.c                      | 1008 +++++++++++++++++++-------
 hw/arm/mps2-tz.c                     |  168 ++++-
 hw/char/cadence_uart.c               |    4 +-
 hw/char/ibex_uart.c                  |    4 +-
 hw/char/pl011.c                      |    5 +-
 hw/core/clock.c                      |   24 +-
 hw/core/qdev-clock.c                 |    8 +-
 hw/mips/cps.c                        |    2 +-
 hw/misc/armsse-cpu-pwrctrl.c         |  149 ++++
 hw/misc/bcm2835_cprman.c             |   23 +-
 hw/misc/iotkit-secctl.c              |   50 +-
 hw/misc/iotkit-sysctl.c              |  521 ++++++++++---
 hw/misc/iotkit-sysinfo.c             |   51 +-
 hw/misc/mps2-fpgaio.c                |   52 +-
 hw/misc/mps2-scc.c                   |   15 +-
 hw/misc/npcm7xx_clk.c                |   26 +-
 hw/misc/npcm7xx_pwm.c                |    2 +-
 hw/misc/zynq_slcr.c                  |    5 +-
 hw/timer/cmsdk-apb-dualtimer.c       |    5 +-
 hw/timer/cmsdk-apb-timer.c           |    4 +-
 hw/timer/npcm7xx_timer.c             |    6 +-
 hw/timer/sse-counter.c               |  474 ++++++++++++
 hw/timer/sse-timer.c                 |  470 ++++++++++++
 hw/watchdog/cmsdk-apb-watchdog.c     |    5 +-
 target/mips/cpu.c                    |    2 +-
 tests/qtest/sse-timer-test.c         |  240 ++++++
 MAINTAINERS                          |    7 +
 hw/arm/Kconfig                       |    9 +-
 hw/misc/Kconfig                      |    9 +
 hw/misc/meson.build                  |    1 +
 hw/misc/trace-events                 |    4 +
 hw/timer/Kconfig                     |    6 +
 hw/timer/meson.build                 |    2 +
 hw/timer/trace-events                |   12 +
 tests/qtest/meson.build              |    1 +
 49 files changed, 3356 insertions(+), 476 deletions(-)
 create mode 100644 include/hw/arm/armsse-version.h
 create mode 100644 include/hw/misc/armsse-cpu-pwrctrl.h
 create mode 100644 include/hw/timer/sse-counter.h
 create mode 100644 include/hw/timer/sse-timer.h
 create mode 100644 hw/misc/armsse-cpu-pwrctrl.c
 create mode 100644 hw/timer/sse-counter.c
 create mode 100644 hw/timer/sse-timer.c
 create mode 100644 tests/qtest/sse-timer-test.c

-- 
2.20.1


