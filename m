Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF83C5B9B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 13:59:03 +0200 (CEST)
Received: from localhost ([::1]:49922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2uaU-0008A0-Ud
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 07:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uW2-0000S7-Ij; Mon, 12 Jul 2021 07:54:26 -0400
Received: from mout.web.de ([217.72.192.78]:45139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uW0-0005wg-S0; Mon, 12 Jul 2021 07:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626090847;
 bh=XrMo2wXI4WKVbPoMqH3ioO76/a0UaPjfPMhLaxMQpzU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=aIwU6bOisI5LN6VsOiJYlNUh902nie9Xrv5GqhJMf34dEqLpZmX+JqvZ6D8qs2o1q
 2Hlv1118OXDSkqOunZ0tVEp8hHSd25xoaKfhawyDaI4//TTQMsYhH1LofF5/Hf3A0Z
 gYkL8s+sBDnqG55wdh+07XKzzPRiaL61QAud4ZGM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.76]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N5CUp-1l2eks087J-0119P1; Mon, 12
 Jul 2021 13:54:07 +0200
Date: Mon, 12 Jul 2021 13:54:05 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 3/5] replication: Properly attach children
Message-ID: <4555f4074e16ed97e134ebd91ac5d9012f30fc70.1626090553.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626090553.git.lukasstraub2@web.de>
References: <cover.1626090553.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cggLnocPYT8Jh1tsVQfBA52";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:/3pJ3pjZuHGRFyVzk7IdQFwrfzT2drhh94cE6UeDIiO3LgbLpYw
 oBu7w29dvI3X3u4ozZpoCyj9dxtYpJCA/ryT9L9o6v3qUFdnZgfyu65MBymRz8hjy7cBugo
 z8/g3MpQW/XhZlyMotitqqwzR2mRdAByuWh3LaXdogI5rfOVjthrbPmKkTV2Vqu1grEfKLQ
 lTYUTLFXpGLM1Ewqr77nQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GH2WfwWWJj8=:iPTiXU8A7Ci2Xg9L+C9s+2
 CxsL/9mc4WgfJOvRgoDsKgNTghZFQ/yZGYbGVo+XHqQOH1g2DvQZHSnKqY48LKWcnSo/wsnmH
 1toedT/UG+pDdB5nk6OJ0vIE+ZkPElogXJ3v57sZbgOPvAFAAOwb3etOp4JYshWB538pstN57
 z6pOKY5DSSBSOMNE7+69eUJN7F/5mAJt9+tcUJU9Nk6NOooythA/W1b3mSeXcyYF6d4e4ecGt
 XxvVebLFEytpgrJofvnSd6fW8KaaTvdfIysmUc6+pzq6leKThOkA4y+8HkvQjZUiVlgZTjLc5
 g/e4YUGuWHHRO49gqKjSQnR7HOqQXJVwLDqqCgj7lkt6BWqL7+ftpe4JyhTMsUEDIcLjMN+1Z
 JDLnmnbgktbGFdayhOmlJeh0jWR5KeS7+2GlnA+6AMS4UJTZqvXkF2/UwGITRpjvfHZrpPV4p
 nIMKJsLIPqoIB5sD39qxcmB3xlq4CRxcyVDmke7SS/yGrpAyBuhd+XJaejsSr5DfKzJzu76YT
 L6f0JBYkcgegMD8/XPeh+LRwuQbqqJso22TroQ7c0/dE8NepaP5Bm/sfNUPQ50NmKmhZWtgHG
 1IQsU04YsOXRE0DwD2CBlcEnzFGz1ARW8tKrK000vcXWoo/6Bao7KfRqqck/hS2+c789kNROL
 QNYfY6bCknt5y4FnKIJg7TsmX5x+YHULDIdfSC777PLLHZ4uEJip/dg8aOdr+WK5AziSt4X3L
 goqwOK3lUhnBfXPpRfq7OR7cGtISmD8XBQymthmwngvr3NHfHsFbToZeK/NLXiimDuC1kU09u
 Wn2yV/3Cp4CyDmitCTUzCB/5Dfx+t/hbkD5BXvoqw4IqZhu6ABJGg84o6Joc/HZJBIm+x4qY6
 ksVRndXfY7QusIiuFbkSEY/bkC/tsuHSG8Vi1rRzTGXbua/hl6SZxD3pCFH43l41gmBTjVhiw
 yHfDV66T0SVnSON4Q8UJpPCW3Pll8sSg4cGN2hPtLNYHLYU+RL3zNPbJHDxgUMjkEsAW84aD8
 hkoYDF03+ONd+ZWs8B+2KLhBy4eP5V6SSf5y0qm40QI0V/DBNSkYF9yDgodAh3RCu/Gh8XSzC
 squ83eJAcJX4e/lEWedvLiBQdWdDWWAvo1m
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

--Sig_/cggLnocPYT8Jh1tsVQfBA52
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The replication driver needs access to the children block-nodes of
it's child so it can issue bdrv_make_empty() and bdrv_co_pwritev()
to manage the replication. However, it does this by directly copying
the BdrvChilds, which is wrong.

Fix this by properly attaching the block-nodes with
bdrv_attach_child() and requesting the required permissions.

This ultimatively fixes a potential crash in replication_co_writev(),
because it may write to s->secondary_disk if it is in state
BLOCK_REPLICATION_FAILOVER_FAILED, without requesting write
permissions first. And now the workaround in
secondary_do_checkpoint() can be removed.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/replication.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 25bbdf5d4b..b74192f795 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -165,7 +165,12 @@ static void replication_child_perm(BlockDriverState *b=
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
@@ -557,8 +562,25 @@ static void replication_start(ReplicationState *rs, Re=
plicationMode mode,
             return;
         }

-        s->hidden_disk =3D hidden_disk;
-        s->secondary_disk =3D secondary_disk;
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

         /* start backup job now */
         error_setg(&s->blocker,
@@ -664,7 +686,9 @@ static void replication_done(void *opaque, int ret)
     if (ret =3D=3D 0) {
         s->stage =3D BLOCK_REPLICATION_DONE;

+        bdrv_unref_child(bs, s->secondary_disk);
         s->secondary_disk =3D NULL;
+        bdrv_unref_child(bs, s->hidden_disk);
         s->hidden_disk =3D NULL;
         s->error =3D 0;
     } else {
--
2.20.1


--Sig_/cggLnocPYT8Jh1tsVQfBA52
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDsLV0ACgkQNasLKJxd
sliKoA//QDt0hojmg41HmJrzADE8Tpre058TfASs5lBSsSPxltsQCWcecVYgXtOV
LM/QUDtEbdX7KjQfu9ZsTsei6HhecRy4qRupuYBfBnUX3LRxE1GDQgzBdUbAE3ga
SWMNf0sdXwb68qx8Y1egttpfqE/SAcd/8Qc4CQJo0wM3s/DYeRmbCXUHzj5ziKBQ
LVH9Gknxo6OXz9YtugRxbx/AsUshk2IY9Bz2/3wqy+sN6YN+o3MAXOEwwTJid/uo
7nWdMlkvllVtWc40ENHE43SAc7JBhSkIS1vaaU0EHYw/bk7tAJ+DblPMi6lq29MT
JB7+Hncu0YPmDULIwM2FVj9i+FbUANvk5vXmlFSa4h8OGiCo22z3Bg/jkjbmkiv2
ttgiiB1ENsPxqluR3aJBKQjx9DSc2Qwwf7AAc9iRMsfX2QbRydLBqnCgNWF+19zY
Rccdptneu6jHxHxFGqq9ZOpG18ZgwaNx7GXkW3AD7GysuNe34v80ECQqVJbc8fc7
NqUGz3Pe6iaq6kSgk6pdw06Gn4DCRTD7SDO3JB1oXWvu0PJEoYtPPYUMk84WQqyT
jbgUYptBEwffBrdAofrv17S6C1QI6gM2asun90bzVxm/PBOz7dn8I4dUPrBnvbAl
oR28eS4t1vvSN0ilxHUWuL40L0pjjb9Im+WkYVnuWNBTaQaZfto=
=Fs44
-----END PGP SIGNATURE-----

--Sig_/cggLnocPYT8Jh1tsVQfBA52--

