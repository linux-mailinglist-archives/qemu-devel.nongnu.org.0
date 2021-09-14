Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC8540AE8F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:06:59 +0200 (CEST)
Received: from localhost ([::1]:60730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ89K-0005hz-CQ
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mQ83S-0004yE-E4
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:00:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57400 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mQ83J-0007dU-PC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:00:50 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxheXvnEBhNJ0GAA--.21668S2; 
 Tue, 14 Sep 2021 21:00:32 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/21] Add LoongArch linux-user emulation support
Date: Tue, 14 Sep 2021 21:00:10 +0800
Message-Id: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxheXvnEBhNJ0GAA--.21668S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww45uFykCFWkAr1kWFWktFb_yoW3AF45pr
 W3ur15Kw48GrZ7Jr4vga45Xrn5Xa17Gr4293WSq3s5CrWIvryfZFn5K3sxKFy3X3W0gry0
 qFnYkw1UWF4UX3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, 

We are cleanning up 'o32' code for gcc and kernel. This series only support linux-user emulation.  

More about LoongArch at: https://github.com/loongson/

Latest kernel: https://github.com/loongson/linux/tree/loongarch-next


Changes for v5:
  * Follow Richard's code review comments [1].
  * Use force_sig_fault().
    Based-on: <20210822035537.283193-6-richard.henderson@linaro.org>
  * Implement setup_sigtramp.
    Based-on: <20210618192951.125651-2-richard.henderson@linaro.org>

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

V4: https://patchew.org/QEMU/1630586467-22463-1-git-send-email-gaosong@loongson.cn/
V3: https://patchew.org/QEMU/1630048494-2143-1-git-send-email-gaosong@loongson.cn/
V2: https://patchew.org/QEMU/1626861198-6133-1-git-send-email-gaosong@loongson.cn/
V1: https://patchew.org/QEMU/1624881885-31692-1-git-send-email-gaosong@loongson.cn/

Please review!

Thanks.

Song Gao (21):
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
  LoongArch Linux User Emulation
  default-configs: Add loongarch linux-user support
  target/loongarch: Add target build suport
  target/loongarch: 'make check-tcg' support
  scripts: add loongarch64 binfmt config

 MAINTAINERS                                 |    6 +
 accel/tcg/user-exec.c                       |   15 +
 configs/targets/loongarch64-linux-user.mak  |    3 +
 configure                                   |    5 +
 disas/loongarch.c                           | 2511 +++++++++++++++++++++++++++
 disas/meson.build                           |    1 +
 include/disas/dis-asm.h                     |    2 +
 include/elf.h                               |    2 +
 linux-user/elfload.c                        |   58 +
 linux-user/host/loongarch/hostdep.h         |   11 +
 linux-user/loongarch64/cpu_loop.c           |   97 ++
 linux-user/loongarch64/signal.c             |  162 ++
 linux-user/loongarch64/sockbits.h           |    1 +
 linux-user/loongarch64/syscall_nr.h         |  312 ++++
 linux-user/loongarch64/target_cpu.h         |   35 +
 linux-user/loongarch64/target_elf.h         |   14 +
 linux-user/loongarch64/target_errno_defs.h  |    7 +
 linux-user/loongarch64/target_fcntl.h       |   12 +
 linux-user/loongarch64/target_signal.h      |   30 +
 linux-user/loongarch64/target_structs.h     |   49 +
 linux-user/loongarch64/target_syscall.h     |   46 +
 linux-user/loongarch64/termbits.h           |    1 +
 linux-user/syscall_defs.h                   |   10 +-
 meson.build                                 |    3 +-
 scripts/qemu-binfmt-conf.sh                 |    6 +-
 target/loongarch/README                     |   76 +
 target/loongarch/cpu-param.h                |   19 +
 target/loongarch/cpu.c                      |  286 +++
 target/loongarch/cpu.h                      |  151 ++
 target/loongarch/fpu_helper.c               |  824 +++++++++
 target/loongarch/helper.h                   |   93 +
 target/loongarch/insn_trans/trans_arith.c   |  322 ++++
 target/loongarch/insn_trans/trans_atomic.c  |  133 ++
 target/loongarch/insn_trans/trans_bit.c     |  255 +++
 target/loongarch/insn_trans/trans_branch.c  |   85 +
 target/loongarch/insn_trans/trans_extra.c   |   87 +
 target/loongarch/insn_trans/trans_farith.c  |  131 ++
 target/loongarch/insn_trans/trans_fcmp.c    |   59 +
 target/loongarch/insn_trans/trans_fcnv.c    |   36 +
 target/loongarch/insn_trans/trans_fmemory.c |  187 ++
 target/loongarch/insn_trans/trans_fmov.c    |  153 ++
 target/loongarch/insn_trans/trans_memory.c  |  235 +++
 target/loongarch/insn_trans/trans_shift.c   |  131 ++
 target/loongarch/insns.decode               |  480 +++++
 target/loongarch/internals.h                |   29 +
 target/loongarch/meson.build                |   18 +
 target/loongarch/op_helper.c                |   85 +
 target/loongarch/translate.c                |  288 +++
 target/loongarch/translate.h                |   46 +
 target/meson.build                          |    1 +
 tests/tcg/configure.sh                      |    1 +
 51 files changed, 7604 insertions(+), 6 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 disas/loongarch.c
 create mode 100644 linux-user/host/loongarch/hostdep.h
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


