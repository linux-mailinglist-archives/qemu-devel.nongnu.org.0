Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1B15A2525
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 11:56:21 +0200 (CEST)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRW4a-0002A4-2u
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 05:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oRW1L-0006ZK-IL
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:53:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52016 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oRW1F-0005vZ-8a
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:52:58 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72vslwhjn00KAA--.42825S2; 
 Fri, 26 Aug 2022 17:52:44 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 imammedo@redhat.com
Subject: [PATCH v1 0/2] Add mem hotplug and improve acpi dsdt
Date: Fri, 26 Aug 2022 17:52:42 +0800
Message-Id: <20220826095244.613426-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx72vslwhjn00KAA--.42825S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU
 =
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

This series based on the 'Add funtions for LoongArch virt machine patch'(11 Aug)
and 'Fix acpi ged irq number in dsdt table patch'(19 Aug).

Changes for v1:
1.Support memory hotplug
2.Improve acpi dsdt table

Xiaojuan Yang (2):
  hw/loongarch: Support memory hotplug
  hw/loongarch: Improve acpi dsdt table

 hw/loongarch/Kconfig        |   2 +
 hw/loongarch/acpi-build.c   | 191 +++++++++---------------------------
 hw/loongarch/virt.c         | 106 +++++++++++++++++++-
 include/hw/loongarch/virt.h |   1 +
 4 files changed, 153 insertions(+), 147 deletions(-)

-- 
2.31.1


