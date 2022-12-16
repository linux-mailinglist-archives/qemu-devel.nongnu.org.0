Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C5664F422
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:31:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU2-00060I-2K; Fri, 16 Dec 2022 16:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITj-0005vK-E3
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:53 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITh-0000ad-DO
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:51 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so5040701wmh.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/wUvI3dux/q059zDrQ1mwdElAMMkANGlFRKKdZJQP1A=;
 b=gWecYp4K+w+UjVBcDkepQXf9mkCv/TFi5LgoUtSeycG5dMopROBqtB4G4uFB3PtLEL
 NrROb3pE8j41xNvVshHQhxvKtPFSDDZJ7Cm18hXKEHg344ygkQt9z2+ouJ7P5cUhNqbG
 OQi2kfilTLiqwJwzlaMXIkkjY5rjIcPTYTdsYJYrcOyM4Z9zVHOEuFYgxyQs6clfh4be
 xm1VCZvAPTh8vIQzPQmKfm6MQ8SW7008gDrYVWZbwRaPBcB3nECh2dc/1WQ/8KgmsntW
 SiCZHWCjm302zR9CRrdZg25R+etp0AT7fpNJN22k01Eq0hPVfZTdnnEkW053JMdnRnba
 pJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/wUvI3dux/q059zDrQ1mwdElAMMkANGlFRKKdZJQP1A=;
 b=3A99FLDV2pVrKApz0eqbCHZtR+wqX9cJFREvYpWWLfcXgTMffKcnTB/OZtlOS/D/Pp
 AHb512+SwxwuQ/BveepZPB4S04r7q1OVQaFIFluLE0xdcQQwkP+thTuX8IVJYsrxSd3c
 lI49awxL79niUJiUs6fyHdFtsFtT96pbXhbrk9kryXRtbJqAwJwHTPtMIeBfqgOqv6i4
 ZBn1BMS8T0uM06ETqSn3PdnQE/ok61D0MHGQzizobQxTsGkgBoKuWjPSE6DP6aWr3nYZ
 kE+QgwYhaFWNelaL+MHEMOhrX5CHtfDZtJgp+tD+ysqGU/Bhh+uTMM/33+89zfg/Cwd2
 cJVQ==
X-Gm-Message-State: ANoB5pn/CDrVtc39yKTZ5K5q2fb52zTQIApYOoWQQXrVVwAHzpeVUFf+
 FbyIrgkLl0HQJRpnAKxifUmkebYlIu4ufych
X-Google-Smtp-Source: AA0mqf5tOO+qoLqJw75cFq0vLLOld18vS43OnuBrc1EOa903S2e7cfblP7kmiMknuANeNj1yDrQEzg==
X-Received: by 2002:a05:600c:310e:b0:3cf:b07a:cd2f with SMTP id
 g14-20020a05600c310e00b003cfb07acd2fmr25994306wmo.37.1671226966403; 
 Fri, 16 Dec 2022 13:42:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/36] reset refactoring patches
Date: Fri, 16 Dec 2022 21:42:08 +0000
Message-Id: <20221216214244.1391647-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This pull request collects up various reset-related patches
that I sent out and had reviewed during freeze. I've sent
them all here because they touch various devices across
the tree, and this seems more efficient than splitting them
across different submaintainer trees.

thanks
-- PMM

The following changes since commit 4208e6ae114ac8266dcacc9696a443ce5c37b04e:

  Merge tag 'pull-request-2022-12-15' of https://gitlab.com/thuth/qemu into staging (2022-12-15 21:39:56 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221216

for you to fetch changes up to a0c2e80afc98a9771b109eb5ce0b47edd7c78155:

  hw/pci-host/pnv_phb3_msi: Convert TYPE_PHB3_MSI to 3-phase reset (2022-12-16 15:59:07 +0000)

----------------------------------------------------------------
reset refactoring queue:
 * remove uses of qdev_reset_all(), qbus_reset_all(), device_legacy_reset()
 * convert various devices to 3-phase reset, so we can remove their
   uses of device_class_set_parent_reset()

----------------------------------------------------------------
Peter Maydell (36):
      hw/s390x/s390-pci-inst.c: Use device_cold_reset() to reset PCI devices
      pci: Use device_cold_reset() and bus_cold_reset()
      hw/hyperv/vmbus: Use device_cold_reset() and bus_cold_reset()
      Replace use of qdev_reset_all() with device_cold_reset()
      qdev: Remove qdev_reset_all() and qbus_reset_all()
      hw: Remove device_legacy_reset()
      hw/input/ps2: Convert TYPE_PS2_DEVICE to 3-phase reset
      hw/input/ps2.c: Convert TYPE_PS2_{KBD, MOUSE}_DEVICE to 3-phase reset
      hw/misc/mos6522: Convert TYPE_MOS6522 to 3-phase reset
      hw/misc: Convert TYPE_MOS6522 subclasses to 3-phase reset
      hw/core/cpu-common: Convert TYPE_CPU class to 3-phase reset
      target/arm: Convert to 3-phase reset
      target/avr: Convert to 3-phase reset
      target/cris: Convert to 3-phase reset
      target/hexagon: Convert to 3-phase reset
      target/i386: Convert to 3-phase reset
      target/loongarch: Convert to 3-phase reset
      target/m68k: Convert to 3-phase reset
      target/microblaze: Convert to 3-phase reset
      target/mips: Convert to 3-phase reset
      target/nios2: Convert to 3-phase reset
      target/openrisc: Convert to 3-phase reset
      target/ppc: Convert to 3-phase reset
      target/riscv: Convert to 3-phase reset
      target/rx: Convert to 3-phase reset
      target/sh4: Convert to 3-phase reset
      target/sparc: Convert to 3-phase reset
      target/tricore: Convert to 3-phase reset
      target/xtensa: Convert to 3-phase reset
      hw/virtio: Convert TYPE_VIRTIO_PCI to 3-phase reset
      hw/display/virtio-vga: Convert TYPE_VIRTIO_VGA_BASE to 3-phase reset
      pci: Convert TYPE_PCIE_ROOT_PORT to 3-phase reset
      pci: Convert child classes of TYPE_PCIE_ROOT_PORT to 3-phase reset
      hw/intc/xics: Reset TYPE_ICS objects with device_cold_reset()
      hw/intc/xics: Convert TYPE_ICS to 3-phase reset
      hw/pci-host/pnv_phb3_msi: Convert TYPE_PHB3_MSI to 3-phase reset

 hw/display/virtio-vga.h        |  2 +-
 include/hw/input/ps2.h         |  2 +-
 include/hw/misc/mos6522.h      |  2 +-
 include/hw/pci/pcie_port.h     |  2 +-
 include/hw/ppc/xics.h          |  2 +-
 include/hw/qdev-core.h         | 35 -----------------------
 target/arm/cpu-qom.h           |  4 +--
 target/avr/cpu-qom.h           |  4 +--
 target/cris/cpu-qom.h          |  4 +--
 target/hexagon/cpu.h           |  2 +-
 target/i386/cpu-qom.h          |  4 +--
 target/loongarch/cpu.h         |  4 +--
 target/m68k/cpu-qom.h          |  4 +--
 target/microblaze/cpu-qom.h    |  4 +--
 target/mips/cpu-qom.h          |  4 +--
 target/nios2/cpu.h             |  4 +--
 target/openrisc/cpu.h          |  4 +--
 target/ppc/cpu-qom.h           |  4 +--
 target/riscv/cpu.h             |  4 +--
 target/rx/cpu-qom.h            |  4 +--
 target/sh4/cpu-qom.h           |  4 +--
 target/sparc/cpu-qom.h         |  4 +--
 target/tricore/cpu-qom.h       |  2 +-
 target/xtensa/cpu-qom.h        |  4 +--
 hw/core/cpu-common.c           |  7 +++--
 hw/core/qdev.c                 | 64 ------------------------------------------
 hw/display/virtio-vga.c        | 15 ++++++----
 hw/hyperv/vmbus.c              |  4 +--
 hw/i386/xen/xen_platform.c     |  2 +-
 hw/input/adb.c                 |  2 +-
 hw/input/ps2.c                 | 45 ++++++++++++++++++++---------
 hw/intc/xics.c                 | 11 ++++----
 hw/misc/mac_via.c              | 26 ++++++++++-------
 hw/misc/macio/cuda.c           | 14 +++++----
 hw/misc/macio/pmu.c            | 14 +++++----
 hw/misc/mos6522.c              |  7 +++--
 hw/pci-bridge/cxl_root_port.c  | 14 +++++----
 hw/pci-bridge/pcie_root_port.c |  8 ++++--
 hw/pci-host/pnv_phb.c          | 18 ++++++------
 hw/pci-host/pnv_phb3_msi.c     | 22 ++++++---------
 hw/pci/pci.c                   |  6 ++--
 hw/pci/pci_bridge.c            |  2 +-
 hw/remote/vfio-user-obj.c      |  2 +-
 hw/s390x/s390-pci-inst.c       |  2 +-
 hw/s390x/s390-virtio-ccw.c     |  2 +-
 hw/usb/dev-uas.c               |  2 +-
 hw/virtio/virtio-pci.c         |  8 ++++--
 target/arm/cpu.c               | 13 ++++++---
 target/avr/cpu.c               | 13 ++++++---
 target/cris/cpu.c              | 12 +++++---
 target/hexagon/cpu.c           | 12 +++++---
 target/i386/cpu.c              | 12 +++++---
 target/loongarch/cpu.c         | 12 +++++---
 target/m68k/cpu.c              | 12 +++++---
 target/microblaze/cpu.c        | 12 +++++---
 target/mips/cpu.c              | 12 +++++---
 target/nios2/cpu.c             | 12 +++++---
 target/openrisc/cpu.c          | 12 +++++---
 target/ppc/cpu_init.c          | 12 +++++---
 target/riscv/cpu.c             | 12 +++++---
 target/rx/cpu.c                | 13 +++++----
 target/sh4/cpu.c               | 12 +++++---
 target/sparc/cpu.c             | 12 +++++---
 target/tricore/cpu.c           | 12 +++++---
 target/xtensa/cpu.c            | 12 +++++---
 hw/core/trace-events           |  6 ----
 66 files changed, 321 insertions(+), 314 deletions(-)

