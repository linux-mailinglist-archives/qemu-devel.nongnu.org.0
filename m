Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE8E5BE40A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:02:43 +0200 (CEST)
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oab1W-0005JE-87
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oaZuj-0000PM-65
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34006 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oaZuc-0005Tx-Uc
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:35 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxnmsCjSljVJ8eAA--.35099S8; 
 Tue, 20 Sep 2022 17:51:28 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL v2 6/9] hw/loongarch: Add RAMFB to dynamic_sysbus_devices list
Date: Tue, 20 Sep 2022 17:50:55 +0800
Message-Id: <20220920095058.4124145-7-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220920095058.4124145-1-gaosong@loongson.cn>
References: <20220920095058.4124145-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxnmsCjSljVJ8eAA--.35099S8
X-Coremail-Antispam: 1UD129KBjvdXoWrKr1DZFWrXrW8JFW5Wr47twb_yoWkXFc_uF
 13Ar1fu3y8J3W0g3WFqa15JF12ka4UZFs8uFsIgan7Za45t3y3tayaywn8Zr129rWq9r43
 Ww40gry5CryrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add RAMFB device to dynamic_sysbus_devices list so that it can be
hotpluged to the machine.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220908094623.73051-7-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index eedff10758..0dd57935b0 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -39,6 +39,7 @@
 #include <libfdt.h>
 #include "hw/core/sysbus-fdt.h"
 #include "hw/platform-bus.h"
+#include "hw/display/ramfb.h"
 
 static void create_fdt(LoongArchMachineState *lams)
 {
@@ -852,6 +853,7 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "acpi",
         "Enable ACPI");
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 }
 
 static const TypeInfo loongarch_machine_types[] = {
-- 
2.31.1


