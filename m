Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6D48624A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 10:45:55 +0100 (CET)
Received: from localhost ([::1]:39842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5PLG-0003sV-51
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 04:45:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n5PHk-0008RZ-0p
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:42:16 -0500
Received: from mail.loongson.cn ([114.242.206.163]:56582 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n5PHe-0003Qr-EE
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:42:13 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz8toudZhmQsAAA--.229S2;
 Thu, 06 Jan 2022 17:42:00 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 00/26] Add LoongArch linux-user emulation support
Date: Thu,  6 Jan 2022 04:41:34 -0500
Message-Id: <20220106094200.1801206-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz8toudZhmQsAAA--.229S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww45Ar1rCFy5Xw43Ar47urg_yoWxZr1xpr
 W3ur15Kw48GrZ7Jrs2qay5ZryrXa1xGr4293WSq3s5CrWIvryfZF1kK3sxKFy3X3W0gry0
 qFnYkw1UWF4UXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20220106074740.1754661-1-gaosong@loongson.cn>

Hi all,

This series only support linux-user emulation.
More about LoongArch at: https://github.com/loongson/

The latest kernel:
  * https://github.com/loongson/linux/tree/loongarch-next

Patches need review:
  * 0018-linux-user-Add-LoongArch-specific-structures.patch
  * 0019-linux-user-Add-LoongArch-signal-support.patch

Changes for v14:
  * Rebase;
  * Update README, use new clfs-system/cross-tools test.

V13:
https://patchew.org/QEMU/1638610165-15036-1-git-send-email-gaosong@loongson.cn/

Please review! Thanks.

Song Gao (26):
  target/loongarch: Add README
  target/loongarch: Add core definition
  target/loongarch: Add main translation routines
  target/loongarch: Add fixed point arithmetic instruction translation
  target/loongarch: Add fixed point shift instruction translation
  target/loongarch: Add fixed point bit instruction translation
  target/loongarch: Add fixed point load/store instruction translation
  target/loongarch: Add fixed point atomic instruction translation
  target/loongarch: Add fixed point extra instruction translation
  target/loongarch: Add floating point arithmetic instruction
    translation
  target/loongarch: Add floating point comparison instruction
    translation
  target/loongarch: Add floating point conversion instruction
    translation
  target/loongarch: Add floating point move instruction translation
  target/loongarch: Add floating point load/store instruction
    translation
  target/loongarch: Add branch instruction translation
  target/loongarch: Add disassembler
  linux-user: Add LoongArch generic header files
  linux-user: Add LoongArch specific structures
  linux-user: Add LoongArch signal support
  linux-user: Add LoongArch elf support
  linux-user: Add LoongArch syscall support
  linux-user: Add LoongArch cpu_loop support
  default-configs: Add loongarch linux-user support
  target/loongarch: Add target build suport
  target/loongarch: 'make check-tcg' support
  scripts: add loongarch64 binfmt config

 MAINTAINERS                                   |   5 +
 configs/targets/loongarch64-linux-user.mak    |   3 +
 configure                                     |   3 +
 include/disas/dis-asm.h                       |   2 +
 linux-user/elfload.c                          |  53 ++
 linux-user/loongarch64/cpu_loop.c             |  94 ++
 linux-user/loongarch64/signal.c               | 198 ++++
 linux-user/loongarch64/sockbits.h             |  11 +
 linux-user/loongarch64/syscall_nr.h           | 313 +++++++
 linux-user/loongarch64/target_cpu.h           |  34 +
 linux-user/loongarch64/target_elf.h           |  12 +
 linux-user/loongarch64/target_errno_defs.h    |  12 +
 linux-user/loongarch64/target_fcntl.h         |  11 +
 linux-user/loongarch64/target_signal.h        |  13 +
 linux-user/loongarch64/target_structs.h       |  47 +
 linux-user/loongarch64/target_syscall.h       |  48 +
 linux-user/loongarch64/termbits.h             |  11 +
 linux-user/syscall_defs.h                     |  10 +-
 meson.build                                   |   1 +
 scripts/gensyscalls.sh                        |   1 +
 scripts/qemu-binfmt-conf.sh                   |   6 +-
 target/loongarch/README                       |  77 ++
 target/loongarch/cpu-param.h                  |  18 +
 target/loongarch/cpu.c                        | 315 +++++++
 target/loongarch/cpu.h                        | 252 +++++
 target/loongarch/disas.c                      | 612 +++++++++++++
 target/loongarch/fpu_helper.c                 | 862 ++++++++++++++++++
 target/loongarch/helper.h                     |  94 ++
 target/loongarch/insn_trans/trans_arith.c.inc | 304 ++++++
 .../loongarch/insn_trans/trans_atomic.c.inc   | 114 +++
 target/loongarch/insn_trans/trans_bit.c.inc   | 212 +++++
 .../loongarch/insn_trans/trans_branch.c.inc   |  83 ++
 target/loongarch/insn_trans/trans_extra.c.inc |  86 ++
 .../loongarch/insn_trans/trans_farith.c.inc   | 105 +++
 target/loongarch/insn_trans/trans_fcmp.c.inc  |  56 ++
 target/loongarch/insn_trans/trans_fcnv.c.inc  |  33 +
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 153 ++++
 target/loongarch/insn_trans/trans_fmov.c.inc  | 157 ++++
 .../loongarch/insn_trans/trans_memory.c.inc   | 229 +++++
 target/loongarch/insn_trans/trans_shift.c.inc | 106 +++
 target/loongarch/insns.decode                 | 442 +++++++++
 target/loongarch/internals.h                  |  28 +
 target/loongarch/meson.build                  |  19 +
 target/loongarch/op_helper.c                  |  85 ++
 target/loongarch/translate.c                  | 268 ++++++
 target/loongarch/translate.h                  |  45 +
 target/meson.build                            |   1 +
 tests/tcg/configure.sh                        |   1 +
 48 files changed, 5640 insertions(+), 5 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/syscall_nr.h
 create mode 100644 linux-user/loongarch64/target_cpu.h
 create mode 100644 linux-user/loongarch64/target_elf.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/target_syscall.h
 create mode 100644 linux-user/loongarch64/termbits.h
 create mode 100644 target/loongarch/README
 create mode 100644 target/loongarch/cpu-param.h
 create mode 100644 target/loongarch/cpu.c
 create mode 100644 target/loongarch/cpu.h
 create mode 100644 target/loongarch/disas.c
 create mode 100644 target/loongarch/fpu_helper.c
 create mode 100644 target/loongarch/helper.h
 create mode 100644 target/loongarch/insn_trans/trans_arith.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_atomic.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_bit.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_branch.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_extra.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_farith.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fcmp.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fcnv.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fmemory.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fmov.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_memory.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_shift.c.inc
 create mode 100644 target/loongarch/insns.decode
 create mode 100644 target/loongarch/internals.h
 create mode 100644 target/loongarch/meson.build
 create mode 100644 target/loongarch/op_helper.c
 create mode 100644 target/loongarch/translate.c
 create mode 100644 target/loongarch/translate.h

-- 
2.27.0


