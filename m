Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9FA5E7277
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 05:33:54 +0200 (CEST)
Received: from localhost ([::1]:41666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obZRp-0000qv-KQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 23:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1obZNO-0004gH-TZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 23:29:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43466 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1obZNL-0000s8-Pq
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 23:29:18 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxFeIDKC1jj3UgAA--.57803S2; 
 Fri, 23 Sep 2022 11:29:07 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn,
	maobibo@loongson.cn
Subject: [PATCH v1 0/3] Add memmap and fix bugs for LoongArch
Date: Fri, 23 Sep 2022 11:29:04 +0800
Message-Id: <20220923032907.1728700-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxFeIDKC1jj3UgAA--.57803S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFW3XF1xZFW5uF15XF48Crg_yoW3Cwb_uF
 yfuFWrJF45Wa4YvFyIgFyrA34UGa10qFsxuFn7XrWxKr1xXrn8XFsxGrs0vr10qr4UXrsx
 trW0qryrAr1aqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series add memmap table and fix extioi, ipi device
emulation for LoongArch virt machine.

Changes for v1: 
1. Add memmap table for LoongArch virt machine
2. Fix LoongArch extioi function
3. Fix LoongArch ipi device emulation

Thanks for your reviewing.

Xiaojuan Yang (3):
  hw/loongarch: Add memmap for LoongArch virt machine
  hw/intc: Fix LoongArch extioi function
  hw/intc: Fix LoongArch ipi device emulation

 hw/intc/loongarch_extioi.c  |  17 +++--
 hw/intc/loongarch_ipi.c     |   1 -
 hw/loongarch/acpi-build.c   |  46 ++++++------
 hw/loongarch/fw_cfg.c       |   5 +-
 hw/loongarch/virt.c         | 138 ++++++++++++++++++++++--------------
 include/hw/loongarch/virt.h |  34 +++++----
 include/hw/pci-host/ls7a.h  |  18 -----
 7 files changed, 143 insertions(+), 116 deletions(-)

-- 
2.31.1


