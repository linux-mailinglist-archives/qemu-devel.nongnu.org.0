Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E3C3B5DA0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:09:01 +0200 (CEST)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxq4S-0007Aq-Jr
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0Y-00028o-J1
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:04:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45300 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0T-00014S-8b
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:04:58 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S2;
 Mon, 28 Jun 2021 20:04:45 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/20] Add LoongArch linux-user emulation support
Date: Mon, 28 Jun 2021 20:04:25 +0800
Message-Id: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr4xXw4DCrWfWFWDZFWUJwb_yoW7Xw1Dpr
 W3ur1rKa18GrZrJr4kXa45Xrn5Xa1xGr4293WSqry8CrWSyryxZFn5K3sIgF13J3W8Wry0
 qr1vkw1UWF4UXaDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series adds linux-user emulation support for LoongArch.

Patch 1 add an introduction to LoongArch.
Patches 2-5 adds LoongArch basic definition.
Patches 6-18 implements user mode instruction emulation.
Patche 19 add support for disassembling via option '-d in_asm'
Patch 20 add files to linux-user/loongarch64 and support compilling
linux-user binary.

About LoongArch, please see:
   https://github.com/loongson/LoongArch-Documentation

Please review!

thanks

Song Gao (20):
  target/loongarch: Add README
  target/loongarch: Add CSR registers definition
  target/loongarch: Add core definition
  target/loongarch: Add interrupt handling support
  target/loongarch: Add memory management support
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
  target/loongarch: Add linux-user emulation support

 MAINTAINERS                                        |    7 +
 default-configs/targets/loongarch64-linux-user.mak |    4 +
 disas/loongarch.c                                  | 2528 +++++++++++++++++++
 disas/meson.build                                  |    1 +
 include/disas/dis-asm.h                            |    2 +
 include/elf.h                                      |    2 +
 linux-user/elfload.c                               |   58 +
 linux-user/loongarch64/cpu_loop.c                  |  177 ++
 linux-user/loongarch64/signal.c                    |  193 ++
 linux-user/loongarch64/sockbits.h                  |    1 +
 linux-user/loongarch64/syscall_nr.h                |  307 +++
 linux-user/loongarch64/target_cpu.h                |   36 +
 linux-user/loongarch64/target_elf.h                |   14 +
 linux-user/loongarch64/target_fcntl.h              |   12 +
 linux-user/loongarch64/target_signal.h             |   28 +
 linux-user/loongarch64/target_structs.h            |   49 +
 linux-user/loongarch64/target_syscall.h            |   46 +
 linux-user/loongarch64/termbits.h                  |  229 ++
 linux-user/syscall_defs.h                          |    8 +-
 meson.build                                        |    3 +-
 qapi/machine-target.json                           |    4 +-
 target/loongarch/README                            |   16 +
 target/loongarch/cpu-csr.h                         |  724 ++++++
 target/loongarch/cpu-param.h                       |   21 +
 target/loongarch/cpu-qom.h                         |   41 +
 target/loongarch/cpu.c                             |  477 ++++
 target/loongarch/cpu.h                             |  245 ++
 target/loongarch/fpu_helper.c                      | 1436 +++++++++++
 target/loongarch/fpu_helper.h                      |   34 +
 target/loongarch/helper.h                          |  158 ++
 target/loongarch/insns.decode                      |  483 ++++
 target/loongarch/instmap.h                         |  200 ++
 target/loongarch/internal.h                        |  107 +
 target/loongarch/meson.build                       |   19 +
 target/loongarch/op_helper.c                       |  231 ++
 target/loongarch/tlb_helper.c                      |  109 +
 target/loongarch/trans.inc.c                       | 2426 ++++++++++++++++++
 target/loongarch/translate.c                       | 2607 ++++++++++++++++++++
 target/loongarch/translate.h                       |   58 +
 target/meson.build                                 |    1 +
 40 files changed, 13096 insertions(+), 6 deletions(-)
 create mode 100644 default-configs/targets/loongarch64-linux-user.mak
 create mode 100644 disas/loongarch.c
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/syscall_nr.h
 create mode 100644 linux-user/loongarch64/target_cpu.h
 create mode 100644 linux-user/loongarch64/target_elf.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/target_syscall.h
 create mode 100644 linux-user/loongarch64/termbits.h
 create mode 100644 target/loongarch/README
 create mode 100644 target/loongarch/cpu-csr.h
 create mode 100644 target/loongarch/cpu-param.h
 create mode 100644 target/loongarch/cpu-qom.h
 create mode 100644 target/loongarch/cpu.c
 create mode 100644 target/loongarch/cpu.h
 create mode 100644 target/loongarch/fpu_helper.c
 create mode 100644 target/loongarch/fpu_helper.h
 create mode 100644 target/loongarch/helper.h
 create mode 100644 target/loongarch/insns.decode
 create mode 100644 target/loongarch/instmap.h
 create mode 100644 target/loongarch/internal.h
 create mode 100644 target/loongarch/meson.build
 create mode 100644 target/loongarch/op_helper.c
 create mode 100644 target/loongarch/tlb_helper.c
 create mode 100644 target/loongarch/trans.inc.c
 create mode 100644 target/loongarch/translate.c
 create mode 100644 target/loongarch/translate.h

-- 
1.8.3.1


