Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B62C8040
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 09:47:11 +0100 (CET)
Received: from localhost ([::1]:53776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjepy-00067K-Dx
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 03:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjeh1-0003RP-FR; Mon, 30 Nov 2020 03:37:55 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjego-0000XV-Cv; Mon, 30 Nov 2020 03:37:52 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CkzB22qQ2zhkNB;
 Mon, 30 Nov 2020 16:37:14 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Nov 2020
 16:37:28 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 09/12] u2f-passthru: put it into the 'misc' category
Date: Mon, 30 Nov 2020 16:36:27 +0800
Message-ID: <20201130083630.2520597-10-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201130083630.2520597-1-ganqixin@huawei.com>
References: <20201130083630.2520597-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=ganqixin@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Gerd
 Hoffmann <kraxel@redhat.com>, Gan Qixin <ganqixin@huawei.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The category of the u2f-passthru device is not set, put it into the 'misc'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/u2f-passthru.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/u2f-passthru.c b/hw/usb/u2f-passthru.c
index ae00e93f35..fc93429c9c 100644
--- a/hw/usb/u2f-passthru.c
+++ b/hw/usb/u2f-passthru.c
@@ -534,6 +534,7 @@ static void u2f_passthru_class_init(ObjectClass *klass, void *data)
     dc->desc = "QEMU U2F passthrough key";
     dc->vmsd = &u2f_passthru_vmstate;
     device_class_set_props(dc, u2f_passthru_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo u2f_key_passthru_info = {
-- 
2.23.0


