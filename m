Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B4965FB82
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 07:34:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDgI3-0000L8-Kq; Fri, 06 Jan 2023 01:33:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pDgI1-0000Jq-6U
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 01:33:17 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pDgHx-0000DP-F8
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 01:33:16 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxjfCiwLdjIAkAAA--.497S3;
 Fri, 06 Jan 2023 14:33:06 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxg+WhwLdjihIVAA--.1106S2; 
 Fri, 06 Jan 2023 14:33:05 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 0/3] loongarch-to-apply queue
Date: Fri,  6 Jan 2023 14:33:02 +0800
Message-Id: <20230106063305.3919094-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxg+WhwLdjihIVAA--.1106S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFy5Gr1rJr4rAr45WFy5XFb_yoW8Jw1kpF
 43Cr13Kr4kJr13Xrn3Jw1UXr1rJFn7Wr12v3W3Kry8Ar4UAr1UXr1kJryrWFyUG34UJryY
 qF1rKw1UWF1UGF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b08Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xAC
 xx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx2
 6rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit d1852caab131ea898134fdcea8c14bc2ee75fbe9:

  Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging (2023-01-05 16:59:22 +0000)

are available in the Git repository at:

  https://gitlab.com/gaosong/qemu.git pull-loongarch-20230106

for you to fetch changes up to f4d10ce8aa545266a0b6df223a7f8ea2afca18b2:

  hw/intc/loongarch_pch: Change default irq number of pch irq controller (2023-01-06 14:12:43 +0800)

----------------------------------------------------------------

Add irq number property for loongarch pch interrupt controller

----------------------------------------------------------------
Tianrui Zhao (3):
      hw/intc/loongarch_pch_msi: add irq number property
      hw/intc/loongarch_pch_pic: add irq number property
      hw/intc/loongarch_pch: Change default irq number of pch irq controller

 hw/intc/loongarch_pch_msi.c         | 29 ++++++++++++++++++++++++++---
 hw/intc/loongarch_pch_pic.c         | 35 +++++++++++++++++++++++++++++++----
 hw/loongarch/virt.c                 | 19 ++++++++++++-------
 include/hw/intc/loongarch_pch_msi.h |  9 +++++----
 include/hw/intc/loongarch_pch_pic.h |  6 ++----
 include/hw/pci-host/ls7a.h          |  2 +-
 6 files changed, 77 insertions(+), 23 deletions(-)


