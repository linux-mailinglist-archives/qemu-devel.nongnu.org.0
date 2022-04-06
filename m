Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBAC4F6899
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:11:16 +0200 (CEST)
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncA7f-0003gU-Hk
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA5A-0000NS-Pj
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:43 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:37445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA57-0001vl-Ol
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:40 -0400
Received: by mail-lj1-x229.google.com with SMTP id bx37so4333860ljb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 11:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t6lsn4nW3rcF/M2cWGQSYle4tgbfFEygVPAUIGkb6Ik=;
 b=fuy7yht0WPSesHZesg4jFRv20FATiALL2yFY0b3wMNeSBO3QGBlgF7SIiIUryZEUEq
 0iq/7xn9Id+in8VxFlm13mWHl7Md1Lm7XT6o9+Lx0Ay1xpOnsnV6AFrz0mJipVAWEOP5
 Up8xshetbv0Yz259M3BmOWVVTPz4QMl7C20pxvPySw8aS1IVEppWWAx/VncQrMQQ5AB8
 0U0il8VYa6SacK6vmiwLhrm2TQby629kTKyapqygETPoAkcSIoYH3bxVKGg2rmPAQToS
 w0ulrd/K/wRDAT5zpFdAHX8Q6BsiwAhRByDZrEjJKQah2CFv9/wtF1A+ncFy5RaKdNaP
 Ixeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t6lsn4nW3rcF/M2cWGQSYle4tgbfFEygVPAUIGkb6Ik=;
 b=yvlefpJojpuxyJ47pudatFvB7k7zjiit6Yak6t5O4mHsCj5tG9MoSkKwJ1PZq5VU5d
 XvdTWJB6BzZEwz8VBXl9Wf3a1bya3aGLhY+BBab58bU+XcHTmGAZREIoLtGI8YDVWtG0
 SscgZQ889Zeh3Ql0xjTiSw/9aZ6EwBKfDZ6yevTeWJkQj5qzUzo0BgOsWv/qJUJxCo59
 18EH9yxsro9BV5hdGvzV+D9DctWx4shgStyq71jTxfCCPA0t2+4O4tA5pHeMAEohcq/I
 cOWjNR+3Y+1dbIt7ILIb3v0dmKVUfqSG7TMHk1DP55fmq537kWhkLCN+gTLuPiauXMHG
 5+iQ==
X-Gm-Message-State: AOAM533Uf0vJFxHXZZt+l3n7V4D6fikgBQXHDKUAQ2SYtDU+XpJ0A2v7
 76lHmslCbsT7oejSPBJsL+kfnA==
X-Google-Smtp-Source: ABdhPJw1Zl2bzjzWHsZhttOXmFE0aGVp8vA4I6h6wfcyep6fh22kX6406M/cYKkJZWbiy27G82VRbA==
X-Received: by 2002:a2e:a592:0:b0:24b:d8f:ae55 with SMTP id
 m18-20020a2ea592000000b0024b0d8fae55mr5970013ljp.460.1649268516059; 
 Wed, 06 Apr 2022 11:08:36 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 a20-20020a194f54000000b0044a9afab7e7sm1904321lfk.290.2022.04.06.11.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:08:35 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/7] block/copy-before-write: add on-cbw-error open
 parameter
Date: Wed,  6 Apr 2022 21:07:56 +0300
Message-Id: <20220406180801.374844-3-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406180801.374844-1-vsementsov@openvz.org>
References: <20220406180801.374844-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, behavior on copy-before-write operation failure is simple:
report error to the guest.

Let's implement alternative behavior: break the whole copy-before-write
process (and corresponding backup job or NBD client) but keep guest
working. It's needed if we consider guest stability as more important.

The realisation is simple: on copy-before-write failure we set
s->snapshot_ret and continue guest operations. s->snapshot_ret being
set will lead to all further snapshot API requests. Note that all
in-flight snapshot-API requests may still success: we do wait for them
on BREAK_SNAPSHOT-failure path in cbw_do_copy_before_write().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 qapi/block-core.json      | 25 ++++++++++++++++++++++++-
 block/copy-before-write.c | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index beeb91952a..085f1666af 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4163,6 +4163,25 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*bottom': 'str' } }
 
+##
+# @OnCbwError:
+#
+# An enumeration of possible behaviors for copy-before-write operation
+# failures.
+#
+# @break-guest-write: report the error to the guest. This way, the guest
+#                     will not be able to overwrite areas that cannot be
+#                     backed up, so the backup process remains valid.
+#
+# @break-snapshot: continue guest write. Doing so will make the provided
+#                  snapshot state invalid and any backup or export
+#                  process based on it will finally fail.
+#
+# Since: 7.1
+##
+{ 'enum': 'OnCbwError',
+  'data': [ 'break-guest-write', 'break-snapshot' ] }
+
 ##
 # @BlockdevOptionsCbw:
 #
@@ -4184,11 +4203,15 @@
 #          modifications (or removing) of specified bitmap doesn't
 #          influence the filter. (Since 7.0)
 #
+# @on-cbw-error: Behavior on failure of copy-before-write operation.
+#                Default is @break-guest-write. (Since 7.0)
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
+            '*on-cbw-error': 'OnCbwError' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 6877ff893a..ffb05d22f8 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -41,6 +41,7 @@
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
+    OnCbwError on_cbw_error;
 
     /*
      * @lock: protects access to @access_bitmap, @done_bitmap and
@@ -65,6 +66,14 @@ typedef struct BDRVCopyBeforeWriteState {
      * node. These areas must not be rewritten by guest.
      */
     BlockReqList frozen_read_reqs;
+
+    /*
+     * @snapshot_error is normally zero. But on first copy-before-write failure
+     * when @on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT, @snapshot_error takes
+     * value of this error (<0). After that all in-flight and further
+     * snapshot-API requests will fail with that error.
+     */
+    int snapshot_error;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -95,16 +104,27 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
         return 0;
     }
 
+    if (s->snapshot_error) {
+        return 0;
+    }
+
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
     ret = block_copy(s->bcs, off, end - off, true);
-    if (ret < 0) {
+    if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
 
     WITH_QEMU_LOCK_GUARD(&s->lock) {
-        bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
+        if (ret < 0) {
+            assert(s->on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT);
+            if (!s->snapshot_error) {
+                s->snapshot_error = ret;
+            }
+        } else {
+            bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
+        }
         reqlist_wait_all(&s->frozen_read_reqs, off, end - off, &s->lock);
     }
 
@@ -176,6 +196,11 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
 
     QEMU_LOCK_GUARD(&s->lock);
 
+    if (s->snapshot_error) {
+        g_free(req);
+        return NULL;
+    }
+
     if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
         g_free(req);
         return NULL;
@@ -351,6 +376,7 @@ static BlockdevOptions *cbw_parse_options(QDict *options, Error **errp)
      * object for original options.
      */
     qdict_extract_subqdict(options, NULL, "bitmap");
+    qdict_del(options, "on-cbw-error");
 
 out:
     visit_free(v);
@@ -394,6 +420,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             return -EINVAL;
         }
     }
+    s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
+            ON_CBW_ERROR_BREAK_GUEST_WRITE;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-- 
2.35.1


