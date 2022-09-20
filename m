Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29E25BE0C3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 10:52:29 +0200 (CEST)
Received: from localhost ([::1]:56138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaYzU-0001zp-Iw
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 04:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <281773481@qq.com>) id 1oaW7P-0007yq-VG
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 01:48:33 -0400
Received: from out203-205-251-82.mail.qq.com ([203.205.251.82]:41807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <281773481@qq.com>) id 1oaW7J-0000FE-Eu
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 01:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1663652891; bh=N+t0d6Nvpec5x8VcM1G94bPh3CB8QeK90Y3GUa487Gk=;
 h=From:To:Cc:Subject:Date;
 b=lWJmQEcKJn0X8gtiUnKUihcth9OthonWm+2E747/Xo1Ca7sw9DXOlf/T2mbCjQUYl
 zTQf3i0FyAA8w3BiP+kws0OU7m+I8MbVNw4J1JomE8kDDSUg7oOdlDQpUFc5wp3s2i
 bk9ei+Dn+TlNFe8D3rJeq3wMbv0EhqW28MX0SbUQ=
Received: from lihonglei0300.home.langchao.com ([117.160.246.157])
 by newxmesmtplogicsvrszc14.qq.com (NewEsmtp) with SMTP
 id C05B1EB9; Tue, 20 Sep 2022 13:48:05 +0800
X-QQ-mid: xmsmtpt1663652885t3sq52kyq
Message-ID: <tencent_D664D92C94A87E015A59B4A93C16EB1EFC0A@qq.com>
X-QQ-XMAILINFO: OdIVOfqOaVcr5YWLyNdDOWeSlP/ie9IJHRNoQOI6/Z6PlURhv+ypvs+ZXMDmIe
 dhh83W6hcDCf3TP8VgsPliF3uFRUivEHx8XH+iNZ/obOlEHaLy3mD3y+HRGCk8QzMHWJ5LQ2eQ5f
 TJOs4//JTde1uNEX4u2ma5taO/js5S3QGVPN3K+HZUtQiUkt3VHAHs7BePaxAHjuIUVqk+r2alft
 grYFkcvF83Wf9HmxDz1Qtyx6G5BnV24soe4WBvfHFVlRtUQlK+uRc+6AFUVqKKuSA2Fw7osJdrkG
 TXiIIJCujCM1zcKQj9Et5dwqRP0xsvKu6sRZXV6ZcMqje7aGCYjg2/m+T0lGpNELLNhrPdlOp2Q+
 xV+Ba4qQsPPOiHEvtam8mhpjwmsQ0yXoGJNaMPbF0hTnGNuwJReY9KRumIqJ9lfgdtpOsTsr+MVD
 6JpH8PCPDXka9Ddbm2H2dfgu599pRs5Vw055bAT3hVWcMvImZlEAtBZReQFqaCjHz6xcJ58zcO5i
 d7bYxvXQPer97014JD5OYC7HeHmEaFv0WXUGekIwRMH+C8HhpDUVUUfkbzTiOIWFQAW1Cqoz4PwY
 QEGG2osWTVVhPFqMZLQVxGDK4sVZo+TnB0SPg1f/51a5pcyyJ9WNJ0Xv2nfXDlUID9RIfjAR8xS1
 F+C2FuJKgW8JTfaJNa5uJUny3mzwHMpdkGJJ91li6jFTxSWqaEjU/2Jjet9kzY9NzuQVRonbp9gh
 FuM54BXkvjbMNUFxAtqVYLpcXRyxbmh0o+AP1jlTQ33pnyY+Kgtp6HLApiPgm/ZSRbVMR/0sU8rI
 YXMnm6ep3kzX9EfUh5EO3cBhUCU0t+f4GMm4fCHi7rylUexfzZc/0spWqDOQpAqIhP7GlKl5FU0M
 l4e+C1745JJreFFU3tH+0XKuugTSXPUDTS1P1iJNsJx+GKxPQpqbYcMUPrTTaVwvLyP4T8dXQvE2
 NVRm62EX7lARMiBezA5g==
From: Hongleilee <281773481@qq.com>
To: qemu-devel@nongnu.org
Cc: vsementsov@yandex-team.ru, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, richard.henderson@linaro.org,
 Hongleilee <281773481@qq.com>
Subject: [PATCH] This patch is to solve the problem that bitmaps in memory are
 lost after dirve-mirror is completed.
Date: Tue, 20 Sep 2022 13:47:52 +0800
X-OQ-MSGID: <20220920054752.1167-1-281773481@qq.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.205.251.82; envelope-from=281773481@qq.com;
 helo=out203-205-251-82.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 20 Sep 2022 04:42:26 -0400
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

Signed-off-by: Hongleilee <281773481@qq.com>
---
 block/mirror.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/block/mirror.c b/block/mirror.c
index 3c4ab1159d..86d2cd6b67 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -24,6 +24,7 @@
 #include "qemu/ratelimit.h"
 #include "qemu/bitmap.h"
 #include "qemu/memalign.h"
+#include "qemu/queue.h"
 
 #define MAX_IN_FLIGHT 16
 #define MAX_IO_BYTES (1 << 20) /* 1 Mb */
@@ -654,7 +655,10 @@ static int mirror_exit_common(Job *job)
     BlockDriverState *target_bs;
     BlockDriverState *mirror_top_bs;
     Error *local_err = NULL;
+    BdrvDirtyBitmap *bm, *next, *bt_mp;
+    HBitmap *hb;
     bool abort = job->ret < 0;
+    int i, j;
     int ret = 0;
 
     if (s->prepared) {
@@ -671,6 +675,31 @@ static int mirror_exit_common(Job *job)
         bdrv_unfreeze_backing_chain(mirror_top_bs, target_bs);
     }
 
+    QLIST_INIT(&target_bs->dirty_bitmaps);
+    QLIST_FOREACH_SAFE(bm, &src->dirty_bitmaps, list, next) {
+        if (bm->name) {
+            bt_mp = g_new0(BdrvDirtyBitmap, 1);
+            hb = g_new0(struct HBitmap, 1);
+            hb->count = bm->bitmap->count;
+            hb->size = bm->bitmap->size;
+            hb->granularity = bm->bitmap->granularity;
+            for (i = 0; i < HBITMAP_LEVELS; i++) {
+                hb->sizes[i] = bm->bitmap->sizes[i];
+                hb->levels[i] = g_new0(unsigned long, bm->bitmap->sizes[i]);
+                for (j = 0; j < bm->bitmap->sizes[i]; j++) {
+                    hb->levels[i][j] = bm->bitmap->levels[i][j];
+                }
+            }
+            bt_mp->mutex = &target_bs->dirty_bitmap_mutex;
+            bt_mp->bitmap = hb;
+            bt_mp->size = bm->size;
+            bt_mp->name = g_strdup(bm->name);
+            qemu_mutex_lock(&target_bs->dirty_bitmap_mutex);
+            QLIST_INSERT_HEAD(&target_bs->dirty_bitmaps, bt_mp, list);
+            qemu_mutex_unlock(&target_bs->dirty_bitmap_mutex);
+        }
+    }
+
     bdrv_release_dirty_bitmap(s->dirty_bitmap);
 
     /* Make sure that the source BDS doesn't go away during bdrv_replace_node,
-- 
2.37.3.windows.1


