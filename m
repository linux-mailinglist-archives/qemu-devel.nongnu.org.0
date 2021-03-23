Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522F1346704
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:57:49 +0100 (CET)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlHn-0007zx-Uy
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlD4-00086b-8D
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:52:54 -0400
Received: from mout.web.de ([212.227.15.3]:44983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlD2-0001Cu-DJ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616521967;
 bh=zUdGo1OnzyqA9eycEoVcse+6uvgmYOW5MxPL6wmbyxc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=OHFGwBfBuBDeFhl/dYosJxWoWORosO2ddgHZsQOtnY7M/uj+JA1yay8buHJuMvJOZ
 wosbP6ksSta7IbWMfOaqZdIDIJ4UUtsu4PAYV8L+yDv2fWycIQV7EU+pPkfF6g1s/q
 790YJ7hO4ptNUpPIp5nRLV2VGn63NLKxz/NVCGfI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.81]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MC6ZE-1lXWdL1sx6-008sA7; Tue, 23
 Mar 2021 18:52:47 +0100
Date: Tue, 23 Mar 2021 18:52:46 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] yank: Always link full yank code
Message-ID: <997aa12a28c555d8a3b7a363b3bda5c3cf1821ba.1616521341.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616521341.git.lukasstraub2@web.de>
References: <cover.1616521341.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ohgAy+Uc5E_LixVNGr6Y/br";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:3IbK5rWgZPrInP9/h6THvofeLlqiZHbgYwKKJDMVc93i7Tim+hV
 ZvNjL4E6V4CKjL7RmJ4e6RBv78uweIe3lUqnlQlxDUPg9inrX7FxJRdORzWzR30PUIZxgO+
 d9ACYtw7Te8JHoGClDNygwa8SvZtDwm1S5rn8oH8Y4xe1Z1u/cP1TrEQkx8UsGNOhR6zq9S
 BRKZeHKFnS4E2r/CkOz0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hQW59kK4kB8=:3UFd4bNmLr9aEt3wdUrVcX
 rO51Y8LGR94QYbXfnVnyil0saZseTzPMwrvPVrn+hhCHDkaBmB0+GKgFn61esI08pLHDzZIKF
 m0/fUBp0DMiwd+gLl7/3Cusc3a6pfs7vH/m7pcGBs2llzYRbUjlzE6hmqES9SRJYYNmak705D
 8lhwU6FpxmUo+716GP0L6D3Pxh49a2506Ac/MrLvruTB46ahDML3TgtRc5+H3ojI4e/GUKyBs
 KeGdmbpddQmfkmx+5C3uBZIzJFVBno37sgCPsMHRaT5T1XKa9DX2lGuGY+SbW74mbQSrpkL2u
 nCGPfUuxgLSLm33M67AUOPlEBWwB9KUNUZUpNGkGYcI8/QnfqMaK5Bd3vv9/Wop5t5uzFBgRW
 nim56HZvHdFtF4SD2hxSzFbofDI2+jfMaNDUcMKt8qtcMK8xHCch8NgAVyShm/ACk+cJwDXhq
 hNdMj/6kbAlpLdozMicX0Guprc7WNTo2naWmXZsjPy+ywCZGNsarUfNlN6VL5roIz0vDoy2x/
 feakH7mcNTw1O2cviIHusvGZ/kUUBEa/ydEGNZ0BNvMUTG95aL9sZOCTvLKfrVoqHKTG8r66x
 jR6ak4+RhxIDr18vGfmCHV1syWOaRHogH9jrFzmC7hahKGJR4TwYm/7BgazyFJmz/kXTfTD2U
 FT6QDZC5QutgIWy1+0jRn/59ULbtk8dAXi3jd/m4POpibQBI5i4XAs9/pFK7Ps3/eJ5iMvy91
 nm1gBXk0qC+8Kt1veJx0/zcknDaM7nDNygJh6QTZ0pAzaELeDRQK35vyjXCiN+vOOQcYt3LzO
 gkhPEAb+tR4eKgp52/EIw7b4uPSX/QSCERs0IE0/1prCA+rJWpaXIRLR2D5iS/FLMsgLMnIDh
 +tSyg3/Bn19eAXLA7F37UEGAwhoWw3YUg0Uul4xuld5a9EOzASlb3F06by3C0FEZ331oRZxW9
 Ti/qBZ5G4tgNWANR5p4MO/+hyqn5lYNflWtj3qrMBhw+u6bAR9lhXMIOkiVvuALNCl9LuXvGY
 RpUlr2j8Ds8+Cl1HY9BmVPV768WrxusCXlY4xKIBrlr3momC99n0FmraNv3OqAEArsHpc9iMN
 SJS2YOZE6TVFsOL30pAD4DU3GHmIQb7DzsaRHaPYpCkltj4aO7mPChHwh+FnnwBBAiBmBgz1y
 uFyACI+mTwZmFvT43e3BuGrn1ivqhK25EXDLkNVW4GLekdbf77q5/M9imhUV+xvDv0WSE=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ohgAy+Uc5E_LixVNGr6Y/br
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Yank now only depends on util and can be always linked in. Also remove
the stubs as they are not needed anymore.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 MAINTAINERS       |  1 -
 stubs/meson.build |  1 -
 stubs/yank.c      | 23 -----------------------
 util/meson.build  |  2 +-
 4 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 stubs/yank.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 455775c4a3..77259c031d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2820,7 +2820,6 @@ Yank feature
 M: Lukas Straub <lukasstraub2@web.de>
 S: Odd fixes
 F: util/yank.c
-F: stubs/yank.c
 F: migration/yank_functions*
 F: include/qemu/yank.h
 F: qapi/yank.json
diff --git a/stubs/meson.build b/stubs/meson.build
index 8a3e804cf0..be6f6d609e 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -46,7 +46,6 @@ stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
 stub_ss.add(files('cpu-synchronize-state.c'))
 if have_block
-  stub_ss.add(files('yank.c'))
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
diff --git a/stubs/yank.c b/stubs/yank.c
deleted file mode 100644
index 11b24fc057..0000000000
--- a/stubs/yank.c
+++ /dev/null
@@ -1,23 +0,0 @@
-#include "qemu/osdep.h"
-#include "qemu/yank.h"
-
-bool yank_register_instance(const YankInstance *instance, Error **errp)
-{
-    return true;
-}
-
-void yank_unregister_instance(const YankInstance *instance)
-{
-}
-
-void yank_register_function(const YankInstance *instance,
-                            YankFn *func,
-                            void *opaque)
-{
-}
-
-void yank_unregister_function(const YankInstance *instance,
-                              YankFn *func,
-                              void *opaque)
-{
-}
diff --git a/util/meson.build b/util/meson.build
index 984fba965f..510765cde4 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -43,6 +43,7 @@ util_ss.add(files('stats64.c'))
 util_ss.add(files('systemd.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('drm.c'))
 util_ss.add(files('guest-random.c'))
+util_ss.add(files('yank.c'))

 if have_user
   util_ss.add(files('selfmap.c'))
@@ -51,7 +52,6 @@ endif
 if have_system
   util_ss.add(files('crc-ccitt.c'))
   util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
-  util_ss.add(files('yank.c'))
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
 endif

--
2.30.2

--Sig_/ohgAy+Uc5E_LixVNGr6Y/br
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBaKu4ACgkQNasLKJxd
slgz5Q//b18NHQA7StH+Cs6yaNocFwo9pw3qYqL+b7Oj70QNQgOOaariixY63H31
TUoNwweI069EbFZxSYprDJg4uLDn1Ld3976btWvik/7LlDxYBsiCQVxSLd4dMvbI
dOJjpCoV7z4T87gUaVcM3+DPbpsMgaRgUsYQQxqiGOlLDzz6dk4ijGAnMniBisYQ
zgNyJL2gv8gb6JKXoU8Xe0kejfsvNyuhJYVMIHQnmzr6xVPQhN2mZlShFW6b97+4
QdlviTe+b2F++xJF14Dg3aZomh3o3P5lRp3AqBkbp1H0TbVAVrf2h5RYaq2KMXge
b8NziY49NekWFcs/R1FKplj7n9da2Pmqi+kLREp+MXPCS5oiKu4+QxkYWvnqzYze
N0UwAOn8dC1BH4oJ01vDdvJ5YVznHR/Oz9287yU/3DIaNBqtkkZta3KY8JDGAH7M
RZEgp3Thylgq5L2ii5f4/FefUA7WPyTpM+9LaQgT2b4dFme6fQ+bFfle0eM6QZTZ
2uyKmuxEfNloQR/rauLoZk5/2chw9AOb1h7l+daq2kVUoqxdZYyBpzfwItGZ15KB
vH/nozcUcCCucY2nrOU9/E97THPw5fKmP9Z24XZw2mmecELnGZFW6pSaMFiluxOn
WGUGh4iRopCn44WuLC/ljCrXDyhIVFNMH8WkXKkQzkNZxFqwakw=
=Ek3g
-----END PGP SIGNATURE-----

--Sig_/ohgAy+Uc5E_LixVNGr6Y/br--

