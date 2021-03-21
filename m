Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CEC3435C6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 00:33:37 +0100 (CET)
Received: from localhost ([::1]:45542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO7Zg-0000pK-2l
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 19:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7Y5-0007yO-7V
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:31:57 -0400
Received: from mout.web.de ([217.72.192.78]:50867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7Y3-0000Gh-9G
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616369511;
 bh=g96QoTGwedFUXA0fm9qRHfwgSpJ5sKc88uQ9mOYbs8g=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HldLYBfnwi/K6EMLBLsNFThCJvvRXoNQ/MaQVybK1DBp8sswnUBpROay0kfcukKvq
 xXNPj8jBrprHmLhSg/qKqASmTbme1d5H4swnZdAOlrdV9dJV/3ok2gCDTNVSPL6ZAO
 TlZetMq4CR0D8hsTDVLfb6nBxo37bPRIYOZ/ukY4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.131]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LfAoO-1m3o5P0R9U-00omLQ; Mon, 22
 Mar 2021 00:31:51 +0100
Date: Mon, 22 Mar 2021 00:31:49 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 2/5] tests: Add tests for yank with the chardev-change
Message-ID: <a9bbe2d090df2a88ff5d71f95ff3888873c5e4ad.1616368879.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616368879.git.lukasstraub2@web.de>
References: <cover.1616368879.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0yWvBSAJSpD2xkySF0CPHfM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:uBbVE/AGt6Cs/n1SLeOx7krvvnF1f2SiUvcmPVjMKH325m8ypIL
 8HDXMcGIfdCtJbD424GTZKzaUb96B6XoMYH85a9cJjxx8WAgfCQO+vJWTK331WY26nr1DT+
 nrTmWP9C0Z59swCDB97hcLrmbv8zF+ECb+TAgNjcgGr59W5B8ZZ63UNxs+ezHeyAPdqZ4T7
 eiZGbUSvbUp2Es48mPekA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5WIsvmLIz/4=:1IBQmfxnOCkHfc5bUSf6fy
 05+f5jQ2y0tPwCKvgNnmlwyyorUPbBeADsUkCHt/Q/HCx0Jbe1y/k9aNCAoqISZstpIbfMZgL
 IAckN6EJ1YqRw/C17itkqN6oL56xLOaxihnyHCVLwgPo5UiqKrFOVnQY/qLQfQgIqeYD88HMg
 shzoY521bQduu/Ft2VGDEuCvtdOlr0iPUaoRCfvWfCPitYfx9MBo1QDJDgn1/yDjrMaPBXkY0
 EuRzvFHCe6aYyf1WPwKBjQiw7mXEyJ+VfHQqes2muk6ji8jNytvYvuUGUICrqHPXK0bBDXzNb
 1qAbxGk0TQ1Im1MS1RHvOjzUoBkGYW6OmD/AZd5e1/O+v/UuMyX1oe92U9rXCv17xWS7TNBpr
 CceVjNW+B24cWfMmoHIR2NVANH7mCBqCPkhBwbGrFINAUh1a61rdztu4uS1xLcfti2sHjWH7+
 5cztiVuWQg3FLYwBkgjqAk+HOVa0tr8oN7qwqkZn/O/df05inn1+zslM6sUQs9T8BYiGJmoMZ
 LfSncZm1Uxq5mm8r6jWXbkfvE7bVaDERRIGgc1JLVYCQsryNRJPLwGa5gplaoGVcrTcFykBT0
 7ryI9/hkqUg9b41j1kfFUD6/M90+ebEg2K6e8kVsMxYG8NGOeY8TKcgC94Ld6qhCRdWOK2/mk
 CCEEffXJ4HFwANAnqCeteRdswRM2fSALw4yEeoxTIzVlinAHX2yCBm/ROxE2k53rtFAlsA5wn
 l3jP8GVNF2hUDk0jmx3ulZFubSTYYTA7HL6C/el5aXJmh5B2ZJWTl0v0ZDtPxXsM9TJ7TLxIp
 qWImah9BvgfS4Dzk8gW2qhtydcc9yh545NOdv6oaFo4dGqv9j9gIe8fQAw3p9L4CUJtQYuVlo
 Tv1KTCr/Eor/BrkGMR7cskgYj2SngW5DPfNE6e0yo=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--Sig_/0yWvBSAJSpD2xkySF0CPHfM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Add tests for yank with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 MAINTAINERS            |   1 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 240 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 243 insertions(+), 1 deletion(-)
 create mode 100644 tests/unit/test-yank.c

diff --git a/MAINTAINERS b/MAINTAINERS
index aa024eed17..a8a7f0d1c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2817,6 +2817,7 @@ F: monitor/yank.c
 F: stubs/yank.c
 F: include/qemu/yank.h
 F: qapi/yank.json
+F: tests/unit/test-yank.c

 COLO Framework
 M: zhanghailiang <zhang.zhanghailiang@huawei.com>
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 8ccf60af66..38e5dba920 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -123,7 +123,8 @@ if have_system
     'test-util-sockets': ['socket-helpers.c'],
     'test-base64': [],
     'test-bufferiszero': [],
-    'test-vmstate': [migration, io, '../../monitor/yank.c']
+    'test-vmstate': [migration, io, '../../monitor/yank.c'],
+    'test-yank': ['socket-helpers.c', qom, io, chardev, '../../monitor/yan=
k.c']
   }
   if 'CONFIG_INOTIFY1' in config_host
     tests +=3D {'test-util-filemonitor': []}
diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c
new file mode 100644
index 0000000000..44f24c45a8
--- /dev/null
+++ b/tests/unit/test-yank.c
@@ -0,0 +1,240 @@
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+
+#include "qemu/config-file.h"
+#include "qemu/module.h"
+#include "qemu/option.h"
+#include "qemu/sockets.h"
+#include "chardev/char-fe.h"
+#include "sysemu/sysemu.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-char.h"
+#include "qapi/qmp/qdict.h"
+#include "qom/qom-qobject.h"
+#include "io/channel-socket.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qapi-visit-sockets.h"
+#include "socket-helpers.h"
+#include "qapi/qapi-commands-yank.h"
+#include "qapi/qapi-types-yank.h"
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
+static void char_change_to_yank_test(gconstpointer opaque)
+{
+    SocketAddress *addr =3D (gpointer) opaque;
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
+    qio_channel_socket_listen_sync(ioc, addr, 1, &error_abort);
+    addr =3D qio_channel_socket_get_local_address(ioc, &error_abort);
+    g_assert_nonnull(addr);
+
+    ChardevBackend old_backend =3D { .type =3D CHARDEV_BACKEND_KIND_NULL };
+    ChardevBackend new_backend =3D {
+            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
+            .u.socket.data =3D &(ChardevSocket) {
+                .addr =3D &(SocketAddressLegacy) {
+                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
+                    .u.inet.data =3D &addr->u.inet
+                },
+                .has_server =3D true,
+                .server =3D false
+            } };
+
+    g_assert(!is_yank_instance_registered());
+
+    ret =3D qmp_chardev_add("chardev", &old_backend, &error_abort);
+    qapi_free_ChardevReturn(ret);
+    chr =3D qemu_chr_find("chardev");
+    g_assert_nonnull(chr);
+
+    g_assert(!is_yank_instance_registered());
+
+    qemu_chr_wait_connected(chr, &error_abort);
+    qemu_chr_fe_init(&be, chr, &error_abort);
+    /* allow chardev-change */
+    qemu_chr_fe_set_handlers(&be, NULL, NULL,
+                             NULL, chardev_change, NULL, NULL, true);
+
+    ret =3D qmp_chardev_change("chardev", &new_backend, &error_abort);
+    g_assert_nonnull(ret);
+    g_assert(be.chr !=3D chr);
+    g_assert(is_yank_instance_registered());
+
+    object_unparent(OBJECT(be.chr));
+    object_unref(OBJECT(ioc));
+    qapi_free_ChardevReturn(ret);
+}
+
+static void char_change_yank_to_yank_test(gconstpointer opaque)
+{
+    SocketAddress *addr =3D (gpointer) opaque;
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
+    qio_channel_socket_listen_sync(ioc, addr, 1, &error_abort);
+    addr =3D qio_channel_socket_get_local_address(ioc, &error_abort);
+    g_assert_nonnull(addr);
+
+    ChardevBackend backend =3D {
+            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
+            .u.socket.data =3D &(ChardevSocket) {
+                .addr =3D &(SocketAddressLegacy) {
+                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
+                    .u.inet.data =3D &addr->u.inet
+                },
+                .has_server =3D true,
+                .server =3D false
+            } };
+
+    g_assert(!is_yank_instance_registered());
+
+    ret =3D qmp_chardev_add("chardev", &backend, &error_abort);
+    qapi_free_ChardevReturn(ret);
+    chr =3D qemu_chr_find("chardev");
+    g_assert_nonnull(chr);
+
+    g_assert(is_yank_instance_registered());
+
+    qemu_chr_wait_connected(chr, &error_abort);
+    qemu_chr_fe_init(&be, chr, &error_abort);
+    /* allow chardev-change */
+    qemu_chr_fe_set_handlers(&be, NULL, NULL,
+                             NULL, chardev_change, NULL, NULL, true);
+
+    ret =3D qmp_chardev_change("chardev", &backend, &error_abort);
+    g_assert_nonnull(ret);
+    g_assert(be.chr !=3D chr);
+    g_assert(is_yank_instance_registered());
+
+    object_unparent(OBJECT(be.chr));
+    object_unref(OBJECT(ioc));
+    qapi_free_ChardevReturn(ret);
+}
+
+static void char_change_from_yank_test(gconstpointer opaque)
+{
+    SocketAddress *addr =3D (gpointer) opaque;
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
+    qio_channel_socket_listen_sync(ioc, addr, 1, &error_abort);
+    addr =3D qio_channel_socket_get_local_address(ioc, &error_abort);
+    g_assert_nonnull(addr);
+
+    ChardevBackend old_backend =3D {
+            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
+            .u.socket.data =3D &(ChardevSocket) {
+                .addr =3D &(SocketAddressLegacy) {
+                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
+                    .u.inet.data =3D &addr->u.inet
+                },
+                .has_server =3D true,
+                .server =3D false
+            } };
+    ChardevBackend new_backend =3D { .type =3D CHARDEV_BACKEND_KIND_NULL };
+
+    g_assert(!is_yank_instance_registered());
+
+    ret =3D qmp_chardev_add("chardev", &old_backend, &error_abort);
+    qapi_free_ChardevReturn(ret);
+    chr =3D qemu_chr_find("chardev");
+    g_assert_nonnull(chr);
+
+    g_assert(is_yank_instance_registered());
+
+    qemu_chr_wait_connected(chr, &error_abort);
+    qemu_chr_fe_init(&be, chr, &error_abort);
+    /* allow chardev-change */
+    qemu_chr_fe_set_handlers(&be, NULL, NULL,
+                             NULL, chardev_change, NULL, NULL, true);
+
+    ret =3D qmp_chardev_change("chardev", &new_backend, &error_abort);
+    g_assert_nonnull(ret);
+    g_assert(be.chr !=3D chr);
+    g_assert(!is_yank_instance_registered());
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
+    g_test_add_data_func("/yank/char_change_to_yank", &tcpaddr,
+                         char_change_to_yank_test);
+    g_test_add_data_func("/yank/char_change_yank_to_yank", &tcpaddr,
+                         char_change_yank_to_yank_test);
+    g_test_add_data_func("/yank/char_change_from_yank", &tcpaddr,
+                         char_change_from_yank_test);
+
+end:
+    return g_test_run();
+}
--
2.30.2


--Sig_/0yWvBSAJSpD2xkySF0CPHfM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBX12UACgkQNasLKJxd
slhsTBAArDjIO2P2bCZ1s3lfcNPEgCioQMPOUdQnMWMmgRA+sYjw9ZeaNmHdEKom
x0KPEC9fHrlvnxcyvCh9XQ05RE9bwRXGZ7AWDDLIqoFpugw99TcmRsjvTivpvIAg
/vjz91g/K7QWuhOSExIujYoPt03YgHhHVzzsD6DBSAAokHDhxWMI7jPR9CY25SJa
NnRHzTngdRyfi+CdE0VYmS41QTOGs8UxIz44qwuNFiaEk6KTsmM2QTIXi7RaufnL
NDd1AEXDd2Rp37s4TEPlajrPbkXSr0huK/E7K4klY4z0ccywefQOjmZ63oSojjCm
zykT0XDgp7GUdBUMiw/smtjOCWQWKLs8A2SqqKeMHwdo+LE/BGnUVD0zgirvBceU
mYXQ3IV49Q7kubpdJ3DNdYIgj8BpoX/0pifvFZMNklB/ootn11RvFYt/yKavv/El
5GreGZ9k96Em8OLFNzVjBzcM9tf89JEE88nP3T7ctSZMP14TAhttffEreOGN1BQ+
6VYmz/ASMVGOhtJ86NTbWkOasSG4Z3cEZnk60riTuvMSlGVfy6z7ydwbxiCZlVfO
pdP1cV9l39K+RJ0ZJaBlTWg4sW4ye/7ikma36mmwrfeR9uUV8gzsaq1yZ8Ic1G/n
FNRJEHLFGDK8lCPjNsU4E/vQjMPN44NroEyGngjgdrjV2HDJpNk=
=KkWY
-----END PGP SIGNATURE-----

--Sig_/0yWvBSAJSpD2xkySF0CPHfM--

