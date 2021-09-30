Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C1541DD20
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:16:23 +0200 (CEST)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxnK-00041i-Kb
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjD-0008V2-Jh
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjB-0003sF-9s
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:07 -0400
Received: by mail-wr1-x430.google.com with SMTP id w29so10651857wra.8
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=czvOQVMTn3AFUjgfXeidA6VLYpMWH9dBWejPu5BrKd4=;
 b=Ejjj3BPpsh8vPdk2TAduqESiTYoFfddBYUSLvb92IxXRUMGzdOnYe9yZsTToHrdK7m
 wB/96NxA8htlUp1ebTRAlL47J3Y9+UcZXDGz0us9KLXznMxvO1gWEoLryqLDPuhnlpI6
 yJpJeKumGBXmluA3u5v3aqwaVna7pulfghvWW2fSlAj/1ixsVAAnkekVHhviSkB45bOk
 Aa1pnOkJyxzYq7tYKz+ODsiGqYFucTN9BWgf1h+ilF/Z2pQTxEfg048BAmSYRnpF9w0J
 Mk6NVqHA8orlu3dzb9xYf5rA3HGABPgvFmjysY1cMUQajonliUZK4AlEuLsZxx+imRuI
 cIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=czvOQVMTn3AFUjgfXeidA6VLYpMWH9dBWejPu5BrKd4=;
 b=CBZF4etnibM6ZQjfjC9IKnIpIhrGfhbwribyIvF6/hrTxwV44nK/F/reIJ5UyJW67B
 zJIesLhfk+k5vBdjK2FuFhKvGJLNMIsW3BKu2L5rTE022Wzk+7I4Yvte4AqIMniphtQS
 AopPpwRU4MBa75rFEkoqyyI5tkNfZmn2W8UQUiA7vT+t72INddXZdspzFmnNESejZj2S
 mL+7bNYMUxPgRZai+6reAeNhZi/1jhPl3a9Ggl+SBJKqFDUWKhYnBVaCga6GK/9h2pIq
 SBxTDjNRQ/4JdTh5c7SjkzXtEjiYvvLgdDyc1Fe1QGK3qYSEMuc+WBz83g/zwBpJSVgT
 txiQ==
X-Gm-Message-State: AOAM532AsQVYzbCzMTnIvasWf+lay1nB2N6ku9/E4fMhOmUi79PUDhLO
 N4Ehea+7qeJAaXNEtBY6ARnD6UgkUXwIhQ==
X-Google-Smtp-Source: ABdhPJwF76BfKUioFB9SWS62vJMAGwvTT+PiysVog+dUBBK75m/RbfbmMrz6Cg/9F//4dVwrKNHGMg==
X-Received: by 2002:a05:6000:144e:: with SMTP id
 v14mr5514630wrx.228.1633014723758; 
 Thu, 30 Sep 2021 08:12:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/22] target-arm queue
Date: Thu, 30 Sep 2021 16:11:39 +0100
Message-Id: <20210930151201.9407-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Nothing too exciting in this lot :-)

The following changes since commit ba0fa56bc06e563de68d2a2bf3ddb0cfea1be4f9:

  Merge remote-tracking branch 'remotes/vivier/tags/q800-for-6.2-pull-request' into staging (2021-09-29 21:20:49 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210930

for you to fetch changes up to 1f4b2ec701b9d73d3fa7bb90c8b4376bc7d3c42b:

  hw/arm: sabrelite: Connect SPI flash CS line to GPIO3_19 (2021-09-30 13:44:13 +0100)

----------------------------------------------------------------
target-arm queue:
 * allwinner-h3: Switch to SMC as PSCI conduit
 * arm: tcg: Adhere to SMCCC 1.3 section 5.2
 * xlnx-zcu102, xlnx-versal-virt: Support BBRAM and eFUSE devices
 * gdbstub related code cleanups
 * Don't put FPEXC and FPSID in org.gnu.gdb.arm.vfp XML
 * Use _init vs _new convention in bus creation function names
 * sabrelite: Connect SPI flash CS line to GPIO3_19

----------------------------------------------------------------
Alexander Graf (2):
      allwinner-h3: Switch to SMC as PSCI conduit
      arm: tcg: Adhere to SMCCC 1.3 section 5.2

Peter Maydell (10):
      configs: Don't include 32-bit-only GDB XML in aarch64 linux configs
      target/arm: Fix coding style issues in gdbstub code in helper.c
      target/arm: Move gdbstub related code out of helper.c
      target/arm: Don't put FPEXC and FPSID in org.gnu.gdb.arm.vfp XML
      scsi: Replace scsi_bus_new() with scsi_bus_init(), scsi_bus_init_named()
      ipack: Rename ipack_bus_new_inplace() to ipack_bus_init()
      pci: Rename pci_root_bus_new_inplace() to pci_root_bus_init()
      qbus: Rename qbus_create_inplace() to qbus_init()
      qbus: Rename qbus_create() to qbus_new()
      ide: Rename ide_bus_new() to ide_bus_init()

Tong Ho (9):
      hw/nvram: Introduce Xilinx eFuse QOM
      hw/nvram: Introduce Xilinx Versal eFuse device
      hw/nvram: Introduce Xilinx ZynqMP eFuse device
      hw/nvram: Introduce Xilinx battery-backed ram
      hw/arm: xlnx-versal-virt: Add Xilinx BBRAM device
      hw/arm: xlnx-versal-virt: Add Xilinx eFUSE device
      hw/arm: xlnx-zcu102: Add Xilinx BBRAM device
      hw/arm: xlnx-zcu102: Add Xilinx eFUSE device
      docs/system/arm: xlnx-versal-virt: BBRAM and eFUSE Usage

Xuzhou Cheng (1):
      hw/arm: sabrelite: Connect SPI flash CS line to GPIO3_19

 docs/system/arm/xlnx-versal-virt.rst      |  49 ++
 configs/targets/aarch64-linux-user.mak    |   2 +-
 configs/targets/aarch64-softmmu.mak       |   2 +-
 configs/targets/aarch64_be-linux-user.mak |   2 +-
 configs/targets/arm-linux-user.mak        |   2 +-
 configs/targets/arm-softmmu.mak           |   2 +-
 configs/targets/armeb-linux-user.mak      |   2 +-
 include/hw/arm/xlnx-versal.h              |  15 +
 include/hw/arm/xlnx-zynqmp.h              |   5 +
 include/hw/ide/internal.h                 |   4 +-
 include/hw/ipack/ipack.h                  |   8 +-
 include/hw/nvram/xlnx-bbram.h             |  54 ++
 include/hw/nvram/xlnx-efuse.h             | 132 +++++
 include/hw/nvram/xlnx-versal-efuse.h      |  68 +++
 include/hw/nvram/xlnx-zynqmp-efuse.h      |  44 ++
 include/hw/pci/pci.h                      |  10 +-
 include/hw/qdev-core.h                    |   6 +-
 include/hw/scsi/scsi.h                    |  30 +-
 target/arm/internals.h                    |   7 +
 hw/arm/allwinner-h3.c                     |   2 +-
 hw/arm/sabrelite.c                        |   2 +-
 hw/arm/xlnx-versal-virt.c                 |  88 +++
 hw/arm/xlnx-versal.c                      |  57 ++
 hw/arm/xlnx-zcu102.c                      |  30 ++
 hw/arm/xlnx-zynqmp.c                      |  49 ++
 hw/audio/intel-hda.c                      |   2 +-
 hw/block/fdc.c                            |   2 +-
 hw/block/swim.c                           |   3 +-
 hw/char/virtio-serial-bus.c               |   4 +-
 hw/core/bus.c                             |  13 +-
 hw/core/sysbus.c                          |  10 +-
 hw/gpio/bcm2835_gpio.c                    |   3 +-
 hw/hyperv/vmbus.c                         |   2 +-
 hw/i2c/core.c                             |   2 +-
 hw/ide/ahci.c                             |   2 +-
 hw/ide/cmd646.c                           |   2 +-
 hw/ide/isa.c                              |   2 +-
 hw/ide/macio.c                            |   2 +-
 hw/ide/microdrive.c                       |   2 +-
 hw/ide/mmio.c                             |   2 +-
 hw/ide/piix.c                             |   2 +-
 hw/ide/qdev.c                             |   4 +-
 hw/ide/sii3112.c                          |   2 +-
 hw/ide/via.c                              |   2 +-
 hw/ipack/ipack.c                          |  10 +-
 hw/ipack/tpci200.c                        |   4 +-
 hw/isa/isa-bus.c                          |   2 +-
 hw/misc/auxbus.c                          |   2 +-
 hw/misc/mac_via.c                         |   4 +-
 hw/misc/macio/cuda.c                      |   4 +-
 hw/misc/macio/macio.c                     |   4 +-
 hw/misc/macio/pmu.c                       |   4 +-
 hw/nubus/nubus-bridge.c                   |   2 +-
 hw/nvme/ctrl.c                            |   4 +-
 hw/nvme/subsys.c                          |   3 +-
 hw/nvram/xlnx-bbram.c                     | 545 +++++++++++++++++++
 hw/nvram/xlnx-efuse-crc.c                 | 119 +++++
 hw/nvram/xlnx-efuse.c                     | 280 ++++++++++
 hw/nvram/xlnx-versal-efuse-cache.c        | 114 ++++
 hw/nvram/xlnx-versal-efuse-ctrl.c         | 783 +++++++++++++++++++++++++++
 hw/nvram/xlnx-zynqmp-efuse.c              | 855 ++++++++++++++++++++++++++++++
 hw/pci-host/raven.c                       |   4 +-
 hw/pci-host/versatile.c                   |   6 +-
 hw/pci/pci.c                              |  30 +-
 hw/pci/pci_bridge.c                       |   4 +-
 hw/ppc/spapr_vio.c                        |   2 +-
 hw/s390x/ap-bridge.c                      |   2 +-
 hw/s390x/css-bridge.c                     |   2 +-
 hw/s390x/event-facility.c                 |   4 +-
 hw/s390x/s390-pci-bus.c                   |   2 +-
 hw/s390x/virtio-ccw.c                     |   3 +-
 hw/scsi/esp-pci.c                         |   2 +-
 hw/scsi/esp.c                             |   2 +-
 hw/scsi/lsi53c895a.c                      |   2 +-
 hw/scsi/megasas.c                         |   3 +-
 hw/scsi/mptsas.c                          |   2 +-
 hw/scsi/scsi-bus.c                        |   6 +-
 hw/scsi/spapr_vscsi.c                     |   3 +-
 hw/scsi/virtio-scsi.c                     |   4 +-
 hw/scsi/vmw_pvscsi.c                      |   3 +-
 hw/sd/allwinner-sdhost.c                  |   4 +-
 hw/sd/bcm2835_sdhost.c                    |   4 +-
 hw/sd/pl181.c                             |   3 +-
 hw/sd/pxa2xx_mmci.c                       |   4 +-
 hw/sd/sdhci.c                             |   3 +-
 hw/sd/ssi-sd.c                            |   3 +-
 hw/ssi/ssi.c                              |   2 +-
 hw/usb/bus.c                              |   2 +-
 hw/usb/dev-smartcard-reader.c             |   3 +-
 hw/usb/dev-storage-bot.c                  |   3 +-
 hw/usb/dev-storage-classic.c              |   4 +-
 hw/usb/dev-uas.c                          |   3 +-
 hw/virtio/virtio-mmio.c                   |   3 +-
 hw/virtio/virtio-pci.c                    |   3 +-
 hw/xen/xen-bus.c                          |   2 +-
 hw/xen/xen-legacy-backend.c               |   2 +-
 target/arm/gdbstub.c                      | 154 ++++++
 target/arm/gdbstub64.c                    | 140 +++++
 target/arm/helper.c                       | 262 ---------
 target/arm/psci.c                         |  35 +-
 gdb-xml/arm-neon.xml                      |   2 -
 gdb-xml/arm-vfp-sysregs.xml               |  17 +
 gdb-xml/arm-vfp.xml                       |   2 -
 gdb-xml/arm-vfp3.xml                      |   2 -
 hw/Kconfig                                |   2 +
 hw/arm/Kconfig                            |   2 +
 hw/nvram/Kconfig                          |  19 +
 hw/nvram/meson.build                      |   8 +
 108 files changed, 3806 insertions(+), 447 deletions(-)
 create mode 100644 include/hw/nvram/xlnx-bbram.h
 create mode 100644 include/hw/nvram/xlnx-efuse.h
 create mode 100644 include/hw/nvram/xlnx-versal-efuse.h
 create mode 100644 include/hw/nvram/xlnx-zynqmp-efuse.h
 create mode 100644 hw/nvram/xlnx-bbram.c
 create mode 100644 hw/nvram/xlnx-efuse-crc.c
 create mode 100644 hw/nvram/xlnx-efuse.c
 create mode 100644 hw/nvram/xlnx-versal-efuse-cache.c
 create mode 100644 hw/nvram/xlnx-versal-efuse-ctrl.c
 create mode 100644 hw/nvram/xlnx-zynqmp-efuse.c
 create mode 100644 gdb-xml/arm-vfp-sysregs.xml

