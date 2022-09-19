Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47FD5BCC84
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:06:03 +0200 (CEST)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGTK-0001x0-Rb
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oaGCy-0001Xf-SY
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:49:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50908 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oaGCv-0000I1-VM
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:49:08 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72s9ZShjN8QdAA--.43684S2; 
 Mon, 19 Sep 2022 20:49:01 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL 0/9] loongarch-to-apply queue
Date: Mon, 19 Sep 2022 20:48:52 +0800
Message-Id: <20220919124901.2653396-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx72s9ZShjN8QdAA--.43684S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ary8KF4xuFW8Kr1fZFyDAwb_yoW8Gw4xpr
 W3Zr13Ar4rJr9rJrn3J3sxXrn8Ars7Gr42qF17tr18CrWUAr1UXr1xAry8ZFyUJ34xJr1q
 vr18Cw1UWF4UJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

The following changes since commit d29201ff34a135cdfc197f4413c1c5047e4f58bb:

  Merge tag 'pull-hmp-20220915a' of https://gitlab.com/dagrh/qemu into staging (2022-09-17 10:31:11 -0400)

are available in the Git repository at:

  https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20220919

for you to fetch changes up to c06bc455a0ac03123548ac9a2a76e5887f9b9a89:

  hw/loongarch: Improve acpi dsdt table (2022-09-19 20:01:41 +0800)

----------------------------------------------------------------
pull-loongarch

----------------------------------------------------------------
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
 hw/loongarch/acpi-build.c   | 191 ++++++++++-------------------------------
 hw/loongarch/fw_cfg.c       |   3 +-
 hw/loongarch/virt.c         | 205 +++++++++++++++++++++++++++++++++++++++++++-
 include/hw/loongarch/virt.h |   2 +
 include/hw/pci-host/ls7a.h  |   5 ++
 6 files changed, 259 insertions(+), 152 deletions(-)


