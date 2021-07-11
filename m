Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097CD3C3F54
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:57:33 +0200 (CEST)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gW3-0000ka-OK
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2gUb-0006mQ-VQ; Sun, 11 Jul 2021 16:56:01 -0400
Received: from mout.web.de ([212.227.17.12]:43731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2gUY-00053w-Nx; Sun, 11 Jul 2021 16:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626036945;
 bh=9vP1SKJ2ByWb1U3MxjQ6zjQS4zHEBen1kSDRHnvAZ2c=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=CXFWcsN5v30l4XNvV5iRFCS8qmb/39y9ksiGAzfP0COl2gvNdkRTcEttuJ8qojL52
 i1FO98wDlKbrE1m+VYuCNj9asONEtCyOafTTdG3Ym40kFs6ogK9Wkff7ZuS054CUlZ
 NPovTL5IG7evE0M5O+QHDvAg+C0Q45rDN8jwLsVg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.236]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7Nig-1m5xk43dyG-007mjQ; Sun, 11
 Jul 2021 22:55:44 +0200
Date: Sun, 11 Jul 2021 22:55:43 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 1/4] replication: Remove s->active_disk
Message-ID: <be786e1cff12baeb4eb0734885f9e39729ce479b.1626036515.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626036515.git.lukasstraub2@web.de>
References: <cover.1626036515.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ib5lt6cVRlWLOQadELFc8yd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:iRp18u+vyncm7Erpt1Jl2SjpxcwlVtmSIkrkWAaEmM66YFNC4OZ
 Ms5NKAlCY1M/lcBXQz4c/kZyQjS+9jKkFCw7onNZ0qsCgUXesYE6rNcv1+uEjmNlFCaclqL
 drsx+871nA1KdLRdKUoaXgTDg+KhtILYd9I64eAVTK5T0Tc3VYDe5LU1T08o1gGNGfXaAwV
 iFp3NsINchPCzQsCN9yVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8mntAEo56rw=:smWngTYPTGbrCFh5AAYi5B
 HpeHEG31y06LxPCrJX6cka0m1v8HgZj/AMFXJu7+Womgjg0sSFBFSmTFvq6QkoKD3UwVLmhtp
 o5vG6UmpYuNlt+0ACcfwCRufa+M44dt1s5TRN3y+YKmGSe04wyf3LC2tGQXL+AH4AM2pucSzc
 4fUrPYF56P4e8OwGFUwO4KSBTu4O05qjpGzH3gLxWENZ/Tkwhdmj70YnuYkfzpPfLEMBKHVl3
 ez56nwvDWQSy+wokUNt4UKsArjEO5Ok6u1A1Ro3+Y4SMNXPBeVwfy5JU5Nc1ftEVjYKeLg5LU
 Yp02C386YxdJZGtWxHRebaN0J0RtXXLVGEgHnFYiElKZ7xal98LU/QHzxuCENoZEOXd4iv66E
 BMjWbXbQkCmxy0NMWHbKFd1xHdkSD+TnVCt5dIHZDz2pWv8J0QIhXkWqMtIDgHAv2/0ev73v/
 olhvimbdT9IGnyN8TNtPgLU2eC+MdrMCQgY+M12XBLYRJXK1R9HUNCGfeLofNQasrM9KfgoSJ
 m0ublvtzAzwtqGSEcXnB8e6/JJ7zi01lk+DpnoSfJwCIpqHRhNAz0FbUajSSfLr4K49NyySLG
 jRIwEU87o4Op/JcFZArF2IvfzY7wYLIJB5voyTISZFOvGYKDMZkcTqAC5aywesHZxWqi2XN1j
 YunE6JX+k93rCSv55RCmikb+h2jlB2FwSB+hdIAXcFructJZSXE/spwzU0+Zx2+HuGb+9p0lA
 QWU0t0VQUDygx4vlNGeJPq0vWQSYHmzHJRUvmvxnNxZ188v0ybr6OM7jDzmeS7+e50jD9KI42
 MGSKRvWz6JCY9ZEt+HllapR1MFZRkLDbAkYve89HTeBq4xebApNeoaEH2lRaJ/vusMlnKcZ3Q
 5wlis3MeerqVQC+Ru+S5c3GpS955MDpsy7sajjr6D1iqb/Tz8advU1lqzrLaLyqmQII628T1d
 c1rIm6oCgqcC70XpAiG70vhkcNnoLzKyk6ZOmGHoI9GtiGFn1W41GUxRLgm/SHUbqqFPh3Jv3
 SLBrLoJ1XDZZ986vFNTpm45cmq11wxkCL1ye+BD9qlLhFm72vuCQg0J81z7HRlfQ5G4QAAfUw
 VgQ9kaBQD4tSilFV5oGO069DiObeKB7Rlwu
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/ib5lt6cVRlWLOQadELFc8yd
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


--Sig_/ib5lt6cVRlWLOQadELFc8yd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDrWs8ACgkQNasLKJxd
slhKjA/8D/pBKp5WXhaFjXMBk/qTAIO0uVi1sM1PwuwDx5qt7aWzK3TmC2UcfPx3
pq02TlhdOEUeJohAo+GVunuMJBcGUWAErraaOzrcZ6s/37rEPLQ5SINbjsTATNlS
awzU8Ij0VGAcCXJ0WJV3w9SD18PYHcnja7yC/00lszPFJ5gmIH9Tv/klGtSQfqzc
0dSfFFEn5UX3Vg6QYMA0bvem4f13cnSr8WwOgyQrG8RHGDuU09CDlcwC8GNPTO8e
MNjzVOz8qSVydvFYovmAXUYrr0qk+Jm6DajMc604FMpwRjXfSuOfA6ZDfHffLyRc
g5uoT3SCIH03olMAmT3xQKaW8oq+MXb/+frf9tPjs6B5AceiIqy1WXXihyGfjnCA
lEcggsohqXc6ybWt47qIlrOkf4kNi3wgffN1puP4fcEZyYVzmjf37or7OMjVz7yr
VNMYWJXNUj0u4JpX/0brXw8cN6ModP6wWG4ynmf05ubpfUS6i1O2roUipDCkL12S
GaRuoUyghLkfHYGcznbVuf9CCLKlSfjwulQoHnBpJSUHxUfmfnIuCxsviAXo+DgH
5cCJkOPMbsRnh3j7sIPhydEdTGT2eunS1wRw3Sw0k8TQW6eh2iOfnJRg8oGmZofG
6qBbwK82Iq2HZOr5rU9q0zVk5UUVWzSVNhHZ+fasW0AU4TB11Io=
=mNqP
-----END PGP SIGNATURE-----

--Sig_/ib5lt6cVRlWLOQadELFc8yd--

