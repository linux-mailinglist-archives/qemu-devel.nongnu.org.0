Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F2F2EF4F3
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:38:45 +0100 (CET)
Received: from localhost ([::1]:56272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtqd-00062p-Ii
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoS-0004Nt-E8
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoQ-0002pT-1A
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:28 -0500
Received: by mail-wm1-x32e.google.com with SMTP id r4so8751731wmh.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0HJ5hnIVK4wCTwPt1N8IA4C49lrrO8ZyrLHK6RBfiAk=;
 b=EHKSX+Prws7f/tIO/tXpLayG2LW53wRV9XBZpXBbYKh6lltzOP55mbCyPshsJQEWR1
 ORAWxxUIfO38b/xduT6vBIMynYT6KxAg9wqN2YcIbhowZ0gTAnZi6GApUwgJPgw/9ueS
 89iTpwPK3Y0/rF7z90biBfKsFqZW77flyxnMQGn9tBScpZfBGKo3R0mywnSqWXuU3Ful
 N6S/3/EWH37HGHa5+Fy7+Wx7pRnp7MGbvr23D/le5wRacZ8mBfaeyTLP+xNJjx3W+5bO
 bIMsU3efwGEpfvXwU+WM3Th/Qq4eXG7uxz7xG8IzHTq4vvtqR1L6VZ3FNbBthCDD3lkm
 /LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0HJ5hnIVK4wCTwPt1N8IA4C49lrrO8ZyrLHK6RBfiAk=;
 b=Vg6NYwAV8awl4+AWCryPmcAl/1a2X+vg+hB1VZuZhZ9DyQRYjcchNXoynUANvdczX0
 KIFG9ramzzWZFzveteO6t1dMq9ZbwNAOzdxSseY8JNvAJnNfs+M1GsySgBX9n2dkeU3F
 7B0X6+uAL4rOtGNORsaWLt/McRBd75tYByEaYKWyanPqVbN8jEIfBTr8ldKVxcGE9lu3
 SLqi/ZqFVfZlqolnHey/lHmme4ldUMBw3L7RFPBK8WMrxgMVJ+iChwgCsjqZ1/E1bDtD
 lR2dp837v5sq1oqbgaGlWqBQDGuqpwx0+dlQ0rca8+SqPWv+AEnCguL6NfBJukU4JIIr
 GOwg==
X-Gm-Message-State: AOAM533Tpg08ay5Rue+bhP/GcdHzdUdp/qcTh4/vnLKFKuCT2DKEWnp9
 xhXAiYz1+ERa3NWeGAmpVG9/rJBGm4A6+w==
X-Google-Smtp-Source: ABdhPJx5ILL+oR0uVs7pieRAaBSWovWQBYAYW64bMk7H1i++5+lvVPzVI8ZnlN8wwutrQKrWBZIB6A==
X-Received: by 2002:a1c:4843:: with SMTP id v64mr3576141wma.186.1610120183867; 
 Fri, 08 Jan 2021 07:36:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] target-arm queue
Date: Fri,  8 Jan 2021 15:35:58 +0000
Message-Id: <20210108153621.3868-1-peter.maydell@linaro.org>
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

Nothing too exciting, but does include the last bits of v8.1M support work.

-- PMM

The following changes since commit e79de63ab1bd1f6550e7b915e433bec1ad1a870a:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210107' into staging (2021-01-07 20:34:05 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210108

for you to fetch changes up to c9f8511ea8d2b80723af0fea1f716d752c1b5208:

  docs/system: arm: Add sabrelite board description (2021-01-08 15:13:39 +0000)

----------------------------------------------------------------
target-arm queue:
 * intc/arm_gic: Fix gic_irq_signaling_enabled() for vCPUs
 * target/arm: Fix MTE0_ACTIVE
 * target/arm: Implement v8.1M and Cortex-M55 model
 * hw/arm/highbank: Drop dead KVM support code
 * util/qemu-timer: Make timer_free() imply timer_del()
 * various devices: Use ptimer_free() in finalize function
 * docs/system: arm: Add sabrelite board description
 * sabrelite: Minor fixes to allow booting U-Boot

----------------------------------------------------------------
Andrew Jones (1):
      hw/arm/virt: Remove virt machine state 'smp_cpus'

Bin Meng (4):
      hw/misc: imx6_ccm: Update PMU_MISC0 reset value
      hw/msic: imx6_ccm: Correct register value for silicon type
      hw/arm: sabrelite: Connect the Ethernet PHY at address 6
      docs/system: arm: Add sabrelite board description

Edgar E. Iglesias (1):
      intc/arm_gic: Fix gic_irq_signaling_enabled() for vCPUs

Gan Qixin (7):
      digic-timer: Use ptimer_free() in the finalize function to avoid memleaks
      allwinner-a10-pit: Use ptimer_free() in the finalize function to avoid memleaks
      exynos4210_rtc: Use ptimer_free() in the finalize function to avoid memleaks
      exynos4210_pwm: Use ptimer_free() in the finalize function to avoid memleaks
      mss-timer: Use ptimer_free() in the finalize function to avoid memleaks
      musicpal: Use ptimer_free() in the finalize function to avoid memleaks
      exynos4210_mct: Use ptimer_free() in the finalize function to avoid memleaks

Peter Maydell (9):
      hw/intc/armv7m_nvic: Correct handling of CCR.BFHFNMIGN
      target/arm: Correct store of FPSCR value via FPCXT_S
      target/arm: Implement FPCXT_NS fp system register
      target/arm: Implement Cortex-M55 model
      hw/arm/highbank: Drop dead KVM support code
      util/qemu-timer: Make timer_free() imply timer_del()
      scripts/coccinelle: New script to remove unnecessary timer_del() calls
      Remove superfluous timer_del() calls
      target/arm: Remove timer_del()/timer_deinit() before timer_free()

Richard Henderson (1):
      target/arm: Fix MTE0_ACTIVE

 docs/system/arm/sabrelite.rst                 | 119 ++++++++++++++++++++++++++
 docs/system/target-arm.rst                    |   1 +
 scripts/coccinelle/timer-del-timer-free.cocci |  18 ++++
 include/hw/arm/virt.h                         |   3 +-
 include/qemu/timer.h                          |  24 +++---
 block/iscsi.c                                 |   2 -
 block/nbd.c                                   |   1 -
 block/qcow2.c                                 |   1 -
 hw/arm/highbank.c                             |  14 +--
 hw/arm/musicpal.c                             |  12 +++
 hw/arm/sabrelite.c                            |   4 +
 hw/arm/virt-acpi-build.c                      |   9 +-
 hw/arm/virt.c                                 |  21 +++--
 hw/block/nvme.c                               |   2 -
 hw/char/serial.c                              |   2 -
 hw/char/virtio-serial-bus.c                   |   2 -
 hw/ide/core.c                                 |   1 -
 hw/input/hid.c                                |   1 -
 hw/intc/apic.c                                |   1 -
 hw/intc/arm_gic.c                             |   4 +-
 hw/intc/armv7m_nvic.c                         |  15 ++++
 hw/intc/ioapic.c                              |   1 -
 hw/ipmi/ipmi_bmc_extern.c                     |   1 -
 hw/misc/imx6_ccm.c                            |   4 +-
 hw/net/e1000.c                                |   3 -
 hw/net/e1000e_core.c                          |   8 --
 hw/net/pcnet-pci.c                            |   1 -
 hw/net/rtl8139.c                              |   1 -
 hw/net/spapr_llan.c                           |   1 -
 hw/net/virtio-net.c                           |   2 -
 hw/rtc/exynos4210_rtc.c                       |   9 ++
 hw/s390x/s390-pci-inst.c                      |   1 -
 hw/sd/sd.c                                    |   1 -
 hw/sd/sdhci.c                                 |   2 -
 hw/timer/allwinner-a10-pit.c                  |  11 +++
 hw/timer/digic-timer.c                        |   8 ++
 hw/timer/exynos4210_mct.c                     |  14 +++
 hw/timer/exynos4210_pwm.c                     |  11 +++
 hw/timer/mss-timer.c                          |  13 +++
 hw/usb/dev-hub.c                              |   1 -
 hw/usb/hcd-ehci.c                             |   1 -
 hw/usb/hcd-ohci-pci.c                         |   1 -
 hw/usb/hcd-uhci.c                             |   1 -
 hw/usb/hcd-xhci.c                             |   1 -
 hw/usb/redirect.c                             |   1 -
 hw/vfio/display.c                             |   1 -
 hw/virtio/vhost-vsock-common.c                |   1 -
 hw/virtio/virtio-balloon.c                    |   1 -
 hw/virtio/virtio-rng.c                        |   1 -
 hw/watchdog/wdt_diag288.c                     |   1 -
 hw/watchdog/wdt_i6300esb.c                    |   1 -
 migration/colo.c                              |   1 -
 monitor/hmp-cmds.c                            |   1 -
 net/announce.c                                |   1 -
 net/colo-compare.c                            |   1 -
 net/slirp.c                                   |   1 -
 replay/replay-debugging.c                     |   1 -
 target/arm/cpu.c                              |   2 -
 target/arm/cpu_tcg.c                          |  42 +++++++++
 target/arm/helper.c                           |   2 +-
 target/s390x/cpu.c                            |   2 -
 ui/console.c                                  |   1 -
 ui/spice-core.c                               |   1 -
 util/throttle.c                               |   1 -
 target/arm/translate-vfp.c.inc                | 114 ++++++++++++++++++++++--
 65 files changed, 421 insertions(+), 111 deletions(-)
 create mode 100644 docs/system/arm/sabrelite.rst
 create mode 100644 scripts/coccinelle/timer-del-timer-free.cocci

