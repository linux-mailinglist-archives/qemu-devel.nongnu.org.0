Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7680D28A78D
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 15:42:07 +0200 (CEST)
Received: from localhost ([::1]:47720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRbby-0001fP-Fv
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 09:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRXv5-00019i-VB; Sun, 11 Oct 2020 05:45:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5169 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRXv1-0007P1-Pa; Sun, 11 Oct 2020 05:45:35 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7E54E2BF15CC7CE11937;
 Sun, 11 Oct 2020 17:45:12 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Sun, 11 Oct 2020
 17:45:03 +0800
From: Bihong Yu <yubihong@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v1 2/8] migration: Don't use '#' flag of printf format
Date: Sun, 11 Oct 2020 18:17:03 +0800
Message-ID: <1602411429-12043-3-git-send-email-yubihong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602411429-12043-1-git-send-email-yubihong@huawei.com>
References: <1602411429-12043-1-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 05:45:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 11 Oct 2020 09:36:15 -0400
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
Cc: alex.chen@huawei.com, zhengchuan@huawei.com, wanghao232@huawei.com,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by:Bihong Yu <yubihong@huawei.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Bihong Yu <yubihong@huawei.com>
---
 migration/block.c | 2 +-
 migration/ram.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 4b8576b..399dfb8 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -998,7 +998,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
                    (addr == 100) ? '\n' : '\r');
             fflush(stdout);
         } else if (!(flags & BLK_MIG_FLAG_EOS)) {
-            fprintf(stderr, "Unknown block migration flags: %#x\n", flags);
+            fprintf(stderr, "Unknown block migration flags: %0x\n", flags);
             return -EINVAL;
         }
         ret = qemu_file_get_error(f);
diff --git a/migration/ram.c b/migration/ram.c
index 433489d..59bdd15 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3298,7 +3298,7 @@ static int ram_load_postcopy(QEMUFile *f)
             multifd_recv_sync_main();
             break;
         default:
-            error_report("Unknown combination of migration flags: %#x"
+            error_report("Unknown combination of migration flags: %0x"
                          " (postcopy mode)", flags);
             ret = -EINVAL;
             break;
@@ -3576,7 +3576,7 @@ static int ram_load_precopy(QEMUFile *f)
             if (flags & RAM_SAVE_FLAG_HOOK) {
                 ram_control_load_hook(f, RAM_CONTROL_HOOK, NULL);
             } else {
-                error_report("Unknown combination of migration flags: %#x",
+                error_report("Unknown combination of migration flags: %0x",
                              flags);
                 ret = -EINVAL;
             }
-- 
1.8.3.1


