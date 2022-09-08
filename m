Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F8A5B194D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:52:17 +0200 (CEST)
Received: from localhost ([::1]:40668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWECm-0003BU-IF
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oWE7H-0005EB-Hb
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:46:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43696 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oWE7B-0004z0-Lr
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:46:34 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxYOLwuRljGFYUAA--.17873S2; 
 Thu, 08 Sep 2022 17:46:24 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 imammedo@redhat.com
Subject: [PATCH v1 0/9] Fix bugs and improve functions for LoongArch
Date: Thu,  8 Sep 2022 17:46:14 +0800
Message-Id: <20220908094623.73051-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxYOLwuRljGFYUAA--.17873S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1DGr47Wr1kXFWrZryxZrb_yoW8XrW7pF
 Wa9r1ayr4rCr9rt3s3J3sI9r1Fyrs7Cr42qFnrtrW8C3y5Ar1jvrn2y3savFyUG34xJFWq
 qr4Fkw18WF4UXFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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

These patches integrate all previous patches, including
'[PATCH v1 0/2] Add mem hotplug and improve acpi dsdt (26 Aug )', 
'[PATCH v1] hw/loongarch: Fix acpi ged irq number in dsdt table (19 
Aug)',
'[PATCH v1 0/6] Add funtions for LoongArch virt machine (11 Aug)'.
As none of the patches has not been reviewed, so we integrate them for 
more convenient reviewing.

Changes for v1: 
1. Remove vga device when loongarch init
2. Support fw_cfg dma function
3. Add interrupt information to FDT table
4. Add platform bus support
5. Add hotplug handler for machine
6. Add RAMFB to dynamic_sysbus_devices list
7. Fix acpi ged irq number in dsdt table
8. Support memory hotplug
9. Improve acpi dsdt table

Xiaojuan Yang (9):
  hw/loongarch: Remove vga device when loongarch init
  hw/loongarch: Support fw_cfg dma function
  hw/loongarch: Add interrupt information to FDT table
  hw/loongarch: Add platform bus support
  hw/loongarch: Add hotplug handler for machine
  hw/loongarch: Add RAMFB to dynamic_sysbus_devices list
  hw/loongarch: Fix acpi ged irq number in dsdt table
  hw/loongarch: Support memory hotplug
  hw/loongarch: Improve acpi dsdt table

 hw/loongarch/Kconfig        |   5 +-
 hw/loongarch/acpi-build.c   | 191 ++++++++-------------------------
 hw/loongarch/fw_cfg.c       |   3 +-
 hw/loongarch/virt.c         | 205 +++++++++++++++++++++++++++++++++++-
 include/hw/loongarch/virt.h |   2 +
 include/hw/pci-host/ls7a.h  |   5 +
 6 files changed, 259 insertions(+), 152 deletions(-)

-- 
2.31.1


