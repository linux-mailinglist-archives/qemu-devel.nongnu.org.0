Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B602AF16B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:01:58 +0100 (CET)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpl7-0003tT-HM
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcpaS-0007v1-4f; Wed, 11 Nov 2020 07:50:56 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcpaO-00034f-Rw; Wed, 11 Nov 2020 07:50:55 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWPj550pZzkbyJ;
 Wed, 11 Nov 2020 20:50:33 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 20:50:39 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 2/4] ads7846: put it into the 'dispaly' category
Date: Wed, 11 Nov 2020 06:17:18 +0800
Message-ID: <20201110221720.572902-3-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201110221720.572902-1-ganqixin@huawei.com>
References: <20201110221720.572902-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 07:50:46
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 laurent@vivier.eu, Gan Qixin <ganqixin@huawei.com>, kuhn.chenqun@huawei.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The category of the ads7846 device is not set, put it into the 'dispaly' category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
 hw/display/ads7846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
index 023165b2a3..b455cb5acd 100644
--- a/hw/display/ads7846.c
+++ b/hw/display/ads7846.c
@@ -163,10 +163,12 @@ static void ads7846_realize(SSISlave *d, Error **errp)
 
 static void ads7846_class_init(ObjectClass *klass, void *data)
 {
+    DeviceClass *dc = DEVICE_CLASS(klass);
     SSISlaveClass *k = SSI_SLAVE_CLASS(klass);
 
     k->realize = ads7846_realize;
     k->transfer = ads7846_transfer;
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
 }
 
 static const TypeInfo ads7846_info = {
-- 
2.23.0


