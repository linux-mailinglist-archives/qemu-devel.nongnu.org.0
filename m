Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A445434B18B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 22:51:06 +0100 (CET)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPuMD-0002du-NJ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 17:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPuFl-0005JI-MQ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:44:25 -0400
Received: from mout.web.de ([217.72.192.78]:59443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPuFj-0003Iy-La
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616795059;
 bh=PsCLTv9xKfipUVZE1wFEPMN9xQENy4PggJ+zi4m7VN4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QxVhD0ddESNwMvIl087HQWJrjFEnzt9AMvcpOcAmoruc0YWiz92kDrh4VnG16nZgb
 c+PoffBcDJkfGxmzTLUH4uWAnIV3qDFnn7xIa6Dl+auWraorj6AEvx1MFFCNkiKiev
 pZ8loJf5BDgRUE7gL3wn4RNAl5n7Kn97sPI+CBJw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M5QqN-1lP4ly1fpF-001MI6; Fri, 26
 Mar 2021 22:44:19 +0100
Date: Fri, 26 Mar 2021 22:44:18 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 4/4] tests: Add tests for yank with the chardev-change case
Message-ID: <7c2f1ddcaa1c97462cb0b834d5aa7368283aa67d.1616794852.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616794852.git.lukasstraub2@web.de>
References: <cover.1616794852.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jzw/qBX5+NjI=Ge4Dp+MCpK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:A1oPse6oZo4izmAtO4LE1IkiBAdp6ySmld7CpUi91TLnGHVXh8B
 GqbOidKFckFI7xb3FhmN5yrh4B1lyIMw7omAoRtnk9bIOwHx48RbaQ7kYLlYfVN7z+hdnBP
 T5hJo54GvNUKzRYmE+/K/wqaPTZ4AO/TETHpiZCj6x4UYVD0xfZoOKNcp0D/TS52Sq5w7x3
 /lFEeUi+NYxKAHb0jiC/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PMBjvxE2TCE=:KfgYjI4g4bQL5LKbUjvueD
 CitFisdj/4DCmeaK+vjIxhqv/e0XJ0zlkVt/6vC6xccPCZ/mhvPhI8bu0KHeAkiyLT3L+P3/I
 Fa6pKee2G1ON8olZEqrbdLmU0+ja7WrutKHxdptmFdQrJygp2Fz1oe+BdrP0Dhb/3wo1/C+pn
 YY9NbOSXDBL5i7kymLumT3lkVJrn6KU61gAZyNI49YKIiukP/QhAldy7LS7XSrdGNviXIgG1F
 PUvdiv7ncAb4Raz1TFDm+b4LXkZeE0FMBOn40sUZSeyg7w/XB5nq00HCc8SUG9n04hk1nqxwc
 WAXAvuXQc1ay0yp9ST+WKB4HigLUy5mDfDYRSXYrSCN3K3Atc40gSpyenMPGS4k+EHrON5jJu
 WzjEI1e6cge9up7srsprjrv7yCJYYJvkG+Y9S5HXzejKGCG3nCLnA9J+eoq8tVT2WIngCDYlO
 yehLRQsPtvAvT+A2ulPrSTCM99oH21jsJfOFlRL12BL22E+VZMVoEOFhyc93G4HedsuY8wjLY
 P3BslQBTxLMoolTtHuGQ+YPbydfRYBGTsJpD8vW/Zb0T43QHGVD7o5fL2ECyvVYaWiG8JAUjN
 McKtmEqJcHtCpbhKHF/drvstrNW9bGzletLcvNhaO313EPJjV0+VTB/dZWWqmJLfbtgc7MJSg
 xKmx/hxftgYM8vrb6IF1JHUlfAvN1jXkN740y58WhJJ3XwJPnnCkh1ieN0v9/WO/f7QKTnNl/
 8NC8sBYSU/4aAX31+mZTpewbaQylzR8Nsr7fp5O4/5Wa9D4AmSAV0K/RytkhTVoEm8hk8bqhq
 sTV3+ObITO7EJb3ZxoullG9/dGcpBW2vPc1Ip2eViCQx2Psu+9J54QRk9Yshq8d3ww97c6O/z
 ecRU4J/vQKa7452dMr/SCNHqQ8Lk9Qcoe74uYsYwRkPCXkqzp60HXWIfmaL93s3uyv4X64deG
 u59ND8tmpEVABXjUqkCWyg8bAFJ/cwjZ+7Gc/TWqVzeKsG0dLFZeZK+ETQMpxSbHj0fvSwl2d
 mubDNWF463A86HIu+dcRpka0SdAktH4NcItPAb36DtcWAw8zbGsfF5N2c8SYx0zw3lUpuWKc1
 ngtY7mLWMACMW7r+CZGKZeVL02AhUvmsnfyGYQXrnfxC+2tBaXR4a6qgKc1jSxnAM5BDu2VXk
 aZveSGuoaH2AON+9lHN8ne4+8q8uhoQEjORT3WR/4LfeAcpmgRruJnF0k3o0lZZeL4nGHwM3E
 NuupVQggJVgLFvfJX
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/jzw/qBX5+NjI=Ge4Dp+MCpK
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

--Sig_/jzw/qBX5+NjI=Ge4Dp+MCpK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeVbIACgkQNasLKJxd
sliLxg/9EWASugDdZrTaFNo8NYyUxQ9oGuZxeSQdaOEnYtc5ZDCXl8jQaCH046jr
ATvpLHjLI7Raf4TZqXewodRq175h1i/vrUTqixxbuchy3Du2Ui+i+LlzpFdvhMOF
IaCIvZ46vXLIybEi+PTqvm5G+sgfqNb40INqFXjZx4J6opbvSFPzZxm4NzC2mZWS
ly8y0RIV8zn6apzhTZfSaZOScwo0eUODFnpA9QoB1aY6I9AtRlYw+oeKaSorucnS
lUNbRFJY5AOqSdhIWukcQ+d+/JSeG9WMsu9CPp+eWHvxmG0AsOawjhwpcXPiDtI9
WKv/T0pMIP9YlhG/GoegzpYegwjM9Ry9etM9F5O3kbe2x79zgPWFYYtlzyXWMWkk
5CdlCXkOh3zbJGPBYURfZXtFt5MLIWOdVi6npHw1GccC9P2csZe9gbMzflbdsTRd
YtKMtg63B1J+NY5FKCeKhqm4FZq+QCdjeYk0mQsqOmHwNOifQCQdGPI2PNw+tc0S
A5b0MiUcT7u8ESQIWUG/VVSPWAM6k3+oqHbgb9eYEhaf4baBLqJF8oqTTPIb0D0W
bL3fJen16ARoIUaAGN2QPpTcJjyJfd6cEe9mxIaD+K4oA9QwcuxgLVvNK/3WUiHa
+AxbR7A8D8aZbFzjyQ7fU+eQXyG+MhV6RgePCkC7QXFvdlTDK10=
=23SP
-----END PGP SIGNATURE-----

--Sig_/jzw/qBX5+NjI=Ge4Dp+MCpK--

