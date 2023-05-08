Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B73E6FB6A9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 21:12:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw6GZ-0007Ia-SV; Mon, 08 May 2023 15:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GX-0007I3-BI
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:11:21 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GS-00045s-Ju
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683573072; i=lukasstraub2@web.de;
 bh=A+4cqBKUkLELvquPN55Hz1t4Aq7uehn7miNGhcLw8AM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JaagfLx+dhi3P4EFrTzTCzZ/3GP02J1ywngevFzIK/aPZyyQ+p1Zx371KGZyOVKcq
 SbCfPUNwXX+poz0VgMW9Y3EqD1qlrPoEFLrZvhQvaFyQkTgIsPzLQXo2AS6HOFUbyC
 NZ4xhBQil7lGPXFkyotVsp5PDSM+Jk4DMAiLA5Pnl9Z+vArzOyfC4bJCL7Z9r+EwF6
 /79ou6SPPOp+QeRJXAY/vz434K2sS5k2crGAdxPCNP9+bGQW6yvc18ceuheAdemvvF
 1JNHgLmBcEYFQcDkDhcOT1gQP7RHi9YlTd9mrPmxOJn9eGocK1JlhuLl+XHPFQUG3g
 xJdeRrkyEK0og==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.98]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MlsKF-1qeXts3Toh-00ihe4; Mon, 08
 May 2023 21:11:11 +0200
Date: Mon, 8 May 2023 21:11:10 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 6/6] multifd: Add colo support
Message-ID: <bca69b86e488b6d64dd85e6d94fa31ca4604665f.1683572883.git.lukasstraub2@web.de>
In-Reply-To: <cover.1683572883.git.lukasstraub2@web.de>
References: <cover.1683572883.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9ndu9.uhWeGrNAt+3=/4YVC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Gr0zXIk2hmORKG6JrlenkUOIlyHVLlag+e350nwznqhB3Klxxz9
 9Xv7v0ONf+pDH5xd8HoMUbsDAbR2kDmZwTjSIvBHofXxJMGauEhyIDUvQz0qV7KH4Zl4pvp
 dl574WeOtxmnBcHWuhbA9/tbYfkPudWB7h5/AlJNnVpVAcyf69MohWsx0NEbtnD9a8jRVBk
 U6qpJLtWauX087FJyyp+A==
UI-OutboundReport: notjunk:1;M01:P0:MB0m002iubo=;qWENqjIyDLqaZKYrRoqqtWau0NQ
 kB/pVa4dpo7Iluk9z4mbuanCmekQMn28tbDixmIncVHYGH7ZAYwMXWm3kF8MlL6hFfqHPtXFR
 wCO7QAzxTI1z/tZ8mmmTUvwXHEZzABynZO2Jj91G2Zueb4gA829etxwr6B54HuZ24k0J8kEuh
 5P9tOwMV9EaqZLOr8VLQ7fpHG2JNlOkyJIKPaTjUogVDVsFCgnKOGZtUdGda0F3WziEuLH0aF
 nJJ+m00Xpepor9Nx4qhTthawbLpLyyMYxhYVA58Jq6iaAnHRPi+NtObNC3JZjY2G7d6LPribp
 y3VzU9dsZnXph0ggmRQEW3YR3KCcKgixg7IKE5qknEyzgElosAKa8t0r1j6xqaMCxYnEEGE8/
 bT184yW0b+8qfWAELT3/F+87iBefaY0TSlbcWfO2Iz2A9KYQe4aFJrRqQQEOE2j1yb/VP6lpB
 nLN955wO/L3Q8oNvUB8SkmtfWEW5NATbG0dmCiSJhaJ/E+V6GVRYfe8SV3JeFqLKWfFry8uiX
 dANs3P1jbIBSsEsvd/0E7aozxoWCP3mdgs/bBPWAYUDwybErXlS0H461UhzJs0xOBzFoEjqMK
 DxbNZpwQ/iRKrAMF6KWKuTabRJLFVxdPN5X87tXEobltQvHY2Xgxt4BxvDU64p17P5athBSKm
 GJANpI/uYtHQ3+3XAmwPA3xRtL7sLgtcKDFIAH62s3ueKNeJBzXBTQpbqyiKRHHVYvH5yD21K
 f5OGDwPGAP8LF2KbwT1BI/iPdyXG8G536Eu7LlRHiD+S0maOA9Dtsa3ZTLTZWmEaDB5L6WJ2U
 96tngDwqlK7RFrNxaQVSq8TPFrwMU8NDSCBY3eJAoYB4KW6AR//Ow3ZWxlrjJPnklk2bA8Qvn
 DJshN6j9FKNgG19ks+TR7enq1WOr4Pm5EvTwgWi/4cTBZiICENJftMugmOaxrZrLmborgQ//C
 EEWLiJRJv5n+KxPe7TTjK3u9BKY=
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

--Sig_/9ndu9.uhWeGrNAt+3=/4YVC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Like in the normal ram_load() path, put the received pages into the
colo cache and mark the pages in the bitmap so that they will be
flushed to the guest later.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/multifd-colo.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

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
--=20
2.39.2

--Sig_/9ndu9.uhWeGrNAt+3=/4YVC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRZSU4ACgkQNasLKJxd
sliiWw/+P92gOXbzjwQciSQve/mzaknYtnY66AGqJLAf02JWMafBDw2oR2mYRLtj
FDRVFetVcSlgvyYOFTPrAX/aCXnjgjhNPtfX+mstCTBb4fUotKFQbNQLdhFpnGyr
8K4lipSyIaFR6NYWlKDEjrjD37irIJiclksOBNZASTFlcovCH1xUbhJrxCbDZPEv
tUNvRCEFNQukqs6++jvzkQjCzke3mhoonHEoactRMLhHRKFktPAzkoxfUDzRCaSa
/5x+AMkCwkwBCqfMZn+2j2nUyWgOy5NQZul2NxJGXmJb2faIi69kOlbJByf2Kmz/
YOYKY2n7cnFfuddu4MtqLOh0kUsOvvL1AOG1kSP1EFeRUDfaQfaR8feY6/NFEBYN
RbOdRO1U3CiuW9sZ/9c3vi9WTj6bk9fFrgz4UmPOKDeJTEOCFZOanoKzOp/Nq0Sv
w/nOreZ/IbtZFIbOswIWd4vLFFd6SU/VXsrWhDvE+fBQTd0keyiErx4x2tHHKBiv
7GVAz36Z/QvoiYOAXBSStgj/T4FkawaHrovw7wx4HTXVvBzQrmC0EWca7ypS7QiO
fMDJ/btxySJ+/LQyG/WFXC3d6BTvqSGrxvQJ8p66fQRDdCAY+cr102fryLsp3Jre
NpC+cSoN6x2CML4l4ZfnfjNbgRBHKeI+eiYgFc2EsGJwDapzEdU=
=34q1
-----END PGP SIGNATURE-----

--Sig_/9ndu9.uhWeGrNAt+3=/4YVC--

