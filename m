Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0841A0F47
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 16:32:41 +0200 (CEST)
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLpHL-0001fV-S8
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 10:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55099)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jLpBY-0000H7-F1
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 10:26:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jLpBX-0006s2-4q
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 10:26:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36521
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jLpBX-0006rS-0v
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 10:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586269598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WdIL7HYduaJ+1uyoeeDrLN2mdSDKLLtwIO+Xi3xkxJY=;
 b=LeOpm0MWX1Xp2DE5DTr9mGyC0g9D6eOP+HpXQjvzfCSGMxGG76gPdyGqLHckXCfwIob7nM
 B/iMbWteCpuRk1zkoKE7Uhzwt3sElOmnX8FiLmYuzsf6vPZxT0AMF2WdW0Aer2nXdk6w1B
 ahO6IfqquKFu9lULcD0Ava1A1+7n6hU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-p5G3-EZjM4u7KNi77rtlqQ-1; Tue, 07 Apr 2020 10:26:36 -0400
X-MC-Unique: p5G3-EZjM4u7KNi77rtlqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 492028010EB;
 Tue,  7 Apr 2020 14:26:35 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-253.ams2.redhat.com
 [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453455DA60;
 Tue,  7 Apr 2020 14:26:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 4/7] block-backend: Reorder flush/pdiscard function definitions
Date: Tue,  7 Apr 2020 16:26:13 +0200
Message-Id: <20200407142616.7961-5-kwolf@redhat.com>
In-Reply-To: <20200407142616.7961-1-kwolf@redhat.com>
References: <20200407142616.7961-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

Move all variants of the flush/pdiscard functions to a single place and
put the blk_co_*() version first because it is called by all other
variants (and will become static in the next patch).

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200407121259.21350-2-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 92 +++++++++++++++++++++----------------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 8b8f2a80a0..17b2e87afa 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1488,38 +1488,6 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64=
_t offset,
                         blk_aio_write_entry, flags, cb, opaque);
 }
=20
-static void blk_aio_flush_entry(void *opaque)
-{
-    BlkAioEmAIOCB *acb =3D opaque;
-    BlkRwCo *rwco =3D &acb->rwco;
-
-    rwco->ret =3D blk_co_flush(rwco->blk);
-    blk_aio_complete(acb);
-}
-
-BlockAIOCB *blk_aio_flush(BlockBackend *blk,
-                          BlockCompletionFunc *cb, void *opaque)
-{
-    return blk_aio_prwv(blk, 0, 0, NULL, blk_aio_flush_entry, 0, cb, opaqu=
e);
-}
-
-static void blk_aio_pdiscard_entry(void *opaque)
-{
-    BlkAioEmAIOCB *acb =3D opaque;
-    BlkRwCo *rwco =3D &acb->rwco;
-
-    rwco->ret =3D blk_co_pdiscard(rwco->blk, rwco->offset, acb->bytes);
-    blk_aio_complete(acb);
-}
-
-BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk,
-                             int64_t offset, int bytes,
-                             BlockCompletionFunc *cb, void *opaque)
-{
-    return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_pdiscard_entry, =
0,
-                        cb, opaque);
-}
-
 void blk_aio_cancel(BlockAIOCB *acb)
 {
     bdrv_aio_cancel(acb);
@@ -1586,6 +1554,37 @@ int blk_co_pdiscard(BlockBackend *blk, int64_t offse=
t, int bytes)
     return bdrv_co_pdiscard(blk->root, offset, bytes);
 }
=20
+static void blk_aio_pdiscard_entry(void *opaque)
+{
+    BlkAioEmAIOCB *acb =3D opaque;
+    BlkRwCo *rwco =3D &acb->rwco;
+
+    rwco->ret =3D blk_co_pdiscard(rwco->blk, rwco->offset, acb->bytes);
+    blk_aio_complete(acb);
+}
+
+BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk,
+                             int64_t offset, int bytes,
+                             BlockCompletionFunc *cb, void *opaque)
+{
+    return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_pdiscard_entry, =
0,
+                        cb, opaque);
+}
+
+static void blk_pdiscard_entry(void *opaque)
+{
+    BlkRwCo *rwco =3D opaque;
+    QEMUIOVector *qiov =3D rwco->iobuf;
+
+    rwco->ret =3D blk_co_pdiscard(rwco->blk, rwco->offset, qiov->size);
+    aio_wait_kick();
+}
+
+int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
+{
+    return blk_prw(blk, offset, NULL, bytes, blk_pdiscard_entry, 0);
+}
+
 int blk_co_flush(BlockBackend *blk)
 {
     blk_wait_while_drained(blk);
@@ -1597,6 +1596,21 @@ int blk_co_flush(BlockBackend *blk)
     return bdrv_co_flush(blk_bs(blk));
 }
=20
+static void blk_aio_flush_entry(void *opaque)
+{
+    BlkAioEmAIOCB *acb =3D opaque;
+    BlkRwCo *rwco =3D &acb->rwco;
+
+    rwco->ret =3D blk_co_flush(rwco->blk);
+    blk_aio_complete(acb);
+}
+
+BlockAIOCB *blk_aio_flush(BlockBackend *blk,
+                          BlockCompletionFunc *cb, void *opaque)
+{
+    return blk_aio_prwv(blk, 0, 0, NULL, blk_aio_flush_entry, 0, cb, opaqu=
e);
+}
+
 static void blk_flush_entry(void *opaque)
 {
     BlkRwCo *rwco =3D opaque;
@@ -2083,20 +2097,6 @@ int blk_truncate(BlockBackend *blk, int64_t offset, =
bool exact,
     return bdrv_truncate(blk->root, offset, exact, prealloc, errp);
 }
=20
-static void blk_pdiscard_entry(void *opaque)
-{
-    BlkRwCo *rwco =3D opaque;
-    QEMUIOVector *qiov =3D rwco->iobuf;
-
-    rwco->ret =3D blk_co_pdiscard(rwco->blk, rwco->offset, qiov->size);
-    aio_wait_kick();
-}
-
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
-{
-    return blk_prw(blk, offset, NULL, bytes, blk_pdiscard_entry, 0);
-}
-
 int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
                      int64_t pos, int size)
 {
--=20
2.20.1


