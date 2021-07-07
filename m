Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB873BEE2A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:18:16 +0200 (CEST)
Received: from localhost ([::1]:46702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1C7i-0007yg-CK
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1C5X-000560-2R; Wed, 07 Jul 2021 14:15:59 -0400
Received: from mout.web.de ([212.227.17.12]:59807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1C5V-0004qb-85; Wed, 07 Jul 2021 14:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625681741;
 bh=7Kj46IqMRPfisjQHLg0tSdUCX4WrO/qJOxJZLFd6LDM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=qn8u3XSgYRFnyEH9kuiPCvaESsl9iRS8hYwX/sT6cO5M8WilHWRExB/E9YOV/NVZP
 QkHWSGVQcCKOXsvaj2NMFooWEmwxQx3LDbjfd2eaSjcrvQLXFD+5H+bj7yhGseZhCz
 NCjDh9sZrQxtZsJO5dxjCF13FJd0pbumeHFt7dAA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.194]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mcpuy-1lSPIV1SCo-00Zw2X; Wed, 07
 Jul 2021 20:15:41 +0200
Date: Wed, 7 Jul 2021 20:15:39 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/4] replication: Remove s->active_disk
Message-ID: <dd6c3cd4bc77138918c31d590569bdf77b7cef0b.1625680555.git.lukasstraub2@web.de>
In-Reply-To: <cover.1625680555.git.lukasstraub2@web.de>
References: <cover.1625680555.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y=LrgVk7tphqyT_ynQQnbZc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:w9L5VJkqEf4XzGQR26j8E00B7IaIFM8X2qqmRXUovJeDxnpexep
 2fl3chT6/0K56Fx2petfK27Qvedgyj3O6DrswM7vOGl6fSWmPRIhRojnCXOgL6yVLOEaeTI
 5x+hVzUUm0j2JTWZxhhWfEZXM+C0JUIvKw9gPO7ioQP9Jrtya+L6Ow5V5W9tV7qwZTID+QP
 9DQsRiaKw/Oba/pXlosbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:APelpnyKlbU=:OFHqFsUyYco+p9LOWZihPg
 25O+H4BsDALYOTZSMjj6cVXFYGZpXRMZ5MyRWtMRCs3AAv/VFK2KLMzyvmM2LKLdKjePjk9pM
 YOodvugI0rEi+S+rulxad9xLW4jzAfrGxHnd4HDMbVdaLGfShDE6/SLr9C54GZwAtWa8tvkvv
 zY/JKvqJjUWJ9yzu5LGQd+E8HmnzTrlomrMHdjxc3wmEYic82p71vrsxguysouWJClgC6JuGt
 R/Xe0o0i/vys0JM+wjxyGY0IHtW4/0R61K5dNZvzsmkNYbwPFjWndR5T1Kee4Dpubh0wm71cx
 b0tshjWOPmGs1cJcACKKo4Qovho42k1GYLk1UR1wbwi8/h1EdVoQ3vZWFJhIf9MbX9jm3EDeq
 psIC6evskuOIolbgET8R+lPy76L0+R/8+BmyxO29n19IHgy3zdVNGADy2gEdFdKL5ZCrFfDXm
 PCqOQeUaHWVjFyCJ/yiIOucwWLz3yE0q2HGA0o21Iq+QNO0hbX+dVLMos2Bpnl1FsWKwzY6KE
 jXn4mFZDg6P9DjAYI9W4J5pWLW9vqaXCSuTFVoKRCrnZuidgS5ylqoOEmnB2Km4rNK/leMy6i
 BfV7KxUZFeC9AQHuUfJGw8cANRUs1knxHFR9is5OqI92ZsbDnv2dvBCQN4stnIVenDHnvx5++
 BFLXKBTHgfe2Ifa6ks1+KVl8JnvSIKw5jJs/6WgN5bAdok+iW6LtlCZBKiKVsVW/fV6+tPVL2
 9dTqpCv2pMFzrXXuOexpiRNQwj9l2PzCqK4gxGbY8VwqJHxMGPswPrZpdwbbWLkajoirY7yjn
 uoBu8Lq2yaoANji6hPi93oi8Epyy9aXpQziWLnQETIyWCIfuqBI9FnDjtSOUFQJX94NhLMC07
 alHE8lObHSZAWhKlNGrmJTM/OOcJp097VspH1WBRtHGYTJaxm3g6fVYdzL52Uo6GdEwK9RRmg
 cFi1Y+HsB9rUNmvbIbKL+8tntXPIAtThB3UsvJmScydVAEPVXtbMQdytt1uIL34XKqr7xWxqo
 apZHlyW7FAOV5PWO5Jl5HIJCibARV90kj/G5R80/2SOz4UcBFsEWlQUgXhdiKJTh5fg4nhLK7
 q/xkqLlfeTUbs1TXEIGmrdlFtxQBSZYMSXp
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/y=LrgVk7tphqyT_ynQQnbZc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

s->active_disk is bs->file. Remove it and use local variables instead.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 block/replication.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 52163f2d1f..50940fbe33 100644
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
@@ -307,11 +306,15 @@ out:
     return ret;
 }

-static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
+static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
 {
+    BDRVReplicationState *s =3D bs->opaque;
+    BdrvChild *active_disk;
     Error *local_err =3D NULL;
     int ret;

+    active_disk =3D bs->file;
+
     if (!s->backup_job) {
         error_setg(errp, "Backup job was cancelled unexpectedly");
         return;
@@ -323,13 +326,13 @@ static void secondary_do_checkpoint(BDRVReplicationSt=
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
@@ -451,6 +454,7 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
     BlockDriverState *bs =3D rs->opaque;
     BDRVReplicationState *s;
     BlockDriverState *top_bs;
+    BdrvChild *active_disk;
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err =3D NULL;
@@ -488,15 +492,14 @@ static void replication_start(ReplicationState *rs, R=
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
@@ -511,7 +514,7 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
         }

         /* verify the length */
-        active_length =3D bdrv_getlength(s->active_disk->bs);
+        active_length =3D bdrv_getlength(active_disk->bs);
         hidden_length =3D bdrv_getlength(s->hidden_disk->bs);
         disk_length =3D bdrv_getlength(s->secondary_disk->bs);
         if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
@@ -523,9 +526,9 @@ static void replication_start(ReplicationState *rs, Rep=
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
@@ -579,7 +582,7 @@ static void replication_start(ReplicationState *rs, Rep=
licationMode mode,
     s->stage =3D BLOCK_REPLICATION_RUNNING;

     if (s->mode =3D=3D REPLICATION_MODE_SECONDARY) {
-        secondary_do_checkpoint(s, errp);
+        secondary_do_checkpoint(bs, errp);
     }

     s->error =3D 0;
@@ -608,7 +611,7 @@ static void replication_do_checkpoint(ReplicationState =
*rs, Error **errp)
     }

     if (s->mode =3D=3D REPLICATION_MODE_SECONDARY) {
-        secondary_do_checkpoint(s, errp);
+        secondary_do_checkpoint(bs, errp);
     }
     aio_context_release(aio_context);
 }
@@ -645,7 +648,6 @@ static void replication_done(void *opaque, int ret)
     if (ret =3D=3D 0) {
         s->stage =3D BLOCK_REPLICATION_DONE;

-        s->active_disk =3D NULL;
         s->secondary_disk =3D NULL;
         s->hidden_disk =3D NULL;
         s->error =3D 0;
@@ -659,11 +661,13 @@ static void replication_stop(ReplicationState *rs, bo=
ol failover, Error **errp)
 {
     BlockDriverState *bs =3D rs->opaque;
     BDRVReplicationState *s;
+    BdrvChild *active_disk;
     AioContext *aio_context;

     aio_context =3D bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
     s =3D bs->opaque;
+    active_disk =3D bs->file;

     if (s->stage =3D=3D BLOCK_REPLICATION_DONE ||
         s->stage =3D=3D BLOCK_REPLICATION_FAILOVER) {
@@ -698,7 +702,7 @@ static void replication_stop(ReplicationState *rs, bool=
 failover, Error **errp)
         }

         if (!failover) {
-            secondary_do_checkpoint(s, errp);
+            secondary_do_checkpoint(bs, errp);
             s->stage =3D BLOCK_REPLICATION_DONE;
             aio_context_release(aio_context);
             return;
@@ -706,7 +710,7 @@ static void replication_stop(ReplicationState *rs, bool=
 failover, Error **errp)

         s->stage =3D BLOCK_REPLICATION_FAILOVER;
         s->commit_job =3D commit_active_start(
-                            NULL, s->active_disk->bs, s->secondary_disk->b=
s,
+                            NULL, active_disk->bs, s->secondary_disk->bs,
                             JOB_INTERNAL, 0, BLOCKDEV_ON_ERROR_REPORT,
                             NULL, replication_done, bs, true, errp);
         break;
--
2.20.1


--Sig_/y=LrgVk7tphqyT_ynQQnbZc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDl70sACgkQNasLKJxd
sli2aQ//UWzlBaNqcwGbF8kBHQl6wMK+UYQdvqDM+AUe6wg6VM5RgIP9GtucqOrT
43FMczMqtCcK8PntyDfzhmhQOV6bRNTQ+5GVIEUlXCqomUWlQQzJMo+sKVZvGmWH
oyIkzw+lukLYi9kjKmLeKJ6EcFZByOz0EOPxtZH4yA61j8JZVWtP9xMZ8zgjhKQo
A2KoMfCbZt1nPUAhp9LBR6sh1NQnaliStp0cw4agKOYwecWdjgWP3CPVZYoJNS62
pvKkTylf0rZkMabsS+MDSUYb9yOBGANw1snB7j32POym0L+YPyMvv/pvjuJwrtih
dnYqPUhfRTZn6TOBAOapAME+abiIfj8o3LKrwJcdGlJa6VOBL8p/Sy40zNlErfoL
M+n466UGoF/LXFsDQZSW/dWgk6uUN3vJubu/+hmyEZCecAafqjJCfPmezfaTSsCO
CIVOEleT3RfKRZhD9AHflPkbx0qM2zVLTRYmt5fegyTwpQ/VtXuzhJf1lmhzntCi
8KYyn69gglNHAB/IAlZrRmSvbkghQeFIwNnKwOMC2L2DXtdyTeeScBcYPLaQH+Vu
4LBNB8OhHMjzCnF7Iw8nNAbEluIZsEboZT+m++G1TR2fc0hVBTRu+LdK2TEBYO5G
nbXjpu0Yg60mK1sC1dQFn+LQbkKrr+IKUuqAMRYD23zgAHsx6yQ=
=qUuA
-----END PGP SIGNATURE-----

--Sig_/y=LrgVk7tphqyT_ynQQnbZc--

