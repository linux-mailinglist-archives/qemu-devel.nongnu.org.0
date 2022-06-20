Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516E1552270
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:41:51 +0200 (CEST)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KTF-0005ov-Fu
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFP-0005pZ-J8
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFN-0005O0-C3
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655742448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oX8yxx0QBnmbAYhzhtCxIgoNrNucW6Qfs9ClSyrsx00=;
 b=DxqcU2RVqvj56G/GwHAvPxphjk4mcm9vvX1NTAf0hPiXzVHI6fZjl/Q7MsnqpJkUjtpPfo
 3ctAsiubmK4Tu6z4FzGPD1g8P+NFAQRuMnLRTQXafEpXsbmyoIB2/xDXNxvbO2n4JCdbfF
 0JvcSYwoZrXggtdwgNTNRBX2nagWoAo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-qTv6pwhhP7SlzT9igizF2g-1; Mon, 20 Jun 2022 12:27:26 -0400
X-MC-Unique: qTv6pwhhP7SlzT9igizF2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEAB480B70F;
 Mon, 20 Jun 2022 16:27:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 692ED2166B26;
 Mon, 20 Jun 2022 16:27:25 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 12/12] qemu-img: Change info key names for protocol nodes
Date: Mon, 20 Jun 2022 18:27:04 +0200
Message-Id: <20220620162704.80987-13-hreitz@redhat.com>
In-Reply-To: <20220620162704.80987-1-hreitz@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, when querying a qcow2 image, qemu-img info reports something
like this:

image: test.qcow2
file format: qcow2
virtual size: 64 MiB (67108864 bytes)
disk size: 196 KiB
cluster_size: 65536
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false
Child node '/file':
    image: test.qcow2
    file format: file
    virtual size: 192 KiB (197120 bytes)
    disk size: 196 KiB
    Format specific information:
        extent size hint: 1048576

Notably, the way the keys are named is specific for image files: The
filename is shown under "image", the BDS driver under "file format", and
the BDS length under "virtual size".  This does not make much sense for
nodes that are not actually supposed to be guest images, like the /file
child node shown above.

Give bdrv_node_info_dump() a @protocol parameter that gives a hint that
the respective node is probably just used for data storage and does not
necessarily present the data for a VM guest disk.  This renames the keys
so that with this patch, the output becomes:

image: test.qcow2
[...]
Child node '/file':
    filename: test.qcow2
    protocol type: file
    file length: 192 KiB (197120 bytes)
    disk size: 196 KiB
    Format specific information:
        extent size hint: 1048576

(Perhaps we should also rename "Format specific information", but I
could not come up with anything better that will not become problematic
if we guess wrong with the protocol "heuristic".)

This change affects iotest 302, which has protocol node information in
its reference output.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
This patch is completely optional and just based on personal
preference.  I just don't like e.g. how the child node is called an
"image" when it's pretty much unusable as a guest image, or how "virtual
size" is there twice but with different values.
---
 include/block/qapi.h           |  2 +-
 block/monitor/block-hmp-cmds.c |  2 +-
 block/qapi.c                   | 39 ++++++++++++++++++++++++++++------
 qemu-img.c                     |  3 ++-
 tests/qemu-iotests/302.out     |  6 +++---
 5 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/include/block/qapi.h b/include/block/qapi.h
index 38855f2ae9..26113da21a 100644
--- a/include/block/qapi.h
+++ b/include/block/qapi.h
@@ -51,5 +51,5 @@ void bdrv_snapshot_dump(QEMUSnapshotInfo *sn);
 void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
                                    const char *prefix,
                                    int indentation);
-void bdrv_node_info_dump(BlockNodeInfo *info, int indentation);
+void bdrv_node_info_dump(BlockNodeInfo *info, int indentation, bool protocol);
 #endif
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index a63c25c208..a8067846b2 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -734,7 +734,7 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
         monitor_printf(mon, "\nImages:\n");
         image_info = inserted->image;
         while (1) {
-            bdrv_node_info_dump(qapi_ImageInfo_base(image_info), 0);
+            bdrv_node_info_dump(qapi_ImageInfo_base(image_info), 0, false);
             if (image_info->has_backing_image) {
                 image_info = image_info->backing_image;
             } else {
diff --git a/block/qapi.c b/block/qapi.c
index 3e35603f0c..56f398c500 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -934,24 +934,49 @@ void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
     visit_free(v);
 }
 
-void bdrv_node_info_dump(BlockNodeInfo *info, int indentation)
+/**
+ * Print the given @info object in human-readable form.  Every field is indented
+ * using the given @indentation (four spaces per indentation level).
+ *
+ * When using this to print a whole block graph, @protocol can be set to true to
+ * signify that the given information is associated with a protocol node, i.e.
+ * just data storage for an image, such that the data it presents is not really
+ * a full VM disk.  If so, several fields change name: For example, "virtual
+ * size" is printed as "file length".
+ * (Consider a qcow2 image, which is represented by a qcow2 node and a file
+ * node.  Printing a "virtual size" for the file node does not make sense,
+ * because without the qcow2 node, it is not really a guest disk, so it does not
+ * have a "virtual size".  Therefore, we call it "file length" instead.)
+ *
+ * @protocol is ignored when @indentation is 0, because we take that to mean
+ * that the associated node is the root node in the queried block graph, and
+ * thus is always to be interpreted as a standalone guest disk.
+ */
+void bdrv_node_info_dump(BlockNodeInfo *info, int indentation, bool protocol)
 {
     char *size_buf, *dsize_buf;
     g_autofree char *ind_s = g_strdup_printf("%*s", indentation * 4, "");
 
+    if (indentation == 0) {
+        /* Top level, consider this a normal image */
+        protocol = false;
+    }
+
     if (!info->has_actual_size) {
         dsize_buf = g_strdup("unavailable");
     } else {
         dsize_buf = size_to_str(info->actual_size);
     }
     size_buf = size_to_str(info->virtual_size);
-    qemu_printf("%simage: %s\n"
-                "%sfile format: %s\n"
-                "%svirtual size: %s (%" PRId64 " bytes)\n"
+    qemu_printf("%s%s: %s\n"
+                "%s%s: %s\n"
+                "%s%s: %s (%" PRId64 " bytes)\n"
                 "%sdisk size: %s\n",
-                ind_s, info->filename,
-                ind_s, info->format,
-                ind_s, size_buf, info->virtual_size,
+                ind_s, protocol ? "filename" : "image", info->filename,
+                ind_s, protocol ? "protocol type" : "file format",
+                info->format,
+                ind_s, protocol ? "file length" : "virtual size",
+                size_buf, info->virtual_size,
                 ind_s, dsize_buf);
     g_free(size_buf);
     g_free(dsize_buf);
diff --git a/qemu-img.c b/qemu-img.c
index 6da4064d57..17ccde5448 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2837,7 +2837,8 @@ static void dump_human_image_info(BlockGraphInfo *info, int indentation,
 {
     BlockChildInfoList *children_list;
 
-    bdrv_node_info_dump(qapi_BlockGraphInfo_base(info), indentation);
+    bdrv_node_info_dump(qapi_BlockGraphInfo_base(info), indentation,
+                        info->children == NULL);
 
     for (children_list = info->children; children_list;
          children_list = children_list->next)
diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
index edfa1c4f05..7b5014cdd8 100644
--- a/tests/qemu-iotests/302.out
+++ b/tests/qemu-iotests/302.out
@@ -5,9 +5,9 @@ file format: raw
 virtual size: 448 KiB (458752 bytes)
 disk size: unavailable
 Child node '/file':
-    image: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
-    file format: nbd
-    virtual size: 448 KiB (458752 bytes)
+    filename: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
+    protocol type: nbd
+    file length: 448 KiB (458752 bytes)
     disk size: unavailable
 
 === Converted image info ===
-- 
2.35.3


