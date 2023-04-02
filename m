Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCB36D3988
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:49:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1oo-0003GF-Bs; Sun, 02 Apr 2023 13:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1om-0003G3-LP
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:48:40 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1ok-0002gp-RK
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:48:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680457713; i=lukasstraub2@web.de;
 bh=zF1d+LYn7W0RpO/gzEs/u71icHjBIdWD5oHxcsVifYw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=j6+z4+THWxPiUXsWi289ilpsUxY/L7RrqosyMKq4Ilz8QDDQIjBGAV2cgaWPLuYgY
 Lhysck4HGyywLAxJS/2HzinG1B+tyWfqDixDKVADdUguACr/26FnLU4ElX9aeKLkia
 ssxMm2C1m2/ODqfV6I6/aPZDYNE8scYTFJSWEsWLveOyiOThwQWcDeYPtr8XTKhJ4S
 UIAZn5yLFdRK2TJ7277SmmWh0qvSog9ZnNY14E1SkYzEV6jRUUl0Dhi0zFO3JB/ZNR
 zLiuz36G5bOXROShlY6LU6KlHy6to/Bsw3ye1P3fpifam3m7lPlX4PVzaQB0FbwT0E
 mVFw6St207ysg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2xrq-1phupB2flM-003kk2; Sun, 02
 Apr 2023 19:48:33 +0200
Date: Sun, 2 Apr 2023 17:47:45 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH RESEND 1/2] qtest/migration-test.c: Add test with compress
 enabled
Message-ID: <af76761aa6978071c5b8e9b872b697db465a5520.1680457631.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=j0BXTt0oy8hjAHD.fGU.uG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:PxQwMhmIwR6K92ky9qrIa2hhqcRm2IfKE94mpR2gvnYaJuB8TvH
 P9MXqn5kwB8aJHCok9nEK7RrcuLEEavcDxYKmJ4Q7JuK+mQtdkVpaeTi4zQjIUIriB6Jab8
 GrcphghDW8HkWH+7yZ55Ni84Y8ViT+QDPeZmwsUy+hDcx4okUyLwE68OytBBXutJb1yu5ki
 DupUAN0qfiEqd5fk964nQ==
UI-OutboundReport: notjunk:1;M01:P0:1Iol1Uuf/EY=;dWtE46/FyDes9Or7S66kUzO1/3q
 FRy1WEs93MVu8igwtSaGi9r1WzEC8lgHzXWMRRg9UDE/mJFQlIz83j2zgldq6DZkCXpLcci/C
 5kGK90d4RMJ0qyLQA8og4A05Mk5A+iX8jowqAif/6/lKowi5CxOPPOgv7/TEJ4+Xttdr4jBTf
 nNS6RXqcx+Ecw5llNpgRxQhvdKHOWQUCK+wnZ8I0xZjNtJ6/z3o3LNpEhqmCFzlyoczYkeefs
 Vtan1dm81Fs7muQ6eKvRV4Ja2EifL13FlTZOW7ruR3zBS5lANoFVkZrMVjG1Yu41YGJ9RvDw6
 Md6GilGki62/x0R7FE5G7r3Das3NWXPfQx/G8L0/PCiNdUr5mLGWjiY/C0YOmDNiqilBHeK8m
 EzhJd0q+ibAb0K+H7uXmjMap66fV/ofmy9bjaSmWsYvuTghwI/ipaDqYCJNYzegv2lrXmKnl/
 +RZCG31VyApbI8+shqOr8Mw4w8YmNdejSvMyT4QoneiZ5LJsuJrxjwH1+to/af+P9VgUuQ/a9
 efmEtH2Ibg4GIYUp4CBEczOXfBdSeL5m/CEmR0i6+hE3OqUQVMDGC6R5HvPSSYxEizv/9+C6R
 dyIwAW8dk4v6b5elkqf1CMh+7TpNQYSdsEGbSPG/9pm0y+H9byfWBhpzawL4tECSwh79n6qkf
 G5E4SW4akkf+GFztYoMlM6aPZBgNMMCJoMVQ1paE/OjwTDNLU+A8TYLJo6nO9iz8cFVyHTX/1
 eHmA86VsYGeXvw+7sze79W24lyitGEYFd0YMkW7wmAhJS5oJgkifGRoQBBRIYhtx2fIoc69yr
 EBPOifXn2guKWyjQGTPnuKmgHpNZR4wQ5yMMSPkXdGY+Cl8bB173k0djLrXZSIZKnJlw7z/Gf
 /P5EuCIB7/za6azNRxPmdrez6omQQiWVO/vtrCSLw1PfuhCsI6RjT8ZUOMRdvfR36y//WkQST
 KkFLaKRo/y3Vf9T7WJLVOciJQho=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/=j0BXTt0oy8hjAHD.fGU.uG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

There has never been a test for migration with compress enabled.

Add a suitable test, testing with compress-wait-thread =3D false
too.

iterations =3D 2 is intentional, so it also tests that no invalid
thread state is left over from the previous iteration.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 tests/qtest/migration-test.c | 67 ++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3b615b0da9..dbcab2e8ae 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -406,6 +406,41 @@ static void migrate_set_parameter_str(QTestState *who,=
 const char *parameter,
     migrate_check_parameter_str(who, parameter, value);
 }
=20
+static long long migrate_get_parameter_bool(QTestState *who,
+                                           const char *parameter)
+{
+    QDict *rsp;
+    int result;
+
+    rsp =3D wait_command(who, "{ 'execute': 'query-migrate-parameters' }");
+    result =3D qdict_get_bool(rsp, parameter);
+    qobject_unref(rsp);
+    return !!result;
+}
+
+static void migrate_check_parameter_bool(QTestState *who, const char *para=
meter,
+                                        int value)
+{
+    int result;
+
+    result =3D migrate_get_parameter_bool(who, parameter);
+    g_assert_cmpint(result, =3D=3D, value);
+}
+
+static void migrate_set_parameter_bool(QTestState *who, const char *parame=
ter,
+                                      int value)
+{
+    QDict *rsp;
+
+    rsp =3D qtest_qmp(who,
+                    "{ 'execute': 'migrate-set-parameters',"
+                    "'arguments': { %s: %i } }",
+                    parameter, value);
+    g_assert(qdict_haskey(rsp, "return"));
+    qobject_unref(rsp);
+    migrate_check_parameter_bool(who, parameter, value);
+}
+
 static void migrate_ensure_non_converge(QTestState *who)
 {
     /* Can't converge with 1ms downtime + 3 mbs bandwidth limit */
@@ -1524,6 +1559,36 @@ static void test_precopy_unix_xbzrle(void)
     test_precopy_common(&args);
 }
=20
+static void *
+test_migrate_compress_start(QTestState *from,
+                          QTestState *to)
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
+static void test_precopy_unix_compress(void)
+{
+    g_autofree char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args =3D {
+        .connect_uri =3D uri,
+        .listen_uri =3D uri,
+
+        .start_hook =3D test_migrate_compress_start,
+
+        .iterations =3D 2,
+    };
+
+    test_precopy_common(&args);
+}
+
 static void test_precopy_tcp_plain(void)
 {
     MigrateCommon args =3D {
@@ -2515,6 +2580,8 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plai=
n);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbz=
rle);
+    qtest_add_func("/migration/precopy/unix/compress",
+                   test_precopy_unix_compress);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
--=20
2.30.2


--Sig_/=j0BXTt0oy8hjAHD.fGU.uG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpv8EACgkQNasLKJxd
slg+qQ/9EINWZIV18BTfi2hMCgCJuJhsOtg/Ak/e+OWCGV+x5RHDe6IcJUkFl1tL
krBsV99tQ6KvFzBGBJphC7gBx59O3GsNdJcs/DG8x14cfKZk/GKYIwy719iGXnE0
zMX799HPAONWoCW2X0yFTSbTBm3qMwxwnOaB3pgxMX70z4R0gMpIxO1Mgfo5DZH4
N/gOr6+cfLRyuc5G6KYRpL5dwxJWnNRdW37tstTmP74fkdoJ+uHx577S7CaAwPQO
MvrnqFTNKLcG18bETTHja2UmkDeNeArYplX3t0LoHbRXLgmJCS7I/TAMDW5wGp7G
J3IcE2v9xeVEoSnRFJ/q+eLl5eHljJjFmQUBydjemUk9zIwzDeV2vcsQ4ytmiolp
S0/zjgfpPB2LadCp0E2JNQHYpCy8MbB3tLrDgXT6FuE/fTvyeKc1jG/l3SNqerkP
9Crq4LQALv9EIjrJ405ByT4f/y8gVFUF0HdsoJHrVo/WLTgUH/UOSVZXzbQg1aAf
z9fON5x5DyuzKVrEyH51FUcZ3tOiCtE5hSDqHjqbwZ2LWaeHb0zxk5SyxDG9th2u
4Ql92IHyBa3KYwMY6CM/LPsS7dHW29NLhR6MFWZ4+1pDfI4MA91GuSI+uj+AYbFf
5VpMrUaNJmod52xdThKaIu1jHGX5zCp10zZDnAoLW7I2HotGLl8=
=duzj
-----END PGP SIGNATURE-----

--Sig_/=j0BXTt0oy8hjAHD.fGU.uG--

