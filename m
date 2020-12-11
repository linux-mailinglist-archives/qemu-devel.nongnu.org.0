Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1024A2D75AB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:34:22 +0100 (CET)
Received: from localhost ([::1]:38072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhcr-0002TW-0J
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knhZr-0008GG-FF
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knhZm-0002Qv-GD
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607689868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=47aGZd0MtxPtZGQMVWl1cle+dKP9Vf29XDN/toGrnVU=;
 b=BNZcSxRj6FqOAL2iOKgTPYaVvP9O+V1cpVhrCQasDMj8o5NGhR5rI1s8hMyZSkfi1LYJBP
 Pbl71FuDECe5R39WNmAn0DwcLf63eZ7C6f+YN8zNVXnCGWbWJ4knvJqqyU/BwR8Y0Dw9Ns
 h1j/KqHKi0cxwNcB04SkiTh3DqrO5HY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-sIi3zARhOvCqT4_6WLZpLA-1; Fri, 11 Dec 2020 07:31:05 -0500
X-MC-Unique: sIi3zARhOvCqT4_6WLZpLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04097EC1A0
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 12:31:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A98D75D71D
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 12:31:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 000/113] First batch of misc (i386, kernel-doc, memory,
 vl.c) changes for QEMU 6.0
Date: Fri, 11 Dec 2020 07:31:02 -0500
Message-Id: <20201211123103.615007-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 379e9eaed497a2e09b5985e1e15967d7bfea8296:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-aspeed-20201210' into staging (2020-12-10 14:26:35 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 953d0c333e2825656ba1ec5bd1c18bc53485b39c:

  scripts: kernel-doc: remove unnecessary change wrt Linux (2020-12-10 12:15:25 -0500)

----------------------------------------------------------------
* Fix for NULL segments (Bin Meng)
* Support for 32768 CPUs on x86 without IOMMU (David)
* PDEP/PEXT fix and testcase (myself)
* Remove bios_name and ram_size globals (myself)
* qemu_init rationalization (myself)
* Update kernel-doc (myself + upstream patches)
* Propagate MemTxResult across DMA and PCI functions (Philippe)
* Remove master/slave when applicable (Philippe)
* WHPX support for in-kernel irqchip (Sunil)

----------------------------------------------------------------

v2->v3: Fix warning on 32-bit compilation of test-i386-bmi2

Alexander A. Klimov (1):
      Replace HTTP links with HTTPS ones: documentation

André Almeida (2):
      kernel-doc: fix processing nested structs with attributes
      kernel-doc: add support for ____cacheline_aligned_in_smp attribute

Bin Meng (1):
      target/i386: seg_helper: Correct segment selector nullification in the RET/IRET helper

David Woodhouse (1):
      target/i386: Support up to 32768 CPUs without IRQ remapping

Jonathan Cameron (1):
      kernel-doc: add support for ____cacheline_aligned attribute

Jonathan Neuschäfer (1):
      scripts/kernel-doc: Add support for named variable macro arguments

Mauro Carvalho Chehab (19):
      scripts: kernel-doc: proper handle @foo->bar()
      scripts: kernel-doc: accept negation like !@var
      scripts: kernel-doc: accept blank lines on parameter description
      scripts/kernel-doc: parse __ETHTOOL_DECLARE_LINK_MODE_MASK
      scripts/kernel-doc: handle function pointer prototypes
      kernel-doc: include line numbers for function prototypes
      scripts: kernel-doc: add support for typedef enum
      scripts: kernel-doc: make it more compatible with Sphinx 3.x
      scripts: kernel-doc: use a less pedantic markup for funcs on Sphinx 3.x
      scripts: kernel-doc: fix troubles with line counts
      scripts: kernel-doc: reimplement -nofunction argument
      scripts: kernel-doc: fix typedef identification
      scripts: kernel-doc: don't mangle with parameter list
      scripts: kernel-doc: allow passing desired Sphinx C domain dialect
      scripts: kernel-doc: fix line number handling
      scripts: kernel-doc: try to use c:function if possible
      scripts: kernel-doc: fix typedef parsing
      scripts: kernel-doc: split typedef complex regex
      scripts: kernel-doc: use :c:union when needed

Paolo Bonzini (69):
      target/i386: fix operand order for PDEP and PEXT
      qom: eliminate identical functions
      alpha: remove bios_name
      arm: remove bios_name
      hppa: remove bios_name
      i386: remove bios_name
      lm32: remove bios_name
      m68k: remove bios_name
      mips: remove bios_name
      moxie: remove bios_name
      ppc: remove bios_name
      rx: move BIOS load from MCU to board
      s390: remove bios_name
      sh4: remove bios_name
      sparc: remove bios_name
      digic: remove bios_name
      vl: remove bios_name
      arm: do not use ram_size global
      cris: do not use ram_size global
      hppa: do not use ram_size global
      i386: do not use ram_size global
      m68k: do not use ram_size global
      microblaze: do not use ram_size global
      mips: do not use ram_size global
      moxie: do not use ram_size global
      nios2: do not use ram_size global
      ppc: do not use ram_size global
      riscv: do not use ram_size global
      s390x: do not use ram_size global
      sparc64: do not use ram_size global
      make ram_size local to vl.c
      treewide: do not use short-form boolean options
      vl: extract validation of -smp to machine.c
      vl: remove bogus check
      vl: split various early command line options to a separate function
      vl: move various initialization routines out of qemu_init
      vl: extract qemu_init_subsystems
      vl: move prelaunch part of qemu_init to new functions
      vl: extract various command line validation snippets to a new function
      vl: preconfig and loadvm are mutually exclusive
      vl: extract various command line desugaring snippets to a new function
      qemu-option: restrict qemu_opts_set to merge-lists QemuOpts
      vl: create "-net nic -net user" default earlier
      vl: load plugins as late as possible
      vl: extract default devices to separate functions
      vl: move CHECKPOINT_INIT after preconfig
      vl: separate qemu_create_early_backends
      vl: separate qemu_create_late_backends
      vl: separate qemu_create_machine
      vl: separate qemu_apply_machine_options
      vl: separate qemu_resolve_machine_memdev
      vl: initialize displays before preconfig loop
      vl: move -global check earlier
      migration, vl: start migration via qmp_migrate_incoming
      vl: start VM via qmp_cont
      hmp: introduce cmd_available
      vl: extract softmmu/datadir.c
      vl: extract machine done notifiers
      vl: extract softmmu/rtc.c
      vl: remove serial_max_hds
      vl: clean up -boot variables
      config-file: move -set implementation to vl.c
      docs: temporarily disable the kernel-doc extension
      Revert "scripts/kerneldoc: For Sphinx 3 use c:macro for macros with arguments"
      Revert "kernel-doc: Use c:struct for Sphinx 3.0 and later"
      Revert "kernel-doc: Handle function typedefs without asterisks"
      Revert "kernel-doc: Handle function typedefs that return pointers"
      Revert "docs: temporarily disable the kernel-doc extension"
      scripts: kernel-doc: remove unnecessary change wrt Linux

Philippe Mathieu-Daudé (16):
      docs/devel/loads-stores: Add regexp for DMA functions
      dma: Document address_space_map/address_space_unmap() prototypes
      dma: Let dma_memory_set() propagate MemTxResult
      dma: Let dma_memory_rw() propagate MemTxResult
      dma: Let dma_memory_read() propagate MemTxResult
      dma: Let dma_memory_write() propagate MemTxResult
      pci: Let pci_dma_rw() propagate MemTxResult
      pci: Let pci_dma_read() propagate MemTxResult
      pci: Let pci_dma_write() propagate MemTxResult
      hw/ssi/aspeed_smc: Rename 'max_slaves' variable as 'max_peripherals'
      hw/ssi: Update coding style to make checkpatch.pl happy
      hw/ssi: Rename SSI 'slave' as 'peripheral'
      hw/core/stream: Rename StreamSlave as StreamSink
      hw/dma/xilinx_axidma: Rename StreamSlave as StreamSink
      hw/net/xilinx_axienet: Rename StreamSlave as StreamSink
      hw/char/serial: Clean up unnecessary code

Pierre-Louis Bossart (1):
      scripts/kernel-doc: optionally treat warnings as errors

Sunil Muthuswamy (1):
      WHPX: support for the kernel-irqchip on/off

 MAINTAINERS                                 |    1 +
 docs/devel/loads-stores.rst                 |    2 +
 docs/specs/tpm.rst                          |    2 +-
 docs/sphinx/kerneldoc.py                    |    6 +-
 hw/alpha/dp264.c                            |    3 +-
 hw/arm/aspeed.c                             |    8 +-
 hw/arm/boot.c                               |    1 +
 hw/arm/cubieboard.c                         |    2 +-
 hw/arm/digic_boards.c                       |   20 +-
 hw/arm/highbank.c                           |    9 +-
 hw/arm/npcm7xx_boards.c                     |    6 +-
 hw/arm/orangepi.c                           |    2 +-
 hw/arm/sbsa-ref.c                           |    3 +
 hw/arm/spitz.c                              |   32 +-
 hw/arm/stellaris.c                          |    4 +-
 hw/arm/tosa.c                               |   12 +-
 hw/arm/vexpress.c                           |    9 +-
 hw/arm/virt.c                               |    3 +
 hw/arm/z2.c                                 |   14 +-
 hw/avr/boot.c                               |    1 +
 hw/block/m25p80.c                           |   14 +-
 hw/char/serial.c                            |   13 +-
 hw/core/generic-loader.c                    |    3 +-
 hw/core/loader.c                            |    1 +
 hw/core/machine.c                           |   56 +
 hw/core/numa.c                              |   10 +-
 hw/core/stream.c                            |   20 +-
 hw/cris/axis_dev88.c                        |    1 +
 hw/cris/boot.c                              |    2 +-
 hw/cris/boot.h                              |    1 +
 hw/display/ads7846.c                        |   12 +-
 hw/display/cg3.c                            |    1 +
 hw/display/pxa2xx_lcd.c                     |    5 +-
 hw/display/ssd0323.c                        |   12 +-
 hw/display/tcx.c                            |    1 +
 hw/dma/xilinx_axidma.c                      |   58 +-
 hw/hppa/machine.c                           |   14 +-
 hw/i386/fw_cfg.c                            |    2 +-
 hw/i386/kvm/apic.c                          |    7 +
 hw/i386/microvm.c                           |    7 +-
 hw/i386/pc.c                                |   16 +-
 hw/i386/pc_sysfw.c                          |    4 +-
 hw/i386/vmport.c                            |    3 +-
 hw/i386/x86.c                               |   17 +-
 hw/i386/xen/xen-hvm.c                       |    2 +-
 hw/intc/apic_common.c                       |    3 +-
 hw/lm32/milkymist.c                         |    5 +-
 hw/m68k/mcf5206.c                           |    4 +-
 hw/m68k/mcf5208.c                           |   14 +-
 hw/m68k/next-cube.c                         |    4 +-
 hw/m68k/q800.c                              |    5 +-
 hw/microblaze/boot.c                        |    9 +-
 hw/mips/fuloong2e.c                         |   11 +-
 hw/mips/jazz.c                              |    7 +-
 hw/mips/malta.c                             |    9 +-
 hw/mips/mipssim.c                           |    7 +-
 hw/misc/max111x.c                           |   18 +-
 hw/moxie/moxiesim.c                         |    8 +-
 hw/net/xilinx_axienet.c                     |   44 +-
 hw/nios2/boot.c                             |    9 +-
 hw/nvram/fw_cfg.c                           |    1 +
 hw/pci-host/prep.c                          |    1 +
 hw/pci/pci.c                                |    1 +
 hw/ppc/e500.c                               |    5 +-
 hw/ppc/mac_newworld.c                       |    5 +-
 hw/ppc/mac_oldworld.c                       |    5 +-
 hw/ppc/pnv.c                                |    6 +-
 hw/ppc/ppc405_boards.c                      |    7 +-
 hw/ppc/ppc440_bamboo.c                      |    1 +
 hw/ppc/prep.c                               |    6 +-
 hw/ppc/sam460ex.c                           |    1 +
 hw/ppc/spapr.c                              |   11 +-
 hw/ppc/spapr_vio.c                          |    4 +-
 hw/ppc/virtex_ml507.c                       |    1 +
 hw/riscv/boot.c                             |    6 +-
 hw/rx/rx-gdbsim.c                           |   10 +
 hw/rx/rx62n.c                               |    9 -
 hw/s390x/ipl.c                              |   19 +-
 hw/s390x/s390-skeys.c                       |    6 +-
 hw/s390x/s390-virtio-ccw.c                  |    7 +-
 hw/sd/ssi-sd.c                              |   12 +-
 hw/sh4/shix.c                               |    3 +-
 hw/smbios/smbios.c                          |    8 +-
 hw/sparc/leon3.c                            |    5 +-
 hw/sparc/sun4m.c                            |    3 +-
 hw/sparc64/sparc64.c                        |    3 +-
 hw/sparc64/sun4u.c                          |    7 +-
 hw/ssi/aspeed_smc.c                         |   53 +-
 hw/ssi/pl022.c                              |    2 +-
 hw/ssi/ssi.c                                |   48 +-
 hw/ssi/xilinx_spips.c                       |    9 +-
 hw/virtio/virtio-balloon.c                  |    3 +-
 include/exec/cpu-common.h                   |    2 -
 include/hw/boards.h                         |    2 +
 include/hw/i386/x86.h                       |    3 +-
 include/hw/misc/max111x.h                   |    2 +-
 include/hw/pci/pci.h                        |   50 +-
 include/hw/qdev-core.h                      |    8 -
 include/hw/ssi/aspeed_smc.h                 |    2 +-
 include/hw/ssi/ssi.h                        |   56 +-
 include/hw/ssi/xilinx_spips.h               |    2 +-
 include/hw/stream.h                         |   41 +-
 include/migration/misc.h                    |    1 -
 include/qemu-common.h                       |   21 -
 include/qemu/config-file.h                  |    1 -
 include/qemu/datadir.h                      |   28 +
 include/qemu/option.h                       |    3 +-
 include/standard-headers/asm-x86/kvm_para.h |    1 +
 include/sysemu/dma.h                        |  117 +-
 include/sysemu/sysemu.h                     |   10 +-
 include/sysemu/whpx.h                       |   22 +
 migration/migration.c                       |   37 +-
 monitor/hmp.c                               |   18 +-
 monitor/qmp-cmds.c                          |    3 +-
 python/qemu/machine.py                      |    2 +-
 qemu-options.hx                             |   32 +-
 qom/object.c                                |   36 +-
 scripts/kernel-doc                          |  455 ++++---
 softmmu/cpus.c                              |    3 +-
 softmmu/datadir.c                           |  129 ++
 softmmu/dma-helpers.c                       |    7 +-
 softmmu/meson.build                         |    2 +
 softmmu/qdev-monitor.c                      |    6 -
 softmmu/rtc.c                               |  190 +++
 softmmu/vl.c                                | 1755 ++++++++++++---------------
 target/arm/arm-semi.c                       |    3 +-
 target/i386/cpu.c                           |    8 +-
 target/i386/kvm.c                           |   77 +-
 target/i386/kvm_i386.h                      |    2 +
 target/i386/meson.build                     |    1 +
 target/i386/seg_helper.c                    |    5 +-
 target/i386/translate.c                     |    8 +-
 target/i386/whp-dispatch.h                  |    9 +-
 target/i386/whpx-all.c                      |  291 ++++-
 target/i386/whpx-apic.c                     |  274 +++++
 target/m68k/m68k-semi.c                     |    5 +-
 target/s390x/excp_helper.c                  |    3 +-
 target/s390x/mem_helper.c                   |   10 +-
 target/s390x/mmu_helper.c                   |    4 +-
 tests/qtest/bios-tables-test.c              |    4 +-
 tests/qtest/fuzz/fuzz.c                     |    1 +
 tests/qtest/pflash-cfi02-test.c             |    4 +-
 tests/qtest/test-filter-redirector.c        |    8 +-
 tests/qtest/vhost-user-test.c               |    8 +-
 tests/tcg/i386/Makefile.target              |    3 +
 tests/tcg/i386/test-i386-bmi2.c             |   42 +
 tests/test-char.c                           |    8 +-
 tests/test-qemu-opts.c                      |   20 +-
 ui/keymaps.c                                |    1 +
 util/qemu-config.c                          |   33 -
 util/qemu-option.c                          |    9 +-
 151 files changed, 2923 insertions(+), 1812 deletions(-)
 create mode 100644 include/qemu/datadir.h
 create mode 100644 softmmu/datadir.c
 create mode 100644 softmmu/rtc.c
 create mode 100644 target/i386/whpx-apic.c
 create mode 100644 tests/tcg/i386/test-i386-bmi2.c
-- 
2.26.2


