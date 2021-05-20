Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF54B389FA2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:16:32 +0200 (CEST)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdr5-0005sQ-Vg
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ljdn6-0001u8-NR
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:12:24 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:9009
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1ljdn3-00024x-Ps
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:12:24 -0400
IronPort-Data: =?us-ascii?q?A9a23=3Ai3f9E699jmUpYCu6ht/2DrUDunyTJUtcMsCJ2f8?=
 =?us-ascii?q?bfWQNrUp2hT0GymUXWWqDPf2JMWD8c9EkaIu090JQvZbUnNMyQFdlrnsFo1Bi8?=
 =?us-ascii?q?5ScXYvDRqvT04J+FuWaFQQ/qZx2huDodKjYdVeB4Ef3WlTdhSMkj/jQG+OtULC?=
 =?us-ascii?q?s1h1ZHmeIdg9w0HqPpMZp2uaEsfDha++8kYuaT//3YTdJ6BYoWo4g0J9vnTs01?=
 =?us-ascii?q?BjEVJz0iXRlDRxDlAe2e3D4l/vzL4npR5fzatE88uJX24/+IL+FEmPxp3/BC/u?=
 =?us-ascii?q?ulPD1b08LXqXPewOJjxK6WYD72l4b+HN0if19aZLwam8O49mNt9Rw2tVMt525T?=
 =?us-ascii?q?y8nI6/NhP8AFRJfFkmSOIUfoO+aeSfn7JX7I0ruNiGEL+9VJFg7OJBd9utpDGV?=
 =?us-ascii?q?m8/seJzYQKBeZiIqezL26TuNhnNgLNsTnPIoD/HpnyFnxFOsnR4zOR6zi/9JU3?=
 =?us-ascii?q?D4swMtJGJ7ji2AxAdZ0RE2YJUQRZRFMU9Rj9NpET0LXK1VwwG95b4Jui4QL8DF?=
 =?us-ascii?q?M7Q=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Ad1lNga6CRLa+GqbXkwPXwCLXdLJyesId70hD?=
 =?us-ascii?q?6qhwISY1TiX+rbHIoB17726TtN9/YgBCpTntAsa9qBDnhPpICOsqTNWftWDd0Q?=
 =?us-ascii?q?PCRuwP0WKI+V3d8kPFmNK1rZ0QFpSWFueAd2RSvILr5hWiCdY8zJ2i+KCsv+3X?=
 =?us-ascii?q?yHBgVmhRGtldxjY8GgCGCVd3WQUDIZI4EaCX7s1BqyHlVm8Qaq2AdwI4dtmGt9?=
 =?us-ascii?q?vWj4jnfBJDIxYm7TOFhTSu5KW/MzXw5GZmbw9y?=
X-IronPort-AV: E=Sophos;i="5.82,313,1613404800"; d="scan'208";a="108507051"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 May 2021 16:12:18 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 2E3F3499D6C0;
 Thu, 20 May 2021 16:12:15 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 20 May 2021 16:12:15 +0800
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 20 May 2021 16:12:14 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 20 May 2021 16:12:15 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH RESEND 1/4] migration/rdma: cleanup rmda in
 rdma_start_incoming_migration error path
Date: Thu, 20 May 2021 16:11:45 +0800
Message-ID: <20210520081148.17001-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 2E3F3499D6C0.ADFC8
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the error path after calling qemu_rdma_dest_init() should do rdma cleanup

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 41726cc74a..7e7595faab 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -4040,7 +4040,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
 
     if (ret) {
         ERROR(errp, "listening on socket!");
-        goto err;
+        goto cleanup_rdma;
     }
 
     trace_rdma_start_incoming_migration_after_rdma_listen();
@@ -4050,7 +4050,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
         rdma_return_path = qemu_rdma_data_init(host_port, &local_err);
 
         if (rdma_return_path == NULL) {
-            goto err;
+            goto cleanup_rdma;
         }
 
         qemu_rdma_return_path_dest_init(rdma_return_path, rdma);
@@ -4059,6 +4059,9 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
     qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
                         NULL, (void *)(intptr_t)rdma);
     return;
+
+cleanup_rdma:
+    qemu_rdma_cleanup(rdma);
 err:
     error_propagate(errp, local_err);
     if (rdma) {
-- 
2.30.2




