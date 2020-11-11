Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED6A2B004A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 08:23:05 +0100 (CET)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd6wh-0000fC-Pv
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 02:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kd6uR-0007I9-6b; Thu, 12 Nov 2020 02:20:43 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kd6uN-0006Cq-B7; Thu, 12 Nov 2020 02:20:42 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CWtKc4ytJz76JM;
 Thu, 12 Nov 2020 15:20:20 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 12 Nov 2020
 15:20:23 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 1/4] ssd0323: put it into the 'display' category
Date: Thu, 12 Nov 2020 00:47:07 +0800
Message-ID: <20201111164710.644863-2-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111164710.644863-1-ganqixin@huawei.com>
References: <20201111164710.644863-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ganqixin@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 02:20:30
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
 laurent@vivier.eu, armbru@redhat.com, Gan Qixin <ganqixin@huawei.com>,
 kuhn.chenqun@huawei.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The category of the ssd0323 device is not set, put it into the 'display'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
 hw/display/ssd0323.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
index 17d4b32ae3..cbfd21dfd5 100644
--- a/hw/display/ssd0323.c
+++ b/hw/display/ssd0323.c
@@ -370,6 +370,7 @@ static void ssd0323_class_init(ObjectClass *klass, void *data)
     k->transfer = ssd0323_transfer;
     k->cs_polarity = SSI_CS_HIGH;
     dc->vmsd = &vmstate_ssd0323;
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
 }
 
 static const TypeInfo ssd0323_info = {
-- 
2.23.0


