Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36211626D0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 14:09:11 +0100 (CET)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42cg-0004gs-K2
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 08:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39672)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j42Eo-0007Ev-5B
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j42Em-0001uJ-9t
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25305
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j42Em-0001ti-5C
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582029867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVNM86XVMKqugCb12twZ0/DNmmxlHxT6mS8rcuuuDLQ=;
 b=Vf5CXzeiq50TJDmVzZhuwUHv/S8GmEd48jO2VZV3TvJ7RNO/v+HGeYOZRSHX1y4aD36Sm6
 vk+1SH+qeDjHtROcCEhIuySdNoFOITtbKKIcYNRzkLL2/MQjcuHNwzgvH2vNufh+FYFa02
 SEBNy4goeqlgFuHiJnRhFsnlnhVn7JU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-xKp8y621O-W5C0FC_gLv7w-1; Tue, 18 Feb 2020 07:44:25 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11F76800D5E;
 Tue, 18 Feb 2020 12:44:25 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8621F394;
 Tue, 18 Feb 2020 12:44:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 31/33] block: Drop child_file
Date: Tue, 18 Feb 2020 13:42:40 +0100
Message-Id: <20200218124242.584644-32-mreitz@redhat.com>
In-Reply-To: <20200218124242.584644-1-mreitz@redhat.com>
References: <20200218124242.584644-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: xKp8y621O-W5C0FC_gLv7w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block.c                   | 30 +-----------------------------
 include/block/block_int.h |  1 -
 tests/test-bdrv-drain.c   |  8 +++-----
 3 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/block.c b/block.c
index 16eb790ea6..986f99415c 100644
--- a/block.c
+++ b/block.c
@@ -1121,33 +1121,6 @@ const BdrvChildClass child_of_bds =3D {
     .update_filename =3D bdrv_child_cb_update_filename,
 };
=20
-/*
- * Returns the options and flags that bs->file should get if a protocol dr=
iver
- * is expected, based on the given options and flags for the parent BDS
- */
-static void bdrv_protocol_options(BdrvChildRole role, bool parent_is_forma=
t,
-                                  int *child_flags, QDict *child_options,
-                                  int parent_flags, QDict *parent_options)
-{
-    bdrv_inherited_options(BDRV_CHILD_IMAGE, true,
-                           child_flags, child_options,
-                           parent_flags, parent_options);
-}
-
-const BdrvChildClass child_file =3D {
-    .parent_is_bds   =3D true,
-    .get_parent_desc =3D bdrv_child_get_parent_desc,
-    .inherit_options =3D bdrv_protocol_options,
-    .drained_begin   =3D bdrv_child_cb_drained_begin,
-    .drained_poll    =3D bdrv_child_cb_drained_poll,
-    .drained_end     =3D bdrv_child_cb_drained_end,
-    .attach          =3D bdrv_child_cb_attach,
-    .detach          =3D bdrv_child_cb_detach,
-    .inactivate      =3D bdrv_child_cb_inactivate,
-    .can_set_aio_ctx =3D bdrv_child_cb_can_set_aio_ctx,
-    .set_aio_ctx     =3D bdrv_child_cb_set_aio_ctx,
-};
-
 static void bdrv_backing_attach(BdrvChild *c)
 {
     BlockDriverState *parent =3D c->opaque;
@@ -2278,8 +2251,7 @@ static void bdrv_default_perms_for_metadata(BlockDriv=
erState *bs, BdrvChild *c,
 {
     int flags;
=20
-    assert(child_class =3D=3D &child_file ||
-           (child_class =3D=3D &child_of_bds && (role & BDRV_CHILD_METADAT=
A)));
+    assert(child_class =3D=3D &child_of_bds && (role & BDRV_CHILD_METADATA=
));
=20
     flags =3D bdrv_reopen_get_flags(reopen_queue, bs);
=20
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 28a35cd5d1..1609e40b58 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -741,7 +741,6 @@ struct BdrvChildClass {
 };
=20
 extern const BdrvChildClass child_of_bds;
-extern const BdrvChildClass child_file;
=20
 struct BdrvChild {
     BlockDriverState *bs;
diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index 0da5a3a6a1..655fd0d085 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -93,12 +93,10 @@ static void bdrv_test_child_perm(BlockDriverState *bs, =
BdrvChild *c,
                                  uint64_t *nperm, uint64_t *nshared)
 {
     /*
-     * bdrv_default_perms() accepts only these two, so disguise
-     * detach_by_driver_cb_parent as one of them.
+     * bdrv_default_perms() accepts nothing else, so disguise
+     * detach_by_driver_cb_parent.
      */
-    if (child_class !=3D &child_file && child_class !=3D &child_of_bds) {
-        child_class =3D &child_of_bds;
-    }
+    child_class =3D &child_of_bds;
=20
     bdrv_default_perms(bs, c, child_class, role, reopen_queue,
                        perm, shared, nperm, nshared);
--=20
2.24.1


