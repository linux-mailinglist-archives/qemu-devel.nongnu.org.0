Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E33F954C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:44:44 +0200 (CEST)
Received: from localhost ([::1]:34662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWXR-0003AI-Fh
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mJW52-0000i7-4S
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:15:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59288 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mJW4v-00033n-If
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:15:11 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxtOTvkChhno4AAA--.2304S2;
 Fri, 27 Aug 2021 15:14:55 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/19] Add LoongArch linux-user emulation support
Date: Fri, 27 Aug 2021 15:14:35 +0800
Message-Id: <1630048494-2143-1-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9AxtOTvkChhno4AAA--.2304S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFykCw43CF4Uur1rJw1UKFg_yoWxCr1Upr
 W7ur1UKw48GrZ7Jr4vqay5Xrn5Xa1xGr4293WSq3s5CrWIvryfZF1kK3sxKFy3X3W0gry0
 qFnYkw1UWF4UXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 richard.henderson@linaro.org, f4bug@amsat.org, maobibo@loongson.cn,
 laurent@vivier.eu, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series only adds linux-user emulation support for LoongArch.
So there is no introduction of system in docs/system directory,
We'll add that in a future series.


Changes for v3:
  * split trans.inc.c.
  * remove csr registers.
  * delete patchs 2, 4, 5.
  * follow Richard's code review comments [1].
  * follow Richard's riscv patches [2].

    [1]: https://patchew.org/QEMU/1626861198-6133-1-git-send-email-gaosong@loongson.cn/
    [2]: https://patchew.org/QEMU/20210823195529.560295-1-richard.henderson@linaro.org/ 


Changes for v2:
  * Patch 1, remove unnecessary introduction;
  * Patch 3, follow the ARM/AVR pattern to add new CPU features;
  * Patch 6, remove decode_lsx(); 
  * Patches 7-18, delete opcode definition, modify translation function;
  * Patches 20-22, split V1 patch20 to V2 patch20-22. 


V2: https://patchew.org/QEMU/1626861198-6133-1-git-send-email-gaosong@loongson.cn/
V1: https://patchew.org/QEMU/1624881885-31692-1-git-send-email-gaosong@loongson.cn/

Please review!

thnaks.

Song Gao (19):
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

 MAINTAINERS                                 |    6 +
 configs/targets/loongarch64-linux-user.mak  |    3 +
 disas/loongarch.c                           | 2511 +++++++++++++++++++++++++++
 disas/meson.build                           |    1 +
 include/disas/dis-asm.h                     |    2 +
 include/elf.h                               |    2 +
 linux-user/elfload.c                        |   58 +
 linux-user/loongarch64/cpu_loop.c           |  108 ++
 linux-user/loongarch64/signal.c             |  178 ++
 linux-user/loongarch64/sockbits.h           |    1 +
 linux-user/loongarch64/syscall_nr.h         |  307 ++++
 linux-user/loongarch64/target_cpu.h         |   36 +
 linux-user/loongarch64/target_elf.h         |   14 +
 linux-user/loongarch64/target_errno_defs.h  |    7 +
 linux-user/loongarch64/target_fcntl.h       |   12 +
 linux-user/loongarch64/target_signal.h      |   28 +
 linux-user/loongarch64/target_structs.h     |   49 +
 linux-user/loongarch64/target_syscall.h     |   46 +
 linux-user/loongarch64/termbits.h           |  229 +++
 linux-user/syscall_defs.h                   |   10 +-
 meson.build                                 |    1 +
 target/loongarch/README                     |    5 +
 target/loongarch/cpu-param.h                |   19 +
 target/loongarch/cpu.c                      |  286 +++
 target/loongarch/cpu.h                      |  145 ++
 target/loongarch/fpu_helper.c               |  947 ++++++++++
 target/loongarch/helper.h                   |  102 ++
 target/loongarch/insn_trans/trans_arith.c   |  334 ++++
 target/loongarch/insn_trans/trans_atomic.c  |  132 ++
 target/loongarch/insn_trans/trans_bit.c     |  297 ++++
 target/loongarch/insn_trans/trans_branch.c  |   84 +
 target/loongarch/insn_trans/trans_extra.c   |   88 +
 target/loongarch/insn_trans/trans_farith.c  |   79 +
 target/loongarch/insn_trans/trans_fcmp.c    |  279 +++
 target/loongarch/insn_trans/trans_fcnv.c    |   36 +
 target/loongarch/insn_trans/trans_fmemory.c |  143 ++
 target/loongarch/insn_trans/trans_fmov.c    |  159 ++
 target/loongarch/insn_trans/trans_memory.c  |  263 +++
 target/loongarch/insn_trans/trans_shift.c   |  154 ++
 target/loongarch/insns.decode               |  480 +++++
 target/loongarch/internals.h                |   24 +
 target/loongarch/meson.build                |   18 +
 target/loongarch/op_helper.c                |   85 +
 target/loongarch/translate.c                |  309 ++++
 target/loongarch/translate.h                |   54 +
 target/meson.build                          |    1 +
 46 files changed, 8128 insertions(+), 4 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 disas/loongarch.c
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


