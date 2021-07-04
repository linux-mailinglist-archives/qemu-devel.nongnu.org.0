Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4AA3BACC5
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 13:00:41 +0200 (CEST)
Received: from localhost ([::1]:47298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzzrc-0007q9-QV
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 07:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lzzpa-0005Ak-Ed; Sun, 04 Jul 2021 06:58:34 -0400
Received: from mout.web.de ([212.227.17.12]:46285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lzzpY-0001mt-DS; Sun, 04 Jul 2021 06:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625396296;
 bh=MWV4KaM4Y4W7SLQFc7qbND1ZaKlJQGA7roBKwb6fvxo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=XZjCIgpLtbjYndk/6ge59iamGwOcOH8wFksGdAw7z4KeRsKc3qgb7vrzSaEZHGpF8
 i8WMUb/KAawzgdv+SlINpvamFmrU1Z4BvrE71DncaiAHd4xvyqDkNFKy0mKV/Z6HMy
 BiJItFQaHVFLFcgYUGN/hKzHK8+Mf/oyyjKvJFY4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.115]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNOQy-1lpbog2LXO-00Oltr; Sun, 04
 Jul 2021 12:58:16 +0200
Date: Sun, 4 Jul 2021 12:58:14 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH resend] block/replication.c: Properly attach children
Message-ID: <20210704125814.369c9805@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//mMEtJCrNYeioTa/Ky+e_Hb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:/KoslEaVh0PYC/VqAxwaK+5W8R/0zttpTM1XvFur01ux5E3drGd
 rZTRML859fu1y4bTceBK900REmE0y3Cuc0nnz4wbfWcIUB59PKjt9Cu+TaJOry/ts5mFhxA
 fxBaNvPDa6bfG2h2nwMzz4vQ8KNz2ZCZVgEDhSbHPmuaQHeZwOvFlSvgwbW90y3XM4P4npy
 nESgcIywLuez/Y06bejkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5qaHF3b1tEg=:yRmK1Lpf+w7R8W1aILOwyR
 Zj1xUw16rDBoRaxv0tlmr6MUAgZwYEuUzUCTNmbuOB3Bm2o3LB+Ywb0TlQTBboy2kHqBGN/FT
 E5BZY+jBFfYUfSqdPdlXXPmqpAQDBicRHrvWVH0uk3KE2958oaHSZ3wwjfTM7HhQr+h6DrTpX
 B6io7XWjeLZX43w+6N6twO0e7lwZ+b6XtOHU7DMsQUl+HMwoV/cG8CUI7QFLlDdPPWPl+r+Cf
 xD9UcxucylePCUsAePtHmnMfkBec6jg8/30MeKBZz72uZ65svzhk6zpnCszxqVhEhEBTDbDQ6
 oumy6eMhPWrsZoI5FN6TTxx31QXcKiXhPXaftFyn/Re/zAI0K8xaLIKBNmsrCaRju+h3kV7kK
 TiwKcT/FeAM3D/85Z9VJVLKOyuvzb3IXnTqIllVFIeRxvRjPD+EfSqYH0KGQVTvtKsWAGaKdW
 Yfask3NBHsaF+LGTUUXg0AJF2FoqpzYPdBIuAXNgzz4GgUmTA+0J+66JAkzg+DPg+D2cMKUXM
 XDmBR2r/syeq/VLFWpSyH51BUN7eNWKw1ufGhIJ/Xh+KouoepW0d7DH+hP1ghIbprwZRdjrkV
 nwJncqAefrfvIA2NYtOlfJpbK3MBabEfvaP2hM+K6jSabf3fQm6HDPC//AwjKGe0YTNR9rA72
 q8Kp6a7xoSpsaYjurCEuimqxAz/5uFS9QWp1mA0pxSglr9/i7EmF4jXvD57bhDX+V6zSdLjyq
 vt8kXOxM+ezERPfWd4AiaspqZCcAKciyUMEN0xK521PWvTaETLYzCRb14H/HLkTbNf9YRE672
 +nJlfkln7KID1rApw7I8b0rTKr1kLon6Y4ZQo5AHxUcctcy1+bekuHZ9ZemRgvuVISZlwopp8
 EeFGOlakRjqNhRHYwBzngkCmlFBR1FHGZWcXNTx0Wri+GAO6e62Db51F8VzBIJhb/VcsrRsjP
 ilQb5xwyVmAiw92EpUDUP+oFju2hXQ2Sc/qsAmSx6fiRbsio6oppIzIB4VNmlxa+1hvga6BkN
 LGE2Lgtgs7nV09scNhHeDoS8fx66cZ/wpmdW/ip+5Lvx9q+m4XVdDAU106bnTB8sgHUHhhwNo
 vHGIVWTHnIT3+dh3XJRfzB0QdrZsMnXykzkDVavnwDE6VBB2PzPDu+kyw==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_//mMEtJCrNYeioTa/Ky+e_Hb
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

Fix CC: email address so the mailing list doesn't reject it.

 block/replication.c | 94 +++++++++++++++++++++++++++++----------------
 1 file changed, 61 insertions(+), 33 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 52163f2d1f..426d2b741a 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -166,7 +166,12 @@ static void replication_child_perm(BlockDriverState *b=
s, BdrvChild *c,
                                    uint64_t perm, uint64_t shared,
                                    uint64_t *nperm, uint64_t *nshared)
 {
-    *nperm =3D BLK_PERM_CONSISTENT_READ;
+    if (c =3D=3D bs->file) {
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
2.32.0

--Sig_//mMEtJCrNYeioTa/Ky+e_Hb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDhlEYACgkQNasLKJxd
slj2cBAAuE06ciQwyrLl3aFoFHVrvsBSbJfyWLk8DaVXWXUZRJ1jWe3mZquFntNo
6hSIqzuMRhxx0F4j+r4dWB5NFUzIjT+zDrk9eQ10d2/MyORQ2+OpODP7/ti/mZF2
hBHfDu51Y0Z3CIlREqVBHscXvlWb0YzK0VH6uDT17hXsuXcxOxewGs0ZM5QlPftB
uBDw3IDy9qxZqoZfmbWgQz86CEEudTo17w68puZ3JlA1eC8tNtkGQ9o9TVifSR7i
pYl5mxFkgzsnHdeHHEzidr5qntuX6MLz1eBtpd2zjFOF+UtDhZLG1zJJVLP34M8t
nHyrguu1gNdbIo/HRn3rl1TO1xoKzeK6egfX+weYPzYXeb0PyElThZ4rabXtYlau
miuEgZWHaV/kPu//gIy+RkU8ivzdxW0nXgJYmw3xZ+NO5wLpMYG+kQ6gZOjcd4de
D6KUgYADI87Ozn9kbIvUSaaTHAKLT8WWetobsmJ/u31eKCbuKX2zTfApR3JKiE5u
iZ5zRHj+GmrnBcqLUQDUP+9lBMrPZTyvpxubitf9xuE4wmJuFgG2UjIl62TdDrXc
yznNWS/8zOd5qjBcxKJPD0Hh46eLbHiAvjmTg7O3dkTkvEIEjyAvzKtVuwyrmV3h
TFwD9U6nKkB2M8lwQTridYzbYXnsBUrOhIhOR3ferBAgkZ0jsew=
=MUWn
-----END PGP SIGNATURE-----

--Sig_//mMEtJCrNYeioTa/Ky+e_Hb--

