Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40AF34F0F4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 20:23:55 +0200 (CEST)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRJ1u-00019g-Qw
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 14:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRIs1-00045s-3g
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:13:41 -0400
Received: from mout.web.de ([212.227.15.14]:47447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRIry-0001tS-DF
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617128016;
 bh=hYWHdhWJ57FW11DHZstamdRVO3I1fZa5ifyu3TnL0nE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=S0LrXMWn0PrF9gCv1MxcDOgsdzqxrCLFvFZNzR/12U4ZjPBmEzS7m+k58+BWoO/ND
 z/QV+0rX89nKDr3wJivx13twIWZ0yzIHK5W9ae/U4Ux6JzALHeBIQ1G69zKq69rddw
 +RxzzCRmtvdkY5/hvnA/KH4Rg0+awLrty+1pgI84=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.86]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MfKtb-1m6QB91BlL-00gpgn; Tue, 30
 Mar 2021 20:13:36 +0200
Date: Tue, 30 Mar 2021 20:13:35 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v8 4/4] tests: Add tests for yank with the chardev-change case
Message-ID: <697ce111503a8bab011d21519ae0b6b07041ec9a.1617127849.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617127849.git.lukasstraub2@web.de>
References: <cover.1617127849.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gPWn5VZa.amzG29fAkY8pwd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:EZSSNlMAuJ2/014CPU1Q1XCHkeSoSoQOm3E/wbYgcfp6Z5ECtAe
 yXSvfgtdXytYgeUk2XnoLL2+d3iLlgfzHOnyh5WTO3h9IeQ1G3+1GWJ/3vPItGDcoFLHFKf
 YLHrUv1/3tll9ZniRP1KL0KKCwmQTSzErb/fXeMECKnRNVgfcjGoXOxsovBSuvcPBPh53x4
 VxL/PctBiF0QuwroCLUng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lt74Rvaod2A=:+NTKykOuf1XUct5oHBAC5p
 IcfIi78eC1PrGcKMnm54KGP9I5mGKN2Lxo5Vyc7aOatbJlJoB6jz/woutZnp3BH5kZY0rFz77
 IuBO04sU0JNBiIzUwE/9fFmtb8Aw4dhPe1Ep7LwX1Wbo1WCy79prz5mjCZ0TpCQecmN/TCNeA
 2O+YFhsmFBPOki6CZ6kN0weNxZBIMvPJ/vS9ywQ4MMKg8Gf47hpeH6ksRYj0IgvHJygQVljTd
 fBKc/p3RUYsJcQ0PeBec4dJJeywpGzXUPhRqd8Gr2zJCdzmGHfy1QqsjLizlkfIApXEQiOabx
 v5slXDgIjiKSUSGBEL1J3YWwyb3R5gY5asLF75HO5YeylFYvyGBCw6hOA4qp5YMXPP/ofjJyH
 BA2oH2O8/EaKacRetpLcSKZr8god5xIU7j9B8d5QQaMB6D24Ug5tJKZXdSvHhtwgf5vyegtje
 tDplCU/qBjbAzo6NEq1cAJXWOLml5K0worU27I1DjWXZJ9fPu9Yo2dc0SiBo+D6VlS0JAyZ1z
 j0DRpgSK5rSPRegxe7pEThsHfat8IUFS8uOyKs4HENslYRgG5zE5sLprc3qQJ9PgGKYAG8is+
 KLrulnmwLtA9KfclHYOX/E/ig1crX9nQiZa7xNbFtaOICPfgN5j3kvabDIot/c3xKIyPmbJSa
 YQjfPLx/JW3PFKSutQYUQ7OWShR46tCr7YUckecP+aYFGKQErbGklw14AX7fRfqRAcuXVlxug
 hwMblO7Xhr5E9GRghlXZ/IuDS5UjnRSmrMbKwplZaDZopIWpLPmDd1PxSZuicxZRlR1TMqKdn
 pVoRxbVTMe780aYrQQaUG+E4f7vArtk062J/eEim/XCPydD81cZTQC2rYmUeH7Z1otEb4+L1W
 gQj5/JUNYbJ0kWmJIHgICyjPMm7hEDLMyNNgH0Jk5jaUSxfY5C6BZmD9stskUOb3GK6INsXAa
 KDlEH0jUMY+rremHulTNb5cdwuROcBq7X9TlM9n91zxxv3R9QcP0jGbDMmi5W3xmHEYM6jooQ
 HnDi3tyYkOinQfSk8gIXUyzlDT1u8JAOrd8s4RswgZSa1j27suKN2MpzdEqloNxPY4SbKReI5
 Clvf5VkWT5eZC90GWQOxKnFgENTo8+iwvsqLPqQAntjbLKoFZGW2QWQM5CrDSAhdm3aFWWBil
 dmdm3ucmhBjQBYxIjIt8dBVXG4ajxyfy/NB6jxZNyDt4SAvhyTC9ePNmLnvO/cdtLc0tFEB1+
 awMnxmgHHIlj9jFLm
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
Cc: Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/gPWn5VZa.amzG29fAkY8pwd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add tests for yank with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 MAINTAINERS            |   1 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 249 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 252 insertions(+), 1 deletion(-)
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
index 0000000000..2383d2908c
--- /dev/null
+++ b/tests/unit/test-yank.c
@@ -0,0 +1,249 @@
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
+static gpointer accept_thread(gpointer data)
+{
+    QIOChannelSocket *ioc =3D data;
+    QIOChannelSocket *cioc;
+
+    cioc =3D qio_channel_socket_accept(ioc, &error_abort);
+    object_unref(OBJECT(cioc));
+
+    return NULL;
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
+    QemuThread thread;
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
+    if (conf->old_yank) {
+        qemu_thread_create(&thread, "accept", accept_thread,
+                           ioc, QEMU_THREAD_JOINABLE);
+    }
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
+    if (conf->old_yank) {
+        qemu_thread_join(&thread);
+    }
+
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
+        if (conf->new_yank) {
+                qemu_thread_create(&thread, "accept", accept_thread,
+                                   ioc, QEMU_THREAD_JOINABLE);
+        }
+        ret =3D qmp_chardev_change("chardev", &backend[conf->new_yank],
+                                 &error_abort);
+        if (conf->new_yank) {
+            qemu_thread_join(&thread);
+        }
+        g_assert_nonnull(ret);
+        g_assert(be.chr !=3D chr);
+        g_assert(is_yank_instance_registered() =3D=3D conf->new_yank);
+    }
+
+    object_unparent(OBJECT(be.chr));
+    object_unref(OBJECT(ioc));
+    qapi_free_ChardevReturn(ret);
+    qapi_free_SocketAddress(addr);
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
+    g_test_add_data_func("/yank/char_change/success/to_yank",
+                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
+                                                   .old_yank =3D false,
+                                                   .new_yank =3D true,
+                                                   .fail =3D false },
+                         char_change_test);
+    g_test_add_data_func("/yank/char_change/fail/to_yank",
+                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
+                                                   .old_yank =3D false,
+                                                   .new_yank =3D true,
+                                                   .fail =3D true },
+                         char_change_test);
+
+    g_test_add_data_func("/yank/char_change/success/yank_to_yank",
+                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
+                                                   .old_yank =3D true,
+                                                   .new_yank =3D true,
+                                                   .fail =3D false },
+                         char_change_test);
+    g_test_add_data_func("/yank/char_change/fail/yank_to_yank",
+                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
+                                                   .old_yank =3D true,
+                                                   .new_yank =3D true,
+                                                   .fail =3D true },
+                         char_change_test);
+
+    g_test_add_data_func("/yank/char_change/success/from_yank",
+                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
+                                                   .old_yank =3D true,
+                                                   .new_yank =3D false,
+                                                   .fail =3D false },
+                         char_change_test);
+    g_test_add_data_func("/yank/char_change/fail/from_yank",
+                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
+                                                   .old_yank =3D true,
+                                                   .new_yank =3D false,
+                                                   .fail =3D true },
+                         char_change_test);
+
+end:
+    return g_test_run();
+}
--
2.30.2

--Sig_/gPWn5VZa.amzG29fAkY8pwd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBjak8ACgkQNasLKJxd
slgAMA//UegxeyJYP2mkW8TT9IeoKxasWFkJ9xRmBkPGncNjnhYL2N4HXoJPLuOE
8uTRa3uFhBulFO4iuFuhE92gwxIVfZzXM7ymfwdhci6THTqnvEHGJYnGRt01zqNi
AyvP4VhkdB2VWw6UufJIzzU6Iwkiolp4k3zqQ7995MLXzfp19x7ffGmyLAbEH6oJ
fL9CqZmJA4CMm2c5LTpephAJ8UBKz62mQG3rAmb7wxMIUrrSj5m/QDBEGTmfLFcZ
9Tg2phSYfcehgykja1np0HF2gFiu0ckoBZ9FMslIDYQ4EoOwmlesbvj0p9DcCkOl
06TV3wLxPxl2YPIgs4AZcFPRGGWA6kdA7NWAzZ+aP1jsEpiZ6AV8k0+UOwLZ39Ca
F5W0O6G6Tsr8BYwres1OPIR0zrZSfNpyyyI3lGz3H+zK24pFx2Sd+6KPCS8MUiNS
7Cu8vQidtteGxMKDNWA+2abrQLRU/NO4rYpcnnTSea5n0uMgLoLk/1O+WRDI3lFL
E87I4kh/mVHk9GiA0ZtDNy9pldONTMLht0yn7rMjgD7QKq1j/tm7HAlOWMrOVitf
1lnqa4wyV1sOieIqPCseaIZCq2ydIGBoUnhODnbtI6BnN/m4yCH7xNrJ5s8msDws
CcVR8OdAz2s53b3bF6MWmOv/G4VDJB9x1fVw/aJ4PZ9V49AMukk=
=jLsY
-----END PGP SIGNATURE-----

--Sig_/gPWn5VZa.amzG29fAkY8pwd--

