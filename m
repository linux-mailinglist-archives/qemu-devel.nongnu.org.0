Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4303534680B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:47:33 +0100 (CET)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOm3v-00013P-Tp
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlHq-0001b4-DU
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:57:50 -0400
Received: from mout.web.de ([212.227.15.14]:43737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlHn-0004Dv-Ux
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616522261;
 bh=4ySMfeGkLEh9zg8HyE3ZYBf6mYJhDGGm1avak+YyRXw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QWHNVKKu6lep5QJye6wiVNL6s4PFIIq9pnu1ECoG4Ura662usV2dKzm4qBXwGujGX
 71ABxdPqe6NuzF8wxXQgBuq4nNZ0aoCVH+6XUiUqf+2+usN3jPXics8JMXvG1B6/JB
 GCZfNxgZx1ErOFyV/Yns5zP7kl1mC1SD6BrU44qo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.81]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LaTdP-1m5Tha0yiN-00mJOg; Tue, 23
 Mar 2021 18:57:41 +0100
Date: Tue, 23 Mar 2021 18:57:39 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/4] tests: Add tests for yank with the chardev-change case
Message-ID: <ba184a9b5c1c8c7c454a8eb6959fcbca4c2115d2.1616521487.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616521487.git.lukasstraub2@web.de>
References: <cover.1616521487.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sDln1BwXRMMC4eq_+EmJo4o";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:NlzUZozkdovH2lBW8QK9dx2LHjK5ZbiGZsrrWvgRg8LGrc0dLeb
 BiTAKK4hHrE0QiYtDkEjLpCsFKBizCFknKXU1mrqv7PSm0IGQh1Gr+c/irwQkSXOzDqDX4D
 O9RjWP9Ss0lkgAGIB/zbGmYLdwzXgYAq/Xe5825lRQJlymuNmM2Ghu9rvEFc5qu3Fd3Re23
 AX5s3knC5IOLNUvKgkfEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vZecZI4/XGQ=:WI5wNqRKEMDxLSPvCpK8GQ
 gjptq9oXYAWi1c10wMe9LVGgoQgC+jGtwJU/6UBxOLIA6rxUvuLC2XTyLGaJ+W0ZIG++YCImN
 1eJMyFcl33eI1qbhM7hB2wO9IFtYctH0ro6pI/PhpZeQHaYmkGJPBqKbM2B26Dy056nKWGYoU
 ynPMY0k8wq0CcIS1AFtJc5oeoj5O/YwfR54qqic+Fkx2DpSy0bMDB+I5sRaQOsOtt7PtHaCxg
 6roV77fsgjXG3D88W2AYwtKauNmLCrSupi7kExC96CNWwFApfC/zGjRxTt6GASVrLWbFEZIW4
 GrVB5kWt3Q68ta7NTtjBZIZzuOfwgbc6xTq5TQ7QZAS6mPv2SLY8UO+WRA/bpB4aBQiUVAWNZ
 QObVuVncJEiVW6TdzdEFkvl6LUcVvEOthoSFZm5fN5A6+TkJ/j6Nydwi5CI7cFQc/rT+YVZK6
 1oVvQTMc3WhCCog53sBqpu4QF29Joe2XgQ7sboFJmb+DRCuc8v9isQBuPR3/PvHoZiFgnwzQ3
 Aip+7zOcnxQ9PaGYsTcmHFydz6HQthj2eErLT36TqYbNaLLbbAliEkbVn5cILzaFXTjWju113
 4IaJKcnbojCGxJCPkXUCO+DIuM7dGKoEA7yIDdxEM1Df++cblwPMypkMkWsPG6vqqmXzdMNl4
 Ze3VLOewuMDx/fekkOkOfNsNmrICdYYiiYtIXt4odTJTBurksg3JH1QlVSAH0LdS0ltbWuBE1
 mqEVOYYE2Xbxsl5uPXYxgTvAEYqBbtTI1QKFydLncQRgxyYUOuLjzd8FKb9iKvdQY6nSdwdEp
 G8HZiac2ZYlqC5UuZika9lMmAO1CRqDj/znC0xSy6OFEl2OzfgGWDS3QJgeFwCJQzgcV7Xkbd
 hLIODrsvEjFiSo0iueEg==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/sDln1BwXRMMC4eq_+EmJo4o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Add tests for yank with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 MAINTAINERS            |   1 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 201 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+), 1 deletion(-)
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
index 0000000000..5cb94c2fe4
--- /dev/null
+++ b/tests/unit/test-yank.c
@@ -0,0 +1,201 @@
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
+    do {                                                                  =
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
+                             char_change_test);                           =
     \
+    } while (0)
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


--Sig_/sDln1BwXRMMC4eq_+EmJo4o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBaLBMACgkQNasLKJxd
sljCbw/8DXSCGvj0JxxrvR+gGng3yybTS7s70LxbEWv8heQuHulhRAgSwpWiy2br
AThbD1iPi1/Gwgr22x0KmzNYUJkmi25RGu+7yTd6ozJ0n9buIaGcfyVrsGCb4HvU
jZibt3lxoJXDPwJWAY70MkWzED3VyRxBJVXzh0+wuM4AsdsnhyVOv96giegRADCL
QYzB6X5/LS0iYq9DooLsUucTrngmpa6sMvM0zI1g7upeY6s3LQIlJ+s9LuTMmjML
/ZRp7niCiIpoylhck/hLJxzavr12stjfJxkCC8aunMYlk3WQ0lCAJoPbkDpNZGmc
uyaOKOfKJwkT1jRds3VkN8XDz+pgaQt7lbkeeFXZgITaGbdeLE7GHeT8TvdPqdsB
6fS/5RwbeD9SxhbpkMI2XTxDSmzS6sPJ12qyYrxZhzQXKRnuM/teVPUp59bat4pn
/TV4CNAoT+pJvtonMx65hbINptxiU/Jjj5QMpDb13y1j2suJ0d5EHqd13wOBqyef
euerz/2p8a50kjnh0Hvnekxa7zjBElsqsEF35CPl7UAB9jBRL1kxByk8HZMTlWgH
gSuueq9Mc2hGfCpTeV3aFXnRTJOPGxhAhxa4MXoRX2DBHQ7JqtjpF+Rqi5G7vggx
LApwI3e05J+BzfcgCrevY/ynWnhMa+djQQwVGaC1L5A2LxibNJY=
=DhJo
-----END PGP SIGNATURE-----

--Sig_/sDln1BwXRMMC4eq_+EmJo4o--

