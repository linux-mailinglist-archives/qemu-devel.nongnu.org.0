Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8E034ADB1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:37:13 +0100 (CET)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqOW-00071y-CW
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMa-0005MC-Kz
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:12 -0400
Received: from mout.web.de ([212.227.17.11]:47559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMW-0004U9-9M
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616780105;
 bh=E8oU0ECJhkMypWkLz/VLaAngom9VSRvVzuBq/XgRxgE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=sMMblpFeCbZW/aB4HBu3d8E2vGDweUR8GHEmxz1FyEQ20lXXOpOvwNj575iXs6PMu
 V6E0Th/ycFeIDg3WgIoWoF3uWVrzn8YWDszczv+QW5aJ+Gou+bwm3jT6fDy+WhrID8
 O3cc6bXmyjAXdcpz8V2ZAqM7C4CcpRWlMUUbs29w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M0hfO-1ldnD43isY-00usw9; Fri, 26
 Mar 2021 18:35:04 +0100
Date: Fri, 26 Mar 2021 18:35:03 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/6] yank: Always link full yank code
Message-ID: <ce046d8c6ecd5efadaf592d2759d29fc25fef361.1616779714.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616779714.git.lukasstraub2@web.de>
References: <cover.1616779714.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UPAThusQ5tQi3oQoF1XqLxu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ZRfPae/c2RNahbWm6UfDx5B5CP2I+V18y7pBxB7Jtlqf1+3Ro8s
 vE3Db/kQsFz6N0uI39gizyNj6O+civ/KHKF1WdOqa5NKmYqEszDs3cEgLKK4YkvqMnlpsQd
 A+NoOjPFnrqzo8pApsTe/D6ZCFVXv/rAbn+G3/61RcO9nKpMp91Heg0M+53BH/oMDQvK0aM
 tMPMy8v7ANOpPiLfD4cOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lHOKdF+QC0g=:dnuugPtd4IQvTjvuKN8j9E
 S3FVZirnSDIWzdNNwtpbS8btdSWWOECAYckD9OFd5wdZYNZtDqC3P/yz8OOVZMuZ5bYdFjFom
 yy3L+zDKE2A6B+8wmoETeg4ze0TXWfwrCo565A4uDRC0fr2eUZyeQtrt5RGWd7aCtiqlUn/IP
 z9qskLX/2pqWxl59DTpdzahpWCpHNM1iVlywEADSsBUGZNjQ+8YAsD+SOvr11uU5zU5f3aqW+
 UuTZYF0cBecA3eBT2pbSCgFThS5NmA00joeFlQJh1hkGcDOh/uMcu/m3rQfZTHIY2PlvGN9gy
 O2ElZG/LS3A5sS+JplJAMYWR2Jid4D700yE4tSuDG+/1SimYe8wcSZtP6+SAJPZdnir7NsPnp
 L4k2nsc8YaRv5PMh+hX8xp5l9RG2Dc+F1eGi/Aa6AyWDrpt3XAVR6RnY2xE2f1ZsKDQBlwgKu
 HzL/6TEd8skg35RJv94P9md6hTPsvNS2uPViCYSPWj1PetgHRx+OEGznBd/YmuNOhuqUUNqP+
 wicsGJqbp12mZ6yDQPQpTfU7why60i5U8601sarcVsltfsmLw12jLlU3ZAnAN6cXo7x5GxjfB
 8xtlVCV5c/syDxcObxC4H45KPQFyFyikLPfHrz/LJ4v+nY1BONj6NuFimXU187VyMgjFn8hc1
 elhrIUsd5ReWm9cbvfUx8AwP/+mv7kLyjy8sZRk6w9S90KOeF1iWoZHFmgFtyUhFO39/4OJoJ
 Wg2NgY7xlG+9RE2LzgndSK+u29b8epHId9VkE04irbeLsWy/xh/QE9ngKwOafGJ1Rce5pVdn4
 stntX0krnOVWfSMyRHqKyGBkmJj9qpqSXgP54OdOauulTLSWTurdm3bcg+i8rkbQR5xAka5c5
 6Tc5CmWEnv4gFnC3W5rtUE42xQ5zgARiuoFfIAsVP7rOkMJe7GAp7SuQ0an5BsU0qKQqAy7rH
 0RkELHW1qk53pZu0jnPBISO5kkuf8rOdVySUT7aUOhvzxiK8X1lKrdCSnzMkShhk3uwhtLowd
 k8T/LQj1s+UgSTh9WpExBC16Pd3w5d7eDaR3nJf4fzF22PUWy+chK3PY9ZzOr3qdtTJDwIkJq
 luU0UuV0WVAODz/tOoNTvmTYayhq6d2hZgfRQbtIG/W4xtmepy6H3PNnUTot6+XZD83mwHmyV
 72azN4i4zwSKF18djfRAtHmiAhxdTzD1oK872ti6Ed9dQQwU5hfiQcJ/pI1lvl+s0fq94=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/UPAThusQ5tQi3oQoF1XqLxu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yank now only depends on util and can be always linked in. Also remove
the stubs as they are not needed anymore.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
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


--Sig_/UPAThusQ5tQi3oQoF1XqLxu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeG0cACgkQNasLKJxd
slhmRRAAtQln7R2zjJJCHeFL6zUqkd4QYalwe9QcyDnQ+PQ6oI98BaqpgRyNUCV9
BUa+yymSZbtfKpLZrOnq3loBBtlTFCc6L0xOjdowPUNgPGGAjbBjavvwagMgzpFR
YumBKO+xC4X9CsnhxjctPWtY6Lrjp4Ggc9BEsbuamRuAEVIoFB9m/nB3DTuz4OXa
Olhthqhotb8e/Rn5CbwXNsffxj+VJk+dG0BclO4Z+m3wBA15v+0FtJLMSLnT530J
GME4GKGeeIPx3qi3YpW7U7Pjl3lBAJUHQFjtA/Z7IQrlG57MYi//Sjad/5jq+Qum
SYitVFw8Z3vDWQnxyAMEXfE8kcc/syFFt3FQFTgYECh9DdIUMYAnZ+ppwME++zJw
gruMulUJxUF79y6WggVZ3nSk5QMNF6JXYzYQ5bXwkF7mBunMinDFIEl0R39yUP9e
/EOZ3eQUl2E44P7ZmCYeFP17Pt5HUQSLzev9i24v7Z8d9BxdNfXrbkPdkdPVnaMT
4iE0o48RuigIRK24CLl8xESYVKD96YOMLTxFIHqRe5ZS1sCjzP4goWsU8nuTZEk3
t29nV35iJI9h4vtyNvguca2kIY0Mu60k0MTd6ZKGaBEYAq+3t2RE2evriqZ/mEZ4
aZt9PqxzgLR87sNaTeZHdXGsAmtaVI7idkYtWI4GXM0Pa1gLdjU=
=ANiW
-----END PGP SIGNATURE-----

--Sig_/UPAThusQ5tQi3oQoF1XqLxu--

