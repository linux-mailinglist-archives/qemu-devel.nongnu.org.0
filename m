Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D6F619415
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 11:03:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtXE-0005ae-MS; Fri, 04 Nov 2022 06:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oqtVI-0002OA-1u
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:00:49 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oqtVA-0000um-9T
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:00:47 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bx3NjC4mRjqnsEAA--.15189S3;
 Fri, 04 Nov 2022 18:00:34 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxPuDC4mRjYmUNAA--.37849S2; 
 Fri, 04 Nov 2022 18:00:34 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL v2 0/9] loongarch-to-apply queue
Date: Fri,  4 Nov 2022 18:00:24 +0800
Message-Id: <20221104100033.3473980-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxPuDC4mRjYmUNAA--.37849S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ww45AFW5Zr45XFykGr4fAFb_yoW8trWxpr
 1a9r13Gr4rJrZxZrnIyw13XFn8Jr48Gr42q3W7t34rCa13Ar1UXr48t3s2qFyUJ34UJryj
 qF18Aw15WF4DXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit ece5f8374d0416a339f0c0a9399faa2c42d4ad6f:

  Merge tag 'linux-user-for-7.2-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-11-03 10:55:05 -0400)

are available in the Git repository at:

  https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221104

for you to fetch changes up to 2419978cb09e11bc53a07d4de5621424d2a6a86d:

  target/loongarch: Fix emulation of float-point disable exception (2022-11-04 17:10:53 +0800)

----------------------------------------------------------------
pull-loongarch-20221104

v2:
 - fix win32/win64 complie error;
 - Add Rui Wang' patches.

----------------------------------------------------------------
Rui Wang (2):
      target/loongarch: Adjust the layout of hardware flags bit fields
      target/loongarch: Fix emulation of float-point disable exception

Song Gao (2):
      target/loongarch: Add exception subcode
      target/loongarch: Fix raise_mmu_exception() set wrong exception_index

Xiaojuan Yang (5):
      hw/intc: Convert the memops to with_attrs in LoongArch extioi
      hw/intc: Fix LoongArch extioi coreisr accessing
      hw/loongarch: Load FDT table into dram memory space
      hw/loongarch: Improve fdt for LoongArch virt machine
      hw/loongarch: Add TPM device for LoongArch virt machine

 hw/intc/loongarch_extioi.c                         | 41 +++++++------
 hw/intc/trace-events                               |  3 +-
 hw/loongarch/acpi-build.c                          | 51 +++++++++++++++-
 hw/loongarch/virt.c                                | 53 ++++++++++++++---
 include/hw/loongarch/virt.h                        |  3 -
 include/hw/pci-host/ls7a.h                         |  1 +
 target/loongarch/cpu.c                             | 10 +++-
 target/loongarch/cpu.h                             | 69 +++++++++++++---------
 target/loongarch/insn_trans/trans_farith.c.inc     | 30 ++++++++++
 target/loongarch/insn_trans/trans_fcmp.c.inc       | 11 +++-
 target/loongarch/insn_trans/trans_fmemory.c.inc    | 34 +++++++++--
 target/loongarch/insn_trans/trans_fmov.c.inc       | 29 ++++++++-
 target/loongarch/insn_trans/trans_privileged.c.inc |  2 +-
 target/loongarch/iocsr_helper.c                    | 19 +++---
 target/loongarch/tlb_helper.c                      |  5 +-
 target/loongarch/translate.c                       |  6 +-
 16 files changed, 283 insertions(+), 84 deletions(-)


