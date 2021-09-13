Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D4D409882
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:14:38 +0200 (CEST)
Received: from localhost ([::1]:58916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPobM-0003lP-OY
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYg-0000bC-VG
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:51 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYe-00080N-PH
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:50 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w29so14782653wra.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oShEz2m0Y8VmK7Jpr97QOFKWEywhhBuANXWJ1hk+9SQ=;
 b=M+//LpfhdetYtroEAUZr4UFISP6V/356Mgol/BVCkqZfTtJIRyJZjFW/LdjhsFxB0N
 v/kdwsfAqeaT0OsQtANIAzb+DkrBFUjwTEBPc9Xq4M0mfgG+rcfXAoyeTOHr+fe1Phah
 pfzUlF5zWY2n6U63nLzjTomi+9Yjpn8irgushwlRLVBfwGHEBWhHmkk3zq8sCPrtNsTf
 DkYDhs9Zhwb0ldQ91aY088gDx549jq3qFs4qRcP1o0X2ywMTpIVj10pU+judbp3K4OVw
 Mugs0lGJ02p0xw+cBMe4xbx9IEIf7pB8EFvPnmUDEFi4tdryS8nY6xYL/MIcgeGCFmz4
 6Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oShEz2m0Y8VmK7Jpr97QOFKWEywhhBuANXWJ1hk+9SQ=;
 b=FDDkw64krZaGtD66vtZWu1o9XAm0Nn8lSTW5cKtDtS6sKWI9rNjEh9aBk7KxMe1V4F
 VI/7gPdEco6cjXSKpmOuK9+Zj2ttnMPZ7jUFSvlTsjkf73Ilib1noXxn4Xf1kO5SVQ+x
 nBUP9EXNrM3oheK1wXTkGrF5EI0TQU2L+krjY2TWCSSTMfro5CR0klEaSI77NOUeOe6x
 IyxFOnnxfRFsJ3wjjPeYoZnJGnGkFsAdXob5PpKhGG5swGNBzJCdKni775yDvfJfmOkz
 6MUKNpFJZd3Am+KWENarGCDuPdMYgiJqULlaVVQb23GTXLTctPi3qRdoJogtq9q3cHBj
 Zshg==
X-Gm-Message-State: AOAM533WiVA5DpC6wc1kfugk1CkBgXlvyaYbwLoNEWM5L3fQlkg9M/8A
 GJAqcew+RoiNZoQWsUiEvnpyXHFc9hbK/g==
X-Google-Smtp-Source: ABdhPJzFT9PQzku+4wKHznYvF+sKdI/wKNqRMjqXZjdXrOrfpRM66uCd5tFT+0wtf0xlY9mvYU8hkg==
X-Received: by 2002:adf:eb83:: with SMTP id t3mr13242163wrn.365.1631549506663; 
 Mon, 13 Sep 2021 09:11:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] target-arm queue
Date: Mon, 13 Sep 2021 17:11:21 +0100
Message-Id: <20210913161144.12347-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

The following changes since commit eae587e8e3694b1aceab23239493fb4c7e1a80f5:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-13' into staging (2021-09-13 11:00:30 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210913

for you to fetch changes up to 9a2b2ecf4d25a3943918c95d2db4508b304161b5:

  hw/arm/mps2.c: Mark internal-only I2C buses as 'full' (2021-09-13 17:09:28 +0100)

----------------------------------------------------------------
target-arm queue:
 * mark MPS2/MPS3 board-internal i2c buses as 'full' so that command
   line user-created devices are not plugged into them
 * Take an exception if PSTATE.IL is set
 * Support an emulated ITS in the virt board
 * Add support for kudo-bmc board
 * Probe for KVM_CAP_ARM_VM_IPA_SIZE when creating scratch VM
 * cadence_uart: Fix clock handling issues that prevented
   u-boot from running

----------------------------------------------------------------
Bin Meng (6):
      hw/misc: zynq_slcr: Correctly compute output clocks in the reset exit phase
      hw/char: cadence_uart: Disable transmit when input clock is disabled
      hw/char: cadence_uart: Move clock/reset check to uart_can_receive()
      hw/char: cadence_uart: Convert to memop_with_attrs() ops
      hw/char: cadence_uart: Ignore access when unclocked or in reset for uart_{read, write}()
      hw/char: cadence_uart: Log a guest error when device is unclocked or in reset

Chris Rauer (1):
      hw/arm: Add support for kudo-bmc board.

Marc Zyngier (1):
      hw/arm/virt: KVM: Probe for KVM_CAP_ARM_VM_IPA_SIZE when creating scratch VM

Peter Maydell (5):
      target/arm: Take an exception if PSTATE.IL is set
      qdev: Support marking individual buses as 'full'
      hw/arm/mps2-tz.c: Add extra data parameter to MakeDevFn
      hw/arm/mps2-tz.c: Mark internal-only I2C buses as 'full'
      hw/arm/mps2.c: Mark internal-only I2C buses as 'full'

Richard Henderson (1):
      target/arm: Merge disas_a64_insn into aarch64_tr_translate_insn

Shashi Mallela (9):
      hw/intc: GICv3 ITS initial framework
      hw/intc: GICv3 ITS register definitions added
      hw/intc: GICv3 ITS command queue framework
      hw/intc: GICv3 ITS Command processing
      hw/intc: GICv3 ITS Feature enablement
      hw/intc: GICv3 redistributor ITS processing
      tests/data/acpi/virt: Add IORT files for ITS
      hw/arm/virt: add ITS support in virt GIC
      tests/data/acpi/virt: Update IORT files for ITS

 docs/system/arm/nuvoton.rst            |    1 +
 hw/intc/gicv3_internal.h               |  188 ++++-
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |   13 +
 include/hw/intc/arm_gicv3_its_common.h |   32 +-
 include/hw/qdev-core.h                 |   24 +
 target/arm/cpu.h                       |    1 +
 target/arm/kvm_arm.h                   |    4 +-
 target/arm/syndrome.h                  |    5 +
 target/arm/translate.h                 |    2 +
 hw/arm/mps2-tz.c                       |   92 ++-
 hw/arm/mps2.c                          |   12 +-
 hw/arm/npcm7xx_boards.c                |   34 +
 hw/arm/virt.c                          |   29 +-
 hw/char/cadence_uart.c                 |   61 +-
 hw/intc/arm_gicv3.c                    |   14 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |    7 +-
 hw/intc/arm_gicv3_dist.c               |    5 +-
 hw/intc/arm_gicv3_its.c                | 1322 ++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |    7 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  153 +++-
 hw/misc/zynq_slcr.c                    |   31 +-
 softmmu/qdev-monitor.c                 |    7 +-
 target/arm/helper-a64.c                |    1 +
 target/arm/helper.c                    |    8 +
 target/arm/kvm.c                       |    7 +-
 target/arm/translate-a64.c             |  255 +++---
 target/arm/translate.c                 |   21 +
 hw/intc/meson.build                    |    1 +
 tests/data/acpi/virt/IORT              |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp        |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem      |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb          |  Bin 0 -> 124 bytes
 35 files changed, 2144 insertions(+), 210 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

