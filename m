Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3FA6ED3F6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 19:54:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr0N5-0007CS-UO; Mon, 24 Apr 2023 13:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pr0N3-0007CD-4w
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:53:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pr0N0-0007Gh-Fb
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682358776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0WePC0dvcu7D4zD6j0w5zhZtvpQjKXlwEWCfwsTj9FI=;
 b=VEVEK+vL/JKP+2IV+TLEfu8QRDVOUD2lURWU956fa+l9HpSrvM7dlMLCn9Jrzf6+34qbSK
 qz49JVp+m398vegOGINys4uflWw2vroiskFgHQbIo44e6/OTMzNo1Qo9eCI1o1l2P3fZK/
 +1gh1uzKOEMqmXiNsbbcTGyvhVInAAw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-icENDy0COwG4tgOyLqkOnw-1; Mon, 24 Apr 2023 13:52:54 -0400
X-MC-Unique: icENDy0COwG4tgOyLqkOnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 973092A59579;
 Mon, 24 Apr 2023 17:52:53 +0000 (UTC)
Received: from localhost (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DADA51121318;
 Mon, 24 Apr 2023 17:52:52 +0000 (UTC)
Date: Mon, 24 Apr 2023 13:52:51 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: faithilikerun@gmail.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/20] Block patches
Message-ID: <20230424175251.GA298880@fedora>
References: <20230420120948.436661-1-stefanha@redhat.com>
 <e7775d5f-292c-2a88-afaa-5731ee1bc897@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FATNXgV6+pjTBCgJ"
Content-Disposition: inline
In-Reply-To: <e7775d5f-292c-2a88-afaa-5731ee1bc897@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--FATNXgV6+pjTBCgJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 08:01:56PM +0100, Richard Henderson wrote:
> On 4/20/23 13:09, Stefan Hajnoczi wrote:
> > The following changes since commit c1eb2ddf0f8075faddc5f7c3d39feae3e8e9=
d6b4:
> >=20
> >    Update version for v8.0.0 release (2023-04-19 17:27:13 +0100)
> >=20
> > are available in the Git repository at:
> >=20
> >    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >=20
> > for you to fetch changes up to 36e5e9b22abe56aa00ca067851555ad8127a7966:
> >=20
> >    tracing: install trace events file only if necessary (2023-04-20 07:=
39:43 -0400)
> >=20
> > ----------------------------------------------------------------
> > Pull request
> >=20
> > Sam Li's zoned storage work and fixes I collected during the 8.0 freeze.
> >=20
> > ----------------------------------------------------------------
> >=20
> > Carlos Santos (1):
> >    tracing: install trace events file only if necessary
> >=20
> > Philippe Mathieu-Daud=E9 (1):
> >    block/dmg: Declare a type definition for DMG uncompress function
> >=20
> > Sam Li (17):
> >    block/block-common: add zoned device structs
> >    block/file-posix: introduce helper functions for sysfs attributes
> >    block/block-backend: add block layer APIs resembling Linux
> >      ZonedBlockDevice ioctls
> >    block/raw-format: add zone operations to pass through requests
> >    block: add zoned BlockDriver check to block layer
> >    iotests: test new zone operations
> >    block: add some trace events for new block layer APIs
> >    docs/zoned-storage: add zoned device documentation
> >    file-posix: add tracking of the zone write pointers
> >    block: introduce zone append write for zoned devices
> >    qemu-iotests: test zone append operation
> >    block: add some trace events for zone append
> >    include: update virtio_blk headers to v6.3-rc1
> >    virtio-blk: add zoned storage emulation for zoned devices
> >    block: add accounting for zone append operation
> >    virtio-blk: add some trace events for zoned emulation
> >    docs/zoned-storage:add zoned emulation use case
> >=20
> > Thomas De Schampheleire (1):
> >    tracetool: use relative paths for '#line' preprocessor directives
>=20
> 32 failed CI jobs:
> https://gitlab.com/qemu-project/qemu/-/pipelines/844927626/failures

Hi Sam,
I have dropped the zoned storage patches from the block pull request.
Please take a look at the diff below and squash the fixes into your
original commits.

Once you have reworked your patch series, please retest them and then
resend so we can merge them in the next block pull request.

Thank you!

Stefan

---
=46rom 08dd0db534d2dbc3aa41d6147ae99bf589bbed57 Mon Sep 17 00:00:00 2001
=46rom: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 24 Apr 2023 13:46:46 -0400
Subject: [PATCH 1/4] Fix mingw32 32-bit compilation

Add uintptr_t casts where necessary so 32-bit mingw32 builds succeed.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 6b2b92b7ff..b9274661fc 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1839,7 +1839,8 @@ static void coroutine_fn blk_aio_zone_report_entry(vo=
id *opaque)
     BlkRwCo *rwco =3D &acb->rwco;
=20
     rwco->ret =3D blk_co_zone_report(rwco->blk, rwco->offset,
-                                   (unsigned int*)acb->bytes,rwco->iobuf);
+                                   (unsigned int *)(uintptr_t)acb->bytes,
+                                   rwco->iobuf);
     blk_aio_complete(acb);
 }
=20
@@ -1860,7 +1861,7 @@ BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, in=
t64_t offset,
         .iobuf  =3D zones,
         .ret    =3D NOT_DONE,
     };
-    acb->bytes =3D (int64_t)nr_zones,
+    acb->bytes =3D (int64_t)(uintptr_t)nr_zones,
     acb->has_returned =3D false;
=20
     co =3D qemu_coroutine_create(blk_aio_zone_report_entry, acb);
@@ -1880,7 +1881,8 @@ static void coroutine_fn blk_aio_zone_mgmt_entry(void=
 *opaque)
     BlkAioEmAIOCB *acb =3D opaque;
     BlkRwCo *rwco =3D &acb->rwco;
=20
-    rwco->ret =3D blk_co_zone_mgmt(rwco->blk, (BlockZoneOp)rwco->iobuf,
+    rwco->ret =3D blk_co_zone_mgmt(rwco->blk,
+                                 (BlockZoneOp)(uintptr_t)rwco->iobuf,
                                  rwco->offset, acb->bytes);
     blk_aio_complete(acb);
 }
@@ -1897,7 +1899,7 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, Bloc=
kZoneOp op,
     acb->rwco =3D (BlkRwCo) {
         .blk    =3D blk,
         .offset =3D offset,
-        .iobuf  =3D (void *)op,
+        .iobuf  =3D (void *)(uintptr_t)op,
         .ret    =3D NOT_DONE,
     };
     acb->bytes =3D len;
@@ -1920,7 +1922,7 @@ static void coroutine_fn blk_aio_zone_append_entry(vo=
id *opaque)
     BlkAioEmAIOCB *acb =3D opaque;
     BlkRwCo *rwco =3D &acb->rwco;
=20
-    rwco->ret =3D blk_co_zone_append(rwco->blk, (int64_t *)acb->bytes,
+    rwco->ret =3D blk_co_zone_append(rwco->blk, (int64_t *)(uintptr_t)acb-=
>bytes,
                                    rwco->iobuf, rwco->flags);
     blk_aio_complete(acb);
 }
@@ -1940,7 +1942,7 @@ BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, in=
t64_t *offset,
         .flags  =3D flags,
         .iobuf  =3D qiov,
     };
-    acb->bytes =3D (int64_t)offset;
+    acb->bytes =3D (int64_t)(uintptr_t)offset;
     acb->has_returned =3D false;
=20
     co =3D qemu_coroutine_create(blk_aio_zone_append_entry, acb);
--=20
2.39.2


=46rom 517aea71e044885946864ade870716f38c6f067a Mon Sep 17 00:00:00 2001
=46rom: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 24 Apr 2023 13:48:05 -0400
Subject: [PATCH 2/4] Add GRAPH_RDLOCK_GUARD() to zoned blk_co_*() functions

GRAPH_RDLOCK_GUARD() was introduced recently and your
patches were probably written before that happened. When QEMU is
compiled with the LLVM clang compiler, there are errors because the
compiler detects that the graph read lock is not taken. Fixed by
adding GRAPH_RDLOCK_GUARD().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index b9274661fc..360cde1645 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1971,6 +1971,7 @@ int coroutine_fn blk_co_zone_report(BlockBackend *blk=
, int64_t offset,
=20
     blk_inc_in_flight(blk); /* increase before waiting */
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
     if (!blk_is_available(blk)) {
         blk_dec_in_flight(blk);
         return -ENOMEDIUM;
@@ -1995,6 +1996,7 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, =
BlockZoneOp op,
=20
     blk_inc_in_flight(blk);
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
=20
     ret =3D blk_check_byte_request(blk, offset, len);
     if (ret < 0) {
@@ -2018,6 +2020,7 @@ int coroutine_fn blk_co_zone_append(BlockBackend *blk=
, int64_t *offset,
=20
     blk_inc_in_flight(blk);
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
     if (!blk_is_available(blk)) {
         blk_dec_in_flight(blk);
         return -ENOMEDIUM;
--=20
2.39.2


=46rom 6801fe4981e37fba38f452c837ee733b3fce13c4 Mon Sep 17 00:00:00 2001
=46rom: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 24 Apr 2023 13:49:11 -0400
Subject: [PATCH 3/4] Fix #ifdef CONFIG_BLKZONED in block/file-posix

Ensure the code compiles without CONFIG_BLKZONED by placing the #ifdef
around functions only called when zoned storage support is enabled.
Rework the refresh limits function to compile cleanly.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 156 +++++++++++++++++++++++++--------------------
 1 file changed, 86 insertions(+), 70 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 972d641538..f2632af1a5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1259,6 +1259,7 @@ static int get_sysfs_str_val(struct stat *st, const c=
har *attribute,
 #endif
 }
=20
+#if defined(CONFIG_BLKZONED)
 static int get_sysfs_zoned_model(struct stat *st, BlockZoneModel *zoned)
 {
     g_autofree char *val =3D NULL;
@@ -1280,6 +1281,7 @@ static int get_sysfs_zoned_model(struct stat *st, Blo=
ckZoneModel *zoned)
     }
     return 0;
 }
+#endif /* defined(CONFIG_BLKZONED) */
=20
 /*
  * Get a sysfs attribute value as a long integer.
@@ -1407,14 +1409,93 @@ static void update_zones_wp(BlockDriverState *bs, i=
nt fd, int64_t offset,
         error_report("update zone wp failed");
     }
 }
-#endif
=20
-static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
+static void raw_refresh_zoned_limits(BlockDriverState *bs, struct stat *st,
+                                     Error **errp)
 {
     BDRVRawState *s =3D bs->opaque;
-    struct stat st;
-    int ret;
     BlockZoneModel zoned;
+    int ret;
+
+    bs->bl.zoned =3D BLK_Z_NONE;
+
+    ret =3D get_sysfs_zoned_model(st, &zoned);
+    if (ret < 0 || ret =3D=3D BLK_Z_NONE) {
+        return;
+    }
+
+    /*
+     * The zoned device must at least have zone size and nr_zones fields.
+     */
+    ret =3D get_sysfs_long_val(st, "chunk_sectors");
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Unable to read chunk_sectors "
+                                     "sysfs attribute");
+        return;
+    } else if (!ret) {
+        error_setg(errp, "Read 0 from chunk_sectors sysfs attribute");
+        return;
+    }
+    bs->bl.zone_size =3D ret << BDRV_SECTOR_BITS;
+
+    ret =3D get_sysfs_long_val(st, "nr_zones");
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Unable to read nr_zones "
+                                     "sysfs attribute");
+        return;
+    } else if (!ret) {
+        error_setg(errp, "Read 0 from nr_zones sysfs attribute");
+        return;
+    }
+    bs->bl.nr_zones =3D ret;
+
+    ret =3D get_sysfs_long_val(st, "zone_append_max_bytes");
+    if (ret > 0) {
+        bs->bl.max_append_sectors =3D ret >> BDRV_SECTOR_BITS;
+    }
+
+    ret =3D get_sysfs_long_val(st, "max_open_zones");
+    if (ret >=3D 0) {
+        bs->bl.max_open_zones =3D ret;
+    }
+
+    ret =3D get_sysfs_long_val(st, "max_active_zones");
+    if (ret >=3D 0) {
+        bs->bl.max_active_zones =3D ret;
+    }
+
+    ret =3D get_sysfs_long_val(st, "physical_block_size");
+    if (ret >=3D 0) {
+        bs->bl.write_granularity =3D ret;
+    }
+
+    bs->bl.zoned =3D zoned;
+
+    /* The refresh_limits() function can be called multiple times. */
+    g_free(bs->wps);
+    bs->wps =3D g_malloc(sizeof(BlockZoneWps) +
+            sizeof(int64_t) * bs->bl.nr_zones);
+    ret =3D get_zones_wp(bs, s->fd, 0, bs->bl.nr_zones, 0);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "report wps failed");
+        bs->bl.zoned =3D BLK_Z_NONE;
+        bs->wps =3D NULL;
+        return;
+    }
+    qemu_co_mutex_init(&bs->wps->colock);
+}
+#else /* !defined(CONFIG_BLKZONED) */
+static void raw_refresh_zoned_limits(BlockDriverState *bs, struct stat *st,
+                                     Error **errp)
+{
+    bs->bl.zoned =3D BLK_Z_NONE;
+}
+#endif /* !defined(CONFIG_BLKZONED) */
+
+static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
+{
+    BDRVRawState *s =3D bs->opaque;
+    struct stat st;
=20
     s->needs_alignment =3D raw_needs_alignment(bs);
     raw_probe_alignment(bs, s->fd, errp);
@@ -1453,72 +1534,7 @@ static void raw_refresh_limits(BlockDriverState *bs,=
 Error **errp)
         }
     }
=20
-    ret =3D get_sysfs_zoned_model(&st, &zoned);
-    if (ret < 0) {
-        zoned =3D BLK_Z_NONE;
-    }
-    bs->bl.zoned =3D zoned;
-    if (zoned !=3D BLK_Z_NONE) {
-        /*
-         * The zoned device must at least have zone size and nr_zones fiel=
ds.
-         */
-        ret =3D get_sysfs_long_val(&st, "chunk_sectors");
-        if (ret < 0) {
-            error_setg_errno(errp, -ret, "Unable to read chunk_sectors "
-                                         "sysfs attribute");
-            goto out;
-        } else if (!ret) {
-            error_setg(errp, "Read 0 from chunk_sectors sysfs attribute");
-            goto out;
-        }
-        bs->bl.zone_size =3D ret << BDRV_SECTOR_BITS;
-
-        ret =3D get_sysfs_long_val(&st, "nr_zones");
-        if (ret < 0) {
-            error_setg_errno(errp, -ret, "Unable to read nr_zones "
-                                         "sysfs attribute");
-            goto out;
-        } else if (!ret) {
-            error_setg(errp, "Read 0 from nr_zones sysfs attribute");
-            goto out;
-        }
-        bs->bl.nr_zones =3D ret;
-
-        ret =3D get_sysfs_long_val(&st, "zone_append_max_bytes");
-        if (ret > 0) {
-            bs->bl.max_append_sectors =3D ret >> BDRV_SECTOR_BITS;
-        }
-
-        ret =3D get_sysfs_long_val(&st, "max_open_zones");
-        if (ret >=3D 0) {
-            bs->bl.max_open_zones =3D ret;
-        }
-
-        ret =3D get_sysfs_long_val(&st, "max_active_zones");
-        if (ret >=3D 0) {
-            bs->bl.max_active_zones =3D ret;
-        }
-
-        ret =3D get_sysfs_long_val(&st, "physical_block_size");
-        if (ret >=3D 0) {
-            bs->bl.write_granularity =3D ret;
-        }
-
-        /* The refresh_limits() function can be called multiple times. */
-        g_free(bs->wps);
-        bs->wps =3D g_malloc(sizeof(BlockZoneWps) +
-                sizeof(int64_t) * bs->bl.nr_zones);
-        ret =3D get_zones_wp(bs, s->fd, 0, bs->bl.nr_zones, 0);
-        if (ret < 0) {
-            error_setg_errno(errp, -ret, "report wps failed");
-            bs->wps =3D NULL;
-            return;
-        }
-        qemu_co_mutex_init(&bs->wps->colock);
-        return;
-    }
-out:
-    bs->bl.zoned =3D BLK_Z_NONE;
+    raw_refresh_zoned_limits(bs, &st, errp);
 }
=20
 static int check_for_dasd(int fd)
--=20
2.39.2


=46rom 2e15b856cba2caf9a7635aabf82fd6d8efa1618d Mon Sep 17 00:00:00 2001
=46rom: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 24 Apr 2023 13:50:32 -0400
Subject: [PATCH 4/4] Fix declaration after label warning

There is a compiler warning that a label must come right before a
statement. A variable declaration is not a statement (I didn't know
this), so compilation fails. Use a {} statement to fix this.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index f2632af1a5..59c25436d6 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2512,31 +2512,33 @@ static int coroutine_fn raw_co_prw(BlockDriverState=
 *bs, uint64_t offset,
=20
 out:
 #if defined(CONFIG_BLKZONED)
-    BlockZoneWps *wps =3D bs->wps;
-    if (ret =3D=3D 0) {
-        if ((type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
-            && wps && bs->bl.zone_size) {
-            uint64_t *wp =3D &wps->wp[offset / bs->bl.zone_size];
-            if (!BDRV_ZT_IS_CONV(*wp)) {
-                if (type & QEMU_AIO_ZONE_APPEND) {
-                    *s->offset =3D *wp;
-                    trace_zbd_zone_append_complete(bs, *s->offset
-                        >> BDRV_SECTOR_BITS);
-                }
-                /* Advance the wp if needed */
-                if (offset + bytes > *wp) {
-                    *wp =3D offset + bytes;
+    {
+        BlockZoneWps *wps =3D bs->wps;
+        if (ret =3D=3D 0) {
+            if ((type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
+                && wps && bs->bl.zone_size) {
+                uint64_t *wp =3D &wps->wp[offset / bs->bl.zone_size];
+                if (!BDRV_ZT_IS_CONV(*wp)) {
+                    if (type & QEMU_AIO_ZONE_APPEND) {
+                        *s->offset =3D *wp;
+                        trace_zbd_zone_append_complete(bs, *s->offset
+                            >> BDRV_SECTOR_BITS);
+                    }
+                    /* Advance the wp if needed */
+                    if (offset + bytes > *wp) {
+                        *wp =3D offset + bytes;
+                    }
                 }
             }
+        } else {
+            if (type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
+                update_zones_wp(bs, s->fd, 0, 1);
+            }
         }
-    } else {
-        if (type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
-            update_zones_wp(bs, s->fd, 0, 1);
-        }
-    }
=20
-    if ((type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) && wps) {
-        qemu_co_mutex_unlock(&wps->colock);
+        if ((type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) && wps) {
+            qemu_co_mutex_unlock(&wps->colock);
+        }
     }
 #endif
     return ret;
--=20
2.39.2


--FATNXgV6+pjTBCgJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRGwfMACgkQnKSrs4Gr
c8gdkQf+MyQj5vwYV2QfmgReu7DFemS3SJggypHa9kaU25NHHnHSVaI0+2G04yOI
3NM2eB4XKaMD77BneL7hICXcq1xf5AYenkBBPUid2SGzm1ObmCRUC5FsuEfJU/6t
e2gsMU3N6rTGam8NH21bN5kYPrlOqHGXglWIWR2X/Sdvf1xelJgPeyLid6Vz8amm
ZH0NtKLMRsydai61diDKZnKx4pr0ES/+0v4KukjjmAK1LyeLWNux4MZRhgvDcm/l
HDGuM8ISxoz8zUswMrQs9tXs9W5X3YOYNTq9o3nvl803Tz1AsfhyoPphflViBqSx
EBiZtwvy2en8dTI1PySSoS9bveuhew==
=ocQ2
-----END PGP SIGNATURE-----

--FATNXgV6+pjTBCgJ--


