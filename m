Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A05D2C8043
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 09:49:27 +0100 (CET)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjesA-0007w7-9A
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 03:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjegw-0003Qh-VG; Mon, 30 Nov 2020 03:37:53 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjego-0000XX-Cl; Mon, 30 Nov 2020 03:37:48 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CkzB23Nm0z15VQK;
 Mon, 30 Nov 2020 16:37:14 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Nov 2020
 16:37:29 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 10/12] tosa-ssp: put it into the 'misc' category
Date: Mon, 30 Nov 2020 16:36:28 +0800
Message-ID: <20201130083630.2520597-11-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201130083630.2520597-1-ganqixin@huawei.com>
References: <20201130083630.2520597-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 Gan Qixin <ganqixin@huawei.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The category of the tosa-ssp device is not set, put it into the 'misc'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/tosa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index fe88ed89fe..0e3461c8ed 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -292,10 +292,12 @@ static const TypeInfo tosa_dac_info = {
 
 static void tosa_ssp_class_init(ObjectClass *klass, void *data)
 {
+    DeviceClass *dc = DEVICE_CLASS(klass);
     SSISlaveClass *k = SSI_SLAVE_CLASS(klass);
 
     k->realize = tosa_ssp_realize;
     k->transfer = tosa_ssp_tansfer;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo tosa_ssp_info = {
-- 
2.23.0


