Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79D3125A9
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 16:58:38 +0100 (CET)
Received: from localhost ([::1]:33890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8mSL-0007Oy-D4
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 10:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mPI-00069i-HD
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:29 -0500
Received: from mout.web.de ([217.72.192.78]:51521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mPF-0006Vn-TL
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1612713321;
 bh=8gcxyc0BOTWa/0add2NvTRVFBINwkxvOnIS9uO8R2X4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=h1WU3MQNPc+yXXpMtrmYgtLNJwjhFG10vjMlQgve5MyieRZv7d4D9aODLGbXBhBC4
 s3D5gF3Ia3acl7hAp3U3opOXVbc/CGO1iACM7dgS140taYQe2vpBcmXGutvvC0wmEC
 Muqc1oYX5tVQUsyE0jtGtNS0wP5IOiAzHaBhkkUM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.85]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MKa6N-1lAhY73zk7-001xsy; Sun, 07
 Feb 2021 16:55:21 +0100
Date: Sun, 7 Feb 2021 16:55:18 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 1/6] avocado_qemu: Introduce pick_qemu_util to pick qemu
 utility binaries
Message-ID: <edd9af16a2b716becb5adc5094cd831f4a8e96fa.1612712637.git.lukasstraub2@web.de>
In-Reply-To: <cover.1612712637.git.lukasstraub2@web.de>
References: <cover.1612712637.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lVTOGa/hIoOwGC4j+PFpam1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:dakuNAQXVzhFVcfZdzQZTRCwLhtS9Wo+6VOlTVOwCZc1WQd/L2r
 Q25gIvfLCr1CbFgL41/Sa8K9xfMZQGXjS8JMWVctCk7t0pef3HtzztbGuov1xjMGgWMmTdW
 s7ehM/nqdOanXBIfpGhzhgcMKPM2HrpE9CF2Zb0flrHjZ/Ya9F4scBQaX8SAMZHm+PI27xX
 GZlI8UwOqPjlrU3kCpuew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zQ+BNbA2fTs=:SVDDpaZihTfQlQv8Z8yGP4
 73pYNAS4czEfL7bTdB1lC4LIfIojddRD3TC9UsefJetlt2LldlBLqNvEl1NyOjpgobIAVNnLS
 1aAVR6AEk7dkQztwiG8EMDXa7g24KP1QMKKpEY01VNWD5DyuJRiWtFZxg8xBxgFOAW8cCDS2I
 8mjTf6at/59aVqTe74b4aLrgmqnQLfZ6Pbtz5SSIOxvpDxIPFvzNMLvNmKBb/mwD5ybS8HgvN
 u3JQx5soVIuqPJ2akey81VxCYnVNuFnMLMUqQ+RouN1wKb6nVEEUsdLGjY3fAq/2hkv728fiA
 CEiE8zjs7m9UBC/iig6VZdMsoVFF096xQqbPT+5iP5bN9bvIdcbbw7zxl3pPz45RxhmHOOLBx
 QkkZCK+m/BYuWYXSP1XduMHgFq3AsvsviVGFQ6FL67Ag4fOb3eS4Oi88RnX0z2PrF6s9qs4sb
 3IMU1jBMv+2axYmUIqv1FHjw6bNV2ZXYYLlgTBpX7+/UJl/dMYf9WYzo5lwfUruepGOPAeuAF
 GbexaRh/+W3PwRO2PBpme8mwicvnq1qbaLeLn8rGy0yMOfVvgSNlMqSHvasmKhiArZUWRnc8Q
 G9vteltJ9tXmSPH79BW14jdgxYRH2gzqjpVbXPPRCjWsxYwHwWMwrlUfprjchnwzuLJW7RP6M
 xQqWK0aNHSTDuY2JMlEToeskHJF6XMxkFW1bBOMNFyelNi70D20HFwdxeRD2QlK4o834T0wWd
 pE7rbM7xyZdQqXfAaTWbms96BYGSaEMKeNqXHcH4nGjhyJgQ77u44mvsdg2Y9MBkN7dljkVSr
 h4OGrRNjKAkraMxEi6WJinRrRiyreJNkUe6CPthxYG05w3Rc2Rqz7siBjtnvOpSLfUS+M1+N7
 nUMBYc2A6F82q1bmXwg1AG/fI8WrZ1h/xR5C2w+s0=
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/lVTOGa/hIoOwGC4j+PFpam1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This introduces a generic function to pick qemu utility binaries
from the build dir, system or via test parameter.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 tests/acceptance/avocado_qemu/__init__.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py
index bf54e419da..1f8c41cee0 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -15,6 +15,7 @@ import uuid
 import tempfile

 import avocado
+from avocado.utils.path import find_command

 #: The QEMU build root directory.  It may also be the source directory
 #: if building from the source dir, but it's safer to use BUILD_DIR for
@@ -146,6 +147,20 @@ def exec_command_and_wait_for_pattern(test, command,
     _console_interaction(test, success_message, failure_message, command +=
 '\r')

 class Test(avocado.Test):
+    def pick_qemu_util(self, util):
+        default =3D os.path.join(BUILD_DIR, util)
+        if not os.path.exists(default):
+            default =3D find_command(default, False)
+            if not default:
+                default =3D None
+
+        ret =3D self.params.get(util, default=3Ddefault)
+
+        if ret is None:
+            self.cancel("Could not find \"%s\"" % util)
+
+        return ret
+
     def _get_unique_tag_val(self, tag_name):
         """
         Gets a tag value, if unique for a key
--
2.30.0


--Sig_/lVTOGa/hIoOwGC4j+PFpam1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAgDWcACgkQNasLKJxd
slj18Q//fpnJzYZDPdfFvskqDtleqkY03GDH9hEUmcfDIhDvLwkUq25c4LWmsHnl
R89CT4CD7qrDaNNJGWfh5FN/1KMs7CR9HFjASW8zAzzlMdpB102lmSfWjCpAOZWp
BsYShRLFWTIiTqpQ+HVDuQw5eyFjUmp1dmvcmNwruk0Q0P52Xat+yIzMlp+M9w96
Habke6bmhl6QfUbzqbqm+iL2nTM2m9xbbS+KqmcZZJUOD+6Rbu2VZFVJ9tB93PVk
qCptMroW2M/hdfdPgOvVYTROV/nAoNYUd38O1QieF3ghQCEIc3J+Ilr7y1Qvt0lV
14/1zkZSlP+znbcsCp24mTdWpC6nveZqdPr7tDD21I1UJztHp7pFjAaPauVL+pqV
wsY/v5jz1ir3ZPNPiB5ITOMvrcKRCKdhALBAy+EJHxIcJXSIix6CRBopEGVxNVx8
XIkfhxSAVPFpAR+fR+YE+Oy68m4UcozxRXZe9C+U4CKQ9cEg3mohCsfgn/kBeyzv
qzeOJ26DxPzE2csNUvvGdduf77+gZUe4AL3J5IH6eoP2hzsAl1OHBEx4Gk8bMyZS
ZENuN0ehug1Uv8DpBW9++82y/2I4l0nWSbcSpI0qiUD4EMnjWrHBDjRlNUgrUKkL
kGCbhX2tP4JNdMKgqAom1+rwh/axhg7DuIYC++e3fPzsFtnMXeE=
=N+g4
-----END PGP SIGNATURE-----

--Sig_/lVTOGa/hIoOwGC4j+PFpam1--

