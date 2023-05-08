Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DB86FB6A3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 21:12:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw6GS-0007H3-5Z; Mon, 08 May 2023 15:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GQ-0007GZ-JP
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:11:14 -0400
Received: from mout.web.de ([212.227.15.4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GO-00044l-QI
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683573068; i=lukasstraub2@web.de;
 bh=VWfgn0vy+usTipXAMejAs4Eb46fij7bBgTFx5TjexRE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=tEwfCMx3IUVsT0B9KaIq3NhKJxjCPNdZeD6nZGkh8IBON5B2Bc60mcX/8JT0it7dx
 ZJ1y4UENRV3+qImGvArCfDXvYcZDmihOyWx5+93wnpJTHWHtkJUcchhIvoTmdsTL+d
 3EvSr/T/jBQWsRs5r4yhbBn6k7R0RFE0pF15h8KlHGVx4vCk2JKpj5l5UhWCjkdt0k
 7mUPBBtMjNfylRuTjy69ySuFRMCCV5qTnGEKma5emFfACaGgF8QoPSiIQ/211iUVPH
 I2pGw6CXj5anYhq9x2ItY6CB+mnDMb5Z7tGUoleAvympktS8XEMjlFdCDHtuJvJe8o
 jGpQooMc9BEuw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.98]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Meler-1qWGQT1Og1-00akKA; Mon, 08
 May 2023 21:11:08 +0200
Date: Mon, 8 May 2023 21:11:07 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 5/6] multifd: Add the ramblock to MultiFDRecvParams
Message-ID: <88135197411df1a71d7832962b39abf60faf0021.1683572883.git.lukasstraub2@web.de>
In-Reply-To: <cover.1683572883.git.lukasstraub2@web.de>
References: <cover.1683572883.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/czZiEh3yIoLeq01A_wqV/KE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Kk4+CG4/VqX2tK8marXR1eUJOk5ILk4a9QF77yNcA1RYqFNsdc8
 PDt+PQ7Ms/B9rdfoWdoqRzD6G6WfYhqrn0N7fQCqrnk+GQo4HzZjbQsPVTWzw1EQs6/eb+p
 3aSHgrRpb8Z2pp6QXMk6+5C+CxJoJ1L6sNPHOcN3Ycgyk+6tAvrmIQ4tLsujmtLcss38RlU
 sqqZCsSFh8cciC38h557Q==
UI-OutboundReport: notjunk:1;M01:P0:ms2Gc0sDEoA=;lgzm1hrbRIA0pCFVeUedHGG0Sjt
 QFTtAvsj2GVUSAXBnD7fVbNin2XTPEEgR74CITUDb2D8FhvuKPGFn+RcjfseBiS1AuHwkDTlt
 2EP6dzzYhkrRVlOJMMcP3u3Jp/xnWQDtsIYas/Z+l+vYrdRTfcdXQE31+iREpf9HCxXO0x9T9
 hHXfh3UUlOv9y07JLUXFWa31QCFUia0Wo/VqAXHx0dgvUJk35AOj05fWXdp8wsWW5uf/Pi0DD
 kmKk3UQJ1TRO84RoJ/Tj5IVnoxHQbX8bF1RjIeM6BH9NFaB0KZ3NcwzuStpvb5B4Q8BwAgEY9
 red2+VRKcIDKfKPBVvfM/b3NUxzOOJ0ezFmzVbuzkjGcMYh7iwo7lEj0hL5uBZEuoMDGgAjKb
 06bCaX842QzerW3GyUhRjSAHMzQmdhy6vqzRGbsA0IG46xcmMbiD2dJMEIkjtBZoGwzlFhF8t
 aGLUyZnb043fj/g0qrPVsvrkzs8YtKV6AdTqylc/gVKPEYsrNFozYsLXKb51E+1kbDhLntUHO
 WSOmPKdK39Ydiw+i1UqYcOksGfO701KRab/RwXHI0XHSWQnOJgACvRDvzavk8PP0IuUwCj7wU
 6XAAwudS7vc1g6cAl7960gaSTSdkBSTBbJ3d/GvkRKiURa1lRjU3TedgTSq/g9Pc3mVbMXQYG
 pJ6lLaD7n0kSLk5gYZSufqYJkJHkl6ggl0xSlSj0XF1MIiLOfj1zS3Bl1yn5yq45l1J2ql5+k
 2pFP7sF6lmjs1aodgKypcMrDqSRukQhMuEdMW4chDOIXewZmKrswiVtwPTUz6Bnvikxoo9Fxy
 Byf9S9Y+DZub7c16qsvf2owTETwVqN5eMRtJRQadRDCKaGkMW4xv28UGG6MCNYIq0wowUDuCZ
 2DLsp6VEG+zXdFfZKKWqkPbTlwksG0hpqeLx1cjBpgQ26MX2JG4CUxvuKQ2qoaYBU2cUfSAgZ
 Gr/wgLovn8sJzCmFZnb/gFA772w=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/czZiEh3yIoLeq01A_wqV/KE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/multifd.c | 11 +++++------
 migration/multifd.h |  2 ++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index fb5e8859de..fddbf86596 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -284,7 +284,6 @@ static void multifd_send_fill_packet(MultiFDSendParams =
*p)
 static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
 {
     MultiFDPacket_t *packet =3D p->packet;
-    RAMBlock *block;
     int i;
=20
     packet->magic =3D be32_to_cpu(packet->magic);
@@ -334,21 +333,21 @@ static int multifd_recv_unfill_packet(MultiFDRecvPara=
ms *p, Error **errp)
=20
     /* make sure that ramblock is 0 terminated */
     packet->ramblock[255] =3D 0;
-    block =3D qemu_ram_block_by_name(packet->ramblock);
-    if (!block) {
+    p->block =3D qemu_ram_block_by_name(packet->ramblock);
+    if (!p->block) {
         error_setg(errp, "multifd: unknown ram block %s",
                    packet->ramblock);
         return -1;
     }
=20
-    p->host =3D block->host;
+    p->host =3D p->block->host;
     for (i =3D 0; i < p->normal_num; i++) {
         uint64_t offset =3D be64_to_cpu(packet->offset[i]);
=20
-        if (offset > (block->used_length - p->page_size)) {
+        if (offset > (p->block->used_length - p->page_size)) {
             error_setg(errp, "multifd: offset too long %" PRIu64
                        " (max " RAM_ADDR_FMT ")",
-                       offset, block->used_length);
+                       offset, p->block->used_length);
             return -1;
         }
         p->normal[i] =3D offset;
diff --git a/migration/multifd.h b/migration/multifd.h
index 7cfc265148..a835643b48 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -175,6 +175,8 @@ typedef struct {
     uint32_t next_packet_size;
     /* packets sent through this channel */
     uint64_t num_packets;
+    /* ramblock */
+    RAMBlock *block;
     /* ramblock host address */
     uint8_t *host;
     /* non zero pages recv through this channel */
--=20
2.39.2


--Sig_/czZiEh3yIoLeq01A_wqV/KE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRZSUsACgkQNasLKJxd
slhUcw//RWjSIMAfb4IVZF+CZzHnaMap5yCUr12nbilXGZD/HqXvyAOlR9RKJKi+
09yhZcgJy4yBc7BTQ6LetRmCU9QtyasD0a88euSIvF/B/oiLywPKYXPU5Gb5YPZL
CDKrd8eE20ewP8YYRFQKvdAMcuI7c9yKgrj9dtvBdfud3UXUqqYgMm++73+lhzqC
TJHGrh4jllkQxP6BbVLKqrLAqhsQs2NbbqR6J5XA09igTyP0ROqAUgO3wcU4Cw1M
gCQW65W6TWnyuPzvapxEsa4qqPIvsrZtjwAdcXrPHgRnHNg4rZBEpjQZUf7DeUm/
os44nBSaJoNJJ/Si9hehLzS2C4uygcmFqjaeyXFiRSo9qVM6JNqx3nUlFhXkfrVa
kfxThOpIgK0iYeJW7Gz3qyt1pT1/KK2FW9aoiqsM6ge+1vIEnYq0f2LY50vx0cnV
2+5om9UVGWQB6j5bSbtYgPq0ti6pdoVd9U/FisWNGQQorZPBtjEF3sKARXyYTKmw
CqfKo3gpeJxFQwv0gzCDfUqmAPbiHstDIn4IXdOUuAf2HOvK0Tk0dF3MqeEUrXNx
qphDfX+0EVSK7YVQm0Ok6ScSH5X53wzQSUdOiYnIEhGtGt/4zL0rGkwvcjg64Wlr
K1WdurK6dRLVMUl45LguCaLe/kLtLh897WDUsoauDumft5UOJA0=
=hbb4
-----END PGP SIGNATURE-----

--Sig_/czZiEh3yIoLeq01A_wqV/KE--

