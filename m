Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D455EBAA3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:28:56 +0200 (CEST)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od45P-0003HB-4X
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1od3pn-0001SN-3P
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:12:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40726 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1od3pi-0007Hm-7x
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:12:45 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxT+BJlDJj4J4iAA--.64861S2; 
 Tue, 27 Sep 2022 14:12:25 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v2 0/3] Add memmap and fix bugs for LoongArch
Date: Tue, 27 Sep 2022 14:12:22 +0800
Message-Id: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxT+BJlDJj4J4iAA--.64861S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFW3XF1xZFW5ZFyDtFW3trb_yoWfXrg_WF
 yfZFW8JF4Ygas0yFWIgFyrA34UGa10gF43ZF1kXrWfKr1xXrn8XFsxGws0vr10qrWUJrsx
 J3y0qry8Ar1aqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

Changes for v2:
1. Adjust the position of 'PLATFORM' element in memmap table

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


