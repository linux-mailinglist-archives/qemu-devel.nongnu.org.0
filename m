Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F914BDA12
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:06:35 +0100 (CET)
Received: from localhost ([::1]:37764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9Kj-0006hj-TO
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM8mx-0007k4-Nm
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:31:41 -0500
Received: from [2a00:1450:4864:20::333] (port=45653
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM8mu-0007j4-3Q
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:31:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso11198612wmb.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGH8+druh56GLtcN9tdlv3bBguAArTWHiL6/1L6axWs=;
 b=sLxTWqCWsdmz/PpKxYu1KyWcYZPY31yVROSr3PWx/cq6YIwMy3UiDHtaZykTYJGsmT
 jiuzNRojDRJLryeCcXXPhkbhwhepT+MdzLZfXsPoG8oU8uWNT/cE8enP2sCsPEWIGxLW
 1XPygNGSS7SaZFGmRIMRjzNyLZdXyXD6oqyaUNFVl3kW+dRoSz3rc6JJ4wRTHWZHPtOR
 W4/A+xlYhZQjCQNEShGfFrx0Whc8w/gUoe6mJtq9lXQGAHYQ1WAD3+oEVmvyF6GUG2A5
 VqdWvzyCiOhiAFdBS6dmVFT0fclqLVAiT4bs22+UKcpxdi7ngTVPjlE2cGn2uwshgfAE
 wmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGH8+druh56GLtcN9tdlv3bBguAArTWHiL6/1L6axWs=;
 b=wnwPyMbTAI0nzf0+LASejmgVyWcgqjNqGovH/WfJBIDuDT1U9GxdIu9IEidYlfPdyM
 2oPkpa7TEWx8I8+yhgEx+tP5VGfXShFU3HHuts6Z2t61oY0baNuwv6r438BRnVdOQmvd
 nRnMG9HscsGPcTL24brzpH87aEORAJN1YhgDJWYwoYTZb+u6X43ZjJFvdkSPnxFg327U
 kg/uggQ4EJ6EeS9NtT83kmzIhN150oAGcwD5nn/vUUx/DbJW39rUgcGt45q7sP1/M8+u
 vfs2HvMJ6gB0Vet6XflteNhSsYDxhHMK8B5KjGXzTCe2j8jjP9UlC//7vgOcpbn1sNDD
 RmDw==
X-Gm-Message-State: AOAM531KwepPHPDcwUT8tFNq5TBfmhvQYUb3pdA9YUhQSS6JBiYViup9
 r2AZYp6CFgYzZL+OzQkCY02w3Fjju7M4dQ==
X-Google-Smtp-Source: ABdhPJylMFU2e1iAV4XFkOZRvG3W6ph05FF5rAP+sItfcSOJ22dJyfaRMRC2al+P87MfLblsvRGbTQ==
X-Received: by 2002:a05:600c:2b88:b0:37b:b576:7590 with SMTP id
 j8-20020a05600c2b8800b0037bb5767590mr17777491wmc.71.1645450294005; 
 Mon, 21 Feb 2022 05:31:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id d14sm42507831wri.93.2022.02.21.05.31.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:31:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/25] target-arm queue
Date: Mon, 21 Feb 2022 13:31:31 +0000
Message-Id: <20220221133131.505884-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

v2: drop npcm7xx sdhci tests: new tests assert on some platforms.

-- PMM

The following changes since commit e670f6d825d4dee248b311197fd4048469d6772b:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220218' into staging (2022-02-20 15:05:41 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220221-1

for you to fetch changes up to ca511604925eef8572e22ecbf0d3c758d7277924:

  ui/cocoa: Fix the leak of qemu_console_get_label (2022-02-21 13:30:21 +0000)

----------------------------------------------------------------
arm, cocoa and misc:
 * MAINTAINERS file updates
 * Mark remaining global TypeInfo instances as const
 * checkpatch: Ensure that TypeInfos are const
 * arm hvf: Handle unknown ID registers as RES0
 * Make KVM -cpu max exactly like -cpu host
 * Fix '-cpu max' for HVF
 * Support PAuth extension for hvf
 * Kconfig: Add I2C_DEVICES device group
 * Kconfig: Add 'imply I2C_DEVICES' on boards with available i2c bus
 * hw/arm/armv7m: Handle disconnected clock inputs
 * osdep.h: pull out various things into new header files
 * hw/timer: fix a9gtimer vmstate
 * hw/arm: add initial mori-bmc board
 * ui/cocoa: Remove allowedFileTypes restriction in SavePanel
 * ui/cocoa: Do not alert even without block devices
 * ui/cocoa: Fix the leak of qemu_console_get_label

----------------------------------------------------------------
Akihiko Odaki (3):
      MAINTAINERS: Add Akihiko Odaki to macOS-relateds
      ui/cocoa: Do not alert even without block devices
      ui/cocoa: Fix the leak of qemu_console_get_label

Alexander Graf (2):
      hvf: arm: Use macros for sysreg shift/masking
      hvf: arm: Handle unknown ID registers as RES0

Ani Sinha (1):
      MAINTAINERS: Adding myself as a reviewer of some components

Bernhard Beschow (2):
      Mark remaining global TypeInfo instances as const
      checkpatch: Ensure that TypeInfos are const

Patrick Venture (1):
      hw/arm: add initial mori-bmc board

Pavel Dovgalyuk (1):
      hw/timer: fix a9gtimer vmstate

Peter Maydell (14):
      target/arm: Move '-cpu host' code to cpu64.c
      target/arm: Use aarch64_cpu_register() for 'host' CPU type
      target/arm: Make KVM -cpu max exactly like -cpu host
      target/arm: Unindent unnecessary else-clause
      target/arm: Fix '-cpu max' for HVF
      target/arm: Support PAuth extension for hvf
      Kconfig: Add I2C_DEVICES device group
      Kconfig: Add 'imply I2C_DEVICES' on boards with available i2c bus
      hw/arm/armv7m: Handle disconnected clock inputs
      include: Move qemu_madvise() and related #defines to new qemu/madvise.h
      include: Move qemu_mprotect_*() to new qemu/mprotect.h
      include: Move QEMU_MAP_* constants to mmap-alloc.h
      include: Move qemu_[id]cache_* declarations to new qemu/cacheinfo.h
      include: Move hardware version declarations to new qemu/hw-version.h

Philippe Mathieu-Daudé (1):
      ui/cocoa: Remove allowedFileTypes restriction in SavePanel

 docs/devel/kconfig.rst      |   8 +-
 docs/system/arm/nuvoton.rst |   1 +
 include/qemu/cacheinfo.h    |  21 +++
 include/qemu/hw-version.h   |  27 ++++
 include/qemu/madvise.h      |  95 +++++++++++++
 include/qemu/mmap-alloc.h   |  23 +++
 include/qemu/mprotect.h     |  14 ++
 include/qemu/osdep.h        | 132 ------------------
 accel/tcg/translate-all.c   |   1 +
 backends/hostmem-file.c     |   1 +
 backends/hostmem.c          |   1 +
 hw/arm/armv7m.c             |  26 +++-
 hw/arm/npcm7xx_boards.c     |  32 +++++
 hw/arm/nseries.c            |   1 +
 hw/core/generic-loader.c    |   2 +-
 hw/core/guest-loader.c      |   2 +-
 hw/display/bcm2835_fb.c     |   2 +-
 hw/display/i2c-ddc.c        |   2 +-
 hw/display/macfb.c          |   4 +-
 hw/display/virtio-vga.c     |   2 +-
 hw/dma/bcm2835_dma.c        |   2 +-
 hw/i386/pc_piix.c           |   2 +-
 hw/i386/sgx-epc.c           |   2 +-
 hw/ide/core.c               |   1 +
 hw/intc/bcm2835_ic.c        |   2 +-
 hw/intc/bcm2836_control.c   |   2 +-
 hw/ipmi/ipmi.c              |   4 +-
 hw/mem/nvdimm.c             |   2 +-
 hw/mem/pc-dimm.c            |   2 +-
 hw/misc/bcm2835_mbox.c      |   2 +-
 hw/misc/bcm2835_powermgt.c  |   2 +-
 hw/misc/bcm2835_property.c  |   2 +-
 hw/misc/bcm2835_rng.c       |   2 +-
 hw/misc/pvpanic-isa.c       |   2 +-
 hw/misc/pvpanic-pci.c       |   2 +-
 hw/net/fsl_etsec/etsec.c    |   2 +-
 hw/ppc/prep_systemio.c      |   2 +-
 hw/ppc/spapr_iommu.c        |   2 +-
 hw/s390x/s390-pci-bus.c     |   2 +-
 hw/s390x/sclp.c             |   2 +-
 hw/s390x/tod-kvm.c          |   2 +-
 hw/s390x/tod-tcg.c          |   2 +-
 hw/s390x/tod.c              |   2 +-
 hw/scsi/lsi53c895a.c        |   2 +-
 hw/scsi/megasas.c           |   1 +
 hw/scsi/scsi-bus.c          |   1 +
 hw/scsi/scsi-disk.c         |   1 +
 hw/sd/allwinner-sdhost.c    |   2 +-
 hw/sd/aspeed_sdhci.c        |   2 +-
 hw/sd/bcm2835_sdhost.c      |   2 +-
 hw/sd/cadence_sdhci.c       |   2 +-
 hw/sd/npcm7xx_sdhci.c       |   2 +-
 hw/timer/a9gtimer.c         |  21 +++
 hw/usb/dev-mtp.c            |   2 +-
 hw/usb/host-libusb.c        |   2 +-
 hw/vfio/igd.c               |   2 +-
 hw/virtio/virtio-balloon.c  |   1 +
 hw/virtio/virtio-pmem.c     |   2 +-
 migration/postcopy-ram.c    |   1 +
 migration/qemu-file.c       |   1 +
 migration/ram.c             |   1 +
 plugins/loader.c            |   1 +
 qom/object.c                |   4 +-
 softmmu/physmem.c           |   1 +
 softmmu/vl.c                |   1 +
 target/arm/cpu.c            |  30 ----
 target/arm/cpu64.c          | 331 ++++++++++++++++++++++++--------------------
 target/arm/hvf/hvf.c        |  83 ++++++++---
 target/i386/cpu.c           |   1 +
 target/s390x/cpu_models.c   |   1 +
 tcg/region.c                |   3 +
 tcg/tcg.c                   |   1 +
 util/atomic64.c             |   1 +
 util/cacheflush.c           |   1 +
 util/cacheinfo.c            |   1 +
 util/osdep.c                |   3 +
 util/oslib-posix.c          |   1 +
 MAINTAINERS                 |   5 +
 hw/arm/Kconfig              |  10 ++
 hw/i2c/Kconfig              |   5 +
 hw/rtc/Kconfig              |   2 +
 hw/sensor/Kconfig           |   5 +
 scripts/checkpatch.pl       |   1 +
 ui/cocoa.m                  |  15 +-
 84 files changed, 606 insertions(+), 393 deletions(-)
 create mode 100644 include/qemu/cacheinfo.h
 create mode 100644 include/qemu/hw-version.h
 create mode 100644 include/qemu/madvise.h
 create mode 100644 include/qemu/mprotect.h

