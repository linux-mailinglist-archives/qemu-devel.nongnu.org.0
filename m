Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FA3BDB35
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:13:24 +0200 (CEST)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0nhL-0007ua-46
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m0ng7-00076c-4j; Tue, 06 Jul 2021 12:12:07 -0400
Received: from mout.web.de ([212.227.15.4]:47567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m0ng4-0004aF-VG; Tue, 06 Jul 2021 12:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625587908;
 bh=NjS96URExEYRc7T9oGctwODQjkHncOvUUUuuLOwPPXE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=kYi1N+QCA9rmapWCYbwgBxCx3Lkv6eBm+MeEI7gSYdbq9uxn0PgiUPstmRZmHz4/r
 RKNxsGEELskpaKaSQhsb8rQJYeh9ro5PySMQ9vk7OFbfnut7/vNnIoRFKecTv/Ev57
 xWTDdLdpUD7EhQwMaobdD23NZ9ZeqQST6XQtLqyE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.7]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M844f-1lEcwH27Np-00vdyt; Tue, 06
 Jul 2021 18:11:48 +0200
Date: Tue, 6 Jul 2021 18:11:38 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] block/replication.c: Properly attach children
Message-ID: <20210706181138.1c0bacd8@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R7zg0V0TWTv/8Ok+7T+e9qF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Y4bQeB3Gsp2rvI4Zj78kE8qiUbrVZaIMsUgFPHJKrge+m1YW8vI
 I03ZaQ9OvJkq0zjEU/xqeRqyT9P24NltGF2nM0c5oIKUZbFHeGecBcHuC2DjyiFqwawvVB/
 AzdvjNDR9BCEy4qQEgZgtbKHH8tcu9PFuVNhI4fT3PHfoZq4KKmDrSZjIItPH0C3nNnfsNd
 PqXZBrPdNwRoYqcOKqsHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gkHNhVabihM=:sUkE1R9ByepSbVxDuducAZ
 LoUmK/yC36OBnzNuDJf7IOTEVZPwKQKOM0RTempsjF6JHNeWiSLZH53L1eAsmguhjzG+rvrFr
 WVypn0/D9sLHOQ4zRdw6QxodNQqmUfcBKa9EzoLig0kAOlB0AEPqiiZytySCSnXGP2f9HKYZa
 a+rl1k90Yrj4EZi5a3LTQEz2GsjIOTHPAbUJdnUucwjVELYLOnz3MJgAYvmw10UH9Cb5pdYB7
 AvkKm0dvJJ61nmmpWyy5pW/FdGNSn1MsBFodrevu3JaGD67AwjMtTh6eaxhmoBhm0i0gihmkw
 kmZhhAq2L0cJt8913thnI06Vu+HjtXAw/hGGxzjn9zjEs3u5NAOqfgnRn5+2QdWjItqDQ3jN2
 +q2ekKrPESLA6c7JnktmqcyOzCg+Il/wl4Tk6oVQUbHljdut0Mr+om1Fgx4KQy5U9xcuPJx9R
 LIWVPZ3LMxhMn2TCrfc+3nNJ+RUGSe7ykmcZFISZ0ViotzyzX37bD+v/7O0F1oennMuKVJkQ/
 Kw6oktUiiQZ8rJ1yDo+UbUiBy71jkcw/Z5z5WCSfSauVQYkKtwQhaTcY7ttuVo6EmmOyV2JXh
 LEe/cZKHA6eGNnKZXZ98Cd4YCNtHZXoxFQbdczz6b5jNbZhBlz8aQWlJl26YCfhj5XX5rG2fw
 9mjO+6TrslaJC2J/S9rvnZ5OTZ3VrRgmcq4vYbEIgHMANbBEjjkKziG0+S+l1q5wCkvB23NmK
 GKqlDurDI1omswI+rGmzikZXmNtKjmzYbkklXToGCUD9x/d9qHw38xUTHVz4HNH8OL8IOFkDc
 DkXffUIpX9xl+c/uMESP2BTXeUi6H3lqGMuNIjk0H786mIlq70DHJ2Wd5lJgQvfidr4y4mnGt
 HItLqMc30+VrsSKz2Oo8UFGT/9wwC5ZqQFssJkzZo/Y226tQGkE486NEvtQi7EUlepl/yhJFK
 cwzjtxX6hiN/hUXO1B8v8v/bv7SQT3vIsx//MGt2hj3vFYwen8i7ifMfSDdHsxodBBbx+JfK2
 dG6FL9Pr7epceF3a5SB4UOs3Ajn/0fehpo1TD+n1BfKmGz6niLW+4/1r+Af9GLq59CmTkNKT1
 1RssFciu28Ppq89I/rDzenWOtV0mKuv/lCV
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/R7zg0V0TWTv/8Ok+7T+e9qF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The replication driver needs access to the children block-nodes of
it's child so it can issue bdrv_make_empty to manage the replication.
However, it does this by directly copying the BdrvChilds, which is
wrong.

Fix this by properly attaching the block-nodes with
bdrv_attach_child().

Also, remove a workaround introduced in commit
6ecbc6c52672db5c13805735ca02784879ce8285
"replication: Avoid blk_make_empty() on read-only child".

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---

-v2: Test for BDRV_CHILD_PRIMARY in replication_child_perm, since
     bs->file might not be set yet. (Vladimir)

 block/replication.c | 94 +++++++++++++++++++++++++++++----------------
 1 file changed, 61 insertions(+), 33 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 52163f2d1f..fd8cb728a3 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -166,7 +166,12 @@ static void replication_child_perm(BlockDriverState *b=
s, BdrvChild *c,
                                    uint64_t perm, uint64_t shared,
                                    uint64_t *nperm, uint64_t *nshared)
 {
-    *nperm =3D BLK_PERM_CONSISTENT_READ;
+    if (role & BDRV_CHILD_PRIMARY) {
+        *nperm =3D BLK_PERM_CONSISTENT_READ;
+    } else {
+        *nperm =3D 0;
+    }
+
     if ((bs->open_flags & (BDRV_O_INACTIVE | BDRV_O_RDWR)) =3D=3D BDRV_O_R=
DWR) {
         *nperm |=3D BLK_PERM_WRITE;
     }
@@ -340,17 +345,7 @@ static void secondary_do_checkpoint(BDRVReplicationSta=
te *s, Error **errp)
         return;
     }
=20
-    BlockBackend *blk =3D blk_new(qemu_get_current_aio_context(),
-                                BLK_PERM_WRITE, BLK_PERM_ALL);
-    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        blk_unref(blk);
-        return;
-    }
-
-    ret =3D blk_make_empty(blk, errp);
-    blk_unref(blk);
+    ret =3D bdrv_make_empty(s->hidden_disk, errp);
     if (ret < 0) {
         return;
     }
@@ -365,27 +360,35 @@ static void reopen_backing_file(BlockDriverState *bs,=
 bool writable,
                                 Error **errp)
 {
     BDRVReplicationState *s =3D bs->opaque;
+    BdrvChild *hidden_disk, *secondary_disk;
     BlockReopenQueue *reopen_queue =3D NULL;
=20
+    /*
+     * s->hidden_disk and s->secondary_disk may not be set yet, as they wi=
ll
+     * only be set after the children are writable.
+     */
+    hidden_disk =3D bs->file->bs->backing;
+    secondary_disk =3D hidden_disk->bs->backing;
+
     if (writable) {
-        s->orig_hidden_read_only =3D bdrv_is_read_only(s->hidden_disk->bs);
-        s->orig_secondary_read_only =3D bdrv_is_read_only(s->secondary_dis=
k->bs);
+        s->orig_hidden_read_only =3D bdrv_is_read_only(hidden_disk->bs);
+        s->orig_secondary_read_only =3D bdrv_is_read_only(secondary_disk->=
bs);
     }
=20
-    bdrv_subtree_drained_begin(s->hidden_disk->bs);
-    bdrv_subtree_drained_begin(s->secondary_disk->bs);
+    bdrv_subtree_drained_begin(hidden_disk->bs);
+    bdrv_subtree_drained_begin(secondary_disk->bs);
=20
     if (s->orig_hidden_read_only) {
         QDict *opts =3D qdict_new();
         qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
-        reopen_queue =3D bdrv_reopen_queue(reopen_queue, s->hidden_disk->b=
s,
+        reopen_queue =3D bdrv_reopen_queue(reopen_queue, hidden_disk->bs,
                                          opts, true);
     }
=20
     if (s->orig_secondary_read_only) {
         QDict *opts =3D qdict_new();
         qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
-        reopen_queue =3D bdrv_reopen_queue(reopen_queue, s->secondary_disk=
->bs,
+        reopen_queue =3D bdrv_reopen_queue(reopen_queue, secondary_disk->b=
s,
                                          opts, true);
     }
=20
@@ -393,8 +396,8 @@ static void reopen_backing_file(BlockDriverState *bs, b=
ool writable,
         bdrv_reopen_multiple(reopen_queue, errp);
     }
=20
-    bdrv_subtree_drained_end(s->hidden_disk->bs);
-    bdrv_subtree_drained_end(s->secondary_disk->bs);
+    bdrv_subtree_drained_end(hidden_disk->bs);
+    bdrv_subtree_drained_end(secondary_disk->bs);
 }
=20
 static void backup_job_cleanup(BlockDriverState *bs)
@@ -451,6 +454,7 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
     BlockDriverState *bs =3D rs->opaque;
     BDRVReplicationState *s;
     BlockDriverState *top_bs;
+    BdrvChild *active_disk, *hidden_disk, *secondary_disk;
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err =3D NULL;
@@ -488,32 +492,32 @@ static void replication_start(ReplicationState *rs, R=
eplicationMode mode,
     case REPLICATION_MODE_PRIMARY:
         break;
     case REPLICATION_MODE_SECONDARY:
-        s->active_disk =3D bs->file;
-        if (!s->active_disk || !s->active_disk->bs ||
-                                    !s->active_disk->bs->backing) {
+        active_disk =3D bs->file;
+        if (!active_disk || !active_disk->bs ||
+                                    !active_disk->bs->backing) {
             error_setg(errp, "Active disk doesn't have backing file");
             aio_context_release(aio_context);
             return;
         }
=20
-        s->hidden_disk =3D s->active_disk->bs->backing;
-        if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
+        hidden_disk =3D active_disk->bs->backing;
+        if (!hidden_disk->bs || !hidden_disk->bs->backing) {
             error_setg(errp, "Hidden disk doesn't have backing file");
             aio_context_release(aio_context);
             return;
         }
=20
-        s->secondary_disk =3D s->hidden_disk->bs->backing;
-        if (!s->secondary_disk->bs || !bdrv_has_blk(s->secondary_disk->bs)=
) {
+        secondary_disk =3D hidden_disk->bs->backing;
+        if (!secondary_disk->bs || !bdrv_has_blk(secondary_disk->bs)) {
             error_setg(errp, "The secondary disk doesn't have block backen=
d");
             aio_context_release(aio_context);
             return;
         }
=20
         /* verify the length */
-        active_length =3D bdrv_getlength(s->active_disk->bs);
-        hidden_length =3D bdrv_getlength(s->hidden_disk->bs);
-        disk_length =3D bdrv_getlength(s->secondary_disk->bs);
+        active_length =3D bdrv_getlength(active_disk->bs);
+        hidden_length =3D bdrv_getlength(hidden_disk->bs);
+        disk_length =3D bdrv_getlength(secondary_disk->bs);
         if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
             active_length !=3D hidden_length || hidden_length !=3D disk_le=
ngth) {
             error_setg(errp, "Active disk, hidden disk, secondary disk's l=
ength"
@@ -523,10 +527,10 @@ static void replication_start(ReplicationState *rs, R=
eplicationMode mode,
         }
=20
         /* Must be true, or the bdrv_getlength() calls would have failed */
-        assert(s->active_disk->bs->drv && s->hidden_disk->bs->drv);
+        assert(active_disk->bs->drv && hidden_disk->bs->drv);
=20
-        if (!s->active_disk->bs->drv->bdrv_make_empty ||
-            !s->hidden_disk->bs->drv->bdrv_make_empty) {
+        if (!active_disk->bs->drv->bdrv_make_empty ||
+            !hidden_disk->bs->drv->bdrv_make_empty) {
             error_setg(errp,
                        "Active disk or hidden disk doesn't support make_em=
pty");
             aio_context_release(aio_context);
@@ -541,6 +545,28 @@ static void replication_start(ReplicationState *rs, Re=
plicationMode mode,
             return;
         }
=20
+        s->active_disk =3D active_disk;
+
+        bdrv_ref(hidden_disk->bs);
+        s->hidden_disk =3D bdrv_attach_child(bs, hidden_disk->bs, "hidden =
disk",
+                                           &child_of_bds, BDRV_CHILD_DATA,
+                                           &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            aio_context_release(aio_context);
+            return;
+        }
+
+        bdrv_ref(secondary_disk->bs);
+        s->secondary_disk =3D bdrv_attach_child(bs, secondary_disk->bs,
+                                              "secondary disk", &child_of_=
bds,
+                                              BDRV_CHILD_DATA, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            aio_context_release(aio_context);
+            return;
+        }
+
         /* start backup job now */
         error_setg(&s->blocker,
                    "Block device is in use by internal backup job");
@@ -646,7 +672,9 @@ static void replication_done(void *opaque, int ret)
         s->stage =3D BLOCK_REPLICATION_DONE;
=20
         s->active_disk =3D NULL;
+        bdrv_unref_child(bs, s->secondary_disk);
         s->secondary_disk =3D NULL;
+        bdrv_unref_child(bs, s->hidden_disk);
         s->hidden_disk =3D NULL;
         s->error =3D 0;
     } else {
--=20
2.20.1

--Sig_/R7zg0V0TWTv/8Ok+7T+e9qF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDkgLoACgkQNasLKJxd
slisfA//WN2fVyNTtQu4sY7nWz7eX6+jnkKH9ryxHbs+qbyoarIs5JW+RYwNBGg7
sY3P+Tp/XFuSpIsNW65dqmJYL/G+tQKhGGdHazVR3kK2MA4bwlh7/iiJniJW5HIv
RZKA1PV2ujV19POKUBvWj/YVgEa2JpcCAikJfatPOZMESFxdBWI1eJMQpHYz/dJT
sX+lRf9YCmgW0D+gOjdp5p9g35w1G9TFD99bgChBtzBFawarUXqRLTlNRD5doIV0
IeNpV/KgyB+msW7TCfWblry1BgBtAVWAuBxPhJp2CZdswbk7YlSu+OLUcIld88g+
TMGHdryfRbMtH/Bi7Bkb05PhD0Bru2J2NSjzjCOTQaJkJ5Ndhdmgble/NTqigB57
6+0loAasZJxGYizjbhIof/yruSqETfKOo/lXirraFPprAIc73TIEYQWY/9lC/CD9
lfYkubebR2oGqH0/44QrmheaLr6ScsAgLyKoicFY+StowmMNJrjINCTM1I53ZE/D
EOj0gQ4cei+OkRbeL/4wXbStp5cM3HeFirzj74UV4iF27pMawTxunb997D8DJ+j9
2MnlVQ/u3ld1LttGjAklZMxCv/cRH9nrZ8UUeTBeDqWxvSvjQA60/X5TxbJgrQGV
vudiT5GjKmQZnxtD+ZrbJbLedxQ0AGQAkBGaDXyJ6Dq/Qnm6BQU=
=arGF
-----END PGP SIGNATURE-----

--Sig_/R7zg0V0TWTv/8Ok+7T+e9qF--

