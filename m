Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1402F5E014
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 10:43:35 +0200 (CEST)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiarV-00079r-Nt
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 04:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51027)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapE-0005Ea-VN
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:41:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapD-00062v-9D
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:41:12 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43025)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapC-0005vn-WB
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:41:11 -0400
Received: by mail-lj1-f194.google.com with SMTP id 16so1447544ljv.10
 for <qemu-devel@nongnu.org>; Wed, 03 Jul 2019 01:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=O5L5bMErjytoOiwUIbXUlZWva671lGU52dDqTQsGw1A=;
 b=svhAeoreQbdl8ma2U8d8dsEQnOG9xokD75IqOx4R+ni47weArxmxGRRQwErDfnqC6I
 sW9qWHF/uRK02ZY3nCzDyRdsa2T1OZlB+z2vZTO4nrM4rqKEA4cs7Xue6jIKty07YWO3
 g+5xi5Jtemmy52jonMIup1di79ykOJ/OHZ1VuS+q30CI5D1cpCPJ257uIpM0lMtYHupg
 UTZjY7POh/vOIXnFWqF7SPg6EVmUnTEsLDpk0z7QBFsELWFaRMkRO2ioi8JrygW38iTj
 Tv4zopoww8FLXl/qvpfeZV4BbbKgbdrX9dPBakeoaR1UcA3FOdFQvFQA6jcN+96qZr0Y
 r1+Q==
X-Gm-Message-State: APjAAAUQOrG32041VHBRmp0eg3rM/nQHTnWGwwu7J1iqIWN7S5SlvK9n
 0DzeTtT8tccCgibCuArIrXan4X1I6AMmEQ==
X-Google-Smtp-Source: APXvYqyqbMlsTeCuF9+DKy5sUpybceqzAaf9HOZAY8FcUVwgDJEoY90H1ELq8z3Hr0ns0IUGI5cwxg==
X-Received: by 2002:a2e:63cd:: with SMTP id s74mr20273806lje.164.1562143268160; 
 Wed, 03 Jul 2019 01:41:08 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id e12sm287634lfb.66.2019.07.03.01.41.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:07 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:16 -0700
Message-Id: <20190703084048.6980-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.194
Subject: [Qemu-devel] [PULL] RISC-V Patches for the 4.1 Soft Freeze,
 Part 2 v3
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
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

merged tag 'mips-queue-jun-21-2019'
The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.1-sf1-v3

for you to fetch changes up to 395fd69582a00b76a89c12d9c074055a9d207997:

  hw/riscv: Extend the kernel loading support (2019-06-27 02:47:06 -0700)

----------------------------------------------------------------
RISC-V Patches for the 4.1 Soft Freeze, Part 2 v3

This pull request contains a handful of patches that I'd like to target
for the 4.1 soft freeze.  There are a handful of new features:

* Support for the 1.11.0, the latest privileged specification.
* Support for reading and writing the PRCI registers.
* Better control over the ISA of the target machine.
* Support for the cpu-topology device tree node.

Additionally, there are a handful of bug fixes including:

* Load reservations are now broken by both store conditional and by
  scheduling, which fixes issues with parallel applications.
* Various fixes to the PMP implementation.
* Fixes to the 32-bit linux-user syscall ABI.
* Various fixes for instruction decodeing.
* A fix to the PCI device tree "bus-range" property.

This boots 32-bit and 64-bit OpenEmbedded.

Changes since v2 [riscv-for-master-4.1-sf1-v2]:

* Dropped OpenSBI.

Changes since v1 [riscv-for-master-4.1-sf1]:

* Contains a fix to the sifive_u OpenSBI integration.

----------------------------------------------------------------
Alistair Francis (12):
      target/riscv: Allow setting ISA extensions via CPU props
      target/riscv: Restructure deprecatd CPUs
      target/riscv: Add the privledge spec version 1.11.0
      target/riscv: Add the mcountinhibit CSR
      target/riscv: Set privledge spec 1.11.0 as default
      qemu-deprecated.texi: Deprecate the RISC-V privledge spec 1.09.1
      target/riscv: Require either I or E base extension
      target/riscv: Remove user version information
      target/riscv: Add support for disabling/enabling Counters
      hw/riscv: Split out the boot functions
      hw/riscv: Add support for loading a firmware
      hw/riscv: Extend the kernel loading support

Atish Patra (1):
      riscv: virt: Add cpu-topology DT node.

Bin Meng (3):
      riscv: virt: Correct pci "bus-range" encoding
      riscv: sifive_u: Do not create hard-coded phandles in DT
      riscv: sifive_u: Update the plic hart config to support multicore

Dayeol Lee (1):
      target/riscv: Fix PMP range boundary address bug

Hesham Almatary (6):
      RISC-V: Only Check PMP if MMU translation succeeds
      RISC-V: Raise access fault exceptions on PMP violations
      RISC-V: Check for the effective memory privilege mode during PMP checks
      RISC-V: Check PMP during Page Table Walks
      RISC-V: Fix a PMP bug where it succeeds even if PMP entry is off
      RISC-V: Fix a PMP check with the correct access size

Jim Wilson (1):
      RISC-V: Update syscall list for 32-bit support.

Joel Sing (1):
      RISC-V: Clear load reservations on context switch and SC

Michael Clark (2):
      target/riscv: Implement riscv_cpu_unassigned_access
      disas/riscv: Disassemble reserved compressed encodings as illegal

Nathaniel Graff (1):
      sifive_prci: Read and write PRCI registers

Palmer Dabbelt (3):
      RISC-V: Fix a memory leak when realizing a sifive_e
      RISC-V: Add support for the Zifencei extension
      RISC-V: Add support for the Zicsr extension

Wladimir J. van der Laan (1):
      disas/riscv: Fix `rdinstreth` constraint

 disas/riscv.c                                  |  65 ++++++++----
 hw/riscv/Makefile.objs                         |   1 +
 hw/riscv/boot.c                                | 105 +++++++++++++++++++
 hw/riscv/sifive_e.c                            |  30 ++----
 hw/riscv/sifive_prci.c                         |  49 +++++++--
 hw/riscv/sifive_u.c                            |  54 +++++-----
 hw/riscv/spike.c                               |  21 +---
 hw/riscv/virt.c                                |  79 ++++++--------
 include/hw/riscv/boot.h                        |  29 ++++++
 include/hw/riscv/sifive_e.h                    |   2 +
 include/hw/riscv/sifive_prci.h                 |  32 ++++++
 linux-user/riscv/syscall_nr.h                  |  15 ++-
 qemu-deprecated.texi                           |   8 ++
 target/riscv/cpu.c                             | 137 ++++++++++++++++++-------
 target/riscv/cpu.h                             |  33 ++++--
 target/riscv/cpu_bits.h                        |   1 +
 target/riscv/cpu_helper.c                      |  55 +++++++++-
 target/riscv/csr.c                             |  30 +++++-
 target/riscv/insn_trans/trans_privileged.inc.c |   2 +-
 target/riscv/insn_trans/trans_rva.inc.c        |   8 +-
 target/riscv/insn_trans/trans_rvi.inc.c        |   4 +
 target/riscv/pmp.c                             |  17 +--
 target/riscv/pmp.h                             |   2 +-
 target/riscv/translate.c                       |   3 +
 24 files changed, 583 insertions(+), 199 deletions(-)
 create mode 100644 hw/riscv/boot.c
 create mode 100644 include/hw/riscv/boot.h
From Palmer Dabbelt <palmer@sifive.com> # This line is ignored.
From: Palmer Dabbelt <palmer@sifive.com>
Reply-To: 
Subject: 
In-Reply-To: 



