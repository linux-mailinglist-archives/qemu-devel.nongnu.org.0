Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C869B6D3958
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:07:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1A5-0002Su-Sm; Sun, 02 Apr 2023 13:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1A3-0002Si-F9
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:06:35 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1A1-0004Y2-LL
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680455188; i=lukasstraub2@web.de;
 bh=/apVL7JItbe3d/TDj/ythtFw7lFlzFcl2W9T16lnNQc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=YuRsxJspDfpz/WJ9aSJmuayZeJNJ3+UvU9BEDJ1Rt9pOdl4QVUIT4vwRLl/eVTazj
 INA4QJ7+XySQO5Iy/pfToXj4CyQQRrMWDu8KCyO0s42UgPWDfu0plhjpnw49rcwc3s
 0jaVuJMqFyzXuY9Ec8K7Z8BifPDecRVUnx7/VMzNP58yHVtZ/iOenkUuDl13B+7IF/
 qh8sghbEnp8chCquw5rdFDtOJGLKk/r9KAzuKOM9Gfj1f5obTz/qCWpgrLXtbswW//
 DPiEwtfC+TS7dq053XLWI7a71d1wDBOrG+DGiUMto63pRL5aJaX/dNAY+4qTo8z/mJ
 PC6NuuPYTaDrA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mav2l-1qGA3T2KcN-00bxzT; Sun, 02
 Apr 2023 19:06:28 +0200
Date: Sun, 2 Apr 2023 17:06:18 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH 1/2] qtest/migration-test.c: Add test with compress enabled
Message-ID: <20230402170618.6b0edb87@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0X9ZR9qAJWtCC7jfkol3it1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:2RsVYc+uy2IkJvPiACqaaJ8yZjBVOZIdedoDoZ3tXtQPVpGWMxG
 VvYPOxdXFgvCST/JiSYJMFNps3ofoySxAjVz3xIASt3X2vCjIN9Gw7c1HMWf/udXpX7z066
 LdwD3S9EVTR8jlZ5JqeaccnH9HTKDCvaEDKRIKiQoHGhelQUytqkbndC+N9XvxyZvsbtMJY
 asvV4PmxLrYGR1qBWDLdQ==
UI-OutboundReport: notjunk:1;M01:P0:1/CuZu20+m4=;z5uogJhkulcLHA7aIvFvqQ9IWlz
 5hDj1mxtBB1yu9FnFMA0EKisd8oTy9mQRHqk7+SXiBoJtwL8/ey23ylcLIoEcDW11dEVnwkzK
 xo7OHzZ+BO0/9Zlg8klY53EoIdQCPkU5LsbTyxXybu6zsXKpsgw54+m+f5c3byny1xvA6nOok
 JZ70EjltyZuGniv2O1LVT3wESjsIXVSDOoIEaGxi8gS4qye9Fb75KcdRwvJtKWZLzAlFXnekE
 pNo4n0OGNLZJK22ZW8IHUfrSGJRRDPv2C7d2N/bSOzoQW1Qq83UJw0H9b24ZSu+PLhTNAgHcI
 gKOuUUGbKNp/Kh7I2DG82uaKJN8mbKpE2SqJdK4bzxlIV96SyE5XRrdAA8Xe0L9ZrjQ/BcABh
 4r7ucT6v8/8j7onlp1M2lqtH4XwDR9NRcA7qRLBDe2WE9eb5vKF1nj7/lOx/fKi/CK9gfUWXz
 +uZpkLpLZ68hRASl1oj8ACp2uy9pGhXdGbOhYACpQCti+CDK/3pXyj44HdCBX1+m+cNh6ZBna
 19jiJAj4aoM4yPY7IQ2w9J6ApnpiFEIfw4BNrKT4m3ZE5NdHADCqqValnaCB6XfbLWaJki42t
 R4wZiUEEid6NPVCRJdn2AsoBux2r27nVzMAfly35BItvInYUPQcCK7yla1KPpI1iUYEik5XDS
 34UiDPpFqsssIm4GPXuMcDc5pF5J22sM/1MbEPmTxZoEXbD9VR7cVu76eoORrYXvpP1rz7ZQI
 T0TnPYSB7Q+2I+TpvKjT/EHbjmKqDoHEhO7+lNrUmY/d1zkcVcb88YocQolMGdNOE+lbRZUHd
 iR5NAHuQKxKvmW3MFyoUro9vZe+S+Wj4DZQrB73/PuhbhJV6H2aXc6/EaOLD2FcIZonurKcHc
 AoGU++kwDahaV1ini/Ux/JDQJnrMXuTzDFSEh/2BjzGYc800HpIDe9oONQLEzRAl7O8wNGHGZ
 o62Cjg==
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

--Sig_/0X9ZR9qAJWtCC7jfkol3it1
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


--Sig_/0X9ZR9qAJWtCC7jfkol3it1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQptgoACgkQNasLKJxd
slgJJQ/9FvrCQ+SqjcvBT6YQJUARyP7dzPklvwgqCVJJBf26kfjb6TW/zjs/647b
1Wlnmyl6RB5iOl3IT8qU1K1rFYPTBMBen3jjdVlptDcHfyhp0wp27viE1LGBQBxX
ZUANAOVSCpBjmHmry8YgykFIil1dBFTL7fmwGWqVPCJjANVAfVF/syuORxPCXabs
iVQ+U8LY8lh24DzONfF4gtDnQob6o7ckJE8WYZOR8HyespXWK+NQb8UOak9Glgo6
9DBLL5LTTcqdf80ZAP/6EXAm9/ifbWW5IJkCjg37jgRMGAhJOKE4lspL0NEkRDxo
k5ONEx+uvcZSQffFEFnCatdhFcxDNxSkLC37tTG9ROiwwx9NgR8S+HsngVT2TEti
NsQEaKi7NEXflBo6IGV1o2oyVBgG05JU5h/cMEHE8eIzt2CpacReGBd590qKtUR/
mkB5OHAos2vnZ2xQcFDUrYqvdwl6C5t+mZUjafW/rxMfUjA3b7ry27Xj0HlqcBdj
fVp37qhshZTyU/9/e1ZAk3YqAeDgD6Nsw1LONwljcOJrqdT9szM8L+Gb00Pn8j9V
uxQsxzC6p+DEz/QuDCXS+2DSyxUrTK8booxcCvjYZwsRZRVrUZCcvEYlQGu7bMB9
yT1laytU9P3NpHPNe1GEJ3cinuRTMojq2mUGUDfq3jh1hSgRgm0=
=BzRA
-----END PGP SIGNATURE-----

--Sig_/0X9ZR9qAJWtCC7jfkol3it1--

