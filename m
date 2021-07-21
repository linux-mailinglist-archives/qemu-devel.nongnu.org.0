Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E339C3D0F69
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:23:10 +0200 (CEST)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CBp-0007Yb-U5
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhuguanghong@uniontech.com>)
 id 1m67r7-00066p-GA
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:45:29 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:38982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhuguanghong@uniontech.com>)
 id 1m67r0-0007IR-PP
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:45:27 -0400
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id 54769D5D1B;
 Wed, 21 Jul 2021 16:45:07 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P12363T139710748759808S1626857090345988_; 
 Wed, 21 Jul 2021 16:44:57 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <3773bd706ae5a95b58c25b740f463986>
X-RL-SENDER: zhuguanghong@uniontech.com
X-SENDER: zhuguanghong@uniontech.com
X-LOGIN-NAME: zhuguanghong@uniontech.com
X-FST-TO: pbonzini@redhat.com
X-RCPT-COUNT: 5
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: zhuguanghong <zhuguanghong@uniontech.com>
To: pbonzini@redhat.com,
	berrange@redhat.com,
	ehabkost@redhat.com
Subject: [PATCH] qom/object.c 'if (type_table == NULL)' statement is redundant
 , delete it.
Date: Wed, 21 Jul 2021 16:44:46 +0800
Message-Id: <20210721084446.26377-1-zhuguanghong@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=211.157.147.130;
 envelope-from=zhuguanghong@uniontech.com; helo=lucky1.263xmail.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 21 Jul 2021 09:19:24 -0400
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
Cc: zhuguanghong <zhuguanghong@uniontech.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: zhuguanghong <zhuguanghong@uniontech.com>
---
 qom/object.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 6a01d56546..c8f5481afe 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -78,9 +78,7 @@ static GHashTable *type_table_get(void)
 {
     static GHashTable *type_table;
 
-    if (type_table == NULL) {
-        type_table = g_hash_table_new(g_str_hash, g_str_equal);
-    }
+    type_table = g_hash_table_new(g_str_hash, g_str_equal);
 
     return type_table;
 }
-- 
2.20.1




