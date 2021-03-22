Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134A6344980
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:44:05 +0100 (CET)
Received: from localhost ([::1]:50220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMiq-00020s-0z
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgG-0000IJ-EO
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:26 -0400
Received: from mout.web.de ([212.227.17.12]:38745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgE-00052e-FI
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616427677;
 bh=Seds2x/uRPH8CueU9WBlv+slAJOyRLmoXlrz0O6G/0c=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=nhgtTlSKOkHWxdyiCsHehapW2EgHz4UXtJzTsshL8inTLGhN9V32M593BbGFjVana
 LkdEkXqEWuShfqu9Lnemzdt0tv29Z/aybUKVZJTcrwNiWVS7rMGjaia6X9+MuWaRJj
 hjzdrdy37hGFYY6+tb4K9VyvG8VXtjgnzhl76XHs=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.232]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MgfJz-1l4LW61XvD-00NzkG; Mon, 22
 Mar 2021 16:41:17 +0100
Date: Mon, 22 Mar 2021 16:41:15 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/5] tests: Use the normal yank code instead of stubs in
 relevant tests
Message-ID: <950007e82e19e75831b29fac07ab990c213d2352.1616427054.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616427054.git.lukasstraub2@web.de>
References: <cover.1616427054.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//PrJ5vlsuz+nY_uAjJx4sNV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:qDEc5Hrg2PMbxUtiF40TEuke7tXgnIwEwTKLdnkRYEKabLhC8lE
 TQGmxVyZvK9QbAMQyKC/bzR7i4KH+QLYBO8LE+veSbJZ322KKGM6QMKFp3Df9dA7Djx2VMp
 2380Ht7EccXqUwuXC4nNgUgTZjwUYxdVaioYXy9PnQgjmu/0aROLgSsFsO2yINqB/OZAVyj
 rKyZE1d0XptbmkOYS02qA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:py2NFqFjVAY=:2ZWSErJTLMOzzJTIk0Puil
 i+Io2XkzwjfXzudtbBjQZzAyprrHMv7fAhjztBm/ruWkcb3Zg05MdgPeP9WJpqpHY3bX/P/p+
 nOeywACnKeIpdbHZSh/J65PCeKorL5/C6sAK1N7aNAYhP5ddbxpabafIeMby7NNUAh+BuDCeJ
 rNZBFJ6i2xYVzce9znZ8IA4BYMELDj7CIK4RI44GdwQu797evI5oxK1vorIdVR8iFlOsTnr6e
 +GQATuo4o8pwEBxNT5pcWOk8BK426WX4gTk7URyH0CPQ1rGb1e8GjUrBPFLT02KlzybkVSKw7
 ynHqngqzXS7G8RStEuZ6sdVp2D0rdeyIP1hMD0a8n34YrYw5CQOuk75xqwtFK3F1ezpem5eYi
 GzgW2daYHvzRswXrDMzHlD6f+SKLsaDEibm5KKtF6NS07tC9DAMxqtwX5ozV/2RsOoNeyhObM
 ppqY2v+D+vt80/mSKrw0CSv2XrnNKzGOnErJewj6+c2QCh6t/NOrHyhG7fUwAFD6gZ5aUgSd4
 x3v/lU1G8QpkCla6uYWS7XVhueYb066Qos8rmMVz9TmVbXi+ciYM5r2WjoKF1cHspub7D/PR3
 tROTVpAvwfSdDcDmdGhsUTgvjARBWu3wsbfTnLLPIbNzFai6cd+YUuzG88QrAWNA/mwskQBZ7
 xPfIiaSzWyBxlyXQZvwJpg1DyWtla2XQ/YAgwUKUHEc/EibeKg7REMlzBBb/K/M5QXZWP+yaN
 tOPrVYKEQzrhWEqHQp8SVAY2UeTCPn8r+wLI4x36Gm6GJ1/SHbqwANLRvyE4fWRXFDfY6iw+m
 pi5EjPilVZik7wmYhrViXhSHvQIf7UuNA9KkjA2S/GjmjNcIiOp4rnk0fxJ8cca+9e34bfgUn
 KNAV3haKJTy39qNQL8Tg==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_//PrJ5vlsuz+nY_uAjJx4sNV
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


--Sig_//PrJ5vlsuz+nY_uAjJx4sNV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBYupsACgkQNasLKJxd
sljS8g//bbAOJ8jkwNrEr2PLX8hN22P0tc5P4uDsPVwmH+SEEsQLrNEEpTzJ1xRD
1lQhkaxBjArd3kGDOZ243VVJz2idxMa4AyuKPnHHvNKGUkRULfa959avEu5yB3aH
SZoicXP7oWhuYXBZxEpZZj3OuV+VXvM3S3y70oxlCzhQQ3pfY1ozonfxiCgqOhov
FZ/luzxa8mQar1xeyap+2/SnchLHXOnbSxTs53zMQukNrzRQTFP3/ct+mkwgiRLx
ITOc6fXgLJOu35YVgO2XugqAUr9S7Jh6fTGDSGHnJYVBK/jTT6SBFIBfEMEn89wd
ReROaul1EnckvpPE6tVajUFC5pFyyMqxTj0EHdgpGclRrn30X1N2ik4LAaftTQFy
hvopWMw0OOIiPox7kYOWrvyIwZFvPRluqxg84hYhoWFsj5HcpjPLkmT38xYRddFv
0dsK84NOjRPH6SzJBifkZNhi78dUe4SeFutADdsi7C8N4/sgwJeoDneUKFUmIC60
WGH9r/qK3Qyg8Od5tkWiQPGOXdrrPS68M7aqtgERiSLjeQxi2376/1AM4bo1bArb
XWbLZlH1kj6JR9JXytX4nzXHFToUHqxkp6tynzqKKUV1uc5w/LDkMkZgjRKuco6h
bH/ewT+DSp1ZKQs0+mpKI/z5kdQwb1TdhcXU9U/UHEo3bnjP4Iw=
=ze9p
-----END PGP SIGNATURE-----

--Sig_//PrJ5vlsuz+nY_uAjJx4sNV--

