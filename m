Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C2D61A745
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 04:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or9qb-0003cL-L1; Fri, 04 Nov 2022 23:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1or9qY-0003cB-BH
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 23:27:50 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1or9qV-0006KG-H6
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 23:27:50 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxLtso2GVjiJoEAA--.15616S3;
 Sat, 05 Nov 2022 11:27:37 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxPuIo2GVjZ6ENAA--.38227S2; 
 Sat, 05 Nov 2022 11:27:36 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL v3 0/7] loongarch-to-apply queue
Date: Sat,  5 Nov 2022 11:27:29 +0800
Message-Id: <20221105032736.3789274-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPuIo2GVjZ6ENAA--.38227S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ww45AFW5Zr45XFykAw1UKFg_yoW8CF17pr
 1akrnxGr4rJrZxXrn3J345Xr15Jrs7Gr42qF17t348Cr17Ar1jqr18t34kZFyUJ34UJryj
 qr18Aw1UWF1DJrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0xFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
 FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
 8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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

  https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221105

for you to fetch changes up to 6a284614d485f36af6467ce0925df0042aca7a1f:

  target/loongarch: Fix raise_mmu_exception() set wrong exception_index (2022-11-05 10:52:19 +0800)

----------------------------------------------------------------
pull-loongarch-20221105

V3:
- According to Richard's latest comments, drop patch 8, 9.

v2:
 - fix win32/win64 complie error;
 - Add Rui Wang' patches.

----------------------------------------------------------------
Song Gao (2):
      target/loongarch: Add exception subcode
      target/loongarch: Fix raise_mmu_exception() set wrong exception_index

Xiaojuan Yang (5):
      hw/intc: Convert the memops to with_attrs in LoongArch extioi
      hw/intc: Fix LoongArch extioi coreisr accessing
      hw/loongarch: Load FDT table into dram memory space
      hw/loongarch: Improve fdt for LoongArch virt machine
      hw/loongarch: Add TPM device for LoongArch virt machine

 hw/intc/loongarch_extioi.c      | 41 ++++++++++++++++-------------
 hw/intc/trace-events            |  3 +--
 hw/loongarch/acpi-build.c       | 51 +++++++++++++++++++++++++++++++++++-
 hw/loongarch/virt.c             | 53 ++++++++++++++++++++++++++++++++-----
 include/hw/loongarch/virt.h     |  3 ---
 include/hw/pci-host/ls7a.h      |  1 +
 target/loongarch/cpu.c          |  8 ++++--
 target/loongarch/cpu.h          | 58 ++++++++++++++++++++++-------------------
 target/loongarch/iocsr_helper.c | 19 ++++++++------
 target/loongarch/tlb_helper.c   |  5 ++--
 10 files changed, 172 insertions(+), 70 deletions(-)


