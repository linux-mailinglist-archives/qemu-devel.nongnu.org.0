Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6526510A5E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:23:20 +0200 (CEST)
Received: from localhost ([::1]:35150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRiR-0006ZR-Ts
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRar-0008KQ-Qm
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRal-0007fW-Ig
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0kdS/PlgVoJjAY8fV6yb86LVcxTW+6mEUVLNEv/k+k=;
 b=RfwUPh7XMu0xHLSWYBsV2/hlT0dDf6DK7/IW7A0f50bLBSWR6q3m/TboXepUemC1Dvi9G8
 L8ocuMBdGOrBw9h4iTGXTp2L5rOARwzSx/UAkbEVj+HJPeasMczh671SoAGdcBCq8nqZrt
 9asrp8CUZgwSyShCpnzF52blhXdXeh0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-lYlJOHnoOb2ilq1_ACQ7Cg-1; Tue, 26 Apr 2022 16:15:19 -0400
X-MC-Unique: lYlJOHnoOb2ilq1_ACQ7Cg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 103DD1C0BF03;
 Tue, 26 Apr 2022 20:15:19 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BF6755620D;
 Tue, 26 Apr 2022 20:15:18 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] qapi: rename BlockDirtyBitmapMergeSource to
 BlockDirtyBitmapOrStr
Date: Tue, 26 Apr 2022 15:15:02 -0500
Message-Id: <20220426201514.170410-2-eblake@redhat.com>
In-Reply-To: <20220426201514.170410-1-eblake@redhat.com>
References: <20220426201514.170410-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 "open list:Dirty Bitmaps" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

Rename the type to be reused. Old name is "what is it for". To be
natively reused for other needs, let's name it exactly "what is it".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Message-Id: <20220314213226.362217-2-v.sementsov-og@mail.ru>
[eblake: Adjust S-o-b to Vladimir's new email, with permission]
Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-core.json                   | 6 +++---
 include/block/block_int-global-state.h | 2 +-
 block/monitor/bitmap-qmp-cmds.c        | 6 +++---
 qemu-img.c                             | 8 ++++----
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index beeb91952af3..b66494e8c55c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2079,7 +2079,7 @@
             '*persistent': 'bool', '*disabled': 'bool' } }

 ##
-# @BlockDirtyBitmapMergeSource:
+# @BlockDirtyBitmapOrStr:
 #
 # @local: name of the bitmap, attached to the same node as target bitmap.
 #
@@ -2087,7 +2087,7 @@
 #
 # Since: 4.1
 ##
-{ 'alternate': 'BlockDirtyBitmapMergeSource',
+{ 'alternate': 'BlockDirtyBitmapOrStr',
   'data': { 'local': 'str',
             'external': 'BlockDirtyBitmap' } }

@@ -2106,7 +2106,7 @@
 ##
 { 'struct': 'BlockDirtyBitmapMerge',
   'data': { 'node': 'str', 'target': 'str',
-            'bitmaps': ['BlockDirtyBitmapMergeSource'] } }
+            'bitmaps': ['BlockDirtyBitmapOrStr'] } }

 ##
 # @block-dirty-bitmap-add:
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index 0f21b0570b1b..8b2e95f5ff18 100644
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
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 8e35616c2e0d..2b677c4a2ff6 100644
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
diff --git a/qemu-img.c b/qemu-img.c
index 4c84134a1e64..4cf4d2423df8 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1623,16 +1623,16 @@ static void do_dirty_bitmap_merge(const char *dst_node, const char *dst_name,
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


