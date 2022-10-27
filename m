Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A02610056
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:35:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7iT-0005tX-Rp; Thu, 27 Oct 2022 14:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gd-0001xo-3V
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gb-0002cA-Dm
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHcenUDAqtr4sxkIwa+Rl4vBEKAgz2fUfH+GdStndkw=;
 b=WdbjUnTGBb5xU+3SYrQmABlrl+O57dIPSj5waK0UVNeJCqH40BzQPk5CWUN/dm4keYomcp
 fblNTO/QnzIe7Uu/nZDWGkW7qKkslrn0Ke8O5woLvJ53SmYDhHK+wugnEPtULweizsIAwy
 eOMOOpteaQxgnJPSqVFbIgRA2n3+J1k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-aPvMdq-YP8CTsnesprS92g-1; Thu, 27 Oct 2022 14:32:56 -0400
X-MC-Unique: aPvMdq-YP8CTsnesprS92g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 601841C0690C;
 Thu, 27 Oct 2022 18:32:56 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED061121320;
 Thu, 27 Oct 2022 18:32:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 46/58] vmdk: manually add more coroutine_fn annotations
Date: Thu, 27 Oct 2022 20:31:34 +0200
Message-Id: <20221027183146.463129-47-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

The validity of these was double-checked with Alberto Faria's static analyzer.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-14-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index d75a87cb85..e5004945b0 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1403,13 +1403,13 @@ static void vmdk_refresh_limits(BlockDriverState *bs, Error **errp)
  * [@skip_start_sector, @skip_end_sector) is not copied or written, and leave
  * it for call to write user data in the request.
  */
-static int get_whole_cluster(BlockDriverState *bs,
-                             VmdkExtent *extent,
-                             uint64_t cluster_offset,
-                             uint64_t offset,
-                             uint64_t skip_start_bytes,
-                             uint64_t skip_end_bytes,
-                             bool zeroed)
+static int coroutine_fn get_whole_cluster(BlockDriverState *bs,
+                                          VmdkExtent *extent,
+                                          uint64_t cluster_offset,
+                                          uint64_t offset,
+                                          uint64_t skip_start_bytes,
+                                          uint64_t skip_end_bytes,
+                                          bool zeroed)
 {
     int ret = VMDK_OK;
     int64_t cluster_bytes;
@@ -1484,8 +1484,8 @@ exit:
     return ret;
 }
 
-static int vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
-                         uint32_t offset)
+static int coroutine_fn vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
+                                      uint32_t offset)
 {
     offset = cpu_to_le32(offset);
     /* update L2 table */
@@ -1536,14 +1536,14 @@ static int vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
  *          VMDK_UNALLOC if cluster is not mapped and @allocate is false.
  *          VMDK_ERROR if failed.
  */
-static int get_cluster_offset(BlockDriverState *bs,
-                              VmdkExtent *extent,
-                              VmdkMetaData *m_data,
-                              uint64_t offset,
-                              bool allocate,
-                              uint64_t *cluster_offset,
-                              uint64_t skip_start_bytes,
-                              uint64_t skip_end_bytes)
+static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
+                                           VmdkExtent *extent,
+                                           VmdkMetaData *m_data,
+                                           uint64_t offset,
+                                           bool allocate,
+                                           uint64_t *cluster_offset,
+                                           uint64_t skip_start_bytes,
+                                           uint64_t skip_end_bytes)
 {
     unsigned int l1_index, l2_offset, l2_index;
     int min_index, i, j;
-- 
2.37.3


