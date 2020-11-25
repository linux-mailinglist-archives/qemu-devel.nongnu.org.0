Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E72C366C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 03:07:22 +0100 (CET)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khkC0-0003RB-9b
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 21:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aiyutao@huawei.com>)
 id 1khk45-0007o9-1m
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 20:57:49 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aiyutao@huawei.com>)
 id 1khk41-0007PA-3r
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 20:57:48 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CgkXs2ggkzhZrK;
 Wed, 25 Nov 2020 09:57:17 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Nov 2020
 09:57:22 +0800
From: Yutao Ai <aiyutao@huawei.com>
To: <dgilbert@redhat.com>, <armbru@redhat.com>
Subject: [PATCH 3/3] monitor:Don't use '#' flag of printf format ('%#') in
 format strings
Date: Wed, 25 Nov 2020 01:45:14 +0000
Message-ID: <20201125014514.55562-4-aiyutao@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201125014514.55562-1-aiyutao@huawei.com>
References: <20201125014514.55562-1-aiyutao@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=aiyutao@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, aiyutao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Delete '#' and use '0x' prefix instead

Signed-off-by: Yutao Ai <aiyutao@huawei.com>
---
 monitor/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index 7588f12053..2eb563f6f3 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -910,7 +910,7 @@ static void hmp_ioport_read(Monitor *mon, const QDict *qdict)
         suffix = 'l';
         break;
     }
-    monitor_printf(mon, "port%c[0x%04x] = %#0*x\n",
+    monitor_printf(mon, "port%c[0x%04x] = 0x%0*x\n",
                    suffix, addr, size * 2, val);
 }
 
-- 
2.19.1


