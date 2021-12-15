Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E6D475754
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:06:40 +0100 (CET)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxS7L-00013S-RQ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:06:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiX-0006gN-SG
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:01 -0500
Received: from [2a00:1450:4864:20::32e] (port=46012
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiP-0008PG-GI
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:40:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so15649937wme.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IaPavhzHdCQP8pqj8eEeAUd8M3RVdPe6IBBJiLk2p0c=;
 b=glZLgB1s2VNmzTPvfS32TOMC31TbMyfjKBqvexjf0DMiDj2LH51whySNwj1RGVrNsv
 rFjtSF6bCkBp7jXDKY+PxqXQ9baW28ttr32fItyADHyigeTh+MOv8EHJGgtenTFJfPUN
 KNfHNe/OC/D3HwvpctxtTlHXL1SzxmpUMZgip6u0UkyZhtmdjVTZ066z4o/ebD824+P9
 5rZjLfgEfrDTGqB5dBJaL6fMdQMrOpNSqvIEb9BhvEQ+vQ192XlLnFtzqNe2dwY/ea/Z
 izH0RJNtDfw5b1NP5YX2zv2OJA7PZT+mV6euDhmKKW/PAQbd1IHnDqpX5e7bQ3xiNAqW
 cbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IaPavhzHdCQP8pqj8eEeAUd8M3RVdPe6IBBJiLk2p0c=;
 b=CccpNw1X14GAkfLAqtznQ8MEfYcNrFK2LAvLBvObsGZiOiV7fhKBdXYIS54u4Af5et
 gH8y3HuOLAvhEN5umP3WxQRS5Opv7RIxIfOuEIubJF9MoVE0HD81uU2oXOxu2+QXEG17
 WME9ROeqK3yv+RpK69qWwXUbdS+at4e87aJFmOes/6yVv5SyesA2F6wPTnrNCIVFbMI1
 2YHF4+1L2ygYw8pIqqUHT46RtxjIfF5xowdKvvX3OzYGDJO+viafclh2N/gvw+P0+xAn
 ugtziCM9HzpZ4wZQNYXB8K0Qe704+TTg376QlmNll8hyh+ZVaqADuVdWIEseXfaXXpS9
 nb5A==
X-Gm-Message-State: AOAM531C5rbKg7qFWZ7J5+CBx0/tt7m6W09G4bcT4XviafFJfjyVXMqu
 Qp9kxKByuINqUjVecKNfJacb7/eFMi+vLg==
X-Google-Smtp-Source: ABdhPJwvCmdCM8FOz/VlgxjhH62vXkQe4lg8XT8neZHL5OCQ1FJBGofiVUlaDoZC0KmmGIUBeyk7WA==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr1230020wmb.38.1639564851308; 
 Wed, 15 Dec 2021 02:40:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/33] target-arm queue
Date: Wed, 15 Dec 2021 10:40:16 +0000
Message-Id: <20211215104049.2030475-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hi; here's the first target-arm pullreq for the 7.0 cycle.

thanks
-- PMM

The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-14 12:46:18 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211215

for you to fetch changes up to aed176558806674d030a8305d989d4e6a5073359:

  tests/acpi: add expected blob for VIOT test on virt machine (2021-12-15 10:35:26 +0000)

----------------------------------------------------------------
target-arm queue:
 * ITS: error reporting cleanup
 * aspeed: improve documentation
 * Fix STM32F2XX USART data register readout
 * allow emulated GICv3 to be disabled in non-TCG builds
 * fix exception priority for singlestep, misaligned PC, bp, etc
 * Correct calculation of tlb range invalidate length
 * npcm7xx_emc: fix missing queue_flush
 * virt: Add VIOT ACPI table for virtio-iommu
 * target/i386: Use assert() to sanity-check b1 in SSE decode
 * Don't include qemu-common unnecessarily

----------------------------------------------------------------
Alex Bennée (1):
      hw/intc: clean-up error reporting for failed ITS cmd

Jean-Philippe Brucker (8):
      hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
      hw/arm/virt: Remove device tree restriction for virtio-iommu
      hw/arm/virt: Reject instantiation of multiple IOMMUs
      hw/arm/virt: Use object_property_set instead of qdev_prop_set
      tests/acpi: allow updates of VIOT expected data files
      tests/acpi: add test case for VIOT
      tests/acpi: add expected blobs for VIOT test on q35 machine
      tests/acpi: add expected blob for VIOT test on virt machine

Joel Stanley (4):
      docs: aspeed: Add new boards
      docs: aspeed: Update OpenBMC image URL
      docs: aspeed: Give an example of booting a kernel
      docs: aspeed: ADC is now modelled

Olivier Hériveaux (1):
      Fix STM32F2XX USART data register readout

Patrick Venture (1):
      hw/net: npcm7xx_emc fix missing queue_flush

Peter Maydell (6):
      target/i386: Use assert() to sanity-check b1 in SSE decode
      include/hw/i386: Don't include qemu-common.h in .h files
      target/hexagon/cpu.h: don't include qemu-common.h
      target/rx/cpu.h: Don't include qemu-common.h
      hw/arm: Don't include qemu-common.h unnecessarily
      target/arm: Correct calculation of tlb range invalidate length

Philippe Mathieu-Daudé (2):
      hw/intc/arm_gicv3: Extract gicv3_set_gicv3state from arm_gicv3_cpuif.c
      hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector

Richard Henderson (10):
      target/arm: Hoist pc_next to a local variable in aarch64_tr_translate_insn
      target/arm: Hoist pc_next to a local variable in arm_tr_translate_insn
      target/arm: Hoist pc_next to a local variable in thumb_tr_translate_insn
      target/arm: Split arm_pre_translate_insn
      target/arm: Advance pc for arch single-step exception
      target/arm: Split compute_fsr_fsc out of arm_deliver_fault
      target/arm: Take an exception if PC is misaligned
      target/arm: Assert thumb pc is aligned
      target/arm: Suppress bp for exceptions with more priority
      tests/tcg: Add arm and aarch64 pc alignment tests

 docs/system/arm/aspeed.rst        |  26 ++++++++++++----
 include/hw/i386/microvm.h         |   1 -
 include/hw/i386/x86.h             |   1 -
 target/arm/helper.h               |   1 +
 target/arm/syndrome.h             |   5 +++
 target/hexagon/cpu.h              |   1 -
 target/rx/cpu.h                   |   1 -
 hw/arm/boot.c                     |   1 -
 hw/arm/digic_boards.c             |   1 -
 hw/arm/highbank.c                 |   1 -
 hw/arm/npcm7xx_boards.c           |   1 -
 hw/arm/sbsa-ref.c                 |   1 -
 hw/arm/stm32f405_soc.c            |   1 -
 hw/arm/vexpress.c                 |   1 -
 hw/arm/virt-acpi-build.c          |   7 +++++
 hw/arm/virt.c                     |  21 ++++++-------
 hw/char/stm32f2xx_usart.c         |   3 +-
 hw/intc/arm_gicv3.c               |   2 +-
 hw/intc/arm_gicv3_cpuif.c         |  10 +-----
 hw/intc/arm_gicv3_cpuif_common.c  |  22 +++++++++++++
 hw/intc/arm_gicv3_its.c           |  39 +++++++++++++++--------
 hw/net/npcm7xx_emc.c              |  18 +++++------
 hw/virtio/virtio-iommu-pci.c      |  12 ++------
 linux-user/aarch64/cpu_loop.c     |  46 ++++++++++++++++------------
 linux-user/hexagon/cpu_loop.c     |   1 +
 target/arm/debug_helper.c         |  23 ++++++++++++++
 target/arm/gdbstub.c              |   9 ++++--
 target/arm/helper.c               |   6 ++--
 target/arm/machine.c              |  10 ++++++
 target/arm/tlb_helper.c           |  63 ++++++++++++++++++++++++++++----------
 target/arm/translate-a64.c        |  23 ++++++++++++--
 target/arm/translate.c            |  58 ++++++++++++++++++++++++++---------
 target/i386/tcg/translate.c       |  12 ++------
 tests/qtest/bios-tables-test.c    |  38 +++++++++++++++++++++++
 tests/tcg/aarch64/pcalign-a64.c   |  37 ++++++++++++++++++++++
 tests/tcg/arm/pcalign-a32.c       |  46 ++++++++++++++++++++++++++++
 hw/arm/Kconfig                    |   1 +
 hw/intc/Kconfig                   |   5 +++
 hw/intc/meson.build               |  11 ++++---
 tests/data/acpi/q35/DSDT.viot     | Bin 0 -> 9398 bytes
 tests/data/acpi/q35/VIOT.viot     | Bin 0 -> 112 bytes
 tests/data/acpi/virt/VIOT         | Bin 0 -> 88 bytes
 tests/tcg/aarch64/Makefile.target |   4 +--
 tests/tcg/arm/Makefile.target     |   4 +++
 44 files changed, 429 insertions(+), 145 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_cpuif_common.c
 create mode 100644 tests/tcg/aarch64/pcalign-a64.c
 create mode 100644 tests/tcg/arm/pcalign-a32.c
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot
 create mode 100644 tests/data/acpi/virt/VIOT

