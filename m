Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340972E34C7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:37:08 +0100 (CET)
Received: from localhost ([::1]:59228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktn5X-0007rP-6b
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1ktmvY-0000EZ-JI; Mon, 28 Dec 2020 02:26:48 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1ktmvI-0007l6-DD; Mon, 28 Dec 2020 02:26:48 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D48GL6fm3z15kqH;
 Mon, 28 Dec 2020 15:25:30 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Mon, 28 Dec 2020
 15:26:09 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <armbru@redhat.com>
Subject: [PATCH 4/4] qobject: braces {} are necessary for all arms of this
 statement
Date: Mon, 28 Dec 2020 15:11:29 +0800
Message-ID: <20201228071129.24563-5-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20201228071129.24563-1-zhanghan64@huawei.com>
References: <20201228071129.24563-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhanghan64@huawei.com; helo=szxga04-in.huawei.com
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add braces {} for arms of if/for statement

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 qobject/qdict.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qobject/qdict.c b/qobject/qdict.c
index 05ec950e05..0a49b787ab 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -42,8 +42,9 @@ static unsigned int tdb_hash(const char *name)
     unsigned   i;      /* Used to cycle through random values. */
 
     /* Set the initial value from the key size. */
-    for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++)
+    for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++) {
         value = (value + (((const unsigned char *)name)[i] << (i * 5 % 24)));
+    }
 
     return (1103515243 * value + 12345);
 }
@@ -92,8 +93,9 @@ static QDictEntry *qdict_find(const QDict *qdict,
     QDictEntry *entry;
 
     QLIST_FOREACH(entry, &qdict->table[bucket], next)
-        if (!strcmp(entry->key, key))
+        if (!strcmp(entry->key, key)) {
             return entry;
+        }
 
     return NULL;
 }
-- 
2.29.1.59.gf9b6481aed


