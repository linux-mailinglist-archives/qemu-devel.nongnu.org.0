Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134BE48A64B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 04:29:48 +0100 (CET)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n77r0-0001QF-Op
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 22:29:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n77pt-00007f-Bt
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 22:28:38 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n77po-0000uz-M0
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 22:28:35 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JXx2W1cskz9s8T;
 Tue, 11 Jan 2022 11:27:15 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 11:28:21 +0800
To: <qemu-devel@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
CC: Richard Henderson <richard.henderson@linaro.org>, Andrew Jones
 <drjones@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH] softmmu/device_tree: Remove redundant pointer assignment
Date: Tue, 11 Jan 2022 11:27:58 +0800
Message-ID: <20220111032758.27804-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-devel@nongnu.org>

The pointer assignment "const char *p = path;" in function
qemu_fdt_add_path is unnecessary. Let's remove it and just
use the "path" passed in. No functional change.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
Based on: softmmu/device_tree: Silence compiler warning with --enable-sanitizers
https://patchew.org/QEMU/20220107133844.145039-1-thuth@redhat.com/
---
 softmmu/device_tree.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 9e96f5ecd5..8897c79ea4 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -556,7 +556,6 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
 int qemu_fdt_add_path(void *fdt, const char *path)
 {
     const char *name;
-    const char *p = path;
     int namelen, retval;
     int parent = 0;
 
@@ -565,9 +564,9 @@ int qemu_fdt_add_path(void *fdt, const char *path)
     }
 
     do {
-        name = p + 1;
-        p = strchr(name, '/');
-        namelen = p != NULL ? p - name : strlen(name);
+        name = path + 1;
+        path = strchr(name, '/');
+        namelen = path != NULL ? path - name : strlen(name);
 
         retval = fdt_subnode_offset_namelen(fdt, parent, name, namelen);
         if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
@@ -584,7 +583,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
         }
 
         parent = retval;
-    } while (p);
+    } while (path);
 
     return retval;
 }
-- 
2.27.0


