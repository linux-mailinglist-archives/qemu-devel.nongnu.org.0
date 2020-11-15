Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C232B3623
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 17:28:23 +0100 (CET)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keKt4-00060s-Hj
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 11:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keKrC-0004GK-5G
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keKr8-0005kK-Cy
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605457579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bz+eMrzqM748LWeTH1UrT4kKTHrmqcWDlEPoXQGBaHA=;
 b=fjQP91wI0cLRySy5DN7VCNULPrdzVRlQJ1xnoSqgbrAr82ReoQ6rS0pf68hQJxTWsJiENQ
 XlD3ZArkBzy7ktpZ7fvuWx0MNyMEcA/XlF2avVY70fDY885iDQMRhxvbRrarMvwTv3mOvq
 tCYTbs5lnEhQ6M0AZ+za0hFK2v1NJ1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-RBGde-uINZi1U0IRq37Zpg-1; Sun, 15 Nov 2020 11:26:17 -0500
X-MC-Unique: RBGde-uINZi1U0IRq37Zpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E218A10866A1;
 Sun, 15 Nov 2020 16:26:16 +0000 (UTC)
Received: from thuth.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3A075B4D6;
 Sun, 15 Nov 2020 16:26:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/26] Fixes for Lesser GPL license statements
Date: Sun, 15 Nov 2020 17:25:47 +0100
Message-Id: <20201115162613.74645-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 08:01:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter,
 
the following changes since commit b50ea0d54bbca7d440315c3d0c0f7a4d6537b180:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201113-1' into staging (2020-11-14 11:22:07 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2020-11-15

for you to fetch changes up to 61f3c91a67c4695dee6904d841b393ea21003969:

  nomaintainer: Fix Lesser GPL version number (2020-11-15 17:04:40 +0100)

----------------------------------------------------------------
Fix Lesser GPL license versions (should be "2.1" and not "2")
----------------------------------------------------------------

Chetan Pant (23):
      semihosting: Fix Lesser GPL version number
      non-virt: Fix Lesser GPL version number
      powerpc tcg: Fix Lesser GPL version number
      cris tcg cpus: Fix Lesser GPL version number
      microblaze tcg cpus: Fix Lesser GPL version number
      prep: Fix Lesser GPL version number
      xtensa tcg cpus: Fix Lesser GPL version number
      tricore tcg cpus: Fix Lesser GPL version number
      usb: Fix Lesser GPL version number
      linux user: Fix Lesser GPL version number
      x86 tcg cpus: Fix Lesser GPL version number
      arm tcg cpus: Fix Lesser GPL version number
      parallel nor flash: Fix Lesser GPL version number
      migration: Fix Lesser GPL version number
      overall usermode...: Fix Lesser GPL version number
      overall/alpha tcg cpus|hppa: Fix Lesser GPL version number
      tpm: Fix Lesser GPL version number
      w32: Fix Lesser GPL version number
      nvdimm: Fix Lesser GPL version number
      x86 hvf cpus: Fix Lesser GPL version number
      e1000e: Fix Lesser GPL version number
      sparc tcg cpus: Fix Lesser GPL version number
      nomaintainer: Fix Lesser GPL version number

Gan Qixin (3):
      tests/migration: Fix LGPL information in the file headers
      tests/acceptance: Fix LGPL information in the file headers
      test: Fix LGPL information in the file headers

 backends/tpm/tpm_emulator.c                | 2 +-
 backends/tpm/tpm_passthrough.c             | 2 +-
 backends/tpm/tpm_util.c                    | 2 +-
 block/crypto.c                             | 2 +-
 block/crypto.h                             | 2 +-
 cpus-common.c                              | 2 +-
 disas/lm32.c                               | 2 +-
 exec-vary.c                                | 2 +-
 hw/acpi/core.c                             | 2 +-
 hw/acpi/hmat.c                             | 2 +-
 hw/acpi/hmat.h                             | 2 +-
 hw/acpi/ich9.c                             | 2 +-
 hw/acpi/nvdimm.c                           | 2 +-
 hw/acpi/pcihp.c                            | 2 +-
 hw/acpi/piix4.c                            | 2 +-
 hw/audio/milkymist-ac97.c                  | 2 +-
 hw/block/pflash_cfi01.c                    | 2 +-
 hw/block/pflash_cfi02.c                    | 2 +-
 hw/char/lm32_juart.c                       | 2 +-
 hw/char/lm32_uart.c                        | 2 +-
 hw/char/milkymist-uart.c                   | 2 +-
 hw/core/bus.c                              | 2 +-
 hw/core/platform-bus.c                     | 2 +-
 hw/core/qdev.c                             | 2 +-
 hw/core/sysbus.c                           | 2 +-
 hw/display/bcm2835_fb.c                    | 2 +-
 hw/display/milkymist-tmu2.c                | 2 +-
 hw/display/milkymist-vgafb.c               | 2 +-
 hw/display/milkymist-vgafb_template.h      | 2 +-
 hw/gpio/mpc8xxx.c                          | 2 +-
 hw/i2c/pm_smbus.c                          | 2 +-
 hw/ide/ahci.c                              | 2 +-
 hw/ide/ahci_internal.h                     | 2 +-
 hw/ide/ich.c                               | 2 +-
 hw/ide/qdev.c                              | 2 +-
 hw/input/milkymist-softusb.c               | 2 +-
 hw/intc/apic.c                             | 2 +-
 hw/intc/apic_common.c                      | 2 +-
 hw/intc/arm_gicv2m.c                       | 2 +-
 hw/intc/arm_gicv3_its_kvm.c                | 2 +-
 hw/intc/ioapic.c                           | 2 +-
 hw/intc/ioapic_common.c                    | 2 +-
 hw/intc/lm32_pic.c                         | 2 +-
 hw/intc/xics_pnv.c                         | 2 +-
 hw/isa/apm.c                               | 2 +-
 hw/isa/i82378.c                            | 2 +-
 hw/isa/isa-bus.c                           | 2 +-
 hw/lm32/lm32_boards.c                      | 2 +-
 hw/lm32/lm32_hwsetup.h                     | 2 +-
 hw/lm32/milkymist.c                        | 2 +-
 hw/mem/nvdimm.c                            | 2 +-
 hw/mem/pc-dimm.c                           | 2 +-
 hw/misc/applesmc.c                         | 2 +-
 hw/misc/milkymist-hpdmc.c                  | 2 +-
 hw/misc/milkymist-pfpu.c                   | 2 +-
 hw/net/e1000.c                             | 2 +-
 hw/net/e1000e.c                            | 2 +-
 hw/net/e1000e_core.c                       | 2 +-
 hw/net/e1000e_core.h                       | 2 +-
 hw/net/e1000x_common.c                     | 2 +-
 hw/net/e1000x_common.h                     | 2 +-
 hw/net/milkymist-minimac2.c                | 2 +-
 hw/pci-bridge/i82801b11.c                  | 2 +-
 hw/pci-host/designware.c                   | 2 +-
 hw/ppc/pnv.c                               | 2 +-
 hw/ppc/pnv_core.c                          | 2 +-
 hw/ppc/pnv_lpc.c                           | 2 +-
 hw/ppc/pnv_psi.c                           | 2 +-
 hw/ppc/pnv_xscom.c                         | 2 +-
 hw/ppc/ppce500_spin.c                      | 2 +-
 hw/ppc/spapr_iommu.c                       | 2 +-
 hw/ppc/spapr_vio.c                         | 2 +-
 hw/scsi/megasas.c                          | 2 +-
 hw/scsi/mptconfig.c                        | 2 +-
 hw/scsi/mptendian.c                        | 2 +-
 hw/scsi/mptsas.c                           | 2 +-
 hw/sd/milkymist-memcard.c                  | 2 +-
 hw/timer/hpet.c                            | 2 +-
 hw/timer/lm32_timer.c                      | 2 +-
 hw/timer/milkymist-sysctl.c                | 2 +-
 hw/tpm/tpm_prop.h                          | 2 +-
 hw/tricore/tricore_testboard.c             | 2 +-
 hw/usb/hcd-ohci.c                          | 2 +-
 hw/usb/hcd-xhci-nec.c                      | 2 +-
 hw/usb/hcd-xhci-pci.c                      | 2 +-
 hw/usb/hcd-xhci-pci.h                      | 2 +-
 hw/usb/hcd-xhci.c                          | 2 +-
 hw/usb/hcd-xhci.h                          | 2 +-
 hw/xen/xen_pvdev.c                         | 2 +-
 include/exec/cpu-all.h                     | 2 +-
 include/exec/cpu-defs.h                    | 2 +-
 include/exec/cpu_ldst.h                    | 2 +-
 include/exec/cputlb.h                      | 2 +-
 include/exec/exec-all.h                    | 2 +-
 include/exec/ioport.h                      | 2 +-
 include/exec/memory_ldst.h.inc             | 2 +-
 include/exec/memory_ldst_cached.h.inc      | 2 +-
 include/exec/memory_ldst_phys.h.inc        | 2 +-
 include/exec/tb-context.h                  | 2 +-
 include/exec/tb-hash.h                     | 2 +-
 include/exec/user/thunk.h                  | 2 +-
 include/hw/acpi/acpi.h                     | 2 +-
 include/hw/acpi/ich9.h                     | 2 +-
 include/hw/acpi/pcihp.h                    | 2 +-
 include/hw/display/milkymist_tmu2.h        | 2 +-
 include/hw/i386/apic_internal.h            | 2 +-
 include/hw/i386/ioapic.h                   | 2 +-
 include/hw/i386/ioapic_internal.h          | 2 +-
 include/hw/ide/ahci.h                      | 2 +-
 include/hw/loader-fit.h                    | 2 +-
 include/hw/pci-host/designware.h           | 2 +-
 include/hw/pci-host/spapr.h                | 2 +-
 include/hw/platform-bus.h                  | 2 +-
 include/hw/ppc/pnv.h                       | 2 +-
 include/hw/ppc/pnv_core.h                  | 2 +-
 include/hw/ppc/pnv_homer.h                 | 2 +-
 include/hw/ppc/pnv_lpc.h                   | 2 +-
 include/hw/ppc/pnv_occ.h                   | 2 +-
 include/hw/ppc/pnv_psi.h                   | 2 +-
 include/hw/ppc/pnv_xscom.h                 | 2 +-
 include/hw/ppc/spapr_vio.h                 | 2 +-
 include/hw/semihosting/semihost.h          | 2 +-
 include/qemu/base64.h                      | 2 +-
 include/qemu/buffer.h                      | 2 +-
 include/qemu/filemonitor.h                 | 2 +-
 include/sysemu/tpm_util.h                  | 2 +-
 linux-user/aarch64/target_cpu.h            | 2 +-
 linux-user/aarch64/target_structs.h        | 2 +-
 linux-user/alpha/target_cpu.h              | 2 +-
 linux-user/alpha/target_structs.h          | 2 +-
 linux-user/arm/target_cpu.h                | 2 +-
 linux-user/arm/target_structs.h            | 2 +-
 linux-user/cris/target_cpu.h               | 2 +-
 linux-user/cris/target_structs.h           | 2 +-
 linux-user/hppa/target_cpu.h               | 2 +-
 linux-user/hppa/target_structs.h           | 2 +-
 linux-user/i386/target_cpu.h               | 2 +-
 linux-user/i386/target_structs.h           | 2 +-
 linux-user/microblaze/target_cpu.h         | 2 +-
 linux-user/microblaze/target_structs.h     | 2 +-
 linux-user/mips/target_cpu.h               | 2 +-
 linux-user/mips/target_structs.h           | 2 +-
 linux-user/mips64/target_cpu.h             | 2 +-
 linux-user/nios2/target_cpu.h              | 2 +-
 linux-user/nios2/target_structs.h          | 2 +-
 linux-user/ppc/target_cpu.h                | 2 +-
 linux-user/ppc/target_structs.h            | 2 +-
 linux-user/ppc/target_syscall.h            | 2 +-
 linux-user/s390x/target_structs.h          | 2 +-
 linux-user/sparc/target_cpu.h              | 2 +-
 linux-user/sparc/target_structs.h          | 2 +-
 linux-user/sparc64/target_structs.h        | 2 +-
 linux-user/tilegx/target_cpu.h             | 2 +-
 linux-user/tilegx/target_structs.h         | 2 +-
 linux-user/x86_64/target_structs.h         | 2 +-
 memory_ldst.c.inc                          | 2 +-
 migration/tls.c                            | 2 +-
 migration/tls.h                            | 2 +-
 scripts/analyze-migration.py               | 2 +-
 scripts/decodetree.py                      | 2 +-
 scripts/replay-dump.py                     | 2 +-
 softmmu/physmem.c                          | 2 +-
 softmmu/qdev-monitor.c                     | 2 +-
 target/alpha/cpu.h                         | 2 +-
 target/alpha/fpu_helper.c                  | 2 +-
 target/alpha/gdbstub.c                     | 2 +-
 target/alpha/helper.c                      | 2 +-
 target/alpha/int_helper.c                  | 2 +-
 target/alpha/mem_helper.c                  | 2 +-
 target/alpha/sys_helper.c                  | 2 +-
 target/alpha/translate.c                   | 2 +-
 target/alpha/vax_helper.c                  | 2 +-
 target/arm/a32-uncond.decode               | 2 +-
 target/arm/a32.decode                      | 2 +-
 target/arm/arm_ldst.h                      | 2 +-
 target/arm/cpu.h                           | 2 +-
 target/arm/crypto_helper.c                 | 2 +-
 target/arm/gdbstub.c                       | 2 +-
 target/arm/gdbstub64.c                     | 2 +-
 target/arm/helper-a64.c                    | 2 +-
 target/arm/helper-a64.h                    | 2 +-
 target/arm/helper-sve.h                    | 2 +-
 target/arm/iwmmxt_helper.c                 | 2 +-
 target/arm/neon-dp.decode                  | 2 +-
 target/arm/neon-ls.decode                  | 2 +-
 target/arm/neon-shared.decode              | 2 +-
 target/arm/op_helper.c                     | 2 +-
 target/arm/pauth_helper.c                  | 2 +-
 target/arm/sve.decode                      | 2 +-
 target/arm/sve_helper.c                    | 2 +-
 target/arm/t16.decode                      | 2 +-
 target/arm/t32.decode                      | 2 +-
 target/arm/translate-a64.c                 | 2 +-
 target/arm/translate-a64.h                 | 2 +-
 target/arm/translate-neon.c.inc            | 2 +-
 target/arm/translate-sve.c                 | 2 +-
 target/arm/translate-vfp.c.inc             | 2 +-
 target/arm/translate.c                     | 2 +-
 target/arm/vec_helper.c                    | 2 +-
 target/arm/vec_internal.h                  | 2 +-
 target/arm/vfp-uncond.decode               | 2 +-
 target/arm/vfp.decode                      | 2 +-
 target/cris/cpu.h                          | 2 +-
 target/cris/crisv10-decode.h               | 2 +-
 target/cris/crisv32-decode.h               | 2 +-
 target/cris/gdbstub.c                      | 2 +-
 target/cris/helper.c                       | 2 +-
 target/cris/machine.c                      | 2 +-
 target/cris/mmu.c                          | 2 +-
 target/cris/op_helper.c                    | 2 +-
 target/cris/translate.c                    | 2 +-
 target/cris/translate_v10.c.inc            | 2 +-
 target/hppa/cpu.h                          | 2 +-
 target/hppa/gdbstub.c                      | 2 +-
 target/hppa/helper.c                       | 2 +-
 target/hppa/insns.decode                   | 2 +-
 target/hppa/int_helper.c                   | 2 +-
 target/hppa/machine.c                      | 2 +-
 target/hppa/mem_helper.c                   | 2 +-
 target/hppa/op_helper.c                    | 2 +-
 target/hppa/translate.c                    | 2 +-
 target/i386/bpt_helper.c                   | 2 +-
 target/i386/cc_helper.c                    | 2 +-
 target/i386/cc_helper_template.h           | 2 +-
 target/i386/cpu.c                          | 2 +-
 target/i386/cpu.h                          | 2 +-
 target/i386/excp_helper.c                  | 2 +-
 target/i386/fpu_helper.c                   | 2 +-
 target/i386/gdbstub.c                      | 2 +-
 target/i386/helper.c                       | 2 +-
 target/i386/hvf/panic.h                    | 2 +-
 target/i386/hvf/vmx.h                      | 2 +-
 target/i386/hvf/x86.c                      | 2 +-
 target/i386/hvf/x86.h                      | 2 +-
 target/i386/hvf/x86_cpuid.c                | 2 +-
 target/i386/hvf/x86_decode.c               | 2 +-
 target/i386/hvf/x86_decode.h               | 2 +-
 target/i386/hvf/x86_descr.c                | 2 +-
 target/i386/hvf/x86_descr.h                | 2 +-
 target/i386/hvf/x86_emu.c                  | 4 ++--
 target/i386/hvf/x86_emu.h                  | 2 +-
 target/i386/hvf/x86_flags.c                | 2 +-
 target/i386/hvf/x86_flags.h                | 2 +-
 target/i386/hvf/x86_mmu.c                  | 2 +-
 target/i386/hvf/x86_mmu.h                  | 2 +-
 target/i386/hvf/x86hvf.c                   | 2 +-
 target/i386/hvf/x86hvf.h                   | 2 +-
 target/i386/int_helper.c                   | 2 +-
 target/i386/mem_helper.c                   | 2 +-
 target/i386/misc_helper.c                  | 2 +-
 target/i386/mpx_helper.c                   | 2 +-
 target/i386/ops_sse.h                      | 2 +-
 target/i386/ops_sse_header.h               | 2 +-
 target/i386/seg_helper.c                   | 2 +-
 target/i386/shift_helper_template.h        | 2 +-
 target/i386/smm_helper.c                   | 2 +-
 target/i386/svm_helper.c                   | 2 +-
 target/i386/tcg-stub.c                     | 2 +-
 target/i386/translate.c                    | 2 +-
 target/lm32/cpu.h                          | 2 +-
 target/lm32/gdbstub.c                      | 2 +-
 target/lm32/helper.c                       | 2 +-
 target/lm32/translate.c                    | 2 +-
 target/microblaze/cpu.h                    | 2 +-
 target/microblaze/gdbstub.c                | 2 +-
 target/microblaze/helper.c                 | 2 +-
 target/microblaze/machine.c                | 2 +-
 target/microblaze/mmu.c                    | 2 +-
 target/microblaze/mmu.h                    | 2 +-
 target/microblaze/op_helper.c              | 2 +-
 target/microblaze/translate.c              | 2 +-
 target/ppc/compat.c                        | 2 +-
 target/ppc/cpu-models.c                    | 2 +-
 target/ppc/cpu-models.h                    | 2 +-
 target/ppc/cpu.c                           | 2 +-
 target/ppc/cpu.h                           | 2 +-
 target/ppc/dfp_helper.c                    | 2 +-
 target/ppc/excp_helper.c                   | 2 +-
 target/ppc/fpu_helper.c                    | 2 +-
 target/ppc/gdbstub.c                       | 2 +-
 target/ppc/helper_regs.h                   | 2 +-
 target/ppc/int_helper.c                    | 2 +-
 target/ppc/internal.h                      | 2 +-
 target/ppc/mem_helper.c                    | 2 +-
 target/ppc/misc_helper.c                   | 2 +-
 target/ppc/mmu-book3s-v3.c                 | 2 +-
 target/ppc/mmu-book3s-v3.h                 | 2 +-
 target/ppc/mmu-hash32.c                    | 2 +-
 target/ppc/mmu-hash64.c                    | 2 +-
 target/ppc/mmu-radix64.c                   | 2 +-
 target/ppc/mmu_helper.c                    | 2 +-
 target/ppc/timebase_helper.c               | 2 +-
 target/ppc/translate.c                     | 2 +-
 target/ppc/translate_init.c.inc            | 2 +-
 target/ppc/user_only_helper.c              | 2 +-
 target/sparc/cc_helper.c                   | 2 +-
 target/sparc/cpu.c                         | 2 +-
 target/sparc/fop_helper.c                  | 2 +-
 target/sparc/gdbstub.c                     | 2 +-
 target/sparc/helper.c                      | 2 +-
 target/sparc/int32_helper.c                | 2 +-
 target/sparc/int64_helper.c                | 2 +-
 target/sparc/ldst_helper.c                 | 2 +-
 target/sparc/mmu_helper.c                  | 2 +-
 target/sparc/translate.c                   | 2 +-
 target/sparc/vis_helper.c                  | 2 +-
 target/sparc/win_helper.c                  | 2 +-
 target/tilegx/cpu.h                        | 2 +-
 target/tricore/gdbstub.c                   | 2 +-
 target/xtensa/gdbstub.c                    | 2 +-
 tests/acceptance/pc_cpu_hotplug_props.py   | 2 +-
 tests/acceptance/x86_cpu_model_versions.py | 2 +-
 tests/io-channel-helpers.c                 | 2 +-
 tests/io-channel-helpers.h                 | 2 +-
 tests/migration/guestperf-batch.py         | 2 +-
 tests/migration/guestperf-plot.py          | 2 +-
 tests/migration/guestperf.py               | 2 +-
 tests/migration/guestperf/comparison.py    | 2 +-
 tests/migration/guestperf/engine.py        | 2 +-
 tests/migration/guestperf/hardware.py      | 2 +-
 tests/migration/guestperf/plot.py          | 2 +-
 tests/migration/guestperf/progress.py      | 2 +-
 tests/migration/guestperf/report.py        | 2 +-
 tests/migration/guestperf/scenario.py      | 2 +-
 tests/migration/guestperf/shell.py         | 2 +-
 tests/migration/guestperf/timings.py       | 2 +-
 tests/migration/stress.c                   | 2 +-
 tests/test-base64.c                        | 2 +-
 tests/test-bufferiszero.c                  | 2 +-
 tests/test-crypto-pbkdf.c                  | 2 +-
 tests/test-qgraph.c                        | 2 +-
 tests/test-uuid.c                          | 2 +-
 thunk.c                                    | 2 +-
 ui/x_keymap.c                              | 2 +-
 util/base64.c                              | 2 +-
 util/buffer.c                              | 2 +-
 util/filemonitor-inotify.c                 | 2 +-
 util/filemonitor-stub.c                    | 2 +-
 util/log.c                                 | 2 +-
 util/oslib-win32.c                         | 2 +-
 340 files changed, 341 insertions(+), 341 deletions(-)


