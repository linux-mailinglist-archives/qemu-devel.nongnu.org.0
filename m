Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C261A74D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 04:33:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or9v9-0007Vk-Pn; Fri, 04 Nov 2022 23:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1or9rj-0004Cx-MK
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 23:29:03 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1or9rh-0006T8-FE
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 23:29:03 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Dx_Nh52GVjlZoEAA--.15484S3;
 Sat, 05 Nov 2022 11:28:57 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxtuN52GVjeKENAA--.38334S2; 
 Sat, 05 Nov 2022 11:28:57 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL v3 0/7] loongarch-to-apply queue
Date: Sat,  5 Nov 2022 11:28:50 +0800
Message-Id: <20221105032857.3789472-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtuN52GVjeKENAA--.38334S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ww45AFW5Zr45XFykAw1UKFg_yoW8CF17pr
 1akrnxGr4rJrZxXrn3J345Xr15Jrs7Gr42qF17t348Cr17Ar1jqr18t34kZFyUJ34UJryj
 qr18Aw1UWF1DJrDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bF8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCE
 c2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26r
 WlOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAI
 w28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXV
 WUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
 UI43ZEXa7xRihFxUUUUUU==
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


