Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508BE3CC9AF
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 16:53:03 +0200 (CEST)
Received: from localhost ([::1]:44654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m58AA-0003xd-DB
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 10:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m5865-0005Fp-Sg; Sun, 18 Jul 2021 10:48:49 -0400
Received: from mout.web.de ([212.227.15.4]:47097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m5864-0006ee-1W; Sun, 18 Jul 2021 10:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626619716;
 bh=N5lx1n+FmWrGGPFXhrHbEwqzKxw+96SNpsfYoSYG6C0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=s5j4yscwKAVSHFAuNN7/23veKi09SH4k8OWa6njWqaX7drGyA4iIzL+L6I1bOsFP2
 /mqW138Q8wnd93DjUGG9VcxHiWiq+V5/LgxKJ0FJrPt+4ITemjiNjH9PqRmWVQJ9rh
 BSBzyASsGqI4FyZYj6rh4HQPAXyjs8sAuVX7VebM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.49]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LZvfZ-1lOb5K37NN-00lmGG; Sun, 18
 Jul 2021 16:48:35 +0200
Date: Sun, 18 Jul 2021 16:48:33 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 3/4] replication: Properly attach children
Message-ID: <5d0539d729afb8072d0d7cde977c5066285591b4.1626619393.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626619393.git.lukasstraub2@web.de>
References: <cover.1626619393.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RZHpnrGRnZmXSu_YEnZN/t+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:QKPLLz5zud7s6bdSttrgjU8/h72t8FIWxow1Eroiu1v/TyeCnBd
 qBHBrx9qE+S4DFBh8ragN2FKhHuDwUNbVCqUm5G2h3oXMd/t3jloI7DD24WQUORxSKohoml
 uqp8avkPqMdIsg3FUEIisSJ+MFSH+6l+iH9Bt+CrxGNUI6RTSeNLCnZHZp8Yla1mzETeiTs
 5Ms8B8r8XFoBKAXT2g2/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XLGM+kjdlc0=:Vb3kZ1wvAI08aE3ODw99Fo
 syW5asjcGEPX0rWn+gAUahBEcJw2f5iurahTtYtG2csnmOHpgg3g8uKwRvbZ0vF4ysLtx8pAv
 nXfKb4y/+Z9A2yN+kYJpPz12OO4FK20pIu2vkbNzAvTgI2DG/ZwvXVd60HB/8DKVaggLuCzj6
 RZuTKHicoiiYZQka/lGvp/X4a1fXKiIL/ksHXhz6r8gjefsvbkpPArlfNIrylpmS4KneXfm8E
 AeBQ4ChdBio5io9P6QHQZHpei5/Pov7W9pREHB3JoO9lLX3weu1Bzh3+JKsaDJiT2Eq3YhFtq
 1Bai88HQtA7xOtca/QQvxgNSOf4FdmRZ45r5HwV+FlaSUtpyaz53SRBLRHcnmzlpIq3D6bztf
 3VDVocm0pYGb/InhyjXTuI/GFGN/XE3fmntc5nX0IOoT8ZAm2O+D58d0xs8UFvAb/Xnqmi74t
 bN56aGMwxggyi2a5wZCMIUKqMZQU2FkGqTCXsc2lrdLp7bY0emvub+gBzVZECR9qzT0m3kzbC
 D+0oQaau5q5ONQt/aQBdZH97f3yq6RZrFzvsOeBoYfchVbKrd5Isdtb2UgAzHxJYMiEj4plsO
 LloW0FjnRysFVV3pVs6NeG4EuMAnbd7aCY4OvxiNtihVVj6AFcu0YL11qzOKWOcFDp/Tjp69Q
 7iWHnfWbBCDhHgrHv7ZjmRYvjULUOvQEW2ULhDodgnvGeX8TqFUXmL9hJoCTBOnCSwodcrLvl
 g3Iu0+sPwYtK38pZ4W4IWXJe0OEJ3Uw6F/6BNXiCmyaGE8EQY7sUqf0/4sCqC6RvDkKDyyKpH
 pp9HwquwDQnmJxAXBOq+BuTzSMTobEwWAEk6Zkb3nB1f/lHmqZLRIgez71zphLpCtdiPB5sv0
 Oiwql8ojTlZBDCgIdn/ic+64+Z2ELWK0P5eQZJg2UDC0qsX2UzgMb8OZ6VyfOr8t3/o3/2+Jz
 EQpex9RVgSp77PKC8606Lv4CgZE2xZOQdE2qBPoxjL74QGTjSkPkmnU6BiPPe6RUuhKgbDWmJ
 W6ce6+EAymtLTja53NtlWQT5iPSkMkdu+vQyQySVRGkUY21fzLfrDOUSKDAXQ26N4y6/nhYaP
 H6HPueD7bKfF/cRL136hqdw7th+QJbhs16e
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

--Sig_/RZHpnrGRnZmXSu_YEnZN/t+
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


--Sig_/RZHpnrGRnZmXSu_YEnZN/t+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmD0P0EACgkQNasLKJxd
sljJLRAAkuNIR3BQAXSUjI5+Ttqhef1/Vc1T8KWGpwvFkhV8m3GYsyhIrgCBtSnl
6PUciLfJXPG8xAvupiY6l0fEmp0y4WyqmLzgttHUyDnUL1DXShI+vAebyRJ+jD70
hTLI8MXEjq32GvfmyaP0DtmlqyNx5/hrdzbpMcLW+D2CFCcUhNzrVUoNNAax7ru4
i02LiwoumNXpn3+frWz/lSBbF5MARKoz1CecTZeXG+O+0Bj1euUfJD1wtmuALbC7
Xv5HmgxQ3jeTfYfIAqa1UHqThPgGJ7+1rhYPlsAx2A6tpPF4tQ/e+sMWrEpo4nvz
Q0olHpCeZsaKdeZp+DCec8GfZPRe/r8w6MwKq+bxayfHkjOpCsHrRLb2GAQTjlCy
kUPX67uj9nfPuCT3eM7kWYQmP6+b08TlyZGCbhYaHmsB733uJwWZr102HdNOCeIQ
pf7LzGSJ5/d1MJgUWtjWawthWgvrOwEGo9wRdI5+0QdeL9weE05vAvPyiPXJ610r
IAEJiVVNII+/yXZuLkoR7YMrQSGMA4x9Qmnuo/r8gj5KWc85rhg1N309DXocWSlW
J/eqYXqtqNyjlqycWGfqimfGbGJnk1DEKpJ3UU1WOg/dTZI+ENmqdDkWlC4tEFS6
uP+5TACmdS3zD4DQOKOTJaukqxwkFqc2M2RLwbYnUiekHpneJhU=
=dpHp
-----END PGP SIGNATURE-----

--Sig_/RZHpnrGRnZmXSu_YEnZN/t+--

