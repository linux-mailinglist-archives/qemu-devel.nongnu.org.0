Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A99B707
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 21:26:40 +0200 (CEST)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1FCo-0001SB-Rq
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 15:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1319249da=dmitry.fomichev@wdc.com>)
 id 1i1F96-0007cg-ER
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 15:22:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1319249da=dmitry.fomichev@wdc.com>)
 id 1i1F95-0004KI-28
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 15:22:48 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:37630)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=1319249da=dmitry.fomichev@wdc.com>)
 id 1i1F92-0004HC-3H; Fri, 23 Aug 2019 15:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566588164; x=1598124164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wDuJg/PXjCdmnfQAHj6RMyp+qTSDniP3cOnxGOeYBNk=;
 b=mYWuV3Z1pDCRdFB++hQhsSAVxwwiNSWwtuKNu68RAQi22hu/lbk8sycz
 cAreNiOzHwza+1LrZMos+SjSd5E5s2zC6d99sGWkkj8p9Yeu6+eqtfn7t
 IEymrgM69NBCuL5g3RdK5ngG5nnY/SLVfG2yIQaYbr5ZttD+0cKyWkkue
 6SotH5YAKbVbBmAay8SCMmlmiWrZOdW7GvHTzTwjC1YavGb9d/Bwwx6HF
 AyPv48ztbda1oER++smSoE0dGOwE5eNaN796ALcDDg2j1WVBe/GX5ti+y
 STUdexzIpSRntA65UowsHb5IFwELecWa2wLUdvI5tWoUmonj+oQ6tP/Au Q==;
IronPort-SDR: aYoUkXBewh0D0HznMVXD1DSsf3e6UPQMEiRB/KdZ3yqfbt9QyytaHxVVsNoefecrxSpyN19wt6
 o5HeJqlvtKSrrzv1HmDrSrrSRq4K8v4WPcAlGZvr6GIynxmj/HMHz+MSkN++Ex+2m6cB3xIcWB
 Xxtc+3K9Ub8U99ZWDK4US8Gti47qEWwadBvTZ+B48V0Jk0dxkTdlGyQGFI5pc13bD1BgVCXY/E
 KWzVM1RVVWz6xwr6FUVzmff5Cuk0ihv97PWNbonEQ4zXkKzS3fiZYtEjlhSOYUTMKN5pL7QcmV
 Y2E=
X-IronPort-AV: E=Sophos;i="5.64,422,1559491200"; d="scan'208";a="117476288"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Aug 2019 03:22:30 +0800
IronPort-SDR: kOek2LSY7/gV+4Zn3nB3KIxTD7f9BwWi96vDeKLRuhOZ+Stmh7M4IkjHzSKXbSWO9NFACxgrab
 lDvCZwAzQgm4UwJLwIqMdSenJfzlwFcy5D5+Epnd8//CCWObjXiRopH0a+wzdcHPSokyLf+52T
 PpLkSgvX3K6druPFcwSrPhm7ZvMqvRp09JR6Kq4do6Ja5dt9HRvq26NXFWVLpmFSWYMI74OFD0
 SYvj8rrBc8tKb8F6w2DHz3vPWQfEQ5Wo3tgP8wwB6OD8R5QsZ8GKscjtN3/m7OWmt/Z0bTamH9
 kTwGeEDe+wKiDXl4x53ma69c
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 12:19:47 -0700
IronPort-SDR: 1qRi1JXeETMvq5m7WpAT9pOty1mfa2zftBn4HvW1tx4BL6f4Iu0J6prhliTxJxAHaQC1fv0H+Q
 n0EV1yx8Wdkqsg7knu2WVKAnSiIJTucFnZoWgl0FQNk+B2HNDqHaLHOgtp2QmUc4u2hiiSAkar
 lWVxMR8uv6+JrskcDFjrLYu7fk/hOJslRDDEGHYmu14uK47YFlg5lZbw219O67fS6fAaTkhZhK
 76a23iAmKczNyHRZ7sQu5TAtO9s7bfeIPjZ9ecwXwIjtIc08z5AY+tPcNYgcjaSY0MYI41EZJF
 wh8=
WDCIronportException: Internal
Received: from dhcp-10-88-173-43.hgst.com ([10.88.173.43])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Aug 2019 12:22:28 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Date: Fri, 23 Aug 2019 15:22:23 -0400
Message-Id: <20190823192226.21154-2-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823192226.21154-1-dmitry.fomichev@wdc.com>
References: <20190823192226.21154-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.153.144
Subject: [Qemu-devel] [PATCH v4 1/4] block: Add zoned device model property
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
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit adds Zoned Device Model (as defined in T10 ZBC and
T13 ZAC standards) as a block driver property, along with some
useful access functions.

A new backend driver permission, BLK_PERM_SUPPORT_ZONED, is also
introduced. Only the drivers having this permission will be allowed
to open zoned block devices.

No code is added yet to initialize or check the value of this new
property, therefore this commit doesn't change any functionality.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 block.c                   | 19 +++++++++++++++++++
 include/block/block.h     | 21 ++++++++++++++++++++-
 include/block/block_int.h |  4 ++++
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 874a29a983..6dd4cecded 100644
--- a/block.c
+++ b/block.c
@@ -4679,6 +4679,25 @@ void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr)
     *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
 }
 
+uint8_t bdrv_get_zoned_model(BlockDriverState *bs)
+{
+    if (bs->drv->bdrv_get_zoned_info) {
+        bs->drv->bdrv_get_zoned_info(bs);
+    }
+
+    return bs->bl.zoned_model;
+}
+
+uint8_t bdrv_is_zoned(BlockDriverState *bs)
+{
+    /*
+     * Host Aware zone devices are supposed to be able to work
+     * just like regular block devices. Thus, we only consider
+     * Host Managed devices to be zoned here.
+     */
+    return bdrv_get_zoned_model(bs) == BLK_ZONED_MODEL_HM;
+}
+
 bool bdrv_is_sg(BlockDriverState *bs)
 {
     return bs->sg;
diff --git a/include/block/block.h b/include/block/block.h
index 124ad40809..238c0f5ed7 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -271,18 +271,35 @@ enum {
      */
     BLK_PERM_GRAPH_MOD          = 0x10,
 
+    /** This permission is required to open zoned block devices. */
+    BLK_PERM_SUPPORT_ZONED      = 0x20,
+
     BLK_PERM_ALL                = 0x1f,
 
     DEFAULT_PERM_PASSTHROUGH    = BLK_PERM_CONSISTENT_READ
                                  | BLK_PERM_WRITE
                                  | BLK_PERM_WRITE_UNCHANGED
-                                 | BLK_PERM_RESIZE,
+                                 | BLK_PERM_RESIZE
+                                 | BLK_PERM_SUPPORT_ZONED,
 
     DEFAULT_PERM_UNCHANGED      = BLK_PERM_ALL & ~DEFAULT_PERM_PASSTHROUGH,
 };
 
 char *bdrv_perm_names(uint64_t perm);
 
+/*
+ * Known zoned device models.
+ *
+ * TODO For a Linux host, it could be preferrable to include
+ * /usr/include/linux/blkzoned.h instead of defining ZBD-specific
+ * values here.
+ */
+enum blk_zoned_model {
+    BLK_ZONED_MODEL_NONE, /* Regular block device */
+    BLK_ZONED_MODEL_HA,   /* Host-aware zoned block device */
+    BLK_ZONED_MODEL_HM,   /* Host-managed zoned block device */
+};
+
 /* disk I/O throttling */
 void bdrv_init(void);
 void bdrv_init_with_whitelist(void);
@@ -359,6 +376,8 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs);
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
 void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
+uint8_t bdrv_get_zoned_model(BlockDriverState *bs);
+uint8_t bdrv_is_zoned(BlockDriverState *bs);
 void bdrv_refresh_limits(BlockDriverState *bs, Error **errp);
 int bdrv_commit(BlockDriverState *bs);
 int bdrv_change_backing_file(BlockDriverState *bs,
diff --git a/include/block/block_int.h b/include/block/block_int.h
index ceec8c2f56..91496e8149 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -415,6 +415,7 @@ struct BlockDriver {
     bool (*bdrv_debug_is_suspended)(BlockDriverState *bs, const char *tag);
 
     void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);
+    void (*bdrv_get_zoned_info)(BlockDriverState *bs);
 
     /*
      * Returns 1 if newly created images are guaranteed to contain only
@@ -620,6 +621,9 @@ typedef struct BlockLimits {
 
     /* maximum number of iovec elements */
     int max_iov;
+
+    /* Zoned device model. Zero value indicates a regular block device */
+    uint8_t zoned_model;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
-- 
2.21.0


