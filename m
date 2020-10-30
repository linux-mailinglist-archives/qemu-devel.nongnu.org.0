Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD84129FC41
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 04:43:58 +0100 (CET)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYLKX-0006bG-An
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 23:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kYLJS-00065N-ML
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 23:42:50 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kYLJO-0006Qf-LV
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 23:42:49 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CMp6M2hqCz15MQd;
 Fri, 30 Oct 2020 11:42:35 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
 11:42:25 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH] migration/dirtyrate: simplify inlcudes in dirtyrate.c
Date: Fri, 30 Oct 2020 11:58:01 +0800
Message-ID: <1604030281-112946-1-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 20:41:14
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove redundant blank line which is left by Commit 662770af7c6e8c,
also take this opportunity to remove redundant includes in dirtyrate.c.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/dirtyrate.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 8f728d2..ccb9814 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -11,17 +11,12 @@
  */
 
 #include "qemu/osdep.h"
-
 #include <zlib.h>
 #include "qapi/error.h"
 #include "cpu.h"
-#include "qemu/config-file.h"
-#include "exec/memory.h"
 #include "exec/ramblock.h"
-#include "exec/target_page.h"
 #include "qemu/rcu_queue.h"
 #include "qapi/qapi-commands-migration.h"
-#include "migration.h"
 #include "ram.h"
 #include "trace.h"
 #include "dirtyrate.h"
-- 
1.8.3.1


