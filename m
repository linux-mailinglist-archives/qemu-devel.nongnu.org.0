Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C5D3C5B98
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 13:56:45 +0200 (CEST)
Received: from localhost ([::1]:42822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2uYG-00035c-54
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 07:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uVy-0000D8-Bz; Mon, 12 Jul 2021 07:54:22 -0400
Received: from mout.web.de ([212.227.17.12]:53449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uVv-0005tw-M7; Mon, 12 Jul 2021 07:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626090839;
 bh=pxzzQbjQHGmEgHR63nik675WL0F0T3YSIqZLGM4zN8s=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EwSdXiI1qo8TOb2UO8fmhZWWp7XRe1uk6LbUWPkSRVjjYEd6j2kT+rL6nykX+QNOF
 HPqE0Ji5Qx+6re1f7fqMFYli5MGbm2jA73GHtVLZPVnVfUzWRnFdK95tNSOoDDLwvk
 5Fw638s6aLIliUPErNQ/2+F2XisKzrrEY141AAy0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.76]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LyUkU-1l7LqT1LNO-015rTr; Mon, 12
 Jul 2021 13:53:59 +0200
Date: Mon, 12 Jul 2021 13:53:58 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 1/5] replication: Remove s->active_disk
Message-ID: <be786e1cff12baeb4eb0734885f9e39729ce479b.1626090553.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626090553.git.lukasstraub2@web.de>
References: <cover.1626090553.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rAFL55SmKjFvvdAazMm4Eyr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:X+G9sxvYSLuMoQyYcZwbBOTHFYyaSrTEchBHOr/KP3SOizxO8vl
 MnxFD26wlHmOv9mo7lbeL66rctaokwhERu2inbaKe3mCTLPWWCvjJ+lkjpABTYI1nXWuLIS
 cwcsN+x9GdtbFBgHcg9Y+S27ThWs1ZZWpNG2tl6KW0l2G90v50XnCZxRCUPGexlYpyjMIOn
 xIiwJ4c24ukqY/mrQqFfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6DTqnbOKSXA=:v6bcy5me4rf+G2eadCwmWa
 A+lxWlfjhpncy7vRhPAAEbJCORKy8YrOYAbzjOGJPc16o1NeKgrhfUKr9ygqQm0rP/g9UVWy7
 W5XS69u9EM7SUHrbWoJ97AdlKDmtdG4HzdfnMEpsu0CvVrQlC7m+7ArHdU7/9bctSOsmesB9V
 nv+mQko4ZZSJ1Ejwc1BKo6VL/tC7s/g+Ne9c5sZ75Mhk2USRXYFgV5AuDA6aTX7V2RiF9PIhw
 54aS5bkAnQrxPrifHK7Ta+I9sDiz0yGtMNznjW+B1A9Tu4rPpqoqa4oubWjWqPj7ec472D9Wp
 JfljneED7byMbtsUzp9OeNodyhwhZ41Gv0KxGNc4uUKzQ3qAA0c5ZWXpj7l3sdbxBdYpeEZXz
 PCZDPbcUIkndfymM/pr708nzceQy3uwPsrmflaE43VWpm596DAPDjN4fP7n2DaVewYRnBL2eK
 H+SUwYJULSCQw1G8w2XyKOUMHITGxfFSo8xCUpltjKnBOqdgGJtKbM4IOroacufo2cRpy2q0K
 HOxkQUKdotwbrdaQMbyOIdL6hS75fa/oosb11bdh+z4aNN10DlWsqn/wJocdn7mkdmajw1E1Z
 1sk8RpW53JX2PBRdtVZEacyh75AcqHqBpt/O+VdJ1sSuNCwIJreNZ3+ZaZPEciGF0qP9gT3tx
 BjbSMsD7hTF8pWVgafzo/EpZt1/ZyTzv/VUbC5PWSayj1qmrw4D42mn8G0Uq+K/4A4yqlKQ6b
 5nTh3Vv8ZSVzrX2AmEO1GT6QwKam+gCTYcQ18SwQyrJfWD8MhovLmrhbWunGAUvpLrYdKJNQF
 P1J2IGW2yd/WqIrdTEdraCZmeQ35ftmv/68z3XVuMKRgUBEE/uj5sjKqNU/lx+7tXSaUCZhWy
 U06DQwChqNrNXNfukb7Z099dhaJl5FC85Oxi0dL1KNEfPxINNACRRHmvgU9YFvk9dvW9C31HS
 VjqHkMoFVn1Z185gjJiUoF1G1YBmzm3ofILBZTV0rLF7lXtZjJqBwf9FNJgC1OuwwjiI+5yg+
 tgQ+jZVYI7ICXip6Dihal+Der2qsvTIF5ufstGBt/fGtX2Chd/l5NXZ3QyxHDYlBpDAX6rMrr
 IaVqqOZysgenKqWQO35BtSg3DpKl7OHp635
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/rAFL55SmKjFvvdAazMm4Eyr
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


--Sig_/rAFL55SmKjFvvdAazMm4Eyr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDsLVYACgkQNasLKJxd
slhAQg/9HnLBrpbDAYxsmf7geuaMIh6fRlpzbEUlIoE73HKWHiutV8gDTs8q0/jq
cfZ0xqKRlnQjm5zRcea5JHH8OsVM8gT0L8WcPJXH5QlY5AEj+heRzpBuGgUjogiE
PIEXmm387yN7M+bb8ZYohE6HCdobqqPJI8WuRwFOUzVeOkmOj0YSlZmCQ1vfxvHP
iElgHiZRVPT5uOCUFWFWByrA4lnRqmvDWKIlIz/DfxmIwfXJvU+HIcAkeBPiX1c+
WACej5Q274IJa530C5ZFRTMrItkXIHwaso+MWqWjpqBJvJfoa4vKg7erzsUu4MOX
OUiysi2iSNhvFsSXZKAONPsknKO29GfmDdhE+JYh++gQ9/T56GFAKODtC0ojwJ4s
87J2FrAyTIYNugZZvCWza1lJgdw1mLswhNEYJg4aLrcn5H1rLnqv0dpEZz1zbK6g
O8wzZWGgUQnHe5p2TDUYSR/HNZDr87CKGf4V/1YfTs3jya5FBat0HZGD4rbVWXyC
sNLR4Q6UySPxHB7ylYqqKbdzKBM8Awc8jhV+T+Hg+44MUh5BFE3kuzGqmnnxnALl
lS44WoBbn4+kmrfg0alyi5f8o5Y+JF6CyXp+I0NKLP2yKzY6i1peBf/kBOOQenXy
HxAfz5m1Gd/5ftUTYMQCZsu8cyCUPKkuUoZzbHUfbK5j5zACvho=
=3k7q
-----END PGP SIGNATURE-----

--Sig_/rAFL55SmKjFvvdAazMm4Eyr--

