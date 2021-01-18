Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D79D2F97D3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:22:18 +0100 (CET)
Received: from localhost ([::1]:47392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KBN-0003sK-IL
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l1K9Y-0002mO-Qi
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:20:24 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l1K9X-0003Y6-0P
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:20:24 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DJwTF5dMWz15v7Y;
 Mon, 18 Jan 2021 10:19:13 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 18 Jan 2021 10:20:10 +0800
Subject: [PATCH V4 2/4] bsd-user: suspect code indent for conditional
 statements
References: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
To: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
From: shiliyang <shiliyang@huawei.com>
Message-ID: <ab18c75a-05f4-43f3-dbac-2c734201dc02@huawei.com>
Date: Mon, 18 Jan 2021 10:20:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=shiliyang@huawei.com;
 helo=szxga04-in.huawei.com
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
Cc: alex.chen@huawei.com, hunongda@huawei.com,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error style problems found by checkpatch.pl:
ERROR: suspect code indent for conditional statements

Signed-off-by: Liyang Shi <shiliyang@huawei.com>
---
 bsd-user/elfload.c |  2 +-
 bsd-user/mmap.c    | 25 +++++++++++++------------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 4d1a572534..d5cab25607 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -765,7 +765,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
         /* Now figure out which format our binary is */
         if ((N_MAGIC(interp_ex) != OMAGIC) && (N_MAGIC(interp_ex) != ZMAGIC) &&
                 (N_MAGIC(interp_ex) != QMAGIC)) {
-          interpreter_type = INTERPRETER_ELF;
+            interpreter_type = INTERPRETER_ELF;
         }

         if (interp_elf_ex.e_ident[0] != 0x7f ||
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 1b8c8382ca..785655f319 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -487,18 +487,19 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
        up to the targets page boundary.  */

     if ((qemu_real_host_page_size < qemu_host_page_size) && fd != -1) {
-       struct stat sb;
-
-       if (fstat (fd, &sb) == -1)
-           goto fail;
-
-       /* Are we trying to create a map beyond EOF?.  */
-       if (offset + len > sb.st_size) {
-           /* If so, truncate the file map at eof aligned with
-              the hosts real pagesize. Additional anonymous maps
-              will be created beyond EOF.  */
-           len = REAL_HOST_PAGE_ALIGN(sb.st_size - offset);
-       }
+        struct stat sb;
+
+        if (fstat(fd, &sb) == -1) {
+            goto fail;
+        }
+
+        /* Are we trying to create a map beyond EOF?.  */
+        if (offset + len > sb.st_size) {
+            /* If so, truncate the file map at eof aligned with
+               the hosts real pagesize. Additional anonymous maps
+               will be created beyond EOF.  */
+            len = REAL_HOST_PAGE_ALIGN(sb.st_size - offset);
+        }
     }

     if (!(flags & MAP_FIXED)) {
-- 
2.29.1.59.gf9b6481aed


