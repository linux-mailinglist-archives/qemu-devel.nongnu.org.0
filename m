Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB53F8CAF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:06:17 +0200 (CEST)
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIpU-0007wf-72
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImY-0004yw-Fc
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:14 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImW-0008FO-93
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z4so6154436wrr.6
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9H9wu9brDDFrPLGmL4uvD7B4quY2qC3Q91Wy9LZ6UQE=;
 b=bydXt5LrNm1bDDqMoWuOEr9BHshEfvxn/D3zA+VaVdG2ZUxLHoMo4xHY/9pIWYxeOP
 zE7NoxNvpCx1+PtM8q/uwGUvHmkZ/ZOyf1KCnJNK/Wg4qBx9qBBzg6Ro/NeQ8NZ+UfM+
 ZmXZ85ZCacNGyNp0QtygKOgkZBPq+z0qa9A2mrVqCL7BzakzhM2NjbumFguNqCPoxyGc
 GFtAZeCzkMNpiEtfeAJmKVswcR0bA/Sy5Vv2bPxPZK6s7vK/eoy5WmpmP3wXXa3D5uGV
 Srz0KJ4LHXs8TI3+bI27MLPcccVGgsrt/Rm7lK0X9diaK9pvOYhICvAXuP/g4ED+NF3I
 zjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9H9wu9brDDFrPLGmL4uvD7B4quY2qC3Q91Wy9LZ6UQE=;
 b=kwn+dlrlKA5butD4VbNb4PNtyY3PqaRO2ArbPGNXgO86rHv44PyuGPvuhsSxtIyyXT
 41hHgAw5somkmrEZcRo/HAOv8mNtqacmOus2opc6ds3nDj3jZupMoRyIiC6L+TrXpdRX
 QGArrHAXrVdGxrwx1XEexcqkAnJXewA9+eApqP2njtZeLKraUo90tIzG82rOYhX3MGMR
 2E+KijHq+f3+6bsWdQ/PawSLWhhER7YBrY3GVkbspEcl0lV/8ZNh9b+fPzq6HA8cig3g
 HNxv7qiWNJbn2Jo2Rop7UJjcBZ1lbfWeZAS2IjmxzDaKubKh5wtBXG02SmnegBdreUup
 bpvA==
X-Gm-Message-State: AOAM530rh7UuNA4nnDm6wDa3cX/JLD9pGXutkgPrRBbLRCbyFPFay9jU
 fSrasjCQDLakO0ZBqY3AQMZkCCS4QMmJbw==
X-Google-Smtp-Source: ABdhPJwGBqLGewpUsl35nAvRap08BD+h8MNHNRD+obuk2YqNgNBdlw1yNQO+zCTGMxgy+fStRJQpGg==
X-Received: by 2002:adf:dcc7:: with SMTP id x7mr5213529wrm.173.1629997390509; 
 Thu, 26 Aug 2021 10:03:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/37] target-arm queue
Date: Thu, 26 Aug 2021 18:02:30 +0100
Message-Id: <20210826170307.27733-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

More accumulated patches from during the freeze...

The following changes since commit c83fcfaf8a54d0d034bd0edf7bbb3b0d16669be9:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-08-26' into staging (2021-08-26 13:42:34 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210826

for you to fetch changes up to d2e6f370138a7f32bc28b20dcd55374b7a638f39:

  hw/arm/xlnx-zynqmp: Add unimplemented APU mmio (2021-08-26 17:02:01 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/dma/xlnx-zdma, xlnx_csu_dma: Require 'dma' link property to be set
 * hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly
 * target/arm/cpu: Introduce sve_vq_supported bitmap
 * docs/specs: Convert ACPI spec docs to rST
 * arch_init: Clean up and refactoring
 * hw/core/loader: In gunzip(), check index is in range before use, not after
 * softmmu/physmem.c: Remove unneeded NULL check in qemu_ram_alloc_from_fd()
 * softmmu/physmem.c: Check return value from realpath()
 * Zero-initialize sockaddr_in structs
 * raspi: Use error_fatal for SoC realize errors, not error_abort
 * target/arm: Avoid assertion trying to use KVM and multiple ASes
 * target/arm: Implement HSTR.TTEE
 * target/arm: Implement HSTR.TJDBX
 * target/arm: Do hflags rebuild in cpsr_write()
 * hw/arm/xlnx-versal, xlnx-zynqmp: Add unimplemented APU mmio

----------------------------------------------------------------
Andrew Jones (4):
      target/arm/cpu: Introduce sve_vq_supported bitmap
      target/arm/kvm64: Ensure sve vls map is completely clear
      target/arm/cpu64: Replace kvm_supported with sve_vq_supported
      target/arm/cpu64: Validate sve vector lengths are supported

Ani Sinha (1):
      hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly

Peter Maydell (26):
      docs/specs/acpu_cpu_hotplug: Convert to rST
      docs/specs/acpi_mem_hotplug: Convert to rST
      docs/specs/acpi_pci_hotplug: Convert to rST
      docs/specs/acpi_nvdimm: Convert to rST
      MAINTAINERS: Add ACPI specs documents to ACPI and NVDIMM sections
      softmmu: Use accel_find("xen") instead of xen_available()
      monitor: Use accel_find("kvm") instead of kvm_available()
      softmmu/arch_init.c: Trim down include list
      meson.build: Define QEMU_ARCH in config-target.h
      arch_init.h: Add QEMU_ARCH_HEXAGON
      arch_init.h: Move QEMU_ARCH_VIRTIO_* to qdev-monitor.c
      arch_init.h: Don't include arch_init.h unnecessarily
      stubs: Remove unused arch_type.c stub
      hw/core/loader: In gunzip(), check index is in range before use, not after
      softmmu/physmem.c: Remove unneeded NULL check in qemu_ram_alloc_from_fd()
      softmmu/physmem.c: Check return value from realpath()
      net: Zero sockaddr_in in parse_host_port()
      gdbstub: Zero-initialize sockaddr structs
      tests/qtest/ipmi-bt-test: Zero-initialize sockaddr struct
      tests/tcg/multiarch/linux-test: Zero-initialize sockaddr structs
      raspi: Use error_fatal for SoC realize errors, not error_abort
      target/arm: Avoid assertion trying to use KVM and multiple ASes
      hw/arm/virt: Delete EL3 error checksnow provided in CPU realize
      target/arm: Implement HSTR.TTEE
      target/arm: Implement HSTR.TJDBX
      target/arm: Do hflags rebuild in cpsr_write()

Philippe Mathieu-Daudé (4):
      hw/arm/xlnx-zynqmp: Realize qspi controller *after* qspi_dma
      hw/dma/xlnx_csu_dma: Run trivial checks early in realize()
      hw/dma/xlnx_csu_dma: Always expect 'dma' link property to be set
      hw/dma/xlnx-zdma Always expect 'dma' link property to be set

Tong Ho (2):
      hw/arm/xlnx-versal: Add unimplemented APU mmio
      hw/arm/xlnx-zynqmp: Add unimplemented APU mmio

 docs/specs/acpi_cpu_hotplug.rst                    | 235 +++++++++++++++++++++
 docs/specs/acpi_cpu_hotplug.txt                    | 160 --------------
 docs/specs/acpi_mem_hotplug.rst                    | 128 +++++++++++
 docs/specs/acpi_mem_hotplug.txt                    |  94 ---------
 docs/specs/acpi_nvdimm.rst                         | 228 ++++++++++++++++++++
 docs/specs/acpi_nvdimm.txt                         | 188 -----------------
 .../{acpi_pci_hotplug.txt => acpi_pci_hotplug.rst} |  37 ++--
 docs/specs/index.rst                               |   4 +
 meson.build                                        |   2 +
 include/hw/arm/xlnx-versal.h                       |   2 +
 include/hw/arm/xlnx-zynqmp.h                       |   7 +
 include/hw/dma/xlnx-zdma.h                         |   2 +-
 include/hw/dma/xlnx_csu_dma.h                      |   2 +-
 include/sysemu/arch_init.h                         |  15 +-
 target/arm/cpu.h                                   |  17 +-
 target/arm/helper.h                                |   2 +
 target/arm/syndrome.h                              |   7 +
 blockdev.c                                         |   1 -
 gdbstub.c                                          |   4 +-
 hw/arm/raspi.c                                     |   2 +-
 hw/arm/virt.c                                      |   5 -
 hw/arm/xlnx-versal.c                               |   4 +
 hw/arm/xlnx-zynqmp.c                               |  86 ++++++--
 hw/core/loader.c                                   |  35 ++-
 hw/dma/xlnx-zdma.c                                 |  24 +--
 hw/dma/xlnx_csu_dma.c                              |  31 ++-
 hw/i386/pc.c                                       |   1 -
 hw/i386/pc_piix.c                                  |   1 -
 hw/i386/pc_q35.c                                   |   1 -
 hw/mips/jazz.c                                     |   1 -
 hw/mips/malta.c                                    |   1 -
 hw/ppc/prep.c                                      |   1 -
 hw/riscv/sifive_e.c                                |   1 -
 hw/riscv/sifive_u.c                                |   1 -
 hw/riscv/spike.c                                   |   1 -
 hw/riscv/virt.c                                    |   1 -
 linux-user/arm/signal.c                            |   2 -
 monitor/qmp-cmds.c                                 |   3 +-
 net/net.c                                          |   2 +
 softmmu/arch_init.c                                |  66 ------
 softmmu/physmem.c                                  |   5 +-
 softmmu/qdev-monitor.c                             |   9 +
 softmmu/vl.c                                       |   6 +-
 stubs/arch_type.c                                  |   4 -
 target/arm/cpu.c                                   |  23 ++
 target/arm/cpu64.c                                 | 118 +++++------
 target/arm/helper.c                                |  40 +++-
 target/arm/kvm64.c                                 |   2 +-
 target/arm/op_helper.c                             |  16 ++
 target/arm/translate.c                             |  12 ++
 target/ppc/cpu_init.c                              |   1 -
 target/s390x/cpu-sysemu.c                          |   1 -
 tests/qtest/ipmi-bt-test.c                         |   2 +-
 tests/tcg/multiarch/linux-test.c                   |   4 +-
 MAINTAINERS                                        |   5 +
 hw/arm/Kconfig                                     |   2 -
 stubs/meson.build                                  |   1 -
 57 files changed, 949 insertions(+), 707 deletions(-)
 create mode 100644 docs/specs/acpi_cpu_hotplug.rst
 delete mode 100644 docs/specs/acpi_cpu_hotplug.txt
 create mode 100644 docs/specs/acpi_mem_hotplug.rst
 delete mode 100644 docs/specs/acpi_mem_hotplug.txt
 create mode 100644 docs/specs/acpi_nvdimm.rst
 delete mode 100644 docs/specs/acpi_nvdimm.txt
 rename docs/specs/{acpi_pci_hotplug.txt => acpi_pci_hotplug.rst} (51%)
 delete mode 100644 stubs/arch_type.c

