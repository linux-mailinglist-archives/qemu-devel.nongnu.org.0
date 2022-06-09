Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E30544191
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 04:44:42 +0200 (CEST)
Received: from localhost ([::1]:35636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz8A4-0007zC-VY
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 22:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1nz87p-0005GA-UK
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 22:42:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43364 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1nz87m-0008UE-UP
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 22:42:21 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxWeQBXqFiaLAyAA--.53544S2; 
 Thu, 09 Jun 2022 10:42:09 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	laurent@vivier.eu,
	gaosong@loongson.cn
Subject: [PATCH v15 0/9] Add LoongArch linux-user emulation support
Date: Thu,  9 Jun 2022 10:42:00 +0800
Message-Id: <20220609024209.2406188-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxWeQBXqFiaLAyAA--.53544S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1kAw1fAw4UCFyfGFWDXFb_yoW5uF1xpr
 Wfur1fGw4rGrZ7Jr1qqa45ZF1rXa17Wr4aga4Sqry8CrWIkry8Zw1kGF9xW3W3Z3WrKrWj
 qFyvyw1UWF4DWFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi All,

This series add support linux-user emulation.
As the LoongArch kernel had merged into 5.19-rc1,
you can see the latest kernel at https://kernel.org

Need review patches:

  0002-linux-user-Add-LoongArch-signal-support.patch
  0008-target-loongarch-Adjust-functions-and-structure-to-s.patch
  0009-target-loongarch-Update-README.patch

v15:
  - Rebase;
  - Update README;
  - Adjust some functions and structure to support user-mode;
  - Update syscall;
  - Update target_sigcontext;


Old series:
   - https://patchew.org/QEMU/20220106094200.1801206-1-gaosong@loongson.cn/
  

Thanks.
Song Gao


Song Gao (9):
  linux-user: Add LoongArch generic header files
  linux-user: Add LoongArch signal support
  linux-user: Add LoongArch elf support
  linux-user: Add LoongArch syscall support
  linux-user: Add LoongArch cpu_loop support
  default-configs: Add loongarch linux-user support
  scripts: add loongarch64 binfmt config
  target/loongarch: Adjust functions and structure to support user-mode
  target/loongarch: Update README

 configs/targets/loongarch64-linux-user.mak    |   3 +
 linux-user/elfload.c                          |  54 +++
 linux-user/loongarch64/cpu_loop.c             |  93 ++++++
 linux-user/loongarch64/signal.c               | 194 +++++++++++
 linux-user/loongarch64/sockbits.h             |  11 +
 linux-user/loongarch64/syscall_nr.h           | 312 ++++++++++++++++++
 linux-user/loongarch64/target_cpu.h           |  34 ++
 linux-user/loongarch64/target_elf.h           |  12 +
 linux-user/loongarch64/target_errno_defs.h    |  12 +
 linux-user/loongarch64/target_fcntl.h         |  11 +
 linux-user/loongarch64/target_prctl.h         |   1 +
 linux-user/loongarch64/target_resource.h      |  11 +
 linux-user/loongarch64/target_signal.h        |  13 +
 linux-user/loongarch64/target_structs.h       |  11 +
 linux-user/loongarch64/target_syscall.h       |  48 +++
 linux-user/loongarch64/termbits.h             |  11 +
 linux-user/syscall_defs.h                     |  12 +-
 scripts/gensyscalls.sh                        |   1 +
 scripts/qemu-binfmt-conf.sh                   |   6 +-
 target/loongarch/README                       |  39 ++-
 target/loongarch/cpu.c                        |  22 +-
 target/loongarch/cpu.h                        |   6 +
 target/loongarch/helper.h                     |   5 +-
 target/loongarch/insn_trans/trans_extra.c.inc |  14 +
 .../insn_trans/trans_privileged.c.inc         |  36 ++
 target/loongarch/internals.h                  |   2 +
 target/loongarch/op_helper.c                  |  12 +
 27 files changed, 974 insertions(+), 12 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/syscall_nr.h
 create mode 100644 linux-user/loongarch64/target_cpu.h
 create mode 100644 linux-user/loongarch64/target_elf.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_prctl.h
 create mode 100644 linux-user/loongarch64/target_resource.h
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/target_syscall.h
 create mode 100644 linux-user/loongarch64/termbits.h

-- 
2.31.1


