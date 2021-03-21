Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1193435C8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 00:35:48 +0100 (CET)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO7bn-00036Y-H2
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 19:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7Y2-0007vZ-69
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:31:54 -0400
Received: from mout.web.de ([212.227.17.12]:45101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7Y0-0000FN-Gv
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616369507;
 bh=tuyfOEeBolxuiT4kdpqwI8Wgqhvay43ezbANQOEuxAI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Woh8cQiJ52L9iC99mHeZ1PdqIzJSdUDyT24vfwyuqvhUUc4eP4nap3h+rvOJpV1xc
 KKtX+XAgF9aStrJX6DgxMirrM6wIM6A0sI8GnaIukHM6Q24LwPtKSBMbn1mtjqEo6I
 RNjnLQcvxwQCXzYQVPGvyQFFQl6Kvc5IgZ1EdK68=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.131]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MORuj-1lIK7r4B4H-005u5o; Mon, 22
 Mar 2021 00:31:47 +0100
Date: Mon, 22 Mar 2021 00:31:45 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 1/5] tests: Use the normal yank code instead of stubs in
 relevant tests
Message-ID: <950007e82e19e75831b29fac07ab990c213d2352.1616368879.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616368879.git.lukasstraub2@web.de>
References: <cover.1616368879.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z9c+D=8yEXVEulNExJJ/WB5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ej3DrsVhwNwtE0w9ysuxD0oWGlavD6FrHOGq1wTRfRmWhgkwff0
 JYnDvKyQiZZOu6Vejvx6CQEHm17li9n6aGY/hAyg9uw/t5IQGFxiSGZsPitLUmaoJ6QMiWn
 IosrXShu8/d9t/mUAjQZDKHgimtzGv6c0x5MDIbQLSYuC83ppzLX23pWGYnPYYofQmQsu76
 VE0sEvHbwCku7utRxqccg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sg51EiL4+wg=:Dt/Q0kx7ADKNQWYup/gE/1
 VZ/bjCpqqOuI4bB+GjG9xCa0LqACzZYr1X7wkk4NWbAZ8JxoQPcAQygYh0NFPexR5uHyuQzJl
 un4/4aC/do5Vlcd0T4G1BurqVgogCBn54YGvW3G/yWu+FN1MllpBIPlIFAqPXenJrqP5hPuka
 q77Gh062SljYoOqX61TMDNXpU/wwuaY/lVRZhB803CqTvkKiFB+xe89roerjZrp682UMxCyEj
 fsAziPV6ni/tHwRAAKB+IIFF6zfzp5h3x394HDr9Z/8GudIgciSgUjiFKYf6FPLcDlp1s3tnp
 lmc0OxiOe10qnmSnQY9ITbDwDsEIg5lJxq50kcrqFdDhirs9+28ShdGqjS1Fgs4hgd0FCYLDy
 v0Emm8hGpI9UIE7Aop8AYaXfQ9i5mf3infThCpCcK26oBMV2mmX9NLHuMje2lPkarte+a1cMY
 JKNRLRNwNOdXdfzgyP3bjOXD7UVtubiOCQC9s14X+qb5xDFtpDbKmREM0cX1IxABEbUf3m6ol
 vAdwO8JwUBIy9BCzmTIr1xfz9L8eTIrUj85zU9KpvSrRkS7Dar+nAMnDpHgCkNO/hk8sPm39n
 NsgAA9GHra87WGttqr4r9UkUYC+rE+kgfdu3MNGqqv2UJOcY6LmoKRCnc9qoMIiGPh/HHXAZe
 vEfciSRfPLx8j959bXSXDLekSw91gq0aQ9jGK+3rmYI9VMYqSvP+2tUKtDi8Brf3quesY9Fyu
 66n2GNw3OngCFIVwuhc0q4oCuUYrchQNJSu9xkBkIeDeQ77YRJ5ljWXtBf3OajwDLu7wBKRAG
 t/5szLcoCreklH81kMcNp8AW3UihE56UgOCtSmeOCI/j3big+RXljo8VV7Rph8Hl8WfqZ3s73
 G68eQdyz3GQtMkDltKS8stTb6XDOUdUHzbZrH0PYU=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/z9c+D=8yEXVEulNExJJ/WB5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Use the normal yank code instead of stubs in relevant tests to
increase coverage and to ensure that registering and unregistering
of yank instances and functions is done correctly.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 tests/qtest/meson.build | 6 +++---
 tests/unit/meson.build  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 66ee9fbf45..40e1f495f7 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -234,9 +234,9 @@ tpmemu_files =3D ['tpm-emu.c', 'tpm-util.c', 'tpm-tests=
.c']
 qtests =3D {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
-  'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
+  'dbus-vmstate-test': ['migration-helpers.c', dbus_vmstate1, '../../monit=
or/yank.c'],
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
-  'migration-test': files('migration-helpers.c'),
+  'migration-test': ['migration-helpers.c', io, '../../monitor/yank.c'],
   'pxe-test': files('boot-sector.c'),
   'qos-test': [chardev, io, qos_test_ss.apply(config_host, strict: false).=
sources()],
   'tpm-crb-swtpm-test': [io, tpmemu_files],
@@ -266,7 +266,7 @@ foreach dir : target_dirs
   endif
   qtest_env.set('G_TEST_DBUS_DAEMON', meson.source_root() / 'tests/dbus-vm=
state-daemon.sh')
   qtest_env.set('QTEST_QEMU_BINARY', './qemu-system-' + target_base)
-
+
   foreach test : target_qtests
     # Executables are shared across targets, declare them only the first t=
ime we
     # encounter them
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 4bfe4627ba..8ccf60af66 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -123,7 +123,7 @@ if have_system
     'test-util-sockets': ['socket-helpers.c'],
     'test-base64': [],
     'test-bufferiszero': [],
-    'test-vmstate': [migration, io]
+    'test-vmstate': [migration, io, '../../monitor/yank.c']
   }
   if 'CONFIG_INOTIFY1' in config_host
     tests +=3D {'test-util-filemonitor': []}
@@ -135,7 +135,7 @@ if have_system
   if 'CONFIG_TSAN' not in config_host
     if 'CONFIG_POSIX' in config_host
         tests +=3D {
-          'test-char': ['socket-helpers.c', qom, io, chardev]
+          'test-char': ['socket-helpers.c', qom, io, chardev, '../../monit=
or/yank.c']
         }
     endif

--
2.30.2


--Sig_/z9c+D=8yEXVEulNExJJ/WB5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBX12EACgkQNasLKJxd
sliXFQ//XqMGoefXAqqMs9wZwZmVrUdjtoryr7Zlkdx4Z/ZNwkIvpf5WqqdqGYhu
5orW/xFlEG4GgCkuy82kaaZtiFhhxQLO3byf5+/Qh68NJ//jOiskwOX6F8faMrZ/
BdB9jcBLT0A88ngUhKxJgZbxLjyP29UVKrsUvBJl/hF5mLx/+/xcHZejD0PR/ay0
LtxJaH64mk3qpXOizx3/Ll66FWBtGbzXkXn9y0q+nkcLROlWN46a+GU+tQxuXGqs
rXL8dnouW/mCqU3ooLK6DIChFRnIYUGDkBe5M1PCETN4VL75ABWodjN1/TLP5ea7
zC3fD01H3ng2ThwSQpAf1ZmMAtSXWKqnpmUPrNNZYuvjishtoUPQ5NcFEpu5Fv1B
x/G053WnbNgYTvimcGCl/8kGoYqnVvYcnctSETekDdI+nT2CeByLGmtSLKz712ji
G3R76dG5gealPO9PBwsIYZFqN5av0TNLu8Q7pG2Nk0GO2mAFcG4zVhdzqVWZGb7i
Jb6EYy9s6cR9umD34xHSC/KDusNgdcWjLrvdRt3P3GsntPtfrgJFV4iOwWpKGbUK
9n/qvvkOZcH1d2+En94iR60lFbAlFeChHPGsbVozYpBqXOZtXbvDKTH6Yo8ZKh25
WvhuI4qxD1xc5Rwyxmd1knHsP7rCeo5lBnMim9ruk/7muJj5gUs=
=s7dH
-----END PGP SIGNATURE-----

--Sig_/z9c+D=8yEXVEulNExJJ/WB5--

