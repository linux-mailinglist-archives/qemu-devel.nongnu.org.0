Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E501FD008
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 16:53:25 +0200 (CEST)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlZRM-00013X-Fi
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 10:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlZNd-0002rL-50
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 10:49:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43431
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlZNY-0001eg-8E
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 10:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592405366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhoWVbBUNVB2GtqglvNwOvve4cTH8w1dCPMuKWAeIgw=;
 b=Ibjs60MSU3k9Tdbo2prHeFk5tcY16iLpxF94sAPwbxyOSpCZ9tSsaOL8ARw+w0XHJJpSMx
 kksgd0HTpaL/JcnPGvK53RP6ZiZyNsqFJKxw5ODpuFscn5ETbFxWcnZmSu/dIB7mBn4MW7
 /kN29NlpGLDzupWvUxEptSaiuYGVDcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-B2KuTUGxNGKdhu8BIME0kw-1; Wed, 17 Jun 2020 10:49:22 -0400
X-MC-Unique: B2KuTUGxNGKdhu8BIME0kw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F028108BCA1;
 Wed, 17 Jun 2020 14:49:21 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-44.ams2.redhat.com [10.36.114.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 639707CAA0;
 Wed, 17 Jun 2020 14:49:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/43] qcow2: Tweak comments on
 qcow2_get_persistent_dirty_bitmap_size
Date: Wed, 17 Jun 2020 16:48:32 +0200
Message-Id: <20200617144909.192176-7-kwolf@redhat.com>
In-Reply-To: <20200617144909.192176-1-kwolf@redhat.com>
References: <20200617144909.192176-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 02:02:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

For now, we don't have persistent bitmaps in any other formats, but
that might not be true in the future.  Make it obvious that our
incoming parameter is not necessarily a qcow2 image, and therefore is
limited to just the bdrv_dirty_bitmap_* API calls (rather than probing
into qcow2 internals).

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200608190821.3293867-1-eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2-bitmap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 7bf12502da..1f38806ca6 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1757,19 +1757,20 @@ bool qcow2_supports_persistent_dirty_bitmap(BlockDriverState *bs)
 }
 
 /*
- * Compute the space required for bitmaps in @bs.
+ * Compute the space required to copy bitmaps from @in_bs.
  *
  * The computation is based as if copying to a new image with the
- * given @cluster_size, which may differ from the cluster size in @bs.
+ * given @cluster_size, which may differ from the cluster size in
+ * @in_bs; in fact, @in_bs might be something other than qcow2.
  */
-uint64_t qcow2_get_persistent_dirty_bitmap_size(BlockDriverState *bs,
+uint64_t qcow2_get_persistent_dirty_bitmap_size(BlockDriverState *in_bs,
                                                 uint32_t cluster_size)
 {
     uint64_t bitmaps_size = 0;
     BdrvDirtyBitmap *bm;
     size_t bitmap_dir_size = 0;
 
-    FOR_EACH_DIRTY_BITMAP(bs, bm) {
+    FOR_EACH_DIRTY_BITMAP(in_bs, bm) {
         if (bdrv_dirty_bitmap_get_persistence(bm)) {
             const char *name = bdrv_dirty_bitmap_name(bm);
             uint32_t granularity = bdrv_dirty_bitmap_granularity(bm);
-- 
2.25.4


