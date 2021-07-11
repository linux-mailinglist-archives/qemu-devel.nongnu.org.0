Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D53C3F55
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:57:53 +0200 (CEST)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gWP-00011g-0Y
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2gUg-0006wm-VQ; Sun, 11 Jul 2021 16:56:07 -0400
Received: from mout.web.de ([212.227.17.12]:47605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2gUf-00058P-7Q; Sun, 11 Jul 2021 16:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626036953;
 bh=A/XRZCfRvwzPtRiTJSh318NsXBJY+L0/cZ01K0pxU5k=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=jSbxUeMejb8xNcsy1FdJFxYASEO1Ie5yzwvasCRiPOQWUGrpAKMY3jCREsodmet8x
 hja1BsHrPUTxzzwesG/f+wLOvTnxYkcpVm9PXjMGVnog8mWzfhWm07K4fLGFvP49H/
 2/lCgLWD0TVyx4m2B+3+NHPJfIzzks8S7+biI+K8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.236]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MGzXS-1lxkXy3Lzm-00DnFY; Sun, 11
 Jul 2021 22:55:52 +0200
Date: Sun, 11 Jul 2021 22:55:51 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 3/4] replication: Properly attach children
Message-ID: <4555f4074e16ed97e134ebd91ac5d9012f30fc70.1626036515.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626036515.git.lukasstraub2@web.de>
References: <cover.1626036515.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C_c0l9xa4STrqYEksN8rqbd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:sQZqj2APq6HqL297bqEvNA0c/OxFWuKU/PJAo+GNYdsZIwEO1/Q
 Bz4NZaqB1lnljcS60N6nnyFb/t5yRimVL5sWHcuKHkJivRfNj4DK8IYGrxo+TRu2M3UyjMT
 t7Qk+krw5zf2nPAa0X7eVXmGU6Q8x0FEJgQ0Y1IR8BK2R0Xjyo/tIu6Lo0RcAd0YcguyZMa
 pkzCqG3wCjbJ86oy5tpYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kVuFb9JrXEw=:bvVNDOI30QQujB9FP3BmbN
 dTkB2k4thyx6YemeF/BkJQQQeNLxrHisEgL+JGx3QnUPocoq34T/Iigomnr+BAB76vSd6Kb/7
 p7tYN4JCUF2LB9Xu9IbwsTajEIeLBFR2bJ2+Ogo5H9R4/eRsEuDz6nPZHmwuMyKn3mHi4ttOf
 zDMf0sXt5/hXQAdETUJLSRhN360GE/xDZ2KR5MNe/+WUD0nDQzRb1vYpB2pJpvfMQKELxtO/L
 IvN6iTB9fOESkX0IpuGneSWNXYyFkvZNjSoG2fbziDqmnM8nLZKAWD3Lq5BaEboiI6PBep9z3
 alSFf519u9kBcJPcXs/M7gHdX0utwW+iP8lCRpfz+2rtUK2HrrDeFdZmNn/TlyoCdWBHu+LEK
 BjTWTf9rq81bVsp8MfagAYg4KHfyJ3Yg5jcjO79ArJIl3JQD37L1+H13F9f2/1Mc6ivRuWEHL
 y/ReBnz1D13OGMrFnK/mB05gR+zmL512kcLrDeVz4HtUrnGGOwkhM0TAdGbHdRhBCbUH7UJLc
 O+8yr0XtDciyk4hndpwMBw0dwwpLHs8oZZxSH0EXxzTMz6BcP7WXMhD/I4349sh8GPnMgrq4G
 qhOy0j20YY1b0f2QMK8A7tj9kMMILdpFQ1Q8skCUKv7Bk2TVmFhyT7pom+PJ2KFZ6BC3S+9Us
 X/pU9KHmsoaxNqmkHepmcpi8MJ6UGViQJ47q9ovvCLPyeICXZDVT7OWcv88y5ciS0ZlpuHk4A
 8OXs5uujhrTdr/ZAMIPomIc4gzW/LsEWb7cOVejOaaFpEZJxIixICDDcGrC2V8JQkhpPnHWRX
 LfqdwWJiJHMNoKPOqMAYw9T5qHMfLrHwDAUVuyad4dAUoaV6C0OjVtstW3oo3QYB/p/5uMBeJ
 ebt2/mgPa6NF4wuh6kP2Y3zLKXjhQpx1C9mzeB8jy5PfD3GpuByRMKW6rP1eN3zXxV9AiHfs3
 9LuiGHNMwVaeobHd6kG0tx4mkAR3qvLyhLkvKkWj8QLk7alWawJSPdTX5DM/lnfp+BhCoPP+7
 tF6m0k4zQUNE18AT3DyF79a/OnfezUQ2JQsVBaA2XXZg6kSmG3S3dS7Q/+4RT1KgIECo/ARFO
 b3PNkH+AhwdiBUJmHeN74bcWGrt67Q06P7d
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

--Sig_/C_c0l9xa4STrqYEksN8rqbd
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


--Sig_/C_c0l9xa4STrqYEksN8rqbd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDrWtcACgkQNasLKJxd
slgMDg/+KK/dRY94xiJhCFJURI5kH9s52uvW+mdirJA+h4t+HluCcTDh/+EjDYEX
nZm4+GpecKIn6iqpq4qzazECA9IdIatySpxidYF7/7v9bktpQQSsGHnxaLQeyNl+
bHGsr0QCxbbEcrczXz+i1SNB/potwaxy742enhB41gufJkmiYlSKP650JWyJirzd
oex/KySj25WfwOIZYRwahGlKeHeaffayyWM7V6b4dsH090hBwff18+bJK782k9qM
7rTfCr60ud4YqO1FweqvBUsRQvPl96C0gGPrp7wGznt95tj8qfmUTbzAI0wt7YEr
WghghoYLn10n7tOoERWG4WuNwDjYmr0Q9q66QwgHTDxTbvN3hjePu3gCjfSY8Ko1
qKX44Kz/3E3h8jFSA2YEa476l297YCwP/1Y4PMLpTbT7e6X5drAoltHeMKWMli2j
gNjUubBlyinarMYj0/yWhglw2+9RHWig4HE+HHHRHDQjk+4hdhuPbjsg1imcaJHX
/pLlZnFk9r0STW5xgspEFg68StQPCjfUaTpyQz2TfhSMCclQPM33gc6CHDWA1AXc
1byMK38fuVK8CgbuzoZNEHOa4ovyKUTbEGkuIuyngm/Fu0ybQ9c1x3VYoAA6sYPT
0ReoNhrUbD9s60mr+DiYTHPD2RIN8ldQOPyRpUnU+qKwrnfskWc=
=873q
-----END PGP SIGNATURE-----

--Sig_/C_c0l9xa4STrqYEksN8rqbd--

