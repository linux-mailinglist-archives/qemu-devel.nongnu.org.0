Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5746D34A2B7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 08:52:41 +0100 (CET)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhGq-0006PW-CM
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 03:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhDL-0002pA-HE
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:49:03 -0400
Received: from mout.web.de ([212.227.15.3]:46657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhDJ-0002cG-Db
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616744936;
 bh=T8DxaAScgrFKLwV5enCxg8uflIx8JLJhszSKyUPNmX8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=rMVO92kpBHwjAUYkroMutDA03bR6iTKdg4I6cVzkva5I97e851sFoM76MSsCmYTpP
 yaZzKwdt6D4AI0z6x16gHO+yOL13jjb7DarlPVa1EHx4U9Udg3pzTrI+SedK4+Abej
 00zcZs+N0/Q2tSZqatVMK59KmXq3sLrcj4wbdVWk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MJnvp-1l5hLt1ott-00JtMa; Fri, 26
 Mar 2021 08:48:56 +0100
Date: Fri, 26 Mar 2021 08:48:55 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 4/4] tests: Add tests for yank with the chardev-change case
Message-ID: <b0dd0e40c2635fcb3bc23cb26f884bf585abee95.1616744509.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616744509.git.lukasstraub2@web.de>
References: <cover.1616744509.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hFGCI8qUV5_b9uApWFw/Gno";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:LwXCDLZjF7O3MkmqQLo0HIfoxCrBjSXv0c8hnmKUDKLHWqptuvb
 uGxKB/2UknOn9msbHyhHN5z8rrsWG38EM5Yd+VMrqW1vVtCiliV9YYWUTVflCF6xLZpGSHL
 qXkiY/SujoKTNrmAkMQlppQpe+sbjy1vk5v1HdOq5Fjhrx/vSA4tdljZN21P8xixRgsoBnX
 h2uX3Ut7SZqLyCl+yh12w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TSVsGNsY45k=:QXJmx5GQdAE3uLHXifbptu
 AFUs+xM0apDairHq9T3/M4fadWI3aVdYYTKGLwZw3eNqiypXty0FVqRRuosnomTuuxr1gSi2L
 G1em/Vgpk8OtWAtlJthbFtI3cpz2lZdMreGvFE8fS+yXmjDbOO2n8NQmM8Xr3y3cfBa/skYYU
 4/id9rqsw9p3qNXDkcHljlMVDpRpHi8djMtYQ8SrBiWZgW/1kukPOQeCzbdpAzfaXp1Eo4MI6
 C6UT3MmD+TQx4uZdSop+CqFjoF5jlK/u3Zk7tpJv6Fmi+MYP4M30EvtGo5jcjCGagfUSElkG+
 HCTuoFQv4JpFDoSB0DACVvCQezoZyJ39e0xOSXglIGFaw5ZaSBeNH+cxmK1CMlkgFzk5ML1ra
 X5j8gm7IeOFJ5m8U/ny6K6LqWT2ezUolOx9R0bDOPt/eroUT03rymWE+E/IZbSJ/Is0b4ZH0L
 ueGEiMJYbMdG28Pfb4NDZF5h85wcjbw8debvESiPk6BCI/o+jo/EeVBDdhEHsVxrdObwobOmi
 i3vpHJp8SC+a3AZvDpXtS4BcgN6eyGcxQCdiCeVdnkHHtSSzm0eKTzCHp9PmSqQRR/mEAG1c3
 emfnHrb3/BB+IaFJg0ekyuPG8ds2qqa+ZXWoD9X3x9TDrEJ1QMZu9RNBkiVeBlDZGu3aKUR4a
 bTN4nKWpDFlGkCuIylRahfea8r3CgdR4gaTur+TRR01InQxYiInEX2vAwiPLYExeMXtvBPcZe
 blWmM+0CwOWjSsP6mAQ/m3gCo1fIY2rYjAwFXZxwoleHOHiU/+T8Hfj9Ciq0Bfc9h+bgpBT+T
 AGOvXvrm7IaLEQZo0T51wdXCvmv2M3e/B6OVJS6YxgCmt7B7xKk46UHnkW7LYQaK6QHHH/aF0
 9Nbp8Zel9u2yQoyGQXiiLabqRWpdK7yWF5kcy1z6he3AWDd7lpclBlsYJsBfylBnP7UWBuKd8
 splqKnOtihPc4h+XzOTFhqx3Yt/NU9J/4OVhzfWnbK+tXjprB1vl9kWCOUAHuXsdJ2neqgTJn
 cZQw0Z1Ar6SClhWbmIsZULAjwoee+F/GhMwoDzVy8qzG87kidrIqFc8Lq9ZdhzLuTsUl2lNpN
 Wa79og7/pLM56aICQuZJFcQKajGtvn/V+pJh1kRQrRPL8jvs/9UL+Pz2645A7TPBdB6qizxBl
 szZWS9WqpIoHR8SuANc5kqZl+i7x08VrLaukOfDywvA4SIMiN7nX82mDdK0d2Uw1c69kP2rSb
 VMG9tBuKPVcfqCrYd
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/hFGCI8qUV5_b9uApWFw/Gno
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Add tests for yank with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 MAINTAINERS            |   1 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 199 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 202 insertions(+), 1 deletion(-)
 create mode 100644 tests/unit/test-yank.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 77259c031d..accb683a55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2821,6 +2821,7 @@ M: Lukas Straub <lukasstraub2@web.de>
 S: Odd fixes
 F: util/yank.c
 F: migration/yank_functions*
+F: tests/unit/test-yank.c
 F: include/qemu/yank.h
 F: qapi/yank.json

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 4bfe4627ba..b3bc2109da 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -123,7 +123,8 @@ if have_system
     'test-util-sockets': ['socket-helpers.c'],
     'test-base64': [],
     'test-bufferiszero': [],
-    'test-vmstate': [migration, io]
+    'test-vmstate': [migration, io],
+    'test-yank': ['socket-helpers.c', qom, io, chardev]
   }
   if 'CONFIG_INOTIFY1' in config_host
     tests +=3D {'test-util-filemonitor': []}
diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c
new file mode 100644
index 0000000000..8bc8291a82
--- /dev/null
+++ b/tests/unit/test-yank.c
@@ -0,0 +1,199 @@
+/*
+ * Tests for QEMU yank feature
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+
+#include "qemu/config-file.h"
+#include "qemu/module.h"
+#include "qemu/option.h"
+#include "chardev/char-fe.h"
+#include "sysemu/sysemu.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-char.h"
+#include "qapi/qapi-types-char.h"
+#include "qapi/qapi-commands-yank.h"
+#include "qapi/qapi-types-yank.h"
+#include "io/channel-socket.h"
+#include "socket-helpers.h"
+
+typedef struct {
+    SocketAddress *addr;
+    bool old_yank;
+    bool new_yank;
+    bool fail;
+} CharChangeTestConfig;
+
+static int chardev_change(void *opaque)
+{
+    return 0;
+}
+
+static bool is_yank_instance_registered(void)
+{
+    YankInstanceList *list;
+    bool ret;
+
+    list =3D qmp_query_yank(&error_abort);
+
+    ret =3D !!list;
+
+    qapi_free_YankInstanceList(list);
+
+    return ret;
+}
+
+static void char_change_test(gconstpointer opaque)
+{
+    CharChangeTestConfig *conf =3D (gpointer) opaque;
+    SocketAddress *addr;
+    Chardev *chr;
+    CharBackend be;
+    ChardevReturn *ret;
+    QIOChannelSocket *ioc;
+
+    /*
+     * Setup a listener socket and determine its address
+     * so we know the TCP port for the client later
+     */
+    ioc =3D qio_channel_socket_new();
+    g_assert_nonnull(ioc);
+    qio_channel_socket_listen_sync(ioc, conf->addr, 1, &error_abort);
+    addr =3D qio_channel_socket_get_local_address(ioc, &error_abort);
+    g_assert_nonnull(addr);
+
+    ChardevBackend backend[2] =3D {
+        /* doesn't support yank */
+        { .type =3D CHARDEV_BACKEND_KIND_NULL },
+        /* supports yank */
+        {
+            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
+            .u.socket.data =3D &(ChardevSocket) {
+                .addr =3D &(SocketAddressLegacy) {
+                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
+                    .u.inet.data =3D &addr->u.inet
+                },
+                .has_server =3D true,
+                .server =3D false
+            }
+        } };
+
+    ChardevBackend fail_backend[2] =3D {
+        /* doesn't support yank */
+        {
+            .type =3D CHARDEV_BACKEND_KIND_UDP,
+            .u.udp.data =3D &(ChardevUdp) {
+                .remote =3D &(SocketAddressLegacy) {
+                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_UNIX,
+                    .u.q_unix.data =3D &(UnixSocketAddress) {
+                        .path =3D (char *)""
+                    }
+                }
+            }
+        },
+        /* supports yank */
+        {
+            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
+            .u.socket.data =3D &(ChardevSocket) {
+                .addr =3D &(SocketAddressLegacy) {
+                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
+                    .u.inet.data =3D &(InetSocketAddress) {
+                        .host =3D (char *)"127.0.0.1",
+                        .port =3D (char *)"0"
+                    }
+                },
+                .has_server =3D true,
+                .server =3D false
+            }
+        } };
+
+    g_assert(!is_yank_instance_registered());
+
+    ret =3D qmp_chardev_add("chardev", &backend[conf->old_yank], &error_ab=
ort);
+    qapi_free_ChardevReturn(ret);
+    chr =3D qemu_chr_find("chardev");
+    g_assert_nonnull(chr);
+
+    g_assert(is_yank_instance_registered() =3D=3D conf->old_yank);
+
+    qemu_chr_wait_connected(chr, &error_abort);
+    qemu_chr_fe_init(&be, chr, &error_abort);
+    /* allow chardev-change */
+    qemu_chr_fe_set_handlers(&be, NULL, NULL,
+                             NULL, chardev_change, NULL, NULL, true);
+
+    if (conf->fail) {
+        g_setenv("QTEST_SILENT_ERRORS", "1", 1);
+        ret =3D qmp_chardev_change("chardev", &fail_backend[conf->new_yank=
],
+                                 NULL);
+        g_assert_null(ret);
+        g_assert(be.chr =3D=3D chr);
+        g_assert(is_yank_instance_registered() =3D=3D conf->old_yank);
+        g_unsetenv("QTEST_SILENT_ERRORS");
+    } else {
+        ret =3D qmp_chardev_change("chardev", &backend[conf->new_yank],
+                                 &error_abort);
+        g_assert_nonnull(ret);
+        g_assert(be.chr !=3D chr);
+        g_assert(is_yank_instance_registered() =3D=3D conf->new_yank);
+    }
+
+    object_unparent(OBJECT(be.chr));
+    object_unref(OBJECT(ioc));
+    qapi_free_ChardevReturn(ret);
+}
+
+static SocketAddress tcpaddr =3D {
+    .type =3D SOCKET_ADDRESS_TYPE_INET,
+    .u.inet.host =3D (char *)"127.0.0.1",
+    .u.inet.port =3D (char *)"0",
+};
+
+int main(int argc, char **argv)
+{
+    bool has_ipv4, has_ipv6;
+
+    qemu_init_main_loop(&error_abort);
+    socket_init();
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
+        g_printerr("socket_check_protocol_support() failed\n");
+        goto end;
+    }
+
+    if (!has_ipv4) {
+        goto end;
+    }
+
+    module_call_init(MODULE_INIT_QOM);
+    qemu_add_opts(&qemu_chardev_opts);
+
+#define CHAR_CHANGE_TEST(name, _old_yank, _new_yank)                      =
     \
+        g_test_add_data_func("/yank/char_change/success/" # name,         =
     \
+                             &(CharChangeTestConfig) { .addr =3D &tcpaddr,=
       \
+                                                       .old_yank =3D (_old=
_yank),\
+                                                       .new_yank =3D (_new=
_yank),\
+                                                       .fail =3D false }, =
       \
+                             char_change_test);                           =
     \
+        g_test_add_data_func("/yank/char_change/fail/" # name,            =
     \
+                             &(CharChangeTestConfig) { .addr =3D &tcpaddr,=
       \
+                                                       .old_yank =3D (_old=
_yank),\
+                                                       .new_yank =3D (_new=
_yank),\
+                                                       .fail =3D true },  =
       \
+                             char_change_test);
+
+    CHAR_CHANGE_TEST(to_yank, false, true);
+    CHAR_CHANGE_TEST(yank_to_yank, true, true);
+    CHAR_CHANGE_TEST(from_yank, true, false);
+
+end:
+    return g_test_run();
+}
--
2.30.2

--Sig_/hFGCI8qUV5_b9uApWFw/Gno
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBdkecACgkQNasLKJxd
slhcPhAAmKDPWDoJkWAqslIAN7tK7wJrtmkDr3nMjiP4jQi6bgOMuy0nVKYaKhtI
0TIU4btv6WD1ShogobT9tR0XBhIxjrT6DL7Xxm5j2lW6Ln635WN3OGiRiVXQu8nd
t/QMkcvbiGZ6gd46V3sVldgApumBHk+cGuR+pwtmp4NcbvAEu8lBGvVJU7o41V6t
6IWNTjD45Nk6HHKJ8Qt6cZdROKnV4jbq+LE4ewJTcCSHOlhiFiNSVaQE9Yy358zb
3tltbPRKXNTUS0hffrUIXKExoA8syFsmuOzUAcwjk3rU5S7JHC0IPURY0aDdkYJQ
LyRgAgziGVDtIdgsK2c5uf0ETb01uKS5rJZSy14jG26zkzLf1h2XqJy5HOxfS9O6
T62I6HeYfmnH/d38G1b97s/yzPrEdHfjWYZtvCeqf8HgrLDSYscNKHa4N4W2iRpO
r0+GYtoBsqKzmhmqtRNVUWQw3d05ZL/oYKbkEo0IoAN3Owj+HZqePRh141RxuQXP
2FxO0HD31690myci6YrnF3MlM5S7zQMHazptmKwdlGDfuc5cr7EMw7A6EnOHiGoo
RTSizW0ZklwY9trFhCdGm+hz7ZiyT87LGfp48W38mBfjJ0Xhfea+sYycyi1nh9+4
IH6wQ1rLycdFkw58r0L2wSR0K6xsPCUbhKQeK8OgpVPoY0zd36s=
=kNrb
-----END PGP SIGNATURE-----

--Sig_/hFGCI8qUV5_b9uApWFw/Gno--

