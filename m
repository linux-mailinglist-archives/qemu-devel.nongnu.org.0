Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B79293393
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 05:18:50 +0200 (CEST)
Received: from localhost ([::1]:55256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUiAj-0007vT-Uk
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 23:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kUi4K-0000Jw-1G; Mon, 19 Oct 2020 23:12:12 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5261 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kUi4H-0005EH-8L; Mon, 19 Oct 2020 23:12:11 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DE48069E624F245234AF;
 Tue, 20 Oct 2020 11:12:04 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 11:11:55 +0800
From: Bihong Yu <yubihong@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 5/8] migration: Add braces {} for if statement
Date: Tue, 20 Oct 2020 11:10:45 +0800
Message-ID: <1603163448-27122-6-git-send-email-yubihong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 22:24:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: yubihong@huawei.com, zhengchuan@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com, armbru@redhat.com, alex.chen@huawei.com,
 wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Bihong Yu <yubihong@huawei.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 0aea78f..09178cc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -101,14 +101,16 @@ static struct {
 
 static void XBZRLE_cache_lock(void)
 {
-    if (migrate_use_xbzrle())
+    if (migrate_use_xbzrle()) {
         qemu_mutex_lock(&XBZRLE.lock);
+    }
 }
 
 static void XBZRLE_cache_unlock(void)
 {
-    if (migrate_use_xbzrle())
+    if (migrate_use_xbzrle()) {
         qemu_mutex_unlock(&XBZRLE.lock);
+    }
 }
 
 /**
-- 
1.8.3.1


