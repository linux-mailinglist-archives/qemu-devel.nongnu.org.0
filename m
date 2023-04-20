Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B80B6E8EC2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:00:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppR5G-0005Kr-1r; Thu, 20 Apr 2023 06:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppR5E-0005KN-0L
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:00:08 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppR5B-00020S-Os
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984800; i=lukasstraub2@web.de;
 bh=BVMIw9f2vEQVx3bM1fGGYzyeAeVl7JmqJxoQqPQyLQ8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=B+zWA8wUSSJ8QkgnpSfWpSZ0WTXVVsm5xOVP7kg0FFxcIdn4FCdKl4cDlin7nYeOk
 WFCLAFvn1FFGFD3ymIvOXCAGZFdyPE3wvWzkk3RJiBsX474WT9nL91LkuyjrQjjdyL
 TCAiZVFrzfvRrwArpIl+3daVIcldylQHNf1ydcbVtqmQWz6x+yMn3R3Y1biyq4MEhj
 +qXf58z/cpdTiOqgI8Bv7fElJ9ej5HbnMKn/fkxlrGvomc3o1WYm2pzbMxJLaMQbOI
 FNRk9g4MoxoXGRGd9xI5mS4QZNrSM6e4Qm7MFIq42nsnVG8qTPWWQ2M/iI3Lm58KJc
 hFKfe/ECnG/8Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M28SB-1prLpJ18KP-002Ftu; Thu, 20
 Apr 2023 12:00:00 +0200
Date: Thu, 20 Apr 2023 11:59:50 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 14/13] migration: Initialize and cleanup decompression in
 migration.c
Message-ID: <20230420095950.057fe69b@gecko.fritz.box>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g9sAJUQMVyim7aEjGTneSAK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:jw6QGYHn938aAmgOQhFjuOjrGU1XVCqJuYXTw9i49+6sFWnLVtT
 Lowl+ayFxROyzPlf6c0jWVamyvFSH2Ej7yAxqjs67OOEjb/icPUnGyAtjT3ezi+HKaO4FoJ
 gvodZdRVIBPZQ8IkbDG59ygHT9I/NyX0E6f1JjxEcYnXel1zBrPBh8CplvZN+GyBcOR5xKq
 AnIPw1k691vkcZnCTm1Yw==
UI-OutboundReport: notjunk:1;M01:P0:sQ28WGfYoOk=;uLIKtIzhAubnz8KxgpIBW+1EdMB
 aCQMtaf8kWPpmJ289i4OrxEr1YkRJfwpYjQVbhCU6Jyn3OTLLe+z/jSXAXektm6ge0nhmL0As
 Ixl7fM8iWeZ9/9RQoWN+FXaoU5PEwlcoBFliYuvW5U00Xbnlq/0GE1VcpdA/1bFlnnDpVbhNy
 NNu6r4wtZlYzAxOAObc8hN+UU6TxHFi/xLh6q64UpeJ0OxWyR0ecDfPpr2c1BakKookNFBz6i
 vq3dNO9Djqvpkk0JIb+h5tLyUTp3EpGxNwPNgv3kvcBRbJLvwV4YIbwJ2RiSfUE4itXa7Hhqt
 5WR9VIIoI3msD6is1AnuE1korYdXBx8kLjA/nlX8pHTSf3HrPbMJ5Bb7HhzTSDb8iJMSnzthd
 L7RGsHJiOQpLEkTxoSg664oNKprYdmQwo9Eb83ToNWQxY1fTVT3fH0pI2XFDjTcPdYMG0j2CX
 iYzw0kn3tDQ5bA/Y6Hn/t9k1gb+5Loi553pJM7mvqYxEryvVPTm8SFOp7JchKr6Q38yLi7rmC
 7fnEZFwuFLppM0hi1+Phm+XWgsV4vPSu/cJ9UsLbBU7GCW4dNXkcm/cgjMgLi3YD+SgHN3tbn
 SUfEf2xp+Dpc72w7n6Sd6PI1oOfRdL6rOtst/sqtPNPTQun3Y5nl4/LqtneJzDLzPoHSJRF3r
 QB2PEhQ1YrpupxY6HvPJR1HzQWhfhDFAAamqN52/S1uwolV5hhtBWdu0YeXnIV0WgtApqY8DS
 9XLyrDHjlEhxdQHMTHiYDhnhzePZJLzqdR6pGsBOo7z3Gz5xQLycOLHEcLju7S2lG0fxa32Ob
 VedMfzX0kh0eU8eX/qZH7e6E1e/gcOqQ7PfB54pp5y2x+cjSJy2qpOjstadhWOPGYi1Ln0l9U
 D493mkAqLAj8BDoEqids+yBMrSc7cjSvXgVKcPVOH7DaVp6QHOqZJh2pOJ7xrMDwKsViVRc81
 cq3r1g==
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--Sig_/g9sAJUQMVyim7aEjGTneSAK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This fixes compress with colo.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---

Oops, this one slipped trough

 migration/migration.c | 9 +++++++++
 migration/ram.c       | 5 -----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bda4789193..e7d082a208 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -26,6 +26,7 @@
 #include "sysemu/cpu-throttle.h"
 #include "rdma.h"
 #include "ram.h"
+#include "ram-compress.h"
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "migration.h"
@@ -316,6 +317,7 @@ void migration_incoming_state_destroy(void)
     struct MigrationIncomingState *mis =3D migration_incoming_get_current(=
);
=20
     multifd_load_cleanup();
+    compress_threads_load_cleanup();
=20
     if (mis->to_src_file) {
         /* Tell source that we are done */
@@ -598,6 +600,12 @@ process_incoming_migration_co(void *opaque)
     Error *local_err =3D NULL;
=20
     assert(mis->from_src_file);
+
+    if (compress_threads_load_setup(mis->from_src_file)) {
+        error_report("Failed to setup decompress threads");
+        goto fail;
+    }
+
     mis->migration_incoming_co =3D qemu_coroutine_self();
     mis->largest_page_size =3D qemu_ram_pagesize_largest();
     postcopy_state_set(POSTCOPY_INCOMING_NONE);
@@ -663,6 +671,7 @@ fail:
     qemu_fclose(mis->from_src_file);
=20
     multifd_load_cleanup();
+    compress_threads_load_cleanup();
=20
     exit(EXIT_FAILURE);
 }
diff --git a/migration/ram.c b/migration/ram.c
index ccfedf4fb5..344f326065 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3560,10 +3560,6 @@ void colo_release_ram_cache(void)
  */
 static int ram_load_setup(QEMUFile *f, void *opaque)
 {
-    if (compress_threads_load_setup(f)) {
-        return -1;
-    }
-
     xbzrle_load_setup();
     ramblock_recv_map_init();
=20
@@ -3579,7 +3575,6 @@ static int ram_load_cleanup(void *opaque)
     }
=20
     xbzrle_load_cleanup();
-    compress_threads_load_cleanup();
=20
     RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
         g_free(rb->receivedmap);
--=20
2.40.0

--Sig_/g9sAJUQMVyim7aEjGTneSAK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBDRYACgkQNasLKJxd
sljC2Q/8CqOt2SRBtzQFLfmbQDPy000NZDusQhc4lp3+aS9mkfu8hr3ftcidM4fy
zxwA1zei6qksdjK3lfq3lk5s6nkmOX7nK4/DCH5QZAINK8M4GlHt6OmZMp48334v
FjlDI09CPhlvJhvX/OCh0LCQyxHFAxZhfbDGaONbeknPMeTei+ywo1TgYJNinEL7
O7PdmQC/MJMkRoA8+Ko+uyDe3fIg8uDoIku+c9bfqoTjQy/Cl8jWaaZs4UxP+rCZ
n6SA3rcEzan0H6L1QA/jd6Bh2FH+a3Pk/3wUfcRzWdA2qhDBI1N5tLlNu8aIC4pE
fPUkBeMsowvXTUh0k3BKxn6ua+J422zByek58nHkuw0h2EV6mKo8jrOsPGefJJhp
hQaGQQeSVDE7gWq57laYQI100XcnW7DYzPdZ+iLsJp93gqVNaddQwNNeOsKSKAnR
j7LaDtSlqauYI4XQOoYOpXmHgmMvraVqzYpJVXDdgNJoJMl2dOtJOPJkn13/YOcY
8sZdKwJU95yqWDlja6sSUA+0FLqvweZU04QQtDGEw/gmhdx6JWv3ZxXQ6yDr6SYf
yFjstAZSfJGJ/DrUGHF5ELwTMgjp2UiFBqrXC4wfAkZg02pH9+Cv8yBsYaEldz2N
1KNflE74CUs6YctzG5CHbzhTecAv071uZDIwfTbFgAQIOPkoNQY=
=t18t
-----END PGP SIGNATURE-----

--Sig_/g9sAJUQMVyim7aEjGTneSAK--

