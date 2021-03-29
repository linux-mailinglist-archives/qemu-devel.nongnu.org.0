Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F070B34D7B7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 21:03:24 +0200 (CEST)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQxAa-0000XJ-1i
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 15:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQx3c-0004AO-DX
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:56:12 -0400
Received: from mout.web.de ([212.227.15.3]:60199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQx3Q-0001ZQ-4Y
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617044156;
 bh=GkWeInFAPv/GXGFKkL35Lqyo/aKmE3Y3tGm+mPMxD+M=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=C8VjmVait7UTyIiMgspDwoIalUyz/e84QoGfCRqvLvgwBn5nni3movqCB8ffLTIDh
 g26WniF49Rj+3YMTFX0FwuSOLcdI0iG47CH98GxYiqVZAzBcwgYDkndpajYsQHo6gr
 PSt17h+Ve3WqNL9WNWJzhtXcbpDok4m4hMSC46BU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MCNY9-1lIOSr0aZN-009AU8; Mon, 29
 Mar 2021 20:55:56 +0200
Date: Mon, 29 Mar 2021 20:55:55 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v7 4/4] tests: Add tests for yank with the chardev-change case
Message-ID: <f0d9f6be8bcf54254efd62cb13225b7d47ba22f7.1617043998.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617043998.git.lukasstraub2@web.de>
References: <cover.1617043998.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q29EJqvN5+sw.lKndl3ZE7U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:dQeJNO1+PDQAC6BBQrJKxDR6YKxmZS2vEDKd0PA+3AjLLJK+O5a
 F+rlELX+zbP85N/QwUAhC57kHWVzzC6BXuCyDzMhxxm5TRsZy4TZhGoPwG4X0LVYkhGJ5P/
 70G0uVDS2xCpVE2N3q6a8eVedyzjfQzb6/2G+x0zKVs6JAklvHRf1Ll0P7lilRK5RtYhKOO
 9HKncqJXdGXdH++6+0Xsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mu0NjCx+Et8=:cRLrg8ZKQMq32QcegFJiL2
 /mp0DbT2tFTQRElNaQk9iM0rq64vS1buAi5ef2u/GSOzdx/sp9C1QFJq/9LHaxDhiprahzBsn
 ahLN5zi3mWpjf76x9cgQeg3h6Ok2strAmv9neVDzPvY9+bWU4rjExKVPSyFNExuV+AXg25G+V
 rnLWim5dlJhp3OwBRmieySmg6OwLulFrY529JwIj9f9CRHh5BCdzKH564GGFIXBZA2zN91NFL
 WqAwmXQ7lRSj6q9KzAhNLI4jEBHzlqgI+iSJwzg8TGTpm6t0iWjxOweAeqBWXQQvmkGA+rpLU
 VNRN9nSwmpaZfy4ncgokMFwLCHYOVD4mCO7beEPtLyWUovLS0rcOXIUawfilUHMr8viEOb0Xg
 14HdPOQvTy214W1JPVKbEcI/TtVvHOrz/Y/LTLRqTHw3RXYbnZF3xN1iO2RCxEtLvpIeQFUN0
 dlMeoQGewB8g9y2C+Qnp94LgpUv9nBCvtNw7Q4eOM7eMZP8aJtJadHvr8RpqDDc/7txp2qlE5
 Rc8QO9V5866yIsahHurJ5rA6mEKOhGkdtVUcmV10nkuD+t9Z5ZwA8jjV2Eb7l2qPZ5SFXTFwL
 Cqb28fNcyDYuM/W1WTgeaV7UhzIdt/oo2nbdFfX37d+unjrybaE4suO0T4OUttzynqqMyezNh
 NnPS2WKmGq/9shqpAdb20+DCDXTFT0/KPdFB+dmVci8If9yxqIOZiRDDs+g3+07ln9Cyd0KWA
 AVu/FNapnFVoNdLtSbaWNXEGaTX06BAJXjIs2NtKwAfX27ktEA5UjVw+8W2ewzQ6cMzriTF9u
 uLCj+8dmCgTNXsTwr2uiwCqqS2JRG9Ou3XB53VzoofeAttmONWEhMGyOXsrAxVNBKc8/uE1PI
 7jNL9UwweqNSYzEfy7CyT0p7AGL1ebayxJp9CPw5+k1GkBK+ZszUE7Chgn0G5bcEj3pljgkot
 u6DFxi7b7AntVMQTtnS/1V9XHmvvvXkuzhLxfRmD1h4vW37yPVvxomYbdRBV1cCvGY+sKUhR+
 eGp0JchUlJ1rmgvXe3c8VwsLz1ZhDONks95WjRRE0DoHFGawuDZuaH1wurmLUcUwLDe9Bu6bD
 b1fLtp24+4TqyEcjVsUimXJsX922cHdmUcJGUEYD+5tV5sEPYFi6Vj3qGph989u7Fdy7FqiKw
 miNy0C3YfwHvujKv0MvCV/9VuZPgi4vS24tw4m5gNnWx97XqMvMRoYTOUiXqBxv0ppp4DlWg9
 GDXMftPNworPlpAJA
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
Cc: Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Q29EJqvN5+sw.lKndl3ZE7U
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add tests for yank with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 MAINTAINERS            |   1 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 227 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 230 insertions(+), 1 deletion(-)
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
index 0000000000..c46946b642
--- /dev/null
+++ b/tests/unit/test-yank.c
@@ -0,0 +1,227 @@
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
+#include "io/net-listener.h"
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
+    QIONetListener *listener;
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
+    listener =3D qio_net_listener_new();
+    g_assert_nonnull(listener);
+    qio_net_listener_add(listener, ioc);
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
+    object_unref(OBJECT(listener));
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

--Sig_/Q29EJqvN5+sw.lKndl3ZE7U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiIrsACgkQNasLKJxd
sljoHw/9F1UA/8wwy3a5nliI+8wDVd7eEbZ/4vpD2eWghrGfmLMgGitO6and4D4W
SQw6u8vjz7d3Y9Y6OFG27exBwOAr8of0r8kLdf/E5XDqlLDErbL+pl95CyF9fJga
6Q5bdJiuWxHdgE2YY+p0b/GtVAiyc7ta8NQR3KcXlxhbGqx29aF2MS7eFLw2GMnE
lYzDq4F6O5HV4LTvUZrwmIlMvB1+b3XDHVIQVtxeRIqom8CNqpDFGW/gNw1icJO5
rczsMp5oZhZBJFMn4WePDC4Rvvtw10wfs19bUUIP7se1d+AY4j/hdup+cbEyLYxJ
rBQccAtZ9JuAjfaeLE/VTwCjvJT0yNF/2ksXgCX1xxw1tq488QXCJ7rsG3ZJC3Lf
7ObdhTqUeuGby+ZNw0kluQi2wMGWp4EkElxy+/yHAY/XX3TijPivB8LFAtMqFXwY
nWnhado2NC+UdqHLnDU25ItFK+BJex4hi8UGlyHF/gHAxMaMzeDss26SZ4Xnlmv0
WVHNjlagzkP+fj0b75e/6b/D7Nkpwks8YRUqxDhQu50UX1avOix8Yl/lERaeBZ5w
B6cw87jpnbB0wexWLMoQervVnfj9PUP+KNTO/Pi+Tka8Axy7pgc1pYxyjKemxB9/
S7H4Nv3cFzs+flZhnc4Hoy/8uF6ayyMJtijKoOkVfzdMYOgxo+c=
=QRm9
-----END PGP SIGNATURE-----

--Sig_/Q29EJqvN5+sw.lKndl3ZE7U--

