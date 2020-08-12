Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F13242A8E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 15:44:44 +0200 (CEST)
Received: from localhost ([::1]:54384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5r3b-0002E7-5q
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 09:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1k5noF-0007n5-1E; Wed, 12 Aug 2020 06:16:40 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:58420 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1k5noC-0002yq-Kq; Wed, 12 Aug 2020 06:16:38 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BF4864855CED54BD9A35;
 Wed, 12 Aug 2020 18:16:33 +0800 (CST)
Received: from localhost (10.174.187.253) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Wed, 12 Aug 2020
 18:16:24 +0800
From: zhaolichang <zhaolichang@huawei.com>
To: <qemu-trivial@nongnu.org>
Subject: [PATCH RFC 01/10] qemu/: fix some comment spelling errors
Date: Wed, 12 Aug 2020 18:14:51 +0800
Message-ID: <20200812101500.2066-2-zhaolichang@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200812101500.2066-1-zhaolichang@huawei.com>
References: <20200812101500.2066-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.253]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 06:15:29
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Aug 2020 09:40:49 -0400
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
Cc: zhaolichang <zhaolichang@huawei.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found that there are many spelling errors in the comments of qemu,
so I used the spellcheck tool to check the spelling errors
and finally found some spelling errors in the folder.

Signed-off-by: zhaolichang <zhaolichang@huawei.com>
---
 Changelog                   | 2 +-
 accel/tcg/user-exec.c       | 2 +-
 audio/audio.c               | 2 +-
 block.c                     | 2 +-
 configure                   | 2 +-
 fsdev/virtfs-proxy-helper.c | 2 +-
 gdbstub.c                   | 2 +-
 hmp-commands.hx             | 2 +-
 libdecnumber/decNumber.c    | 2 +-
 qemu-img.c                  | 2 +-
 qobject/qdict.c             | 2 +-
 rules.mak                   | 2 +-
 scsi/pr-manager-helper.c    | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Changelog b/Changelog
index 4a90bb9..f7e178c 100644
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
index d8b027f..d1b3073 100644
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
index ce8c6de..1a68cfa 100644
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
index d9ac0e0..ba03eaf 100644
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
index 2acc4d1..e34ef0c 100644
--- a/configure
+++ b/configure
@@ -3592,7 +3592,7 @@ EOF
     xfs="yes"
   else
     if test "$xfs" = "yes" ; then
-      feature_not_found "xfs" "Instal xfsprogs/xfslibs devel"
+      feature_not_found "xfs" "Install xfsprogs/xfslibs devel"
     fi
     xfs=no
   fi
diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index de061a8..15c0e79 100644
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
diff --git a/gdbstub.c b/gdbstub.c
index f3a318c..bbe66b5 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -698,7 +698,7 @@ static uint32_t gdb_get_cpu_pid(CPUState *cpu)
 {
     /* TODO: In user mode, we should use the task state PID */
     if (cpu->cluster_index == UNASSIGNED_CLUSTER_INDEX) {
-        /* Return the default process' PID */
+        /* Return the default process's PID */
         int index = gdbserver_state.process_num - 1;
         return gdbserver_state.processes[index].pid;
     }
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 60f395c..27c4bbe 100644
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
index 8c19702..1ffe458 100644
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
index 5308773..26369b8 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1187,7 +1187,7 @@ static int64_t find_nonzero(const uint8_t *buf, int64_t n)
  * 'pnum' is set to the number of sectors (including and immediately following
  * the first one) that are known to be in the same allocated/unallocated state.
  * The function will try to align the end offset to alignment boundaries so
- * that the request will at least end aligned and consequtive requests will
+ * that the request will at least end aligned and consecutive requests will
  * also start at an aligned offset.
  */
 static int is_allocated_sectors(const uint8_t *buf, int n, int *pnum,
diff --git a/qobject/qdict.c b/qobject/qdict.c
index 526de54..1079bd3 100644
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
diff --git a/rules.mak b/rules.mak
index 694865b..07f0b4f 100644
--- a/rules.mak
+++ b/rules.mak
@@ -51,7 +51,7 @@ undefined-symbols = $(call find-symbols,$1,awk '$$2=="U"{print $$1}')
 # linking executables that will load them. So we can look up symbol reference
 # in LINK.
 #
-# This is necessary because the exectuable itself may not use the function, in
+# This is necessary because the executable itself may not use the function, in
 # which case the function would not be linked in. Then the DSO loading will
 # fail because of the missing symbol.
 process-archive-undefs = $(filter-out %.a %.mo,$1) \
diff --git a/scsi/pr-manager-helper.c b/scsi/pr-manager-helper.c
index 5acccfb..c16aae4 100644
--- a/scsi/pr-manager-helper.c
+++ b/scsi/pr-manager-helper.c
@@ -126,7 +126,7 @@ static int pr_manager_helper_initialize(PRManagerHelper *pr_mgr,
     qio_channel_set_delay(QIO_CHANNEL(sioc), false);
     pr_mgr->ioc = QIO_CHANNEL(sioc);
 
-    /* A simple feature negotation protocol, even though there is
+    /* A simple feature negotiation protocol, even though there is
      * no optional feature right now.
      */
     r = pr_manager_helper_read(pr_mgr, &flags, sizeof(flags), errp);
-- 
2.26.2.windows.1



