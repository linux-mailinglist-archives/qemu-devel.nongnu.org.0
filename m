Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C13BC8A6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:47:32 +0200 (CEST)
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hfv-0002nb-S5
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m0hdm-0001Rl-68
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:45:18 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:30634
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1m0hdi-00088c-QA
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:45:17 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AXtl8aKz8O3QWd6E+dgqfKrPwxL1zdoMgy1kn?=
 =?us-ascii?q?xilNoRw8SKKlfqeV7ZAmPH7P+VEssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOgg?=
 =?us-ascii?q?LBR+sO0WKI+Vzd8kPFmdK1rZ0QEZSWFueAdmRSvILr5hWiCdY8zJ2i+KCsv+3X?=
 =?us-ascii?q?yHBgVmhRGthdxjY8GgCGCVd3WQUDIZI4EaCX7s1BqyHlVm8Qaq2AdwE4dtmGt9?=
 =?us-ascii?q?vWj4jnfBJDIxYm7TOFhTSu5KW/MzXw5GZ5bw9y?=
X-IronPort-AV: E=Sophos;i="5.83,328,1616428800"; d="scan'208";a="110706310"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jul 2021 17:45:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2C1924C369F6;
 Tue,  6 Jul 2021 17:45:05 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 6 Jul 2021 17:45:04 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 6 Jul 2021 17:45:04 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] misc: Remove redundant new line in perror()
Date: Tue, 6 Jul 2021 17:44:33 +0800
Message-ID: <20210706094433.1766952-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 2C1924C369F6.ACCE4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, dgilbert@redhat.com,
 Li Zhijian <lizhijian@cn.fujitsu.com>, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 2 +-
 softmmu/cpus.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 7fb9646f6ef..e99e2e16a73 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1133,7 +1133,7 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
                     IBV_ACCESS_REMOTE_WRITE
                     );
         if (!local->block[i].mr) {
-            perror("Failed to register local dest ram block!\n");
+            perror("Failed to register local dest ram block!");
             break;
         }
         rdma->total_registrations++;
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index c3caaeb26ec..071085f840b 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -325,7 +325,7 @@ static void sigbus_reraise(void)
         sigaddset(&set, SIGBUS);
         pthread_sigmask(SIG_UNBLOCK, &set, NULL);
     }
-    perror("Failed to re-raise SIGBUS!\n");
+    perror("Failed to re-raise SIGBUS!");
     abort();
 }
 
-- 
2.30.2




