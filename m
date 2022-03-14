Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE44D8DE6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:09:54 +0100 (CET)
Received: from localhost ([::1]:43194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTr0q-0000NL-RZ
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:09:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTqyy-0007UO-MA; Mon, 14 Mar 2022 16:07:56 -0400
Received: from [2a02:6b8:0:801:2::101] (port=34608
 helo=forward101j.mail.yandex.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTqyt-0005zJ-0e; Mon, 14 Mar 2022 16:07:55 -0400
Received: from sas8-3863e163d292.qloud-c.yandex.net
 (sas8-3863e163d292.qloud-c.yandex.net
 [IPv6:2a02:6b8:c1b:290a:0:640:3863:e163])
 by forward101j.mail.yandex.net (Yandex) with ESMTP id D215669B5FAD;
 Mon, 14 Mar 2022 23:07:46 +0300 (MSK)
Received: from sas1-384d3eaa6677.qloud-c.yandex.net
 (sas1-384d3eaa6677.qloud-c.yandex.net [2a02:6b8:c14:3a29:0:640:384d:3eaa])
 by sas8-3863e163d292.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 OyG5T4MOZi-7kf8T2ul; Mon, 14 Mar 2022 23:07:46 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1647288466; bh=YrR5Ot4sGLRv2xF0QG/7/AmQPQxUzrU5g1+O24Gkg9Q=;
 h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
 b=WvaHVgZgbmLb1/d1zY+CFf6hb6Bji1ljVQ40k6T5rVj+wkUydkfNhLvC03un/dU+a
 PxEC4qjtjtDpknuB7fntVwbqaaW48Bf/kUkciV/kV1ZPimNDybmGb6t4Zi9/umc6yA
 Hzg9T22YRHnePnoPTSlMBYLLhon9+zscJxATwILU=
Authentication-Results: sas8-3863e163d292.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Received: by sas1-384d3eaa6677.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id C1cHglIHXL-7kGei3NK; Mon, 14 Mar 2022 23:07:46 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
To: qemu-block@nongnu.org
Subject: [PATCH 1/3] qapi: rename BlockDirtyBitmapMergeSource to
 BlockDirtyBitmapOrStr
Date: Mon, 14 Mar 2022 23:07:21 +0300
Message-Id: <20220314200723.356816-2-v.sementsov-og@ya.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314200723.356816-1-v.sementsov-og@ya.ru>
References: <20220314200723.356816-1-v.sementsov-og@ya.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a02:6b8:0:801:2::101
 (failed)
Received-SPF: pass client-ip=2a02:6b8:0:801:2::101;
 envelope-from=v.sementsov-og@ya.ru; helo=forward101j.mail.yandex.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Rename the type to be reused. Old name is "what is it for". To be
natively reused for other needs, let's name it exactly "what is it".

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
---
 block/monitor/bitmap-qmp-cmds.c        | 6 +++---
 include/block/block_int-global-state.h | 2 +-
 qapi/block-core.json                   | 6 +++---
 qemu-img.c                             | 8 ++++----
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 8e35616c2e..2b677c4a2f 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -257,12 +257,12 @@ void qmp_block_dirty_bitmap_disable(const char *node, const char *name,
 }
 
 BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
-                                          BlockDirtyBitmapMergeSourceList *bms,
+                                          BlockDirtyBitmapOrStrList *bms,
                                           HBitmap **backup, Error **errp)
 {
     BlockDriverState *bs;
     BdrvDirtyBitmap *dst, *src, *anon;
-    BlockDirtyBitmapMergeSourceList *lst;
+    BlockDirtyBitmapOrStrList *lst;
 
     GLOBAL_STATE_CODE();
 
@@ -317,7 +317,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
 }
 
 void qmp_block_dirty_bitmap_merge(const char *node, const char *target,
-                                  BlockDirtyBitmapMergeSourceList *bitmaps,
+                                  BlockDirtyBitmapOrStrList *bitmaps,
                                   Error **errp)
 {
     block_dirty_bitmap_merge(node, target, bitmaps, NULL, errp);
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index 0f21b0570b..8b2e95f5ff 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -262,7 +262,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_lookup(const char *node,
                                            BlockDriverState **pbs,
                                            Error **errp);
 BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
-                                          BlockDirtyBitmapMergeSourceList *bms,
+                                          BlockDirtyBitmapOrStrList *bms,
                                           HBitmap **backup, Error **errp);
 BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
                                            bool release,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index e89f2dfb5b..c0eacd66db 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2078,7 +2078,7 @@
             '*persistent': 'bool', '*disabled': 'bool' } }
 
 ##
-# @BlockDirtyBitmapMergeSource:
+# @BlockDirtyBitmapOrStr:
 #
 # @local: name of the bitmap, attached to the same node as target bitmap.
 #
@@ -2086,7 +2086,7 @@
 #
 # Since: 4.1
 ##
-{ 'alternate': 'BlockDirtyBitmapMergeSource',
+{ 'alternate': 'BlockDirtyBitmapOrStr',
   'data': { 'local': 'str',
             'external': 'BlockDirtyBitmap' } }
 
@@ -2105,7 +2105,7 @@
 ##
 { 'struct': 'BlockDirtyBitmapMerge',
   'data': { 'node': 'str', 'target': 'str',
-            'bitmaps': ['BlockDirtyBitmapMergeSource'] } }
+            'bitmaps': ['BlockDirtyBitmapOrStr'] } }
 
 ##
 # @block-dirty-bitmap-add:
diff --git a/qemu-img.c b/qemu-img.c
index 5dffb3e616..f853efe6fb 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1618,16 +1618,16 @@ static void do_dirty_bitmap_merge(const char *dst_node, const char *dst_name,
                                   const char *src_node, const char *src_name,
                                   Error **errp)
 {
-    BlockDirtyBitmapMergeSource *merge_src;
-    BlockDirtyBitmapMergeSourceList *list = NULL;
+    BlockDirtyBitmapOrStr *merge_src;
+    BlockDirtyBitmapOrStrList *list = NULL;
 
-    merge_src = g_new0(BlockDirtyBitmapMergeSource, 1);
+    merge_src = g_new0(BlockDirtyBitmapOrStr, 1);
     merge_src->type = QTYPE_QDICT;
     merge_src->u.external.node = g_strdup(src_node);
     merge_src->u.external.name = g_strdup(src_name);
     QAPI_LIST_PREPEND(list, merge_src);
     qmp_block_dirty_bitmap_merge(dst_node, dst_name, list, errp);
-    qapi_free_BlockDirtyBitmapMergeSourceList(list);
+    qapi_free_BlockDirtyBitmapOrStrList(list);
 }
 
 enum ImgConvertBlockStatus {
-- 
2.35.1


