Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79A63CC9B0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 16:53:14 +0200 (CEST)
Received: from localhost ([::1]:45132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m58AL-0004I2-MM
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 10:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m5864-0005BP-5C; Sun, 18 Jul 2021 10:48:48 -0400
Received: from mout.web.de ([212.227.15.3]:55767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m5862-0006da-99; Sun, 18 Jul 2021 10:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626619711;
 bh=RcT51x0uGvx/VXymThtSy6KzgjNEbcTDd+d3Y151Mok=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=rMV0RUsYCuvZv/V4by3epUl0DS0jtshrg0aXxKGWhbja9HGdjRCCdbIZvgwTjIiaW
 043t4odiAvqI7QcMUAPdz2gY252a88xGqSH0xSenZxuil+YIiXawRXc3pvAmy5zM0G
 FFmkV5f+QRj5HP8yNedu94YnlvBc0ruuqxl3wNQw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.49]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LaTtv-1lP91c2AN5-00mKW9; Sun, 18
 Jul 2021 16:48:31 +0200
Date: Sun, 18 Jul 2021 16:48:29 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 2/4] replication: Reduce usage of s->hidden_disk and
 s->secondary_disk
Message-ID: <1eb9dc179267207d9c7eccaeb30761758e32e9ab.1626619393.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626619393.git.lukasstraub2@web.de>
References: <cover.1626619393.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.eBmBUJdEd8e_Js_lsPu_.e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ZbTro+QLBFe86VqB8VcX1ZNfSVZgFvoEvwiEeU8d4TIPGu+DiM8
 JbRLPhv+7xi2kecP/klKp3BF+d9loAyFaQOnsZYUIFNs5CWRtxSp7LikCNO057dCqCROykJ
 hBsTqPXq2/t0aTm+I/n3FgADGYlOQuW/djA5aKhcHDVVpk/hPLhohcYUH6N8O9Ccoz8fqFJ
 Ttetmks4kJxDxAyQhRv8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qN293fo1s2g=:niBsgR8yaGaPR7sbIEj+m5
 gDlUCkYLvPG2JSBsRi8umC8h5mQtLKUjxPCI02xmXO/MFhecrfzkcvNNmP7XaclLdx4zISKSP
 SK6B1L/EncwoAO22Va3hxaOEHXDxzeV2sexCrtL1FKU3E4Yjpr3/2JTPVs+l1X76xNs3OWv92
 jCquDPwvAl0Dp3GovKHaEwF6sT+nXB7vQ3BcKtFm5P+DxawdUfK5b5+ao1vIFGInXeYYdrQ3h
 SM8L7TXj/UPGXXuUwC6yfbBT1lrvVa9AhukdtH8Ld+i1Scc/AnyCaVpMc1nwaM+Sr2pwS16UK
 EeOhC27hBOYzJWFV2lLPSCZIivcvmS9JMVYhaqhOSEvayR2C119wY3OoU5dchQOcXpZlvZ8s6
 0m1DXA/+oqv7Y/9QJuEhgiL/joIgYCLNzxbynbGYSFCk37GMb4BRo+rmHIXcxWHdfUUfEei8i
 5I+7LOiN9Pk8VEE8rvn0gABT0pFAWSjai5FnJpC2S7Mu8S7p/HmCghvukzUGGHuY9KYIX/M3F
 zl/ysrXjC7CYAUidWRoFtdINZernBPRnudKABA/cLRMvglyvcnphMRKmjQddJgSfj56fD/a1g
 es98Uij3vkNnxBuDZuRFSu40dEU4gM2dzuGNgXd84cXpM0JINYkdZT2HAXmhAHQAUfgX1+uET
 k9a0I2EZpKmHoWOGzDNyODQawAbb0/6YEF4Ug3XilbqWqj+ExkdfhNJU58I/5o08zZH+clC7v
 tjNYVUcvCzC5ypuyK43UseA4/uOIxNP5o9009J1YGDkXecKxkPv3zYrfDT20Lla3ZrcSZ4v1G
 n6f+CqDnV+UZN9VnHQBOcJdYYYwILw8HVDgbvt1YGirPNP/Fa8H/EhMTfBwONb/podWUwjEeE
 YTx+hw8g0zlGXQC8yf2OHFQpB8VwhuNrGxdNML/zlB7QfVSTYhTgADlR4s6DBu9QXmW30VfdX
 yUOZE4ycXFQi2phHrHtwpZR1QU1jxvVXHv1JG6OK5WOo6OOt81eKw+ULR/WXLowDXo3t8rI0g
 qTyFho6ST55VfucSDVYj6hGS47QTFtxf3M/TEGHKBKzBcbMdu23gT2pGSR3N/1LHtxrySiXEW
 805GWn9DccuCpBY5gpHacHKFfacepUM0F7j
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/.eBmBUJdEd8e_Js_lsPu_.e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

In preparation for the next patch, initialize s->hidden_disk and
s->secondary_disk later and replace access to them with local variables
in the places where they aren't initialized yet.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/replication.c | 45 ++++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 9ad2dfdc69..25bbdf5d4b 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -366,27 +366,35 @@ static void reopen_backing_file(BlockDriverState *bs,=
 bool writable,
                                 Error **errp)
 {
     BDRVReplicationState *s =3D bs->opaque;
+    BdrvChild *hidden_disk, *secondary_disk;
     BlockReopenQueue *reopen_queue =3D NULL;

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

-    bdrv_subtree_drained_begin(s->hidden_disk->bs);
-    bdrv_subtree_drained_begin(s->secondary_disk->bs);
+    bdrv_subtree_drained_begin(hidden_disk->bs);
+    bdrv_subtree_drained_begin(secondary_disk->bs);

     if (s->orig_hidden_read_only) {
         QDict *opts =3D qdict_new();
         qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
-        reopen_queue =3D bdrv_reopen_queue(reopen_queue, s->hidden_disk->b=
s,
+        reopen_queue =3D bdrv_reopen_queue(reopen_queue, hidden_disk->bs,
                                          opts, true);
     }

     if (s->orig_secondary_read_only) {
         QDict *opts =3D qdict_new();
         qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
-        reopen_queue =3D bdrv_reopen_queue(reopen_queue, s->secondary_disk=
->bs,
+        reopen_queue =3D bdrv_reopen_queue(reopen_queue, secondary_disk->b=
s,
                                          opts, true);
     }

@@ -401,8 +409,8 @@ static void reopen_backing_file(BlockDriverState *bs, b=
ool writable,
         }
     }

-    bdrv_subtree_drained_end(s->hidden_disk->bs);
-    bdrv_subtree_drained_end(s->secondary_disk->bs);
+    bdrv_subtree_drained_end(hidden_disk->bs);
+    bdrv_subtree_drained_end(secondary_disk->bs);
 }

 static void backup_job_cleanup(BlockDriverState *bs)
@@ -459,7 +467,7 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
     BlockDriverState *bs =3D rs->opaque;
     BDRVReplicationState *s;
     BlockDriverState *top_bs;
-    BdrvChild *active_disk;
+    BdrvChild *active_disk, *hidden_disk, *secondary_disk;
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err =3D NULL;
@@ -504,15 +512,15 @@ static void replication_start(ReplicationState *rs, R=
eplicationMode mode,
             return;
         }

-        s->hidden_disk =3D active_disk->bs->backing;
-        if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
+        hidden_disk =3D active_disk->bs->backing;
+        if (!hidden_disk->bs || !hidden_disk->bs->backing) {
             error_setg(errp, "Hidden disk doesn't have backing file");
             aio_context_release(aio_context);
             return;
         }

-        s->secondary_disk =3D s->hidden_disk->bs->backing;
-        if (!s->secondary_disk->bs || !bdrv_has_blk(s->secondary_disk->bs)=
) {
+        secondary_disk =3D hidden_disk->bs->backing;
+        if (!secondary_disk->bs || !bdrv_has_blk(secondary_disk->bs)) {
             error_setg(errp, "The secondary disk doesn't have block backen=
d");
             aio_context_release(aio_context);
             return;
@@ -520,8 +528,8 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,

         /* verify the length */
         active_length =3D bdrv_getlength(active_disk->bs);
-        hidden_length =3D bdrv_getlength(s->hidden_disk->bs);
-        disk_length =3D bdrv_getlength(s->secondary_disk->bs);
+        hidden_length =3D bdrv_getlength(hidden_disk->bs);
+        disk_length =3D bdrv_getlength(secondary_disk->bs);
         if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
             active_length !=3D hidden_length || hidden_length !=3D disk_le=
ngth) {
             error_setg(errp, "Active disk, hidden disk, secondary disk's l=
ength"
@@ -531,10 +539,10 @@ static void replication_start(ReplicationState *rs, R=
eplicationMode mode,
         }

         /* Must be true, or the bdrv_getlength() calls would have failed */
-        assert(active_disk->bs->drv && s->hidden_disk->bs->drv);
+        assert(active_disk->bs->drv && hidden_disk->bs->drv);

         if (!active_disk->bs->drv->bdrv_make_empty ||
-            !s->hidden_disk->bs->drv->bdrv_make_empty) {
+            !hidden_disk->bs->drv->bdrv_make_empty) {
             error_setg(errp,
                        "Active disk or hidden disk doesn't support make_em=
pty");
             aio_context_release(aio_context);
@@ -549,6 +557,9 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
             return;
         }

+        s->hidden_disk =3D hidden_disk;
+        s->secondary_disk =3D secondary_disk;
+
         /* start backup job now */
         error_setg(&s->blocker,
                    "Block device is in use by internal backup job");
--
2.20.1


--Sig_/.eBmBUJdEd8e_Js_lsPu_.e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmD0Pz0ACgkQNasLKJxd
slgTJQ/8CkCMDzzeT6AGpK1oZ6MvOLEI5m5H5v/IzCXN9ucJTMVUVs9jOCKy9iSb
A0/Yjhd/V35d4XJEMnlEo5KKxt1ZKU7acWdEZ2voxQaKqEHiAYWFMzPqa1EyvMAs
gKINpdDavGWdarHbc3duu6ftFPrlhbVdLZtTWS146cz8BJ/KyMJ0074dfe7eyjif
ej4sdpAC1mTCR3uohQ8NSOqe6hVVt3zWi3ikD4d3u1e6YoNv/YeIApyJBlbaWpHm
BBOQ45e5r04uNOl/dDCWtIu0Yr3VFufInuWx6qH36U+WEaWv8tGzZCXXrSpqmEem
rZ8sBFTXC5Zzz+p7XkJyZBXZsZVlg8glF1+LK1FaiL2h7vyMyU9f+o6n+J0qaLCS
PHI5tji9rE3Ui2pLqUf21yW1Nm86EFBd9B3sPpaqyphKnwWcSZxjuh9zlNLyle9j
3LqzwWsKllLtAk63hyIE7tFO1mvekmvmQEkJ5CzfE+aZ3PQKXW17AfuMNV0ZUqmx
0+z6t0+LNHfC4RqQY17mkGEAB038KiLc9BvEVOXMhO5gcZHgVfOqv3tLW64VuvdV
MX4t8jICb/G2QblEHoWXu45oBALbb8sMjp+jOPZVjmOQSOaTtQk033T06JD1p5FU
aqjiHxYXAIsP8Z28FKG+qMCqiQY2euv4MttjDD/quwxJVvVPov4=
=tG7G
-----END PGP SIGNATURE-----

--Sig_/.eBmBUJdEd8e_Js_lsPu_.e--

