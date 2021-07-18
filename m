Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D493CC9AD
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 16:50:50 +0200 (CEST)
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5881-0007dv-O4
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 10:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m5860-00053b-NJ; Sun, 18 Jul 2021 10:48:44 -0400
Received: from mout.web.de ([212.227.15.4]:47927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m585y-0006al-Sk; Sun, 18 Jul 2021 10:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626619707;
 bh=mo37842ZcCneXuNNELXoRfP7tT44+hgbDC62XN80mMU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XUwo9oggSiAMsYxP8asLkP6hZGYza4LIRz+qfDr61XO4nqtDEFjIaHiLbvb5/LMyU
 i7cOr/K7CRi9gPA/7u9WDjTosDA8J20A7rK/PW8I0RCPtjwa7rIp1+cUfKnNi0C/ne
 mwvZRBF9vB+FYH+Ruh12USakZsqGbGsD45YjtiWw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.49]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPKB7-1lkXlW0FPJ-00PIqG; Sun, 18
 Jul 2021 16:48:27 +0200
Date: Sun, 18 Jul 2021 16:48:24 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 1/4] replication: Remove s->active_disk
Message-ID: <2534f867ea9be5b666dfce19744b7d4e2b96c976.1626619393.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626619393.git.lukasstraub2@web.de>
References: <cover.1626619393.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xnNNE2LNqNxdnLlyife6AHu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Whbm+Lof7bDsksclQHIInhM+nScSx2lpC6nl3JmEnWMbi28QxZd
 mD4kYCIKr0Cv9JTP2Cch8knH0NMDO9GyDkRlILlnUIPNzNp7f3ElFwDL32e8PyydOfv01Qh
 mkrkv+TgKfGVo04uJl2N7JNDmyeoYRec1TTlbQDVHCY1ZrsQgTrTu33nQAa9/6FvYFL5DaR
 fnlOKY1IfN1ljo52cPRRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cDLnOfe6/g8=:E+Ug47lBxiUMdji9+C2kk1
 Ddp2u/GvxNKRvDKoKFNvHkQr+HzlHcNkvSZaECALc/QTo4Brz1AFzNvf1NOUrogzpGN4hFvTJ
 04zKH/kUlz8U7GIITjESGLQuP9krmmE9RcyMmHxl5okl104mLbW4b7Fur1M8Lr6BKPPObEDwC
 7NfJkC6asOrM0CWiCHInBMcfWUq1fBMBFJzmRofwDFU67rhvy0oAqPMp+XHPR5UxWZpIHg4HI
 e7E0mUd6gv/Q5fd1yZzP2P8OxLjbBrSXpNUAPYvodQQ1XXL7tBGnfNMRdF7FB2hxQEq6Mw2BN
 ZNeO7U/0Ti5kUJGXNMUeJD6iwFgVp1ztfpcA+0ltF2XuPYSf+fqVlLkUZ7bTVaJLDPtHL5XKx
 nPttV5NkGuCmwllwk3r418Yjr2VzLFtDhRR0RGC6r3YO4TIMqBaZ8x/Se7fY3YLgobadj7XTZ
 b6wFDgWAsMTiLHRccRmZgWe1zHObKcoCyTPmlYQapABXJsiJW5b+dSdN/ak+vy9sa2J4tcb7D
 d3Ar3Tu0JCuXVMfUiy6JSwrRKpdGjaZ0iyKTAy7OMOa2aSDzZsSbfYjIGjxiu2IED5RUMP0+M
 NQSg2IBd+PK62wEASVdbx85Gn15KsVBqGxJXbIK8pXQjeoj1R6vJRkKzJz+FN9rVl0qE7Z7xp
 CVIJNQg88spx9BSvvb54G7Qvf88/SrJj6HCNR7DXfRF0sy55Vh+sAOVVJ0PbY6j2suEtf495W
 G5zD5VtpVClHnuU+CBPD+n4ILZl0nXo4DID3Px+nKateyYhZlltk2StcGAUlUK+7dDNkkIgpc
 /QlJMBSTuAbyKwEoIgcDDdp2OGCEcfE8dvx2GVlVXJjdWMHP8z4nnSx/3vjJm8y3G/gaYnmTw
 k7+RlSxHRXSzbPUug0ZLy+pbC+gqWDorajxpiMyyEksXIkkDACtXqhp7hUGEXHJ7AoSRmqRHl
 rVK3b2+KHmZgU/BVu4zUfeBNsSW6FYSArtZAxqi1WD7Zr8Qrvvs7DcD3EAAdQ/SvlXg87WiU1
 cYf5PlNZMYy7/h9uLcOFnotPfiUcySlyBEdObKoO35e1VKPWgOaVF0doXQAmH4ccKbOB/Xlc3
 cNl/1bzjQ3XwLsNtKpuD/M2PVciX1bKU8NE
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
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

--Sig_/xnNNE2LNqNxdnLlyife6AHu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

s->active_disk is bs->file. Remove it and use local variables instead.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/replication.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 774e15df16..9ad2dfdc69 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -35,7 +35,6 @@ typedef enum {
 typedef struct BDRVReplicationState {
     ReplicationMode mode;
     ReplicationStage stage;
-    BdrvChild *active_disk;
     BlockJob *commit_job;
     BdrvChild *hidden_disk;
     BdrvChild *secondary_disk;
@@ -307,8 +306,10 @@ out:
     return ret;
 }

-static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
+static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
 {
+    BDRVReplicationState *s =3D bs->opaque;
+    BdrvChild *active_disk =3D bs->file;
     Error *local_err =3D NULL;
     int ret;

@@ -323,13 +324,13 @@ static void secondary_do_checkpoint(BDRVReplicationSt=
ate *s, Error **errp)
         return;
     }

-    if (!s->active_disk->bs->drv) {
+    if (!active_disk->bs->drv) {
         error_setg(errp, "Active disk %s is ejected",
-                   s->active_disk->bs->node_name);
+                   active_disk->bs->node_name);
         return;
     }

-    ret =3D bdrv_make_empty(s->active_disk, errp);
+    ret =3D bdrv_make_empty(active_disk, errp);
     if (ret < 0) {
         return;
     }
@@ -458,6 +459,7 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
     BlockDriverState *bs =3D rs->opaque;
     BDRVReplicationState *s;
     BlockDriverState *top_bs;
+    BdrvChild *active_disk;
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err =3D NULL;
@@ -495,15 +497,14 @@ static void replication_start(ReplicationState *rs, R=
eplicationMode mode,
     case REPLICATION_MODE_PRIMARY:
         break;
     case REPLICATION_MODE_SECONDARY:
-        s->active_disk =3D bs->file;
-        if (!s->active_disk || !s->active_disk->bs ||
-                                    !s->active_disk->bs->backing) {
+        active_disk =3D bs->file;
+        if (!active_disk || !active_disk->bs || !active_disk->bs->backing)=
 {
             error_setg(errp, "Active disk doesn't have backing file");
             aio_context_release(aio_context);
             return;
         }

-        s->hidden_disk =3D s->active_disk->bs->backing;
+        s->hidden_disk =3D active_disk->bs->backing;
         if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
             error_setg(errp, "Hidden disk doesn't have backing file");
             aio_context_release(aio_context);
@@ -518,7 +519,7 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
         }

         /* verify the length */
-        active_length =3D bdrv_getlength(s->active_disk->bs);
+        active_length =3D bdrv_getlength(active_disk->bs);
         hidden_length =3D bdrv_getlength(s->hidden_disk->bs);
         disk_length =3D bdrv_getlength(s->secondary_disk->bs);
         if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
@@ -530,9 +531,9 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
         }

         /* Must be true, or the bdrv_getlength() calls would have failed */
-        assert(s->active_disk->bs->drv && s->hidden_disk->bs->drv);
+        assert(active_disk->bs->drv && s->hidden_disk->bs->drv);

-        if (!s->active_disk->bs->drv->bdrv_make_empty ||
+        if (!active_disk->bs->drv->bdrv_make_empty ||
             !s->hidden_disk->bs->drv->bdrv_make_empty) {
             error_setg(errp,
                        "Active disk or hidden disk doesn't support make_em=
pty");
@@ -586,7 +587,7 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
     s->stage =3D BLOCK_REPLICATION_RUNNING;

     if (s->mode =3D=3D REPLICATION_MODE_SECONDARY) {
-        secondary_do_checkpoint(s, errp);
+        secondary_do_checkpoint(bs, errp);
     }

     s->error =3D 0;
@@ -615,7 +616,7 @@ static void replication_do_checkpoint(ReplicationState =
*rs, Error **errp)
     }

     if (s->mode =3D=3D REPLICATION_MODE_SECONDARY) {
-        secondary_do_checkpoint(s, errp);
+        secondary_do_checkpoint(bs, errp);
     }
     aio_context_release(aio_context);
 }
@@ -652,7 +653,6 @@ static void replication_done(void *opaque, int ret)
     if (ret =3D=3D 0) {
         s->stage =3D BLOCK_REPLICATION_DONE;

-        s->active_disk =3D NULL;
         s->secondary_disk =3D NULL;
         s->hidden_disk =3D NULL;
         s->error =3D 0;
@@ -705,7 +705,7 @@ static void replication_stop(ReplicationState *rs, bool=
 failover, Error **errp)
         }

         if (!failover) {
-            secondary_do_checkpoint(s, errp);
+            secondary_do_checkpoint(bs, errp);
             s->stage =3D BLOCK_REPLICATION_DONE;
             aio_context_release(aio_context);
             return;
@@ -713,7 +713,7 @@ static void replication_stop(ReplicationState *rs, bool=
 failover, Error **errp)

         s->stage =3D BLOCK_REPLICATION_FAILOVER;
         s->commit_job =3D commit_active_start(
-                            NULL, s->active_disk->bs, s->secondary_disk->b=
s,
+                            NULL, bs->file->bs, s->secondary_disk->bs,
                             JOB_INTERNAL, 0, BLOCKDEV_ON_ERROR_REPORT,
                             NULL, replication_done, bs, true, errp);
         break;
--
2.20.1


--Sig_/xnNNE2LNqNxdnLlyife6AHu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmD0PzgACgkQNasLKJxd
sliZ1Q//WJCZMZ3DnZshz0rArD3DytmAmGoazBQAzAn138SLc2UnT8CXHIfK/dDp
ReXIgMBqOYOT5Tk92fSV0jpS9fkFZHgPW6HeeTczKdqcyfK2foQ9y8wTubwmAzvU
2Y96vV94R7qBky1M0n8Z7ewoJoche0+4t2Qxs2iOdumMd6rIXHwmwojR/5pzofZg
cLo1Ba5vE4mgbMyrFbX1adYwixd3rB2IPflIClfroF4mX0UEJtJadKUnX0Wm+njs
sYLyrwN8aeKGfTt6oaWtPFMvDpzymGObTorwbWue0VxCzGkhQ/UjJ1bwp8fdnQlz
Dpmu2TWMuzetrT2q5Tiyh+NknsoJ0QXtdUG5tYQygCm7B2qS/XiG2yC44DFQicPD
R42XjVZD2pqD/bL0MU/HOpzWqfYB9jpa3AfH4pLfHnQ2cNn+xX2FRbzE2Cpz6BwJ
Z0wgu5BzSadGF/DlhMY7t1Y3TsFkKtaL6NkM+M7dIx3W1wm1FaCTprGweComMPwF
oml+TXgAhooh4c0gQIIRZLTgf/oF8Sf1silvxklylQXCyWb8AXA8WRrDxphjBnmJ
SLjsAL8vwmwSTF4VB4kXexv+yY4CU5ITQ9m9kqrvUh56aO7w2AfKKV0MAc9yi1cw
BJ4n8NicrN+7WppwEpgH6p4J6zn7B5OFXiEoalXMO/mfndfQjLY=
=DEKz
-----END PGP SIGNATURE-----

--Sig_/xnNNE2LNqNxdnLlyife6AHu--

