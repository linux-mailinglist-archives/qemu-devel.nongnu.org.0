Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF430880D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:07:20 +0100 (CET)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RcV-0004cw-6G
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVx-0004Eo-SK
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:33 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVi-0006r7-4f
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:33 -0500
Received: by mail-wr1-x42d.google.com with SMTP id p15so8366575wrq.8
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g+6ZwiaVBzRbyFwMP9W12kqmhkKJp2rZO2+5f6LcDL4=;
 b=schaPctoZRMS+sNDvVGAmbItNbuj94khx75TT+6vEaOiapM0xcotVrW3BgNTCjivTK
 KyZ77ceBgzmcTKfNUYNDc2VQ93bOYnT8cKo3fQe2ZbGC4D0HJ/7MwLuwQy4fJ8UYw0G+
 yjF1vLEJ+ONYgdG8GBsqxKsZD+cLKQXhDRvtYO/W+SdRG2uv0440FmrFM2AKQ3zkMulX
 Pv4/ZQMZGcwISnHei4Liiodkuha47l8cMqc28xmozeXYabUGj9YmrB+b8SzyqiE2GPLd
 j1JWfM1G4KGgBYJ5sJ2kXwYwDZI6QhN69gu2Sn2IJYhsL1sq8Tl3NMLppxsK9hh2GodE
 2lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g+6ZwiaVBzRbyFwMP9W12kqmhkKJp2rZO2+5f6LcDL4=;
 b=J1P/AoxYTtl9EgvjnNi+G5RmVZDTRt7J57RqkM115QmtQ210KF0SzZBATk3PuNy4lF
 RvbZLwMwr4UqtQ/7fm6lySUGvfQiIXY5SgVDjTXwDiy22GidfOitVeoVzA9G+Yz3M9iH
 MiMdsnZhJmRZ04KorIlnojQ3/7j5d3+GmMoC2v98GVuu95uEqpQx9gAOKLZowK96tdgG
 x9Hm4R4qCDV2uazuVMRTA1BYbuUYsRcQIiMz9F/rxYT8GzzMnib0dlEHqB0KNZiOPbIG
 hon+uIe0W7h+UIW0LvGkpbXlSVvWb9dG4DYJxJRPAkMMxkLArrc3yoC9R1+5vxQEEwTw
 OxfA==
X-Gm-Message-State: AOAM532AdwNnmZKUmRCdtBE3WSGr2YRRZ+eSfgsjyPdXYs3e06xfY3Dm
 x0ZjHiIhCxs11y2zLkCVdRwF+MiC47Q/Pg==
X-Google-Smtp-Source: ABdhPJzLdC0qnXTxJNN3la+ghPc7HCZ2moByrp+tRZataFrvNxshbvhk/tK1msP1EQ4a+m7gXUgMoA==
X-Received: by 2002:adf:c14d:: with SMTP id w13mr3781131wre.383.1611918015062; 
 Fri, 29 Jan 2021 03:00:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/46] target-arm queue
Date: Fri, 29 Jan 2021 10:59:26 +0000
Message-Id: <20210129110012.8660-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

The following changes since commit 7e7eb9f852a46b51a71ae9d82590b2e4d28827ee:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-01-28' into staging (2021-01-28 22:43:18 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210129

for you to fetch changes up to 11749122e1a86866591306d43603d2795a3dea1a:

  hw/arm/stellaris: Remove board-creation reset of STELLARIS_SYS (2021-01-29 10:47:29 +0000)

----------------------------------------------------------------
target-arm queue:
 * Implement ID_PFR2
 * Conditionalize DBGDIDR
 * rename xlnx-zcu102.canbusN properties
 * provide powerdown/reset mechanism for secure firmware on 'virt' board
 * hw/misc: Fix arith overflow in NPCM7XX PWM module
 * target/arm: Replace magic value by MMU_DATA_LOAD definition
 * configure: fix preadv errors on Catalina macOS with new XCode
 * Various configure and other cleanups in preparation for iOS support
 * hvf: Add hypervisor entitlement to output binaries (needed for Big Sur)
 * Implement pvpanic-pci device
 * Convert the CMSDK timer devices to the Clock framework

----------------------------------------------------------------
Alexander Graf (1):
      hvf: Add hypervisor entitlement to output binaries

Hao Wu (1):
      hw/misc: Fix arith overflow in NPCM7XX PWM module

Joelle van Dyne (7):
      configure: cross-compiling with empty cross_prefix
      osdep: build with non-working system() function
      darwin: remove redundant dependency declaration
      darwin: fix cross-compiling for Darwin
      configure: cross compile should use x86_64 cpu_family
      darwin: detect CoreAudio for build
      darwin: remove 64-bit build detection on 32-bit OS

Maxim Uvarov (3):
      hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
      arm-virt: refactor gpios creation
      arm-virt: add secure pl061 for reset/power down

Mihai Carabas (4):
      hw/misc/pvpanic: split-out generic and bus dependent code
      hw/misc/pvpanic: add PCI interface support
      pvpanic : update pvpanic spec document
      tests/qtest: add a test case for pvpanic-pci

Paolo Bonzini (1):
      arm: rename xlnx-zcu102.canbusN properties

Peter Maydell (26):
      configure: Move preadv check to meson.build
      ptimer: Add new ptimer_set_period_from_clock() function
      clock: Add new clock_has_source() function
      tests: Add a simple test of the CMSDK APB timer
      tests: Add a simple test of the CMSDK APB watchdog
      tests: Add a simple test of the CMSDK APB dual timer
      hw/timer/cmsdk-apb-timer: Rename CMSDKAPBTIMER struct to CMSDKAPBTimer
      hw/timer/cmsdk-apb-timer: Add Clock input
      hw/timer/cmsdk-apb-dualtimer: Add Clock input
      hw/watchdog/cmsdk-apb-watchdog: Add Clock input
      hw/arm/armsse: Rename "MAINCLK" property to "MAINCLK_FRQ"
      hw/arm/armsse: Wire up clocks
      hw/arm/mps2: Inline CMSDK_APB_TIMER creation
      hw/arm/mps2: Create and connect SYSCLK Clock
      hw/arm/mps2-tz: Create and connect ARMSSE Clocks
      hw/arm/musca: Create and connect ARMSSE Clocks
      hw/arm/stellaris: Convert SSYS to QOM device
      hw/arm/stellaris: Create Clock input for watchdog
      hw/timer/cmsdk-apb-timer: Convert to use Clock input
      hw/timer/cmsdk-apb-dualtimer: Convert to use Clock input
      hw/watchdog/cmsdk-apb-watchdog: Convert to use Clock input
      tests/qtest/cmsdk-apb-watchdog-test: Test clock changes
      hw/arm/armsse: Use Clock to set system_clock_scale
      arm: Don't set freq properties on CMSDK timer, dualtimer, watchdog, ARMSSE
      arm: Remove frq properties on CMSDK timer, dualtimer, watchdog, ARMSSE
      hw/arm/stellaris: Remove board-creation reset of STELLARIS_SYS

Philippe Mathieu-Daudé (1):
      target/arm: Replace magic value by MMU_DATA_LOAD definition

Richard Henderson (2):
      target/arm: Implement ID_PFR2
      target/arm: Conditionalize DBGDIDR

 docs/devel/clocks.rst                    |  16 +++
 docs/specs/pci-ids.txt                   |   1 +
 docs/specs/pvpanic.txt                   |  13 ++-
 docs/system/arm/virt.rst                 |   2 +
 configure                                |  78 ++++++++------
 meson.build                              |  34 ++++++-
 include/hw/arm/armsse.h                  |  14 ++-
 include/hw/arm/virt.h                    |   2 +
 include/hw/clock.h                       |  15 +++
 include/hw/misc/pvpanic.h                |  24 ++++-
 include/hw/pci/pci.h                     |   1 +
 include/hw/ptimer.h                      |  22 ++++
 include/hw/timer/cmsdk-apb-dualtimer.h   |   5 +-
 include/hw/timer/cmsdk-apb-timer.h       |  34 ++-----
 include/hw/watchdog/cmsdk-apb-watchdog.h |   5 +-
 include/qemu/osdep.h                     |  12 +++
 include/qemu/typedefs.h                  |   1 +
 target/arm/cpu.h                         |   1 +
 hw/arm/armsse.c                          |  48 ++++++---
 hw/arm/mps2-tz.c                         |  14 ++-
 hw/arm/mps2.c                            |  28 ++++-
 hw/arm/musca.c                           |  13 ++-
 hw/arm/stellaris.c                       | 170 +++++++++++++++++++++++--------
 hw/arm/virt.c                            | 111 ++++++++++++++++----
 hw/arm/xlnx-zcu102.c                     |   4 +-
 hw/core/ptimer.c                         |  34 +++++++
 hw/gpio/gpio_pwr.c                       |  70 +++++++++++++
 hw/misc/npcm7xx_pwm.c                    |  23 ++++-
 hw/misc/pvpanic-isa.c                    |  94 +++++++++++++++++
 hw/misc/pvpanic-pci.c                    |  94 +++++++++++++++++
 hw/misc/pvpanic.c                        |  85 ++--------------
 hw/timer/cmsdk-apb-dualtimer.c           |  53 +++++++---
 hw/timer/cmsdk-apb-timer.c               |  55 +++++-----
 hw/watchdog/cmsdk-apb-watchdog.c         |  29 ++++--
 target/arm/helper.c                      |  27 +++--
 target/arm/kvm64.c                       |   2 +
 tests/qtest/cmsdk-apb-dualtimer-test.c   | 130 +++++++++++++++++++++++
 tests/qtest/cmsdk-apb-timer-test.c       |  75 ++++++++++++++
 tests/qtest/cmsdk-apb-watchdog-test.c    | 131 ++++++++++++++++++++++++
 tests/qtest/npcm7xx_pwm-test.c           |   4 +-
 tests/qtest/pvpanic-pci-test.c           |  94 +++++++++++++++++
 tests/qtest/xlnx-can-test.c              |  30 +++---
 MAINTAINERS                              |   3 +
 accel/hvf/entitlements.plist             |   8 ++
 hw/arm/Kconfig                           |   1 +
 hw/gpio/Kconfig                          |   3 +
 hw/gpio/meson.build                      |   1 +
 hw/i386/Kconfig                          |   2 +-
 hw/misc/Kconfig                          |  12 ++-
 hw/misc/meson.build                      |   4 +-
 scripts/entitlement.sh                   |  13 +++
 tests/qtest/meson.build                  |   6 +-
 52 files changed, 1432 insertions(+), 319 deletions(-)
 create mode 100644 hw/gpio/gpio_pwr.c
 create mode 100644 hw/misc/pvpanic-isa.c
 create mode 100644 hw/misc/pvpanic-pci.c
 create mode 100644 tests/qtest/cmsdk-apb-dualtimer-test.c
 create mode 100644 tests/qtest/cmsdk-apb-timer-test.c
 create mode 100644 tests/qtest/cmsdk-apb-watchdog-test.c
 create mode 100644 tests/qtest/pvpanic-pci-test.c
 create mode 100644 accel/hvf/entitlements.plist
 create mode 100755 scripts/entitlement.sh

