Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652F9EBCE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 17:03:35 +0200 (CEST)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2d0Q-0005ax-0d
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 11:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cvp-00039V-0U
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cvm-0003Jc-S7
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:58:48 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38400)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i2cvm-0003In-4a; Tue, 27 Aug 2019 10:58:46 -0400
Received: by mail-pl1-x642.google.com with SMTP id w11so11459550plp.5;
 Tue, 27 Aug 2019 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lNMCEHff1KcVCj4pDK6CHhkaejKQuv/hyfxZSDyR5Zw=;
 b=eks1R9LuvbRadD3+eYcWpRdl3kA9/JJe5yLidomwe3BPne74yvcucoXGaIqxcqULM6
 WNr44S5MDB/14qf/R7aLgil+ux3obJNDvgGvoGjaE93tNqkzie69HiekhaKQzE05k95n
 MW0cMgpcg2nB3ujvwFaYPNv+Nff7jagwwRSc6+mu/PJ65d5Knwwp+YeVSjpveNPSL5nW
 m6POScrvjAStLwbGRSlg1L+iHtGkPyrUP0DocWU/AU0K7hHnPSehrMy6Reu/qpJ0wy+b
 RmgU+FNxQdn0ZcjMPBKSygV0EkM3oYoQl9+zV8UC9HkK6LnHV6/0kbbBnINAi3ZQEKwF
 vgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lNMCEHff1KcVCj4pDK6CHhkaejKQuv/hyfxZSDyR5Zw=;
 b=BCHWoIPhh8LRjNQjXoddkCwczeVtP/Oa2w6hC1csVoH4zFGmm4hFXm0SR+hVeb8/bD
 9CzbfADTtb1cofxWvQLQNbvNdYH58/ktMBr6LaKFnrORm7QXXZwOtnnv8epv1QRG1Bu4
 gPUKOCLF3KrFL7JwMRPG4ITPhb0DVzu4MUE7GC5chSsqpYpfZHKRQxuglFnN7+Sy8ZlW
 ufVy1+9vBwBxpjxoOLrt/AC6a1ehIQtZ4LMONBN3vbwA7ht/JcmC4GvTRt6rAVhacMVt
 sVRwzpsLX/iZXv5xM03/OLWl0jtrDFcVMduCdBxwaOUUKOBuBcfFdLEeXXhq9JklF1Ua
 F4pg==
X-Gm-Message-State: APjAAAUngUrxFg243fV5cQul53dcfOPpFGh366Xhzl1qXamaXjAtnrvJ
 SsT5VZ0kAc/pUUa2w43ad8g=
X-Google-Smtp-Source: APXvYqzXpIj4yaBI28Ms0btj92lwaxIIXVIo0WqI1CrstZbWjCQGNmFnmuRpRmS9A/1HrIxvHb8+0w==
X-Received: by 2002:a17:902:1027:: with SMTP id
 b36mr23051091pla.203.1566917925059; 
 Tue, 27 Aug 2019 07:58:45 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id j15sm14839344pfr.146.2019.08.27.07.58.43
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Aug 2019 07:58:44 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Tue, 27 Aug 2019 07:58:09 -0700
Message-Id: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-devel] [PATCH v6 00/30] riscv: sifive_u: Improve the
 emulation fidelity of sifive_u machine
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

As of today, the QEMU 'sifive_u' machine is a special target that does
not boot the upstream OpenSBI/U-Boot firmware images built for the real
SiFive HiFive Unleashed board. Hence OpenSBI supports a special platform
"qemu/sifive_u". For U-Boot, the sifive_fu540_defconfig is referenced
in the OpenSBI doc as its payload, but that does not boot at all due
to various issues in current QEMU 'sifive_u' machine codes.

This series aims to improve the emulation fidelity of sifive_u machine,
so that the upstream OpenSBI, U-Boot and kernel images built for the
SiFive HiFive Unleashed board can be used out of the box without any
special hack.

The major changes include:
- Heterogeneous harts creation supported, so that we can create a CPU
  that exactly mirrors the real hardware: 1 E51 + 4 U54.
- Implemented a PRCI model for FU540
- Implemented an OTP model for FU540, primarily used for storing serial
  number of the board
- Fixed GEM support that was seriously broken on sifive_u
- Synced device tree with upstream Linux kernel on sifive_u

OpenSBI v0.4 image built for sifive/fu540 is included as the default
bios image for 'sifive_u' machine.

The series is tested against OpenSBI v0.4 image for sifive/fu540
paltform, U-Boot v2019.10-rc1 image for sifive_fu540_defconfig,
and Linux kernel v5.3-rc3 image with the following patch:

macb: Update compatibility string for SiFive FU540-C000 [1]

OpenSBI + U-Boot, ping/tftpboot with U-Boot MACB driver works well.
Boot Linux 64-bit defconfig image, verified that system console on
the serial 0 and ping host work pretty well.

An OpenSBI patch [2] was sent to drop the special "qemu/sifive_u" platform
support in OpenSBI. The original plan was to get the drop patch applied
after this QEMU series is merged. However after discussion in the OpenSBI
mailing list, it seems the best option for us is to let OpenSBI continue
shipping the special "qemu/sifive_u" platform support to work with QEMU
version <= 4.1 and deprecate the support sometime in the future. A patch
will need to be sent to OpenSBI mailing list to update its document.

v4 is now rebased on Palmer's QEMU RISC-V repo "for-master" branch.
Dropped the following v3 patch that was already done by someone else.
- riscv: sifive_u: Generate an aliases node in the device tree
- riscv: sifive_u: Support loading initramfs

The following v3 patch was dropped too due to a different cluster approach
suggested by Richard Henderson is used in v4:
- riscv: hart: Support heterogeneous harts population

[1]: https://patchwork.kernel.org/patch/11050003/
[2]: http://lists.infradead.org/pipermail/opensbi/2019-August/000335.html

Changes in v6:
- use s->hartid_base directly, instead of an extra variable
- generate u cpus unconditionally (not test ms->smp.cpus > 1)
  since the minimal required number of cpu is now 2, due to
  this patch is reordered
- fix incorrectly indented comment lines
- remove unneeded brackets around assignment

Changes in v5:
- new patch to change to use qemu_log_mask(LOG_GUEST_ERROR,...) instead
  in various sifive models
- new patch to remove the unnecessary include of target/riscv/cpu.h
- change to use defines instead of enums
- change to use qemu_log_mask(LOG_GUEST_ERROR,...) in sifive_u_prci
- creating a 32-bit val variable and using that instead of casting
  everywhere in sifive_u_prci_write()
- move all register initialization to sifive_u_prci_reset() function
- drop sifive_u_prci_create()
- s/codes that worked/code that works/g
- create sifive_u_prci block directly in the machine codes, instead
  of calling sifive_u_prci_create()
- change to use defines instead of enums
- change to use qemu_log_mask(LOG_GUEST_ERROR,...) in sifive_u_otp
- creating a 32-bit val variable and using that instead of casting
  everywhere in sifive_u_otp_write()
- move all register initialization to sifive_u_otp_reset() function
- drop sifive_u_otp_create()
- create sifive_u_otp block directly in the machine codes, instead
  of calling sifive_u_otp_create()
- add the missing "local-mac-address" property in the ethernet node

Changes in v4:
- remove 2 more "linux,phandle" instances in sifive_u.c and spike.c
  after rebasing on Palmer's QEMU RISC-V tree
- change create_fdt() to return void in sifive_u.c too, after rebasing
  on Palmer's QEMU RISC-V tree
- new patch to remove executable attribute of opensbi images
- prefix all macros/variables/functions with SIFIVE_E/sifive_e
  in the sifive_e_prci driver
- new patch to add a "hartid-base" property to RISC-V hart array
- changed to create clusters for each cpu type
- prefix all macros/variables/functions with SIFIVE_U/sifive_u
  in the sifive_u_prci driver
- prefix all macros/variables/functions with SIFIVE_U/sifive_u
  in the sifive_u_otp driver
- new patch to remove handcrafted clock nodes for UART and ethernet

Changes in v3:
- use management cpu count + 1 for the min_cpus
- changed to use macros for management and compute cpu count
- update IRQ numbers of both UARTs to match hardware as well

Changes in v2:
- keep the PLIC compatible string unchanged as OpenSBI uses that
  for DT fix up
- drop patch "riscv: sifive: Move sifive_mmio_emulate() to a common place"
- new patch "riscv: sifive_e: Drop sifive_mmio_emulate()"
- update the file header to indicate at least 2 harts are created
- fixed the "interrupts-extended" property size
- use create_unimplemented_device() to create the GEM management
  block instead of sifive_mmio_emulate()
- add "phy-handle" property to the ethernet node

Bin Meng (30):
  riscv: hw: Remove superfluous "linux,phandle" property
  riscv: hw: Use qemu_fdt_setprop_cell() for property with only 1 cell
  riscv: hw: Remove not needed PLIC properties in device tree
  riscv: hw: Change create_fdt() to return void
  riscv: hw: Change to use qemu_log_mask(LOG_GUEST_ERROR,...) instead
  riscv: hw: Remove the unnecessary include of target/riscv/cpu.h
  riscv: roms: Remove executable attribute of opensbi images
  riscv: sifive_u: Remove the unnecessary include of prci header
  riscv: sifive: Rename sifive_prci.{c,h} to sifive_e_prci.{c,h}
  riscv: sifive_e: prci: Fix a typo of hfxosccfg register programming
  riscv: sifive_e: prci: Update the PRCI register block size
  riscv: sifive_e: Drop sifive_mmio_emulate()
  riscv: Add a sifive_cpu.h to include both E and U cpu type defines
  riscv: hart: Extract hart realize to a separate routine
  riscv: hart: Add a "hartid-base" property to RISC-V hart array
  riscv: sifive_u: Set the minimum number of cpus to 2
  riscv: sifive_u: Update hart configuration to reflect the real FU540
    SoC
  riscv: sifive_u: Update PLIC hart topology configuration string
  riscv: sifive: Implement PRCI model for FU540
  riscv: sifive_u: Generate hfclk and rtcclk nodes
  riscv: sifive_u: Add PRCI block to the SoC
  riscv: sifive_u: Reference PRCI clocks in UART and ethernet nodes
  riscv: sifive_u: Update UART base addresses and IRQs
  riscv: sifive_u: Change UART node name in device tree
  riscv: roms: Update default bios for sifive_u machine
  riscv: sifive: Implement a model for SiFive FU540 OTP
  riscv: sifive_u: Instantiate OTP memory with a serial number
  riscv: sifive_u: Fix broken GEM support
  riscv: sifive_u: Remove handcrafted clock nodes for UART and ethernet
  riscv: sifive_u: Update model and compatible strings in device tree

 hw/riscv/Makefile.objs                       |   4 +-
 hw/riscv/riscv_hart.c                        |  34 ++--
 hw/riscv/sifive_e.c                          |  27 ++-
 hw/riscv/sifive_e_prci.c                     | 123 +++++++++++++
 hw/riscv/sifive_prci.c                       | 123 -------------
 hw/riscv/sifive_test.c                       |   6 +-
 hw/riscv/sifive_u.c                          | 255 ++++++++++++++++++---------
 hw/riscv/sifive_u_otp.c                      | 190 ++++++++++++++++++++
 hw/riscv/sifive_u_prci.c                     | 169 ++++++++++++++++++
 hw/riscv/sifive_uart.c                       |  10 +-
 hw/riscv/spike.c                             |   1 -
 hw/riscv/virt.c                              |  40 ++---
 include/hw/riscv/riscv_hart.h                |   1 +
 include/hw/riscv/sifive_cpu.h                |  31 ++++
 include/hw/riscv/sifive_e.h                  |   7 +-
 include/hw/riscv/sifive_e_prci.h             |  71 ++++++++
 include/hw/riscv/sifive_prci.h               |  69 --------
 include/hw/riscv/sifive_u.h                  |  31 ++--
 include/hw/riscv/sifive_u_otp.h              |  80 +++++++++
 include/hw/riscv/sifive_u_prci.h             |  91 ++++++++++
 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 40968 -> 45064 bytes
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin
 roms/Makefile                                |   4 +-
 24 files changed, 1007 insertions(+), 360 deletions(-)
 create mode 100644 hw/riscv/sifive_e_prci.c
 delete mode 100644 hw/riscv/sifive_prci.c
 create mode 100644 hw/riscv/sifive_u_otp.c
 create mode 100644 hw/riscv/sifive_u_prci.c
 create mode 100644 include/hw/riscv/sifive_cpu.h
 create mode 100644 include/hw/riscv/sifive_e_prci.h
 delete mode 100644 include/hw/riscv/sifive_prci.h
 create mode 100644 include/hw/riscv/sifive_u_otp.h
 create mode 100644 include/hw/riscv/sifive_u_prci.h
 mode change 100755 => 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin

-- 
2.7.4


