Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA556D657A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:36:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhlE-00073R-6E; Tue, 04 Apr 2023 10:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pjhlB-000738-LG
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:35:45 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pjhl9-0005NB-NE
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680618937; i=lukasstraub2@web.de;
 bh=s0Lcg0rRLB6m+2pzNGnotaTSSpHMe5TOmLpFADUMnUw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=eXTfif3tLlBIfv8sx3pBbCSWyZaQAJEbnKvh+QPACM7SRk81K2k0YpallP4aIaMtj
 1weoiTNLEtLzW65KgIoR0LHRhQYgNgQWb8UXOuGq5UFzpIYvv9DZ/9U+GlexIsWmK3
 a8qTIj84EtNvlVnQeYIuj3QlLQquj3bKl8FAtxa7uVXyltfKPdYbMh5huVL7wrFd5+
 lrppphLnUZ8aBYP1E2T6QNFQaS9O3WT+xVSzv5qhRB8VwnSdKqYCZzNehjkdpdVFya
 KMwkqCM/QF1amegIoZsvIIHrKAT1hjednh7Y6ufPc/6GXUhViLLRlOqFOP80vyzT6K
 jl2NyWeaKa18w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.102]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2jaS-1qOZtN1Z1g-013Iml; Tue, 04
 Apr 2023 16:35:37 +0200
Date: Tue, 4 Apr 2023 14:35:27 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH for-8.0 v2 1/2] qtest/migration-test.c: Add tests with
 compress enabled
Message-ID: <2f4abb67cf5f3e1591b2666676462a93bdd20bbc.1680618040.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h5l4ivoBs0f3sdeeqOiWOWv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:BD4QU++qaWP46izr+U3OKQfcbVtwcoQ4oRX19vebF6hW+kPAbrE
 XZxdBhFZ25rOW9HKO9JK7+xDMOhF3BFnxGos9aqFlSBx6WF9WFBDZp5ZCJ6h2T+ZSumFMey
 uDb5o9ZaQ95aBXyS0fWAs0sp0tiDtgYuuwt/iigJ60VQYK5fzqI+3u2g1WE5axBTKz11G0p
 urXTwCG9cG/V9wI9ox60Q==
UI-OutboundReport: notjunk:1;M01:P0:INyjCGUUccE=;E8lXNXtAwEN0yMZLZsnSJu7e/3K
 ceLTq/7dbZnY7RbjKcDeakhwkUsUWdWWvyZ3WFCUvLC9Sm0+dAaAXhr46I4jXKO8hlupr3tiu
 oQITKKzIi5/yIon12CHwuwtTerBMROhBmA3wypXLUE4RAWXhDUuFyON8umO0RRjhlBNpvz9g1
 b7Whz1vM6pHhco45O66Wlbboat6p3Zbb9wFttMDix3aVur2/hMrjfFNzqLdhiI0nRlE6NZ7r4
 sxcGLj1hevNNr9C7RFkuMx/cAi+GjrTo3SRf2bTNDCPMYWyJtFxekyDMlva8hWCWMUjGJcLng
 V33lwhSQL2EqOUE9HjrLdJECCStWBreO/yA66X4W0AXal6KLjTCVm9zgG2YggNoM8H9IZT40J
 mEtWMcgQjc9SNWufra4h55JoNFu+s1L1lZAHsJbdwNMIunM3BsJfm0p+z3bF56xxvZFPx2w+q
 awVW4uAiJlPxdFe2AKXbEELQnclajipvajtP1r0lMhkMYrmwZR4/RYvG9JUnsxZLOHwhOv88p
 sPMyaFMUQPQPVWL763LHMDS0FzuI4MCt/ZrgzxTO6N/CcRi0j2kpAOPhlgZ3k2w9vhxEWuSZt
 Tw7tMyH09bnONetErnQ8AF7InHsFYXBlEuQLpVflxKymmcjw6t1bMLGiEcqc2SxDbrmCm1dUN
 iK318vmsprmXxsHVplXAaNqmlUVS0QthsjmM+jaEA3ioWuoKJ129gFS6Y7NEHHcVBqs5ZsEna
 qEiEFauzn9W1rUhJRo/rMAJq0KIKiV0EOlLSjwfapJihpIPtT1ROv1x9TTKGEVQ13EKmtKTSX
 DFKl8nVZRUrad0hRTjuJx5W2+gce3INDT4oZD6QpQcpNJGVTGMqqge+qzXqw+4nWdBUXmnzV3
 HVL8n4j98bzN5kZ+rJvDxvTmDoF7HeVNaUCg0dA/g/ZdmKvK5wUD1cPg//ILmEIlm6qoZ06ay
 7khUOQPc7szkiDEGeE0e+rfXD88=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
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

--Sig_/h5l4ivoBs0f3sdeeqOiWOWv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

There has never been tests for migration with compress enabled.

Add suitable tests, testing with compress-wait-thread =3D false
too.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
v2:
 - Split into 2 tests, one with compress-wait-thread =3D true and faster
   compress options. And one with compress-wait-thread =3D false and slower
   compress options, so it definitely sends some pages uncompressed.
 - Add comment for iterations =3D 2.

 tests/qtest/migration-test.c | 103 +++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3b615b0da9..1f2a019ce0 100644
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
@@ -1524,6 +1559,70 @@ static void test_precopy_unix_xbzrle(void)
     test_precopy_common(&args);
 }
=20
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
+static void test_precopy_unix_compress(void)
+{
+    g_autofree char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args =3D {
+        .connect_uri =3D uri,
+        .listen_uri =3D uri,
+        .start_hook =3D test_migrate_compress_start,
+        /*
+         * Test that no invalid thread state is left over from
+         * the previous iteration.
+         */
+        .iterations =3D 2,
+    };
+
+    test_precopy_common(&args);
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
+static void test_precopy_unix_compress_nowait(void)
+{
+    g_autofree char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args =3D {
+        .connect_uri =3D uri,
+        .listen_uri =3D uri,
+        .start_hook =3D test_migrate_compress_nowait_start,
+        /*
+         * Test that no invalid thread state is left over from
+         * the previous iteration.
+         */
+        .iterations =3D 2,
+    };
+
+    test_precopy_common(&args);
+}
+
 static void test_precopy_tcp_plain(void)
 {
     MigrateCommon args =3D {
@@ -2515,6 +2614,10 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plai=
n);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbz=
rle);
+    qtest_add_func("/migration/precopy/unix/compress/wait",
+                   test_precopy_unix_compress);
+    qtest_add_func("/migration/precopy/unix/compress/nowait",
+                   test_precopy_unix_compress_nowait);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
--=20
2.40.0


--Sig_/h5l4ivoBs0f3sdeeqOiWOWv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQsNa8ACgkQNasLKJxd
sli2oRAAsIGW/dAQanmyNLml1V89FTFjmSmpN31O8gIPMJMRyD68dG5/5C4MVd8X
y9xRcubgTwaKX97/JaOmOcQX6lsnX4tSHqm2jtXky7lEv+FRwUTpFKmqkSDzEBoC
6bkBQuUbN16Q+LoPrNrF1NfWRjeO389dDSSuCQksK/0NDnS0xKYsrkwVXHF7+kNL
cpS9shTGwqEsWpkjlJwuFldiFoB+YdWnNr7LD3GhQbtdMWkH64dyZIcOfVunDw38
YMuYpVcQusnaX74bzwEG0wS7uWL8rju3geHzLx8NNv7UWDs98fzNFea/aoJ1dyYG
F/++HKSr+ElsRuqNKRUQ3pvlr80NBpCNZ/sClAgRgE4qlSVEWBEJrkra0N3jPY3B
gqzfCMM8rFRF1ebUkQoMy5/R4k14KNmyVdXuL5/nryzjZ6kQPx80n+dGwZk9GWWK
H7HmPTo4juaxCzzy9aV1Y1I87uu7VhhFUSP9Q+8HQM5Lf9QyeTnnq2nj0taxskR6
JKytsysRg6P39gncL09CvD/4HFb7MdeiGPZL6HG/yngiiZQtMtPp7UEsOfhLc/Vu
0iv+ibsYhnMecp0B7VNdtGsZr1Uu9Jgz5sGyrrwifEnvPO9MAifU+B8STJr2Py9a
aeOKGggIGyKjHb+vXDMGZbvgHdfKV2DSeo9uVgx90+qioQmYCzU=
=poUX
-----END PGP SIGNATURE-----

--Sig_/h5l4ivoBs0f3sdeeqOiWOWv--

