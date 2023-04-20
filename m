Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600BB6E8E83
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:48:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQtp-0006oQ-Vc; Thu, 20 Apr 2023 05:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtV-0006YJ-M6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:03 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtT-0007zM-QC
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984074; i=lukasstraub2@web.de;
 bh=II/xCy85IPZ6uuS206CqWBiCl1Yvzra5TBTN4pjRMqA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=pmVGesYP1rTBRPHmKF+D2byZyDFHz5sdj0+qDiRKvaq9CDzuk4efABDDemWWBRK+y
 7/yr3lmBlS1DG79G7i4cBk5rg03xZg88NFg8xMzw/IQRUxpudST0OjTpJAT5wPquSG
 vy6fw/hNycAdIJfIOKzJxVjS6Jk1dEgMwnAKsoY6RlLaQ8stWmOqhD53crR5nGlj5i
 SC2B6MqRtAisV7dGwE9lPZHJBB/cH74DCAF3xOx4Yzw1RguxEmNUtiwAkTo5SppDMN
 Qgtlg1Y8oA3VyiTaQOILRkSHhyySDWGY+HVduO+vWh5eh+w0LJ7pqulLj7pjy/pKAY
 urtG/dS9KgG3A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MKMA7-1pbTJF0z1T-00Lkkx; Thu, 20
 Apr 2023 11:47:54 +0200
Date: Thu, 20 Apr 2023 11:47:53 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 01/13] qtest/migration-test.c: Add postcopy tests with
 compress enabled
Message-ID: <01a063686e62ce97e7d0bc9fa935389f074ecb4b.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C.O15HesEp.0vYR6xcN7KlK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:sHxw0g7syKrEFsr/t1xYnH/s80ce3X6m/Dd31EXOwbvA1yuSrqS
 fdnkaClmwzZZD6niQO4iy3QKq85IL1IiUmhIsM7ByGnUFtFXfJpAogreNy0ZryyN2frxwdy
 ZtFCiXb0CRyj/HfVHVVz4AS1mYUTTNviAUFDbFrQAb2d7sADAs+J4p8t6i2fuHPMXZTGJwp
 uOf4yzkFsufQW4UFqyzjg==
UI-OutboundReport: notjunk:1;M01:P0:Wf8xBOkFknI=;dHvYNYbp6VI4YZPLrWh2nF/1ajf
 txUAhe7c9SI+CIYqSgjVCeU+yQNwtl4Pu19qJGZHPf9c1t1dDU/XrCQw6ozyxsOg0Ikk9FrrD
 KlpNzwPRW2ticAEOo17Es/1JPnRgYyiigaPOhyU4uUTp55k4b7y6n9AajVz291XvHkcMUbXJ6
 t+wMK663vQQOuDSfFP04RGKxiI9Jlvjr44MyrmjJewTXYt5k3RDws3y1ha+8mqfFdq/LJ/WHe
 Uu/x/g3WBIX5y9vfQhJUwrtoxvQOJuctyjhBNbxdLbVv3TEKi9X1115ARrWs2OvvT5T9PTZyq
 wV7aQVEi5oRrzp+4Tb3RmRWSCwQlCG/VxYeZPTay8Qnf0ah7CHvEACZflODNdSeGoZ8tDMMes
 OZhhpEKmxjbyi2h5rRiszGSNsebk2QizRpTyS6LLRigWK48FFDf8CfT4wVzW+gLJ7OSwiQtz7
 vQOqfv91WBWFoL1Pb0rORTMUytANMWExJyqfVDOu1/w3sk6Ei42Oi/6YrhdGc8oXTkn83CjLU
 YWrHTnxuE0gSCfUn0zLC4jvjxl+4bK68Mafxy9r6KEDXdEUUcmM+cYf9P3IgxahjCTjyWKPSO
 JDPLwdPxM88N0//rgMPYvedDF5rRn1PR7KtJ2Ik3Ayvf96/oJp7qt+R6SoFi5sv7unJCAha0u
 z3SQSMdWqAXZtWXWyfBTmWhTAZbkqtqwmJVwm7VbhdmrjCiVXv2k4FdSyCUIyjFXLfCPttNGZ
 6Na/vGMU7zxIESe/03MzXRBVODPs+8j8GDwTSQHq44OFgRF8bB/Iok+3EiqC3Lch590nZ+nNZ
 Fp82ACluz2lNHqiXhWa2V9WRsKueQHaBEWK0Vp+0a06+VzG6PR/FVKoBIV3Ya7nrmXpVF6sb7
 lTz9P5qGY9f+GpIl5w4XKOHxSIbjH9dtYPDvsRL+/T6nQ+8d1shIXrX+2l5ZnJceztjxqBgvG
 JiuHcW9+nlHRzFxrwhdd/OAsjFY=
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

--Sig_/C.O15HesEp.0vYR6xcN7KlK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Add postcopy tests with compress enabled to ensure nothing breaks
with the refactoring in the next commits.

preempt+compress is blocked, so no test needed for that case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 tests/qtest/migration-test.c | 83 +++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 30 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1f2a019ce0..930cb4f29d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1127,6 +1127,36 @@ test_migrate_tls_x509_finish(QTestState *from,
 #endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */

+static void *
+test_migrate_compress_start(QTestState *from,
+                            QTestState *to)
+{
+    migrate_set_parameter_int(from, "compress-level", 1);
+    migrate_set_parameter_int(from, "compress-threads", 4);
+    migrate_set_parameter_bool(from, "compress-wait-thread", true);
+    migrate_set_parameter_int(to, "decompress-threads", 4);
+
+    migrate_set_capability(from, "compress", true);
+    migrate_set_capability(to, "compress", true);
+
+    return NULL;
+}
+
+static void *
+test_migrate_compress_nowait_start(QTestState *from,
+                                   QTestState *to)
+{
+    migrate_set_parameter_int(from, "compress-level", 9);
+    migrate_set_parameter_int(from, "compress-threads", 1);
+    migrate_set_parameter_bool(from, "compress-wait-thread", false);
+    migrate_set_parameter_int(to, "decompress-threads", 1);
+
+    migrate_set_capability(from, "compress", true);
+    migrate_set_capability(to, "compress", true);
+
+    return NULL;
+}
+
 static int migrate_postcopy_prepare(QTestState **from_ptr,
                                     QTestState **to_ptr,
                                     MigrateCommon *args)
@@ -1204,6 +1234,15 @@ static void test_postcopy(void)
     test_postcopy_common(&args);
 }

+static void test_postcopy_compress(void)
+{
+    MigrateCommon args =3D {
+        .start_hook =3D test_migrate_compress_start
+    };
+
+    test_postcopy_common(&args);
+}
+
 static void test_postcopy_preempt(void)
 {
     MigrateCommon args =3D {
@@ -1305,6 +1344,15 @@ static void test_postcopy_recovery(void)
     test_postcopy_recovery_common(&args);
 }

+static void test_postcopy_recovery_compress(void)
+{
+    MigrateCommon args =3D {
+        .start_hook =3D test_migrate_compress_start
+    };
+
+    test_postcopy_recovery_common(&args);
+}
+
 #ifdef CONFIG_GNUTLS
 static void test_postcopy_recovery_tls_psk(void)
 {
@@ -1338,6 +1386,7 @@ static void test_postcopy_preempt_all(void)

     test_postcopy_recovery_common(&args);
 }
+
 #endif

 static void test_baddest(void)
@@ -1559,21 +1608,6 @@ static void test_precopy_unix_xbzrle(void)
     test_precopy_common(&args);
 }

-static void *
-test_migrate_compress_start(QTestState *from,
-                            QTestState *to)
-{
-    migrate_set_parameter_int(from, "compress-level", 1);
-    migrate_set_parameter_int(from, "compress-threads", 4);
-    migrate_set_parameter_bool(from, "compress-wait-thread", true);
-    migrate_set_parameter_int(to, "decompress-threads", 4);
-
-    migrate_set_capability(from, "compress", true);
-    migrate_set_capability(to, "compress", true);
-
-    return NULL;
-}
-
 static void test_precopy_unix_compress(void)
 {
     g_autofree char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1591,21 +1625,6 @@ static void test_precopy_unix_compress(void)
     test_precopy_common(&args);
 }

-static void *
-test_migrate_compress_nowait_start(QTestState *from,
-                                   QTestState *to)
-{
-    migrate_set_parameter_int(from, "compress-level", 9);
-    migrate_set_parameter_int(from, "compress-threads", 1);
-    migrate_set_parameter_bool(from, "compress-wait-thread", false);
-    migrate_set_parameter_int(to, "decompress-threads", 1);
-
-    migrate_set_capability(from, "compress", true);
-    migrate_set_capability(to, "compress", true);
-
-    return NULL;
-}
-
 static void test_precopy_unix_compress_nowait(void)
 {
     g_autofree char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -2604,8 +2623,12 @@ int main(int argc, char **argv)

     if (has_uffd) {
         qtest_add_func("/migration/postcopy/plain", test_postcopy);
+        qtest_add_func("/migration/postcopy/compress/plain",
+                       test_postcopy_compress);
         qtest_add_func("/migration/postcopy/recovery/plain",
                        test_postcopy_recovery);
+        qtest_add_func("/migration/postcopy/recovery/compress/plain",
+                       test_postcopy_recovery_compress);
         qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_=
preempt);
         qtest_add_func("/migration/postcopy/preempt/recovery/plain",
                        test_postcopy_preempt_recovery);
--
2.40.0


--Sig_/C.O15HesEp.0vYR6xcN7KlK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCkkACgkQNasLKJxd
slj5mBAAskRbYqhjN4lRlBOKwCMckuZbREJtJ+eCxHBudZ1PSIOe8uZh0QcsimSq
1K7c6ipOtiYOvt0yKLFsfTnL8vyJH0Cum9hs361lTkqAdR0wccfAhpFMRsBmsG8x
uq4+95IAzXBh2h5TlSikATFAcjCXPO+MCtV6kf0qLcokjyFIWDRd1G4KpadzZJrz
ErnssIPcDtW+MIWmSl/YqRkhXTRDtumb9NLmR2NPwfs+kXninMVAraB1OMNrZTU8
JIJf4sr1svJ11EOg2C2D2PcHQICciFlZLvlHSYHiI3sR7A6khH4b7jBGC8Jl3Yu4
26ltrDsJh/TxR4tlv0oWONJvAa+DLzCQ7Aq2hvrZqZOtyngiYFhGXuoigkmS1fz+
CGlEkFosagFGLxA8Ifur4dJOk0sLD5ktZC0VwbJfRbbO3Vxf29IIUipohI5Am/5I
WBI2ENmeRpAj/pTPLGW/vGZ8o82bdCveGE7jbfR4Alj4d4AsOUe7IMUQB4R7Y6dr
7GqRSGcZm8J+jtKCxvMByY4xxnB1MQvTXb4FxnU30FK5/4WxhG05EzigNXLalU3k
YZAUbID8t7g5LxvGujnKiU2mSFEYh/BZaeKjRtv5iTm91Q6QODqEvv0IUlnQMzdA
hYw8bJ4HFvNA6k+A6+oLPjocQKbGZat/s67Wi0LoDpHbQFvsVh8=
=TDkF
-----END PGP SIGNATURE-----

--Sig_/C.O15HesEp.0vYR6xcN7KlK--

