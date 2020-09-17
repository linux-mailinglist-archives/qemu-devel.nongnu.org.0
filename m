Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B9026D571
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 09:59:13 +0200 (CEST)
Received: from localhost ([::1]:41954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIoox-0005FD-Vb
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 03:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kIohL-0004i7-0b; Thu, 17 Sep 2020 03:51:19 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:52174 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kIohH-0005LP-Da; Thu, 17 Sep 2020 03:51:18 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 36FBE719311A37E64844;
 Thu, 17 Sep 2020 15:51:09 +0800 (CST)
Received: from localhost (10.174.187.87) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 15:50:58 +0800
From: zhaolichang <zhaolichang@huawei.com>
To: <qemu-trivial@nongnu.org>
Subject: [PATCH V3 01/10] qemu/: fix some comment spelling errors
Date: Thu, 17 Sep 2020 15:50:20 +0800
Message-ID: <20200917075029.313-2-zhaolichang@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200917075029.313-1-zhaolichang@huawei.com>
References: <20200917075029.313-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.87]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 03:51:09
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
Cc: zhaolichang <zhaolichang@huawei.com>, Alex Bennee <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found that there are many spelling errors in the comments of qemu,
so I used the spellcheck tool to check the spelling errors
and finally found some spelling errors in the folder.

Signed-off-by: zhaolichang <zhaolichang@huawei.com>
Reviewed-by: Alex Bennee <alex.bennee@linaro.org>
---
 Changelog                   | 2 +-
 accel/tcg/user-exec.c       | 2 +-
 audio/audio.c               | 2 +-
 block.c                     | 2 +-
 configure                   | 2 +-
 fsdev/virtfs-proxy-helper.c | 2 +-
 hmp-commands.hx             | 2 +-
 libdecnumber/decNumber.c    | 2 +-
 qemu-img.c                  | 2 +-
 qobject/qdict.c             | 2 +-
 scsi/pr-manager-helper.c    | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Changelog b/Changelog
index 4a90bb9e8b..f7e178ccc0 100644
--- a/Changelog
+++ b/Changelog
@@ -241,7 +241,7 @@ version 0.8.0:
 version 0.7.2:
 
   - x86_64 fixes (Win2000 and Linux 2.6 boot in 32 bit)
-  - merge self modifying code handling in dirty ram page mecanism.
+  - merge self modifying code handling in dirty ram page mechanism.
   - MIPS fixes (Ralf Baechle)
   - better user net performances
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index bb039eb32d..5c96819ded 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -88,7 +88,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
          * use that value directly.  Within cpu_restore_state_from_tb, we
          * assume PC comes from GETPC(), as used by the helper functions,
          * so we adjust the address by -GETPC_ADJ to form an address that
-         * is within the call insn, so that the address does not accidentially
+         * is within the call insn, so that the address does not accidentally
          * match the beginning of the next guest insn.  However, when the
          * pc comes from the signal frame it points to the actual faulting
          * host memory insn and not the return from a call insn.
diff --git a/audio/audio.c b/audio/audio.c
index ce8c6dec5f..1a68cfaafb 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1674,7 +1674,7 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
         head = audio_handle_legacy_opts();
         /*
          * In case of legacy initialization, all Audiodevs in the list will have
-         * the same configuration (except the driver), so it does't matter which
+         * the same configuration (except the driver), so it doesn't matter which
          * one we chose.  We need an Audiodev to set up AudioState before we can
          * init a driver.  Also note that dev at this point is still in the
          * list.
diff --git a/block.c b/block.c
index 9538af4884..11ab55f80b 100644
--- a/block.c
+++ b/block.c
@@ -2602,7 +2602,7 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
 
 /*
  * Updates @child to change its reference to point to @new_bs, including
- * checking and applying the necessary permisson updates both to the old node
+ * checking and applying the necessary permission updates both to the old node
  * and to @new_bs.
  *
  * NULL is passed as @new_bs for removing the reference before freeing @child.
diff --git a/configure b/configure
index ce27eafb0a..c74d79bfbc 100755
--- a/configure
+++ b/configure
@@ -3411,7 +3411,7 @@ EOF
     xfs="yes"
   else
     if test "$xfs" = "yes" ; then
-      feature_not_found "xfs" "Instal xfsprogs/xfslibs devel"
+      feature_not_found "xfs" "Install xfsprogs/xfslibs devel"
     fi
     xfs=no
   fi
diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index de061a8a0e..15c0e79b06 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -518,7 +518,7 @@ static void statfs_to_prstatfs(ProxyStatFS *pr_stfs, struct statfs *stfs)
 
 /*
  * Gets stat/statfs information and packs in out_iovec structure
- * on success returns number of bytes packed in out_iovec struture
+ * on success returns number of bytes packed in out_iovec structure
  * otherwise returns -errno
  */
 static int do_stat(int type, struct iovec *iovec, struct iovec *out_iovec)
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 60f395c276..27c4bbe0f2 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1267,7 +1267,7 @@ ERST
     },
 SRST
 ``drive_backup``
-  Start a point-in-time copy of a block device to a specificed target.
+  Start a point-in-time copy of a block device to a specified target.
 ERST
 
     {
diff --git a/libdecnumber/decNumber.c b/libdecnumber/decNumber.c
index 8c197023f4..1ffe458ad8 100644
--- a/libdecnumber/decNumber.c
+++ b/libdecnumber/decNumber.c
@@ -5626,7 +5626,7 @@ static const uShort LNnn[90] = {
 /*    would certainly save at least one if it were made ten times     */
 /*    bigger, too (for truncated fractions 0.100 through 0.999).      */
 /*    However, for most practical evaluations, at least four or five  */
-/*    iterations will be neede -- so this would only speed up by      */
+/*    iterations will be needed -- so this would only speed up by      */
 /*    20-25% and that probably does not justify increasing the table  */
 /*    size.							      */
 /*								      */
diff --git a/qemu-img.c b/qemu-img.c
index 1d8c5cd778..3b7700c780 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1188,7 +1188,7 @@ static int64_t find_nonzero(const uint8_t *buf, int64_t n)
  * 'pnum' is set to the number of sectors (including and immediately following
  * the first one) that are known to be in the same allocated/unallocated state.
  * The function will try to align the end offset to alignment boundaries so
- * that the request will at least end aligned and consequtive requests will
+ * that the request will at least end aligned and consecutive requests will
  * also start at an aligned offset.
  */
 static int is_allocated_sectors(const uint8_t *buf, int n, int *pnum,
diff --git a/qobject/qdict.c b/qobject/qdict.c
index 526de54ceb..1079bd3f6f 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -33,7 +33,7 @@ QDict *qdict_new(void)
 }
 
 /**
- * tdb_hash(): based on the hash agorithm from gdbm, via tdb
+ * tdb_hash(): based on the hash algorithm from gdbm, via tdb
  * (from module-init-tools)
  */
 static unsigned int tdb_hash(const char *name)
diff --git a/scsi/pr-manager-helper.c b/scsi/pr-manager-helper.c
index d735b1e7f6..685ce7f92d 100644
--- a/scsi/pr-manager-helper.c
+++ b/scsi/pr-manager-helper.c
@@ -127,7 +127,7 @@ static int pr_manager_helper_initialize(PRManagerHelper *pr_mgr,
     qio_channel_set_delay(QIO_CHANNEL(sioc), false);
     pr_mgr->ioc = QIO_CHANNEL(sioc);
 
-    /* A simple feature negotation protocol, even though there is
+    /* A simple feature negotiation protocol, even though there is
      * no optional feature right now.
      */
     r = pr_manager_helper_read(pr_mgr, &flags, sizeof(flags), errp);
-- 
2.26.2.windows.1


