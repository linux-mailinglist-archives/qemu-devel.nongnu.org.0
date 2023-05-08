Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327006F9D1E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 02:54:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvp7g-00072n-VZ; Sun, 07 May 2023 20:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7Y-00072f-UM
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:52:56 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7X-0004cy-9A
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683507171; i=lukasstraub2@web.de;
 bh=5e+xMzjmHT59gTlPxFHHRCM0p3PCapn6o0VgG/pG2i4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=USmHOvmh//Xe+xULCHO6IT2dMnKcsuf7HoUUKoBXt+2RiCJDwRpM8XsjdNk5tvxnN
 COB+SqHItNwk5fhbpQJGXX5NQjtA4cZ3KHhYpfTWeLdX3qoODi3lrpj9iGNT0FUbeY
 PTynVYV7UFr//LsF0mf+0yEVU8VoTpMqFxjfNTMjSB8vsTyhJG6EBn+ACZLNNeV9+X
 tbYrZ0naCIP7vnVVZmQUDff2TkZ8QR3kWFPY+6mI+dF9K7z26IkmPh5ucJumO5bOWE
 U2V3Ig8jGp6GHeN0jHa2JPM/vrA+Odsp/+3ZxwHjJq3g3SWOqRkbNUGTPl0OqLfn5/
 dx8BVWYDzdZsA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.115]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2SL5-1qM3Aa20b9-013gYG; Mon, 08
 May 2023 02:52:51 +0200
Date: Mon, 8 May 2023 02:52:50 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 3/5] multifd: Introduce multifd-internal.h
Message-ID: <20230508005250.7866d810@gecko.fritz.box>
In-Reply-To: <cover.1683506133.git.lukasstraub2@web.de>
References: <cover.1683506133.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gMPqQhQVjMS5XYdYnCmcEbD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:a/lgCR8yQmMqaZcjcg4MVB1lACvwzMtS/q4vH4ELVCcCTxD81Iy
 1TaVNr9YUQfFx8C1UiE+9HO56yxwGnPSD9KSMlHYr7lOL/7MrPg8As6RPAefetdrZbaNZ1i
 MplSa4+gZdjNqJFy0vIdYvoCajYnvIT+V2O+Bx6yerQPS3sIkDXmq49sg3gv5TwXf/vKi0B
 bqZX3i3xrOGnPX9lwd4IA==
UI-OutboundReport: notjunk:1;M01:P0:6KM+BGKgoXg=;dqXEZEr5fjIG+qdmZys1yMrwMgO
 FG+tvhb1IupttxrtZuqle54/ckFJM9E4PG3Iv0qRjtlmwg61FJYbD9OauQC1F5zkn+vsO3Cj5
 wPXbVzKQSLJ7UcxdKJPRcyoEz4or/jA7nNHS8AlIJsIRi9bV9adtoqPvCU/kuXhhvZ5DD1QQf
 ByKSv+uu9IG5cVJ6OfHZCVlcLj0+w41jhYIxqzB5VJypTote0CeuTRhVXU3cL6jSJLkCAbP7D
 2vlTdpMTWttiP30YuKY8KLwBY3/RLk+lqA/v0i92UMgzjv6gpSfeJe95D/3PntE8ydA1xWPSS
 WtMMXwqElzq+Jafg+YRDITDPagSWa2MpujmJyVsd6hKIzdWiuYX7ca4DetXaWYvmJid8A4wAp
 L58mFXy8nx3Oz13NTI9h1AwR1YKWOuokpqD4821vu/H0s67RgaR8uZLIhPh13Y/X+IaYe2J2l
 BlSP6fjelYBTfHfufBxEhCHVkrNrwukh6bV7HKEre2VENyrhsa2vzqmWEqQdrVgkSq84g3w2D
 ZHaQ7P1GLBUVlK4xqwoksocE5RQXBhzm273sCaOh2Q7+TegxdrYqjXDZd/KuGFwjAUX0iJGI8
 hcJmKVZH4leyx74MmLD6Y7E5hd54ltvkK+2tbr1R7KdC1aSEI79yv1ZYq4Xx9g9SYJQUZJ2Ta
 A8pMTVXDv9siEkv2eWEejA6ofAlG0D2p7vPDgGfov9faPDQzyDMr0kjUmywo51lZ1M0q8QyDF
 ypYceEI6+uDvQz44jxQlfnxDpsAFxt/ffqfVAmR2y4g9Je0ryMxzdv3NSHQUpOg93B0ebIvBW
 eTv7CuhIqIlYvQsUgNHYSjCTObmiOfXZVL5KfP011FBdvSe+i/HzvYFKzj68ewt3g2olN3b+r
 jNYaS6XYQec+BWB6Mw4NgHAv22kFbTTAgZqXOnMpCoea8GVzoXJ2KUXIa81ZEc+FvkwTmGtR4
 /EfN/xKozBRq7BMUThP10ISiOVY=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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

--Sig_/gMPqQhQVjMS5XYdYnCmcEbD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Introduce multifd-internal.h so code that would normally go into
multifd.c can go into an extra file. This way, multifd.c hopefully
won't grow to 4000 lines like ram.c

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/multifd-internal.h | 34 ++++++++++++++++++++++++++++++++++
 migration/multifd.c          | 15 ++++-----------
 2 files changed, 38 insertions(+), 11 deletions(-)
 create mode 100644 migration/multifd-internal.h

diff --git a/migration/multifd-internal.h b/migration/multifd-internal.h
new file mode 100644
index 0000000000..6eeaa028e7
--- /dev/null
+++ b/migration/multifd-internal.h
@@ -0,0 +1,34 @@
+/*
+ * Internal Multifd header
+ *
+ * Copyright (c) 2019-2020 Red Hat Inc
+ *
+ * Authors:
+ *  Juan Quintela <quintela@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifdef QEMU_MIGRATION_MULTIFD_INTERNAL_H
+#error Only include this header directly
+#endif
+#define QEMU_MIGRATION_MULTIFD_INTERNAL_H
+
+#ifndef MULTIFD_INTERNAL
+#error This header is internal to multifd
+#endif
+
+struct MultiFDRecvState {
+    MultiFDRecvParams *params;
+    /* number of created threads */
+    int count;
+    /* syncs main thread and channels */
+    QemuSemaphore sem_sync;
+    /* global number of generated multifd packets */
+    uint64_t packet_num;
+    /* multifd ops */
+    MultiFDMethods *ops;
+};
+
+extern struct MultiFDRecvState *multifd_recv_state;
diff --git a/migration/multifd.c b/migration/multifd.c
index 4e71c19292..f6bad69b6c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -31,6 +31,9 @@
 #include "io/channel-socket.h"
 #include "yank_functions.h"
=20
+#define MULTIFD_INTERNAL
+#include "multifd-internal.h"
+
 /* Multiple fd's */
=20
 #define MULTIFD_MAGIC 0x11223344U
@@ -967,17 +970,7 @@ int multifd_save_setup(Error **errp)
     return 0;
 }
=20
-struct {
-    MultiFDRecvParams *params;
-    /* number of created threads */
-    int count;
-    /* syncs main thread and channels */
-    QemuSemaphore sem_sync;
-    /* global number of generated multifd packets */
-    uint64_t packet_num;
-    /* multifd ops */
-    MultiFDMethods *ops;
-} *multifd_recv_state;
+struct MultiFDRecvState *multifd_recv_state;
=20
 static void multifd_recv_terminate_threads(Error *err)
 {
--=20
2.39.2


--Sig_/gMPqQhQVjMS5XYdYnCmcEbD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRYR+IACgkQNasLKJxd
slgp0Q/+NfEAD8XYU/j97Wqx+cq80ocqdmdXq0VtEOMfz9ztgJVAtflQ52apWmng
nSYY2rbGg5LCoVNMAiGW5ov+6OuRlxk1o6BkJjKTU1NaXyNPlPctsumvFn+Edpoh
KRoh8/9/L0HuKvK2wzpGHwQX1VOoF6NS2LQpEuT4C8hE8b4GynE48NCI+d6WAJG3
dB9vxMNnxx1bdDil4kChWhfQKFXpL7n+4rEsyDD40weNZx5Mfq2ee6M8rc74s5Ew
YfKULYuEK/pB+ITh6knBTR+2ZkLwhJtXfUc+4OaZLxPTQ+kTxOgSW4IFwezb4UwV
FCkB+yrB6if9qjzAdWp3v/vk2RvrEWWAaLWTGF81XDgdcTjZ7a87kzic5XVuf19l
f1pvcwGO1sKuk2MBWVOKzyV/KGLqI31ODOtu3TO+geSIUOv5yHPFnS3DH0CKHPO3
ZMZv6aXt5M+qvqErGfD7N+vU/jfu6RmaG9UJ2xbWhCB4FN51RCV94JtDsJ81CgU3
F66lRECCG2JJ9iVlZkIHOuM6uWbB1vcwx+bN/JpymX/7w4efjd7RYc4OEzy10ecu
EjDte0LKgBueuGc6+X4rl/WJe+S1xCsLIAOM7VquorOSTCpGR++Y+HEULWWosGe1
x2miB1KUBXKE9SQJHapIUhP731kY2EmnZc6ZnmYmupZIuKMycGc=
=FZWo
-----END PGP SIGNATURE-----

--Sig_/gMPqQhQVjMS5XYdYnCmcEbD--

