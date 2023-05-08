Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1296F9D1D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 02:54:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvp7j-00074W-Us; Sun, 07 May 2023 20:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7f-00073Q-Hm
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:53:03 -0400
Received: from mout.web.de ([212.227.15.4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7c-0004dc-Cf
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683507176; i=lukasstraub2@web.de;
 bh=VzcD1vAT2sl9FLRE5djaiokWkXqOmnEfb7dazRiopis=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LZ84NMzrdZQXOl6UDmVamp4zFTcP60z+IdYDKyfDU6kTOTiE9cNWtMBTCoM8GlwLC
 oIKsE1dzh9rC831XjY2scXnRT3/kx9itahEhvbA2aDHpJC/oS8FMClU7od2gFFMHEf
 yVSXCw1lVm9mRS4px963I0/7/4TzrgAzfqcZsmPZtAifcYk1jdcOGz3i13JMbQpveJ
 U9wrSxkC1P4PDTbUAAEX/F2p2hjTGK8irwS9jnWeo2OkKxr+qPsWSB5jMe1MSqKFd/
 KaRNtMgrR9yBXvfMW3N99Uhpdwqo2xDIyUcaJ9ohFvLq8rXbh2M2x4kLnYB52SMAHS
 0LAVBMpWKbNuw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.115]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdwNW-1qWnle2D5i-00bJoO; Mon, 08
 May 2023 02:52:56 +0200
Date: Mon, 8 May 2023 02:52:55 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 4/5] multifd: Introduce a overridable revc_pages method
Message-ID: <bdf9de97cfaa7edf4a664b91b21e21c394672556.1683506133.git.lukasstraub2@web.de>
In-Reply-To: <cover.1683506133.git.lukasstraub2@web.de>
References: <cover.1683506133.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qeBBQnnHi6_H_tu38Z_ESLu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:dek4LtcPWo+liw2WIGKO0Yg2BShSavyQYR3Cvaezc9Obr2yqAwE
 aNrGsuZoLhT+M7JcjGaqdJs0um/l8SaIIGwA/8f/TGurx4Ztp+Ed4Nbx6MRznq2S+NmU1/S
 eCj+ZqwJ0c2225grqjgnxzJi5Qng3uMPlPANUkdJqGHnkyTE4Z9Pcmzp8PqewsKO7vf0vuM
 8SNrpPQ6M0WudejmlfMkw==
UI-OutboundReport: notjunk:1;M01:P0:0r79VP30mgI=;iJdaHxNkAtugZ7glDwGpVzU3rLZ
 XkWayjIW9j96HEFjKO/CWUib/IaBMXuNu1LKt0s3umgOOsAVTj+CqwpnswPYmfzlrYaNNBsKE
 MenclW0Hjiy8XL9tx9wiJtZDbuPFwyVs2yMk6EwfycHu3x0+vjmZlGYYWyfTZQrasHy8HBUoR
 mAsAdx8F8Xeu2TOJs8ZBN1PuSqaAVUMh23wCnT9T6nDafk9PPcZNECZxExazBkdnGxk1Sp6Rb
 ETwoh7KGq+eNu7jgtNr+2mZIOS1Mi0vGjeclC/oksQ7ZLG0kAnUNJkwZwgGzu8TtfUoBbmF2i
 uBGbNogiqSodnnGSgYi6j2e882W/IgVM8lDdPXxkOB10MiCgl4xGI++uTqSrfTySRX4t5W0nf
 rNh8vv4o1dJP3qbzw9hsDHkQkDkVmFmWUo5PMNA8yvA38HCWi6gcn1F+0NQk+70mVTcHm5M01
 NTkSFsZrQwpx1STBjUri3OVfsDJz0DvGfrkasaV7varJdIICz7AsV82PdFWJ6UkbkbMiw8baX
 b8jW9wMmp4GigHBZNoPrtJ5oFaR2c5wy/7u+nI5R0WDBmGWHsCxQ+322G14UrGUC7zB6uRu7U
 gwGGxjswy0h26LWOoxQ71E8vJ6YIlFrj+SH+985wDTyQX9FCbOYUAm3O1ksYjhy+Uqnsp+Ej8
 gZxowcdbuqfIkG5Re64qLyBHgTgEQ5BmY50H21c2QKbzEu3iEeWdrEVS4inznBXFmCEaDP+2b
 AB1ZxHB3NUQhZN4z81wjjF12S+btnOYnjfrlfL8qMbBkcRrU0cmE4aXYkaWjfm9fse57pOZLx
 jargiZuSrqmlUVqisz5/g9Z4uMP//QDHLI9az+ywBnrADuNdXihDXgPj+sfSf+kWqbvJgW18r
 WIpFW9QjTVb8rSFR5thWM33mNz8ywXyaeLR9MU4Z6XV/vPOnyLPkBC+15+SPX4AAj3a7Z8Hv7
 wdz7fg+2U31f/ImESFXuF2zPCB4=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/qeBBQnnHi6_H_tu38Z_ESLu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This allows to override the behaviour around recv_pages. Think of
it like a "multifd_colo" child class of multifd.

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/meson.build        |  1 +
 migration/multifd-colo.c     | 39 +++++++++++++++++++++++++++++
 migration/multifd-internal.h |  5 ++++
 migration/multifd.c          | 48 ++++++++++++++++++++++++++++--------
 4 files changed, 83 insertions(+), 10 deletions(-)
 create mode 100644 migration/multifd-colo.c

diff --git a/migration/meson.build b/migration/meson.build
index da1897fadf..22ab6c6d73 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -23,6 +23,7 @@ softmmu_ss.add(files(
   'migration.c',
   'multifd.c',
   'multifd-zlib.c',
+  'multifd-colo.c',
   'options.c',
   'postcopy-ram.c',
   'savevm.c',
diff --git a/migration/multifd-colo.c b/migration/multifd-colo.c
new file mode 100644
index 0000000000..c035d15e87
--- /dev/null
+++ b/migration/multifd-colo.c
@@ -0,0 +1,39 @@
+/*
+ * multifd colo implementation
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/target_page.h"
+#include "exec/ramblock.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "ram.h"
+#include "multifd.h"
+#include "io/channel-socket.h"
+
+#define MULTIFD_INTERNAL
+#include "multifd-internal.h"
+
+static int multifd_colo_recv_pages(MultiFDRecvParams *p, Error **errp)
+{
+    return multifd_recv_state->ops->recv_pages(p, errp);
+}
+
+int multifd_colo_load_setup(Error **errp)
+{
+    int ret;
+
+    ret =3D _multifd_load_setup(errp);
+    if (ret) {
+        return ret;
+    }
+
+    multifd_recv_state->recv_pages =3D multifd_colo_recv_pages;
+
+    return 0;
+}
diff --git a/migration/multifd-internal.h b/migration/multifd-internal.h
index 6eeaa028e7..82357f1d88 100644
--- a/migration/multifd-internal.h
+++ b/migration/multifd-internal.h
@@ -29,6 +29,11 @@ struct MultiFDRecvState {
     uint64_t packet_num;
     /* multifd ops */
     MultiFDMethods *ops;
+    /* overridable recv method */
+    int (*recv_pages)(MultiFDRecvParams *p, Error **errp);
 };
=20
 extern struct MultiFDRecvState *multifd_recv_state;
+
+int _multifd_load_setup(Error **errp);
+int multifd_colo_load_setup(Error **errp);
diff --git a/migration/multifd.c b/migration/multifd.c
index f6bad69b6c..fb5e8859de 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1126,7 +1126,7 @@ static void *multifd_recv_thread(void *opaque)
         qemu_mutex_unlock(&p->mutex);
=20
         if (p->normal_num) {
-            ret =3D multifd_recv_state->ops->recv_pages(p, &local_err);
+            ret =3D multifd_recv_state->recv_pages(p, &local_err);
             if (ret !=3D 0) {
                 break;
             }
@@ -1152,20 +1152,12 @@ static void *multifd_recv_thread(void *opaque)
     return NULL;
 }
=20
-int multifd_load_setup(Error **errp)
+int _multifd_load_setup(Error **errp)
 {
     int thread_count;
     uint32_t page_count =3D MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
=20
-    /*
-     * Return successfully if multiFD recv state is already initialised
-     * or multiFD is not enabled.
-     */
-    if (multifd_recv_state || !migrate_multifd()) {
-        return 0;
-    }
-
     thread_count =3D migrate_multifd_channels();
     multifd_recv_state =3D g_malloc0(sizeof(*multifd_recv_state));
     multifd_recv_state->params =3D g_new0(MultiFDRecvParams, thread_count);
@@ -1204,6 +1196,42 @@ int multifd_load_setup(Error **errp)
     return 0;
 }
=20
+static int multifd_normal_recv_pages(MultiFDRecvParams *p, Error **errp)
+{
+    return multifd_recv_state->ops->recv_pages(p, errp);
+}
+
+static int multifd_normal_load_setup(Error **errp)
+{
+    int ret;
+
+    ret =3D _multifd_load_setup(errp);
+    if (ret) {
+        return ret;
+    }
+
+    multifd_recv_state->recv_pages =3D multifd_normal_recv_pages;
+
+    return 0;
+}
+
+int multifd_load_setup(Error **errp)
+{
+    /*
+     * Return successfully if multiFD recv state is already initialised
+     * or multiFD is not enabled.
+     */
+    if (multifd_recv_state || !migrate_multifd()) {
+        return 0;
+    }
+
+    if (migrate_colo()) {
+        return multifd_colo_load_setup(errp);
+    } else {
+        return multifd_normal_load_setup(errp);
+    }
+}
+
 bool multifd_recv_all_channels_created(void)
 {
     int thread_count =3D migrate_multifd_channels();
--=20
2.39.2


--Sig_/qeBBQnnHi6_H_tu38Z_ESLu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRYR+cACgkQNasLKJxd
slgAGhAAss651RBtH1wSAdC83uI646V6Jk8tF3OSaWjL6mtVyspEKe8uB3trZOsL
iGliU1KyCi7JPmruZ70PF6Efo+zpKrC0aKF61eEw9Fx/GYUHP7nRtT4ZcsGbJXsU
4snpF8ceKvaxskbq4UHIILninoRHW/bj9Ci+colkCsDcRFMgij5DuxhyrfFc/VWE
LAFINAO/fjb37AAm7q9U4JIO5sCgoO6yHcaQ7bdp7rF0YRyHIRrOOzs1cxWPOEeX
epGi3VXHH7/rQhfWyokP4E27uALgokWspdT+f2+zV9viqJrNSMVCTm8iVnkxb+O4
QcNuPHUM7cmF2N+s01mFw5XKkRqAG2rMbUS7vnsgeDw1c04xIROvYIR+P2Kz+L1S
w5g7kHsEQceUnKrNow2zPZwpIFPHtlHnsXL4X4WHOJ9XnBwXgsKCfpVZV13Fqhsi
69YoKzyHm5ryPHdI3+nEuYahwvSagpXAIUtTPdY2T8/rToDvJH/Cr9POfed/yiYj
e9sJDKsxt1XTTLQh0NgXYgshZSWQYFZjyf6GhSUBi8XYMhQRQ72QPkpbQMsPWkj/
2dunq8FzZVqGnqwuAR8oCVNAChyDK+ELTyiTkHGDkmeSxPfxIZNk16z4eoYywvW2
FXIWe601/pri+6ZstmhJob1P2dW40221N40S8/5CB7hJy/5HZ78=
=EMhA
-----END PGP SIGNATURE-----

--Sig_/qeBBQnnHi6_H_tu38Z_ESLu--

