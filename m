Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE510B080
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 14:44:50 +0100 (CET)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZxce-0005Gq-Rp
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 08:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iZxCO-0004Yb-Qy
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 08:17:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iZxCJ-0007Av-L6
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 08:17:37 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52450
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iZxCJ-0007AE-0a
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 08:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574860654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+yM82NBm5/xdzlwK3idjjlfIAebRG5yJcjDcxry6qI=;
 b=X9gZJvtoFUKmnPmfW7iUY0gFpKqyU61zb6v7IovF3mXTVSof9IhNVAqTRAwOLXeCyglfZg
 QiseJSxC79PbSfATQaOmelzQXb9IImNBunhfit7A82DtxO+0XNrQPd4T1Y5zPo7TfGKG+k
 FbhROHzgy1NhTUZ3eTSKyowqkZ898ww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-6x6UbzmXOtK29jjLD4Ejhw-1; Wed, 27 Nov 2019 08:17:33 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33303800598;
 Wed, 27 Nov 2019 13:17:32 +0000 (UTC)
Received: from localhost (ovpn-205-186.brq.redhat.com [10.40.205.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C02225C219;
 Wed, 27 Nov 2019 13:17:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.0 27/31] block: Make bdrv_filter_default_perms() static
Date: Wed, 27 Nov 2019 14:16:20 +0100
Message-Id: <20191127131624.1062403-28-mreitz@redhat.com>
In-Reply-To: <20191127131624.1062403-1-mreitz@redhat.com>
References: <20191127131624.1062403-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 6x6UbzmXOtK29jjLD4Ejhw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c                   | 12 ++++++------
 include/block/block_int.h | 10 ----------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/block.c b/block.c
index e800ce862e..b6c92ef283 100644
--- a/block.c
+++ b/block.c
@@ -2171,12 +2171,12 @@ int bdrv_child_refresh_perms(BlockDriverState *bs, =
BdrvChild *c, Error **errp)
     return bdrv_child_try_set_perm(c, perms, shared, errp);
 }
=20
-void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
-                               const BdrvChildClass *child_class,
-                               BdrvChildRole role,
-                               BlockReopenQueue *reopen_queue,
-                               uint64_t perm, uint64_t shared,
-                               uint64_t *nperm, uint64_t *nshared)
+static void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
+                                      const BdrvChildClass *child_class,
+                                      BdrvChildRole role,
+                                      BlockReopenQueue *reopen_queue,
+                                      uint64_t perm, uint64_t shared,
+                                      uint64_t *nperm, uint64_t *nshared)
 {
     *nperm =3D perm & DEFAULT_PERM_PASSTHROUGH;
     *nshared =3D (shared & DEFAULT_PERM_PASSTHROUGH) | DEFAULT_PERM_UNCHAN=
GED;
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 895bcf4d30..7818734708 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1243,16 +1243,6 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t p=
erm, uint64_t shared,
  */
 int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **e=
rrp);
=20
-/* Default implementation for BlockDriver.bdrv_child_perm() that can be us=
ed by
- * block filters: Forward CONSISTENT_READ, WRITE, WRITE_UNCHANGED and RESI=
ZE to
- * all children */
-void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
-                               const BdrvChildClass *child_class,
-                               BdrvChildRole child_role,
-                               BlockReopenQueue *reopen_queue,
-                               uint64_t perm, uint64_t shared,
-                               uint64_t *nperm, uint64_t *nshared);
-
 /* Default implementation for BlockDriver.bdrv_child_perm() that can be us=
ed by
  * (non-raw) image formats: Like above for bs->backing, but for bs->file i=
t
  * requires WRITE | RESIZE for read-write images, always requires
--=20
2.23.0


