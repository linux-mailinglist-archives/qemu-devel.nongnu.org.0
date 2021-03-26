Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209934ADB9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:40:50 +0100 (CET)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqS0-0001ot-44
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMo-0005Zb-Cn
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:26 -0400
Received: from mout.web.de ([217.72.192.78]:58995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMk-0004iG-M2
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616780119;
 bh=C9tqVXqfH8ZEASqLqGHWpwZiyi8bI+mo0IvrY4GWx0I=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=H1uIzkaoQYqyCh0iCecIAUVPhVBrrT9oLP5NYJcORiYKZFbY7FJGqf0TgrVFG0Pm9
 M+ivWpjmfHQieXQA24y04sDZrx7O7P4F51NPntEagiQnDKXyLzzLDLnvChmMzngeRT
 BAn9ogJJEOZnispdCzIi7KV7m+1nVPa/F+OyfGrw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LjJH1-1lvb560wF5-00dUNo; Fri, 26
 Mar 2021 18:35:19 +0100
Date: Fri, 26 Mar 2021 18:35:18 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/6] tests: Add tests for yank with the chardev-change case
Message-ID: <7c2f1ddcaa1c97462cb0b834d5aa7368283aa67d.1616779714.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616779714.git.lukasstraub2@web.de>
References: <cover.1616779714.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tNso3hsMh2nZ6GsKj=wPYEL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:DjG9i+IotW69twHHYSe7fJRVgn2b6CHHUXF4pGaV3F2EkK6UzCb
 LFWF/+HX3VV7WCB9QlkhAYtvjdpcEeMUoGFHzoMPFJi7I3DK2EZm8Sy8jTIdjIlZK1Jlt3t
 rPHIyBcQMdS/1/tnH2TBCyf4cTE6PfaMKsXSQ2zrRt0Bs3XhzarcuyXpSi5EsDDypXxkdYl
 BSsDuq6gzD68ZjbC4rbhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MFxqftFLcMU=:TStRyt6wj6HdpAw14aWxGt
 BXSuKgGK4HNZoBLSDVoARjYwjvqC5GjkBnQYPWaNeW291eO4zdgN9arZ8expaouFUHCCeIvgJ
 2esme/kIxRNariWlmQFVa76QpG/YuNUAvrQOWVQ9xZVeuxqttmNiW/sk4BqntiMrE4kqhj1FT
 xotS69QPAWWAnIyZkX0zII5bdmiQvp2SNg/3S+HGRTaX+/Yogu4luncVwweUHQ/s6cGWRs4+I
 BCoq/KyQBsjYSldGJ64FpF8bidNrKiUlCAu3vfRoBpjLmaaoaiv38xZvIqj+/to/UOHILFbRs
 IraT+Vb6uPRT4eFeuuyF17IrZTsE9bNvIDLzxvOc2RafFkjQD6pbXDC/fIijk8I8GlsdxalxZ
 xdtIWnJguCQcFYlxEhIDYeqSz2Hnglqqc3kZznzhQxsA/SfEWUNryrmHN6a0hcEdulVSKAD2V
 qHIR40uQ4GtVyvjCh0EUwLn4vKuDDDAiYHBRu66AWFP+4MDrncaTIfN3fDLvIJbcN8NYQHuGl
 Mokn8r0Dm2uNdgAnojs3nalxmSOu2YPwKoEwhhcGkoyZO8jPvXe6NjN0PcSxNvIut1NY57Fe0
 QB2eq4s/nz0mFntl6WGe9XVogyOeMDq1TWDDZAkuy7PpYWDfVnWucNuifev9UxNNUZrOdobfZ
 kqHUc9fjeAx/60GFreOShTvwCQWei5k9tE2PC8ynXjtEZTta5LiMJlxnixhW9wps5yceRtnMT
 4kl24PsLtal3OYEVzIW63aX428JgpwwlsSF6bBzVoaEpgfG1IPszNQbGTyymUoxqu5WpCCwHS
 wVd7DnNo8MMmiGTJIZK9QTKMl+MtjfBXeWuFnUcvPHs8YuOKSHe9wmxRWUw+0G4j9GSUyq4FK
 IpjWroiPiNKZ2hN+XR6rvqR4LSPX+ljMvIvlHVyfMe4pwbm8lBYx8MVe01U/g84hJsluxl92i
 63M+W0lZoPnEA8jsNBV/2HScGHerL4slj1A6lQsoNApvELjOmGqDM9A00LJz+/dc8yKp6Tw65
 TBsiBWaq8FLB1X/raMecSvPf51C0TjQlXAc9BI4jltCg2rbikhoPa3+4cKcidGTimdv/NaLwC
 PuXuyFMRx3AfgNthf+O7Q4aQ8Tua9txozXG+yuWY0v45g2gQWTJnMm64p3AmrTsku2zYk3lMZ
 ZWE5dj2misARW8b/UgFAnLIv0xEEx973jUqlrzFeVWk49lmn8m1F1d8tnquNEhx7WFg5TzCQQ
 3glQW7KO0HIhySuJ+
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
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

--Sig_/tNso3hsMh2nZ6GsKj=wPYEL
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

--Sig_/tNso3hsMh2nZ6GsKj=wPYEL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeG1YACgkQNasLKJxd
slgdjQ//SdaJ8ytk3ZbGeik2eIcSyJU+j/SMHDkO4KNNq/dZs0QFRaAluaAIdnt3
Pu5rE0XsayLExNZq5s1qrZ2P2RfrVFc+IRleDv99lHnc0NoZ21paCLwHbxHeWS+5
5PgQAJsi9u/GtaUf+hA+0U9wxza6bj9Bl7lO0bwWsb4up25VuGRMEgIssXMqFKOE
B1YjA+S8+5nengthIBNdKGmvmYt1qVDLPYJkUpwIODteZ/Ssi4X2Wv2fNd4O/L3s
+dBYeFG5W6Kw/28WEMmDh0oWsBRUeFGUjrILNpiGxfu9r/QxuayZNxFpifwqTN5u
8s8Izx9YPW8GT6OijzrdRSzmoH0ncLlhvcqfn7VSL62k0h4UXpQjQkA2cf0V7Kd9
+wHgZuU/VZjVQWDEAoJ0MTKc+TU/qMik7l1bImtOeA84vNS2xhLIpeD/nFEDVJRB
YDXJy0pTLh596pklapblF5/HvXbShmvedkwxg9CDsb4bTll0omJqDAVLLCZM0Cla
ooIr85xEtfnC+rxJxPYdq2+WGJO+vWU55ylaBRYPJTX+7AoLsfF5vHgx+plw+kQr
7Bv3vtehNxcuhoSr7sSpZZuvlhYTbLWIfHrWtI/3ANEGDdhJEI5Zbzwa3A4YudcQ
5ZpEYGl7TENLBcpYVW7e65ipBcsPczBDZgRDeXP3OXjpg4c3Hj8=
=BWTa
-----END PGP SIGNATURE-----

--Sig_/tNso3hsMh2nZ6GsKj=wPYEL--

