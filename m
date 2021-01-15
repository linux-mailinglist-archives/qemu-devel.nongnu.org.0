Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D99D2F714D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 04:59:04 +0100 (CET)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0GGN-00086Y-Ey
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 22:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GEk-00077A-1e
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:57:22 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GEi-0004rk-1v
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:57:21 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DH6mm3ydlzj6nc;
 Fri, 15 Jan 2021 11:56:24 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Fri, 15 Jan 2021 11:57:07 +0800
Subject: [PATCH v2 3/5] softmmu: don't use '#' flag of printf format ('%#') in
 format strings
From: chaihaoyu <chaihaoyu1@huawei.com>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Message-ID: <6cfe1902-1de6-43ca-c448-ad8c650f2c61@huawei.com>
Date: Fri, 15 Jan 2021 11:57:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=chaihaoyu1@huawei.com;
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
Cc: alex.chen@huawei.com, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error messages found by checkpatch.pl:
don't use '#' flag of printf format ('%#') in format strings

Signed-off-by: Haoyu Chai <chaihaoyu1@huawei.com>

---
 softmmu/device_tree.c | 2 +-
 softmmu/runstate.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index b9a3ddc518..f1f4fd6f0d 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -367,7 +367,7 @@ int qemu_fdt_setprop_cell(void *fdt, const char *node_path,

     r = fdt_setprop_cell(fdt, findnode_nofail(fdt, node_path), property, val);
     if (r < 0) {
-        error_report("%s: Couldn't set %s/%s = %#08x: %s", __func__,
+        error_report("%s: Couldn't set %s/%s = 0x%08x: %s", __func__,
                      node_path, property, val, fdt_strerror(r));
         exit(1);
     }
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 636aab0add..87ce18282b 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -490,8 +490,8 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)

     if (info) {
         if (info->type == GUEST_PANIC_INFORMATION_TYPE_HYPER_V) {
-            qemu_log_mask(LOG_GUEST_ERROR, "\nHV crash parameters: (%#"PRIx64
-                          " %#"PRIx64" %#"PRIx64" %#"PRIx64" %#"PRIx64")\n",
+            qemu_log_mask(LOG_GUEST_ERROR, "\nHV crash parameters: (0x%"PRIx64
+                          " 0x%"PRIx64" 0x%"PRIx64" 0x%"PRIx64" 0x%"PRIx64")\n",
                           info->u.hyper_v.arg1,
                           info->u.hyper_v.arg2,
                           info->u.hyper_v.arg3,
-- 
2.29.1.59.gf9b6481aed


