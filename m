Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5504955FE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:34:09 +0100 (CET)
Received: from localhost ([::1]:36306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAf4I-0003D6-Hv
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:34:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAa3f-0003Le-Rr
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:13:07 -0500
Received: from [2a00:1450:4864:20::32b] (port=53776
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAa3W-0004VY-Ue
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:13:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id n8so13137602wmk.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 08:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XV67uHZUmhX/82zYlvDZSyNnjVbtilmKSKLHf7LfghY=;
 b=ov4nQuZppLdBhOupis/19ojYtmQXitDORk38UDZE7gwhV6zsw2SKmrUoIOVDifDsxd
 K3UVNbteTGgk4oK31+A8EtQMuh6kfJMQffHp0gBn51SNX8HqRPG7cNvUBnxkrM4NYE1+
 KMp2AIUrpNNWGjH9FDOkO+asdFmf+t8RPVRX7CosjqTWj2IFP1kjq8AazQZcLAnYx1HY
 2N+jgv+zGkrGf11TTmCUxCdudTBitseH9rTku75PtjmP3HOAL0+m5bPO5BaRm2V14voE
 4IVPUBvEcZFN6Ah0xFzVwInoMK/NLtcYXhOixX/yEnqy5V6s4miZ1M1E/+7nbZBiWZzm
 nxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XV67uHZUmhX/82zYlvDZSyNnjVbtilmKSKLHf7LfghY=;
 b=UNmd2w3kzUdtAaEUbbDcYVIQDZFcA6msivSdV5XzW2QREJLcwUwV8pFS5uHgYDa54u
 l1umZ66zE/1DoJ6Q4KWtOCCsQj+GPpxucLxh/zeFTsibn/2qo2H/NNYxizw8TimdSSyg
 f2Xp5bfN5QJUxXpaBE6d0IlMWXsdIw7RlFx7I7XqlH/QYHv2sH5cGdd04TDm/bLCwEY1
 S0RT6plNKpe1SafmkavFz55wt3mvmrgzvwtx23UhdE601ivd3WlHKFiuF8YtelkQjvgR
 5jam52de2NWPURfjVDkYuRvWfBqtiBXZoASLJso8O6BcYIDI2YvBOedqgIk/qRWV9Uca
 rm/Q==
X-Gm-Message-State: AOAM533WtO3eijRyMuRvDchbTmtcvqWKxhdatHk+8eQTDEWrfTKcFm0M
 YgbeT5Ic0HqKdA1t2O0I8imtEjVcsDCwGA==
X-Google-Smtp-Source: ABdhPJysCOUyUnlhhzZvO9jDUiEGs/qeSDfY/wrs8CmA/flZukY4akBm8w9LwZTkVLKlVG2hz5mr7g==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr21874611wri.203.1642695177028; 
 Thu, 20 Jan 2022 08:12:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id l6sm23155wrb.47.2022.01.20.08.12.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 08:12:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/38] target-arm queue
Date: Thu, 20 Jan 2022 16:12:52 +0000
Message-Id: <20220120161252.452657-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

v1->v2: fix up format string issues in aspeed_i3c.c

-- PMM

The following changes since commit b10d00d8811fa4eed4862963273d7353ce310c82:

  Merge remote-tracking branch 'remotes/kraxel/tags/seabios-20220118-pull-request' into staging (2022-01-19 18:46:28 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220120-1

for you to fetch changes up to b9d383ab797f54ae5fa8746117770709921dc529:

  hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_ERROR (2022-01-20 16:04:58 +0000)

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
 hw/misc/aspeed_i3c.c                     | 384 ++++++++++++++++++++++++
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
 31 files changed, 1476 insertions(+), 782 deletions(-)
 rename docs/{can.txt => system/devices/can.rst} (68%)
 create mode 100644 include/hw/misc/aspeed_i3c.h
 create mode 100644 include/hw/net/mv88w8618_eth.h
 create mode 100644 hw/misc/aspeed_i3c.c
 create mode 100644 hw/net/mv88w8618_eth.c

