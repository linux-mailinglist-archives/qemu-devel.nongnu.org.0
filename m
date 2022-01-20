Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A544953AD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:58:43 +0100 (CET)
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbhq-0008D0-Jk
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgB-00044u-31
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:39 -0500
Received: from [2a00:1450:4864:20::335] (port=39737
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWg6-00035Y-PZ
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:36 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso7090608wmh.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qTbu67z0HL/RUuJy3rUNcUS4Ewm71sCRIhW1zCix0UU=;
 b=X9hfdL2CXlw/y6iy49hsNYQkXMcmA0RpNQMTTJS3Urzp/ev5LqDYvkfOF4NMx4eS+T
 q7flKHweWwKfTu3HvLRDPTkfBWYVn9VqgNO1B1phdRon2+egULdAaX5WjGwTccgje01K
 dBEEfie6ZBiglArmz1N4Nmjg84/deI6qgGBxjHvm4NeyP8wzRet7xuAPXXEfNS4dRPXC
 qnaTPjSmd7IdcGGzQXAVWZ3cIAidKBwnrsUOY8M1iqyjhCPaqPFvF6SuMtCv1LtyCTJA
 4Qc62eVAzi3Fis+e5Tvv9aLWayw6iDy72cSz7aWwusmIzXRcyPqu1oL/sLugeqtXDiyZ
 mnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qTbu67z0HL/RUuJy3rUNcUS4Ewm71sCRIhW1zCix0UU=;
 b=b7QA05IekVy3RvCxNum+kWZdd22TQdDddVGH1Q94cKNAjl4H2kOC1N/YFwBbhUpn/0
 q1HRtuaDSjGmBjezrqCgx9j/sLoV9MqDbaeE3oX9r4o4IdkOd2Xcz/taHI4bPQk6A0bJ
 Q279ciRj3axR/5sAUS6qqMmulRCqu8ip60VyOimhKNgd3UGmDusSodcbYgpjOHkVYlre
 1Cb/+Fo+dEfsJuJ+2pVuUooxb5woHCs6s+s6GDZgnau8LsT5ioX1EJy8b0INKiPpFvD3
 3BwQBtWsThDiA++jruLydRlFlazuuJ+Ndb4KAz3q27n7sOADRS/Haz2LiYvlnAh27U9a
 DOdA==
X-Gm-Message-State: AOAM530PAiSm5HXaNI3LE0LPdnkiKyRLEokbwNzeGaJFMuCVVRGXAmGJ
 gqlJ2bFMPODN/Ftu/8N195zmdP70IIdzFQ==
X-Google-Smtp-Source: ABdhPJy5mFX4JbT8DIp2lzqzUmN6M0dmn9RrWboneAIQCsHieDkRCV3XyKP6/mEL0kEyK87IQkMJ6w==
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr8570005wmb.128.1642682192729; 
 Thu, 20 Jan 2022 04:36:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/38] target-arm queue
Date: Thu, 20 Jan 2022 12:35:52 +0000
Message-Id: <20220120123630.267975-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

The following changes since commit b10d00d8811fa4eed4862963273d7353ce310c82:

  Merge remote-tracking branch 'remotes/kraxel/tags/seabios-20220118-pull-request' into staging (2022-01-19 18:46:28 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220120

for you to fetch changes up to 9705e3c1dcff96b0b3c7e594b6cd68d27d6c4ced:

  hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_ERROR (2022-01-20 11:47:54 +0000)

----------------------------------------------------------------
target-arm:
 * hw/intc/arm_gicv3_its: Fix various minor bugs
 * hw/arm/aspeed: Add the i3c device to the AST2600 SoC
 * hw/arm: kudo: add lm75s behind bus 1 switch at 75
 * hw/arm/virt: Fix support for running guests on hosts
   with restricted IPA ranges
 * hw/intc/arm_gic: Allow reset of the running priority
 * hw/intc/arm_gic: Implement read of GICC_IIDR
 * hw/arm/virt: Support for virtio-mem-pci
 * hw/arm/virt: Support CPU cluster on ARM virt machine
 * docs/can: convert to restructuredText
 * hw/net: Move MV88W8618 network device out of hw/arm/ directory
 * hw/arm/virt: KVM: Enable PAuth when supported by the host

----------------------------------------------------------------
Gavin Shan (2):
      virtio-mem: Correct default THP size for ARM64
      hw/arm/virt: Support for virtio-mem-pci

Lucas Ramage (1):
      docs/can: convert to restructuredText

Marc Zyngier (7):
      hw/arm/virt: KVM: Enable PAuth when supported by the host
      hw/arm/virt: Add a control for the the highmem PCIe MMIO
      hw/arm/virt: Add a control for the the highmem redistributors
      hw/arm/virt: Honor highmem setting when computing the memory map
      hw/arm/virt: Use the PA range to compute the memory map
      hw/arm/virt: Disable highmem devices that don't fit in the PA range
      hw/arm/virt: Drop superfluous checks against highmem

Patrick Venture (1):
      hw/arm: kudo add lm75s behind bus 1 switch at 75

Peter Maydell (13):
      hw/intc/arm_gicv3_its: Fix event ID bounds checks
      hw/intc/arm_gicv3_its: Convert int ID check to num_intids convention
      hw/intc/arm_gicv3_its: Fix handling of process_its_cmd() return value
      hw/intc/arm_gicv3_its: Don't use data if reading command failed
      hw/intc/arm_gicv3_its: Use enum for return value of process_* functions
      hw/intc/arm_gicv3_its: Fix return codes in process_its_cmd()
      hw/intc/arm_gicv3_its: Refactor process_its_cmd() to reduce nesting
      hw/intc/arm_gicv3_its: Fix return codes in process_mapti()
      hw/intc/arm_gicv3_its: Fix return codes in process_mapc()
      hw/intc/arm_gicv3_its: Fix return codes in process_mapd()
      hw/intc/arm_gicv3_its: Factor out "find address of table entry" code
      hw/intc/arm_gicv3_its: Check indexes before use, not after
      hw/intc/arm_gicv3_its: Range-check ICID before indexing into collection table

Petr Pavlu (2):
      hw/intc/arm_gic: Implement read of GICC_IIDR
      hw/intc/arm_gic: Allow reset of the running priority

Philippe Mathieu-Daudé (4):
      hw: Move MARVELL_88W8618 Kconfig from audio/ to arm/
      hw/arm/musicpal: Fix coding style of code related to MV88W8618 device
      hw/net: Move MV88W8618 network device out of hw/arm/ directory
      hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_ERROR

Troy Lee (2):
      hw/misc/aspeed_i3c.c: Introduce a dummy AST2600 I3C model.
      hw/arm/aspeed: Add the i3c device to the AST2600 SoC

Yanan Wang (6):
      hw/arm/virt: Support CPU cluster on ARM virt machine
      hw/arm/virt: Support cluster level in DT cpu-map
      hw/acpi/aml-build: Improve scalability of PPTT generation
      tests/acpi/bios-tables-test: Allow changes to virt/PPTT file
      hw/acpi/aml-build: Support cluster level in PPTT generation
      tests/acpi/bios-table-test: Update expected virt/PPTT file

 docs/system/arm/cpu-features.rst         |   4 -
 docs/system/device-emulation.rst         |   1 +
 docs/{can.txt => system/devices/can.rst} |  90 +++---
 include/hw/arm/aspeed_soc.h              |   3 +
 include/hw/arm/virt.h                    |   5 +-
 include/hw/misc/aspeed_i3c.h             |  48 +++
 include/hw/net/mv88w8618_eth.h           |  12 +
 target/arm/cpu.h                         |   1 +
 hw/acpi/aml-build.c                      |  68 +++--
 hw/arm/aspeed_ast2600.c                  |  16 +
 hw/arm/musicpal.c                        | 381 +-----------------------
 hw/arm/npcm7xx_boards.c                  |  10 +-
 hw/arm/virt-acpi-build.c                 |  10 +-
 hw/arm/virt.c                            | 184 ++++++++++--
 hw/intc/arm_gic.c                        |  11 +
 hw/intc/arm_gicv3_its.c                  | 492 ++++++++++++++-----------------
 hw/intc/arm_gicv3_redist.c               |   4 +-
 hw/misc/aspeed_i3c.c                     | 381 ++++++++++++++++++++++++
 hw/net/mv88w8618_eth.c                   | 403 +++++++++++++++++++++++++
 hw/virtio/virtio-mem.c                   |  36 ++-
 target/arm/cpu.c                         |  16 +-
 target/arm/cpu64.c                       |  31 +-
 target/arm/kvm64.c                       |  21 ++
 MAINTAINERS                              |   2 +
 hw/arm/Kconfig                           |   4 +
 hw/audio/Kconfig                         |   3 -
 hw/misc/meson.build                      |   1 +
 hw/misc/trace-events                     |   6 +
 hw/net/meson.build                       |   1 +
 qemu-options.hx                          |  10 +
 tests/data/acpi/virt/PPTT                | Bin 76 -> 96 bytes
 31 files changed, 1473 insertions(+), 782 deletions(-)
 rename docs/{can.txt => system/devices/can.rst} (68%)
 create mode 100644 include/hw/misc/aspeed_i3c.h
 create mode 100644 include/hw/net/mv88w8618_eth.h
 create mode 100644 hw/misc/aspeed_i3c.c
 create mode 100644 hw/net/mv88w8618_eth.c

