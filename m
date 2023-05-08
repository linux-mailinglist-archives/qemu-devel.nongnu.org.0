Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74696F9D1F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 02:54:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvp7r-00074n-7n; Sun, 07 May 2023 20:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7i-00074K-EU
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:53:06 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7g-0004e0-Mi
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683507180; i=lukasstraub2@web.de;
 bh=QqQu9UpnrMOOeENfQVOCRiuOPULjx7ymu7Dgeocpbcg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=lWnrNpqRoTQXwBUZ95y3s3d9CF64iLhr5ilELhUELnftdEJhLQYfiU+uVVwttpZKr
 +/VlF9sXBxQJ87WFDUAnwgdTk1r/S7DhRvNf8CPAtn985bjoUq28r8lBKaHp+AS7Jv
 w7+uK4UT7U/rK8KO9yz3PDj8wjzAjG2oOYbJtgqST7JOa/F7mzuOk6ULeOtys1avgt
 XRdy3CGyd3eeiqw0EbSJuOV/ArH0NxPhjrl3eLsJbnsUdllYbSA6nzLSxNKmQhwlQ7
 gHMZzYJn/risJ+1t/C06Otpc6td6n4M7fr4gEq/eiIla8GgPAgahHETOiKc3ikGlYU
 /m4e29sE7EFXQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.115]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6Jxd-1qG1Yr1Q2T-016PW0; Mon, 08
 May 2023 02:53:00 +0200
Date: Mon, 8 May 2023 02:52:59 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 5/5] multifd: Add colo support
Message-ID: <6461809211524b24210fd4ac2ea6b2593fc7538f.1683506133.git.lukasstraub2@web.de>
In-Reply-To: <cover.1683506133.git.lukasstraub2@web.de>
References: <cover.1683506133.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uAkkJE8iJQBkQhm3pEjlxLi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:tZW2VOOupCD3OHINsQ1OyaW7u1OgAR1Qz9Xu8UvpXlkiVcwgx97
 cz6WbUzXCMKL7dhRNA9crum+fG0Xg7wsX4vWIGsS8fL5g4YSRMMaJ+4o3Cf4Fv6CqwLbHWr
 FcrdWWFKPugjRxcHEN+xoq7msuH0sEYRN7Pme2uNHRH4B04bM2GCWmny0gwwjKdR0mAPW9H
 EoqlZbqhMdkwedcmD5SBA==
UI-OutboundReport: notjunk:1;M01:P0:jN7hdHy0iW8=;yjQO8qvhTXsNKZ9pWQL9wP6K6UX
 938Pm8gpTwlNjNeQWZ8Q3l6jIHM5s+/hfFG8IKUJ8UJV0QOTOT7xL5Mj3J1pKiCXd6mpi+e32
 og3FUHdYdMKrGSXvL96Wq0GrQpHoXZQBmBBL06Iz3PfUw6R4iSrF2LuAXFbVQa1/TNX7s0ttq
 nCDvibUN5A4Qh1djuk8S4xFNSgUevyxN1ZLC3igeR1qVCMwVrAwlQVYc7DcGq/hSe5AhaIO7D
 SqsV2ZUnrCIeGMWAjOBJoX51LhRfS/WuXkTzD/T6ocM4TwXQO++yfvmIk1JeVmrLDVIs3pvIr
 /Vzd6b3LGHOIuzAkKITZZN16Q4QRMNW673uT/+z2FDjK9bVSPs82M0SBetDlQqGvba82jmGHA
 CtZjTi7aa5HALUTbCXnmBci8Khht51OH/YLTO+jqW9yysnRg4LXxpZxZadEJkK3j/xKGOayHS
 zSusYantLAcV6SNmAcFL9+R1scbnAMDvLJN/Ch9GlLOfZDxoWS8aQn1lT1Wn9ET6Tl0SMauHc
 GIEbI11tC1Mj/TIp6t8AFMjSfZFoktOCTeeDzGxzXRlvXgoVMbFhPl8I7y5w253iXEXVkDncT
 d+CHFZV/N5rtwfK7F8bQG8ZFYICSvfHxQJc7+cFYqEYtH4LgDzGAJG3DuR/Ua1mJkFQ6B+/J2
 wMP5YdfbRQrVMlAbSEA6FTgj0nDQN8CI7Vq4Vrq3qVZ/mpP5VQSDIE03wpoXEXhfJqVwsXJ6K
 +Ec8W+LQ59Di1LN029Ov2kH0Sba/Tilp7/s0lLOl0zBNFmNfhJjN8wc82R1UYiGmwFf2wiY1E
 WbPrm9HNiGFa7z3v+J1nXE1D9nTHZiEW4Aftiz4aX4ZYYc4c3eaPndJRd4QXIb75b+ty68Sq5
 YTma+R1b7CPbOqtq/7nAEI7086G3wQ0jnx3TvFSHuLvtG8rzC7tty6U5NA0mrn+rjkUikH5EB
 eQvxPDGUVbbX0z3CPvEju7dFEIY=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/uAkkJE8iJQBkQhm3pEjlxLi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/multifd-colo.c | 30 +++++++++++++++++++++++++++++-
 migration/multifd.c      | 11 +++++------
 migration/multifd.h      |  2 ++
 3 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/migration/multifd-colo.c b/migration/multifd-colo.c
index c035d15e87..305a1b7000 100644
--- a/migration/multifd-colo.c
+++ b/migration/multifd-colo.c
@@ -15,13 +15,41 @@
 #include "ram.h"
 #include "multifd.h"
 #include "io/channel-socket.h"
+#include "migration/colo.h"
=20
 #define MULTIFD_INTERNAL
 #include "multifd-internal.h"
=20
 static int multifd_colo_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
-    return multifd_recv_state->ops->recv_pages(p, errp);
+    int ret =3D 0;
+
+    /*
+     * While we're still in precopy mode, we copy received pages to both g=
uest
+     * and cache. No need to set dirty bits, since guest and cache memory =
are
+     * in sync.
+     */
+    if (migration_incoming_in_colo_state()) {
+        colo_record_bitmap(p->block, p->normal, p->normal_num);
+    }
+
+    p->host =3D p->block->colo_cache;
+    ret =3D multifd_recv_state->ops->recv_pages(p, errp);
+    if (ret !=3D 0) {
+        p->host =3D p->block->host;
+        return ret;
+    }
+
+    if (!migration_incoming_in_colo_state()) {
+        for (int i =3D 0; i < p->normal_num; i++) {
+            void *guest =3D p->block->host + p->normal[i];
+            void *cache =3D p->host + p->normal[i];
+            memcpy(guest, cache, p->page_size);
+        }
+    }
+
+    p->host =3D p->block->host;
+    return ret;
 }
=20
 int multifd_colo_load_setup(Error **errp)
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

--Sig_/uAkkJE8iJQBkQhm3pEjlxLi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRYR+sACgkQNasLKJxd
slhbiA/5AZcuTVqmqkbIwY8P7HkekgC1wqmMMDRZLoyCKsA/OHZlLiFcZ7oWRRaY
qADkC9Hoe40m8irCMS55N8OqRmfTLL9WSDy6FlcqCIrx/fq//myyBAUYRDEJ2x+y
1dWE50WS3ACc0/dYSxLL08cNwqYhNkHQRLhYslumQYfaD4kfKCAi+WgaOCL9oDxB
H0uLK4li3yrJsJzXMjTum+/k4XUDRZmz4Xz/yzU8afN51cfNJ7fsI1BMErlGnftV
lM93xc+peib5SwYl7Nkwr43J2KU+dOzkKJkuwkcfBJYxtS03SfcxF+7s4mDazONF
uV0UpzV/oxjCgoTvuY/K1RAi7GN1ScYptHEXUC15c2Y6zCDYXzn7I0Q+UDSf1jxM
1An//ky99Toj5FiZdUe0iFpElo7UcUy4BSNv1xdDH+kScXrLTVpNc/bbcZuanAdS
toMa1kSFSUVxq76300JjLBYiiZEwadQmsMV7+15Y1EqCQE+T7hprwFMPs5Zis4Gk
ehJjRD7fuGmo9vlNAYcBD+WRfLsv7XmMVXei0rSiZqGQ4DTaLT6OI1785Vf8ca9s
mkOoN3dT9mICXl2ZNhMLsfmNqj8OcsFLTUMYDTplDLgp2vXkrmpOs/46T0CK1yy1
+ZelKuMMauSQFfzgGqO0sJG/Zpp0X1nI0dV2NdMcz4xczJYM6D4=
=LAtb
-----END PGP SIGNATURE-----

--Sig_/uAkkJE8iJQBkQhm3pEjlxLi--

