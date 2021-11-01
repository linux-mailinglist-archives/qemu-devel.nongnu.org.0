Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0A944190A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 10:54:00 +0100 (CET)
Received: from localhost ([::1]:39024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhU0t-00082s-Fg
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 05:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mhTzD-0005Fi-FH
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:15 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50114 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mhTz9-00089V-Vo
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:15 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn2u3uH9hbKIjAA--.55994S2; 
 Mon, 01 Nov 2021 17:51:51 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/29] Add LoongArch linux-user emulation support
Date: Mon,  1 Nov 2021 17:51:22 +0800
Message-Id: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn2u3uH9hbKIjAA--.55994S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww45Ww4DZFWktFy5Kr1kAFb_yoWDGr18pr
 Wfur15Gr48JrZ7Jrsaga45Zrn5Xa1xGr42g3WSq3s5ArWxZryfZFn5KasxKFy3X3W0gryI
 qFnYkw1UWF4UXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This series only support linux-user emulation.
More about LoongArch at: https://github.com/loongson/

The latest kernel:
  * https://github.com/loongson/linux/tree/loongarch-next

Patches need review:
  * 0002-target-loongarch-Add-core-definition.patch
  * 0016-target-loongarch-Add-disassembler.patch
  * 0017-linux-user-Add-LoongArch-generic-header-files.patch
  * 0018-linux-user-Add-LoongArch-specific-structures.patch
  * 0019-linux-user-Add-LoongArch-signal-support.patch
  * 0020-linux-user-Add-LoongArch-elf-support.patch
  * 0021-linux-user-Add-LoongArch-syscall-support.patch
  * 0022-linux-user-Add-LoongArch-cpu_loop-support.patch
  * 0023-linux-user-Add-host-dependency-for-LoongArch-64-bit.patch
  * 0028-accel-tcg-user-exec-Implement-CPU-specific-signal-ha.patch
  * 0029-linux-user-Add-safe-syscall-handling-for-loongarch64.patch


Changes for v8:
  * Use the FIELD functions to define cpucfg[i].
  * Re-use the decodetree to disassembler description. 
  * Split v7 patch(0017-LoongArch-Linux-User-Emulation.patch).

Changes for v7:
  * scripts/gensyscalls.sh support loongarch64
    if we use gensyscalls.sh, we need disable __BITS_PER_LONG at arch/loongarch/include/uapi/asm/bitsperlong.h

Changes for v6:
  * Resolve patch10 and patch6 code issues.

Changes for v5:
  * Follow Richard's code review comments [1].
  * Use force_sig_fault().
  * Implement setup_sigtramp.

    [1]: https://patchew.org/QEMU/1630586467-22463-1-git-send-email-gaosong@loongson.cn/

Changes for v4:
  * Update README，add LoongArch linux-user emulation Introduction.
  * Add 'make check-tcg' support(patch 20).
  * Add binfmt config(patch 21).
  * Fix bugs when running loongarch basic commands.
Changes for v3:
  * Split trans.inc.c.
  * Remove csr registers.
  * Delete patchs 2, 4, 5.
  * Follow Richard's code review comments [1].
  * Follow Richard's riscv patches [2].

    [1]: https://patchew.org/QEMU/1626861198-6133-1-git-send-email-gaosong@loongson.cn/
    [2]: https://patchew.org/QEMU/20210823195529.560295-1-richard.henderson@linaro.org/

Changes for v2:
  * Patch 1, remove unnecessary introduction;
  * Patch 3, follow the ARM/AVR pattern to add new CPU features;
  * Patch 6, remove decode_lsx();
  * Patches 7-18, delete opcode definition, modify translation function;
  * Patches 20-22, split V1 patch20 to V2 patch20-22.

v7: https://patchew.org/QEMU/1634561247-25499-1-git-send-email-gaosong@loongson.cn/
V6: https://patchew.org/QEMU/1631866380-31017-1-git-send-email-gaosong@loongson.cn/
V5: https://patchew.org/QEMU/1631624431-30658-1-git-send-email-gaosong@loongson.cn/
V4: https://patchew.org/QEMU/1630586467-22463-1-git-send-email-gaosong@loongson.cn/
V3: https://patchew.org/QEMU/1630048494-2143-1-git-send-email-gaosong@loongson.cn/
V2: https://patchew.org/QEMU/1626861198-6133-1-git-send-email-gaosong@loongson.cn/
V1: https://patchew.org/QEMU/1624881885-31692-1-git-send-email-gaosong@loongson.cn/

Please review!

Thanks.


Song Gao (29):
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
  linux-user: Add host dependency for LoongArch 64-bit
  default-configs: Add loongarch linux-user support
  target/loongarch: Add target build suport
  target/loongarch: 'make check-tcg' support
  scripts: add loongarch64 binfmt config
  accel/tcg/user-exec: Implement CPU-specific signal handler for
    loongarch64 hosts
  linux-user: Add safe syscall handling for loongarch64 hosts

 MAINTAINERS                                    |   5 +
 accel/tcg/user-exec.c                          |  73 ++
 configs/targets/loongarch64-linux-user.mak     |   3 +
 configure                                      |   5 +
 include/disas/dis-asm.h                        |   2 +
 include/elf.h                                  |   2 +
 linux-user/elfload.c                           |  58 ++
 linux-user/host/loongarch64/hostdep.h          |  34 +
 linux-user/host/loongarch64/safe-syscall.inc.S |  80 +++
 linux-user/loongarch64/cpu_loop.c              |  98 +++
 linux-user/loongarch64/signal.c                | 163 +++++
 linux-user/loongarch64/sockbits.h              |   1 +
 linux-user/loongarch64/syscall_nr.h            | 312 +++++++++
 linux-user/loongarch64/target_cpu.h            |  35 +
 linux-user/loongarch64/target_elf.h            |  14 +
 linux-user/loongarch64/target_errno_defs.h     |   7 +
 linux-user/loongarch64/target_fcntl.h          |  12 +
 linux-user/loongarch64/target_signal.h         |  30 +
 linux-user/loongarch64/target_structs.h        |  49 ++
 linux-user/loongarch64/target_syscall.h        |  46 ++
 linux-user/loongarch64/termbits.h              |   1 +
 linux-user/syscall_defs.h                      |  10 +-
 meson.build                                    |   3 +-
 scripts/gensyscalls.sh                         |   1 +
 scripts/qemu-binfmt-conf.sh                    |   6 +-
 target/loongarch/README                        |  76 ++
 target/loongarch/cpu-param.h                   |  19 +
 target/loongarch/cpu.c                         | 353 ++++++++++
 target/loongarch/cpu.h                         | 254 +++++++
 target/loongarch/disas.c                       | 919 +++++++++++++++++++++++++
 target/loongarch/fpu_helper.c                  | 865 +++++++++++++++++++++++
 target/loongarch/helper.h                      |  97 +++
 target/loongarch/insn_trans/trans_arith.c      | 322 +++++++++
 target/loongarch/insn_trans/trans_atomic.c     | 133 ++++
 target/loongarch/insn_trans/trans_bit.c        | 255 +++++++
 target/loongarch/insn_trans/trans_branch.c     |  85 +++
 target/loongarch/insn_trans/trans_extra.c      |  87 +++
 target/loongarch/insn_trans/trans_farith.c     | 108 +++
 target/loongarch/insn_trans/trans_fcmp.c       |  59 ++
 target/loongarch/insn_trans/trans_fcnv.c       |  36 +
 target/loongarch/insn_trans/trans_fmemory.c    | 187 +++++
 target/loongarch/insn_trans/trans_fmov.c       | 153 ++++
 target/loongarch/insn_trans/trans_memory.c     | 235 +++++++
 target/loongarch/insn_trans/trans_shift.c      | 131 ++++
 target/loongarch/insns.decode                  | 480 +++++++++++++
 target/loongarch/internals.h                   |  29 +
 target/loongarch/meson.build                   |  19 +
 target/loongarch/op_helper.c                   |  85 +++
 target/loongarch/translate.c                   | 288 ++++++++
 target/loongarch/translate.h                   |  46 ++
 target/meson.build                             |   1 +
 tests/tcg/configure.sh                         |   1 +
 52 files changed, 6367 insertions(+), 6 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 linux-user/host/loongarch64/hostdep.h
 create mode 100644 linux-user/host/loongarch64/safe-syscall.inc.S
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
 create mode 100644 target/loongarch/insn_trans/trans_arith.c
 create mode 100644 target/loongarch/insn_trans/trans_atomic.c
 create mode 100644 target/loongarch/insn_trans/trans_bit.c
 create mode 100644 target/loongarch/insn_trans/trans_branch.c
 create mode 100644 target/loongarch/insn_trans/trans_extra.c
 create mode 100644 target/loongarch/insn_trans/trans_farith.c
 create mode 100644 target/loongarch/insn_trans/trans_fcmp.c
 create mode 100644 target/loongarch/insn_trans/trans_fcnv.c
 create mode 100644 target/loongarch/insn_trans/trans_fmemory.c
 create mode 100644 target/loongarch/insn_trans/trans_fmov.c
 create mode 100644 target/loongarch/insn_trans/trans_memory.c
 create mode 100644 target/loongarch/insn_trans/trans_shift.c
 create mode 100644 target/loongarch/insns.decode
 create mode 100644 target/loongarch/internals.h
 create mode 100644 target/loongarch/meson.build
 create mode 100644 target/loongarch/op_helper.c
 create mode 100644 target/loongarch/translate.c
 create mode 100644 target/loongarch/translate.h

-- 
1.8.3.1


