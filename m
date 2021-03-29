Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8D34D54A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:40:46 +0200 (CEST)
Received: from localhost ([::1]:59176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQuwX-0002u5-Ji
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuuq-0001ts-AM
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:39:00 -0400
Received: from mout.web.de ([212.227.17.11]:53789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuug-0007kF-3Y
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617035928;
 bh=2JqvOaJZTVygyMCS9J0KgGCroHuzkTQBVfZ1gw+FnF4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=olq0vrlqYFsc9xpa1DPY5q5aByk4kj1eD+oRraCFqJZOWTVIL5iF083iZ755uEmiA
 a6jMHM8H+oKyCvtiRgr9olGgBFhmFUu+pCqPl3YYfEv7rcf6kpd20TDkM2RQNh+ocf
 fuOdpBxQe55XTsmHheT90lPxM86uqv2Sji3kjMLo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M8iH2-1lLSs80aEu-00CAMO; Mon, 29
 Mar 2021 18:38:48 +0200
Date: Mon, 29 Mar 2021 18:38:46 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 4/4] tests: Add tests for yank with the chardev-change case
Message-ID: <d4f741cf21c90548cf2145c93aa69671902e44a4.1617035720.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617035720.git.lukasstraub2@web.de>
References: <cover.1617035720.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q8bVRoWWf3n=GP+8phhaY6l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:XYCulbzhwJVlYF+dPClOvOE5XEg47Fjsu4gZH1H1q0LtYSPeaB+
 oiXWF2wotRM3EMvFhSxO3yxSBhbeTJe8cZ7/X1u6ByAoGGYfIb7xNlxIUwYIyjZkEWwUrqr
 ylvYITgVcoAnMBSDpTffhKSh+oE2+WSDdrALf62t2EZSCkvwTsDX9oE+sfB3Rva4gZu/CSl
 DvlSoBI+MBcs0ppb7k0aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uc/0bo0h6Jk=:bol/jUx+FegDfNd9ZJf1sS
 uKBv1xGdP/1Ps1+ADoi/6sg82i36dDVEA/hWqC2ZbkjPmduOTVryYqbx8kv+qDi5m2I5C38Y/
 Zw+iRROr0bZEIfBXAVvyajevc2HLY/UDF3HaW+A6YRUxFGbq0p9f3OlGjGePLK/v8LEPqcwCD
 V7x/9E7/7/rcJ0E24iMCFEeoHhkUhkdnlOFpvgDoOclL0Mze8IIMSxTRe+eFiZ1DE4NJoMwyv
 SdkX576A/ZRfGimjNYUQIJzX46CnRdp4v0kxtF23ZEsJurLO7de9ivziR4aEdHtcpBNXRme1H
 cmR8wBqOsKiVFLNzf8rZ5eiHnNako0ERpwxboxJj3GimAcOF7mimqNK36oSCijhJqsxE+DFFT
 vROOi4jIogI3qVvqsnu5uX5HeLkbZhWF5QuW41q98D8hbCkJaBEgAFuNdvaX3KXxUatdDt4Z5
 5XUiIlUD58qaLelC+1ONuHpvoRga503/fNVKFcpIpyRgpaWQbyZBvYIzycSQXvjLVkj6Z9TGg
 BfHVzNBXZRHQeeuaZ7t4gUiZdTTV4RS19O52nv/nhR6gEzDNeV05LVxr5ufxjhZCHaZ4DdFxU
 xzx5KQ12UOu/k4ngSWpx1haE+0u/zU8X1oI3ZJWRyiz9R6V8b90D6aPGFzOpyyVRHd2l2+jg2
 ASq7kocnhaKzEv71hY8Ish4GPgJVmAHxhzqh1q4WPpJMgW8yZEhHdX8N52BJf0GtERtlco8aZ
 F3VrQZ+1dD+ArMWZpGjChmjMwDMuqUQs7SO1R0YEPr82/Trunx8BDqCY5P0mAwsaDeaPhGQJd
 Zr5g4aPpfzvjBmg6RKhYlI6fTwrPflN9IMThHBPzqfzJ39BxnglOexw5P+CiwbqJv0MB9WFH7
 zs7iZkTomIB4RRjkVa7P1dNUqv7D8U3ktZDyo0/Qvmu7e+BnL1/C2WEcaVung2WkYzRctXztm
 oDyjLZimDpB9Zvh0gF5dVLMCxKtKEEUviCsgT43yS8PVQUfsZgfOPY0cQzf86sH3Hh4BAYOrR
 76EV4zOYKEXQkO5lgwppEiFDZf9zb4HLkT7xsZGZ9y1DZTa430gyN1bUUuCPCtFbKaYuBF4O9
 QeiYCcq2SWz/Dd6dYjqXxRpLeEa+4NcGzDfXZCJft8nXtBHaupfkGmLXjz5peDcnDOX0k2gEd
 srWTm/VTXODrq6xC1RBhUvWVSHRytajpRSefAEOS6czG/Rbff0HjdmW/vGCj15wT2+usWnLnw
 VUqQ8QuHmMBqXHn8L
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
Cc: Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Q8bVRoWWf3n=GP+8phhaY6l
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add tests for yank with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 MAINTAINERS            |   1 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 200 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 203 insertions(+), 1 deletion(-)
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
index 0000000000..1596a3b98e
--- /dev/null
+++ b/tests/unit/test-yank.c
@@ -0,0 +1,200 @@
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

--Sig_/Q8bVRoWWf3n=GP+8phhaY6l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiApYACgkQNasLKJxd
sliXQQ/8DWf40l4atxXcEYLSZ7ykT1GZClkB2XkVhd0PN1ySb+gVhrzWyytEmTBx
ZXZagmiCwWlXRxDIBv+o2Z9paV5NlqtV63f4Nh97iGYFzkioUZ8sxXtbxbjAruW4
nKGd+2hrbbG8PtGHD42dW3U/c0Kir63qCIili0+rTmQuCdk0lCnKRb5TZricEUz3
5A89i/0tZtd7oh3Wl34zN+GCa5eumQu3a/8XAZvJixAQRt03MqWy6ukYj906eyOv
Uh1Qwh4JARRnGdt2OXuBk5vKFLJCSJm+5zgSYu1H+sbs7JJraFM5v2XYMiky5sPQ
pKaPRJp/1jnYYoGWxj6c5zVrzjDLEBMZMO2K4YOtacBZmbCW6PNxQKa5hM2CVF8v
UnrXQ9L5ZRk5+QLEHgGj0mHmsl160NFJoAm/ZPQhNar6636mzznTIQBLkxCvTydo
K6dPHY+WUcYod3gnMmQAnaRpxd8sLK5CBD4Bbp7YSMBCyrKhDqdEC+8vz2BfEvj7
NvowB9IPBlmfdr8E9KJFanU+Vt7CrQ6CkX1c4oo5Zfqvy3XrWQpLtvzsHu36PLba
55IhT0MJVMntWXNe/NjAMs7ZGSTBo/P9vmTC/9bA8H9UsU5L3zEcGXCucO1u+3hW
rYZuJDewAAO03yD6uMoZK93C4HqpHWjJg8o0thFVMWe+d7kx9+c=
=uUKa
-----END PGP SIGNATURE-----

--Sig_/Q8bVRoWWf3n=GP+8phhaY6l--

