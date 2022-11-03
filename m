Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42B8617CD7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 13:41:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZVe-0002QR-5B; Thu, 03 Nov 2022 08:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oqZV7-0002Jq-2t
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:39:19 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oqZV2-0000Z8-S8
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:39:16 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxjrdmtmNjOjsEAA--.9693S3;
 Thu, 03 Nov 2022 20:39:02 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxJldltmNjofgLAA--.16257S2; 
 Thu, 03 Nov 2022 20:39:02 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL 0/7] loongarch-to-apply queue
Date: Thu,  3 Nov 2022 20:38:54 +0800
Message-Id: <20221103123901.2811990-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxJldltmNjofgLAA--.16257S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tFWUZF18Zr17CF4rZr1UJrb_yoW8Ary8pr
 13Cry3Wr4rJrZxXrn3J345Xr15Jr4xGr42qF17J348Cr17Ar1UXr18t34kZFyUG348Jryj
 vr18Aw1UWF1UAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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

The following changes since commit a11f65ec1b8adcb012b89c92819cbda4dc25aaf1:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-11-01 13:49:33 -0400)

are available in the Git repository at:

  https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221103

for you to fetch changes up to d31e2b1af7e6db41e6088679babc3893bd69b4b3:

  target/loongarch: Fix raise_mmu_exception() set wrong exception_index (2022-11-03 17:59:19 +0800)

----------------------------------------------------------------
pull-loongarch-20221103

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
 hw/loongarch/acpi-build.c       | 50 +++++++++++++++++++++++++++++++++--
 hw/loongarch/virt.c             | 53 ++++++++++++++++++++++++++++++++-----
 include/hw/loongarch/virt.h     |  3 ---
 include/hw/pci-host/ls7a.h      |  1 +
 target/loongarch/cpu.c          |  8 ++++--
 target/loongarch/cpu.h          | 58 ++++++++++++++++++++++-------------------
 target/loongarch/iocsr_helper.c | 19 ++++++++------
 target/loongarch/tlb_helper.c   |  5 ++--
 10 files changed, 170 insertions(+), 71 deletions(-)


