Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF6344991
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:47:38 +0100 (CET)
Received: from localhost ([::1]:58708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMmH-0005fy-17
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgi-0000SC-4W
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:52 -0400
Received: from mout.web.de ([212.227.17.12]:47719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgd-0005GL-Q7
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616427684;
 bh=5qU7aaCHSk1bI1bCEfLbJChxRnkYoxmqTr9kqFB2wZU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=CUmdrJpunjdB6rPC/4+nMxL+gYavH77PuDVUcQxsRIi1J6i/iBRgeg1G6iA4CuNRk
 xCIOSUapYX78uC8ihkbcOxQ94dAFWdEwV5WqaBn+KRyxv8QK6YME+3SqlMI3pSQjWe
 NfHwtRZUeSrNRa6lTBUg3T0UvTREN4vLtTnD7lZY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.232]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M8T7K-1lJwpw2w0u-004hOH; Mon, 22
 Mar 2021 16:41:24 +0100
Date: Mon, 22 Mar 2021 16:41:23 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/5] tests: Add tests for yank with the chardev-change case
Message-ID: <22ff5d8a4714a492e34609f21888e62abb06db43.1616427054.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616427054.git.lukasstraub2@web.de>
References: <cover.1616427054.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_hMhZUq/sMde1ij=AUzzIzp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:+T+bVaWdPeyTmRfCdrFiq3LzURsgFOXl7EZGwyKn7T52R36nzZr
 yQOfnQvjcgcILSieceqajeoa3spgFei2gN2TyU0ls41N1FIRNCkk/6XIZ2KxrfkIA38BTbJ
 ySglHk6dbVEz7yqu9YoQykC4u0v9npabgrVzCuBH/PACcVhFh9M0fXYiqlqEbydM6+p/ior
 FEdSAZu3XoM6X9x4MaojQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k1GiqNboc4I=:gsFwCbvKO7Oi+D2FtqsVv/
 /CRsNzDyjmoopJXAVo54M59CnIhRGcfiz2Fdxkc8wTX6FkXkjSAQibLe+vKLJ9/9jXND6SQgq
 ONmAo4k96430pbYNYvjAKgPbnFLUZTizCv6B7LnGaeWAY4Ms8NAw40C1CFIl4Vr0XGZWvtdD0
 F/U8crRP/CO41nWQXXyw2Tr7qa77ofLTzXl0ygubRCBLA78ODgtiYhhQKJ9UKw7YXre+k81Rh
 7X1W49ZccDQyQKIPX4EPKFf1VFqvikB2szEspgsUFqpfjPf3+kd6hAYweG/PW9NvU27T/3DFW
 sTTzEGPGQzm1NGcTeQ/XaSeKrjfMN5edLS3Pkx2qG2ZQZqOoVN0XmwEyGzLcv9xMhpN3sBP8f
 8SG9EPVworKr4TRW1/5/iwjcfZrvMU7y18qxjJZ2fSMu6Bi5GigU4eedy8vwZFxj9qIz7X1EO
 x84eJBtntvSi58Y+lBGG/RpjyFjeOBM2cewLP9MIMRV/A2SrjjKub1+I6zmrBQAHz7xnwLfUy
 nj6/YJju/xRFrHDOMOKzbxLDUcqCtL3jdXYDbnVwf5Qk2rfO3WgxBQqCJFIPkqwckLsA20oIg
 ndOKlHXqOUvSAb1g4Js2m64f/LkIhxU6QfFfGEfiYgkebAA+1T1gUQfvW29jW06eqcymtq2S2
 U1ymGT7gERCNGmjClCkqab92639xEM79FPmrWIcMZPWXCblllmTrpJAu5Y6RIgi6BXe4Ik/gc
 GcnfFKpplNk0mf66b7nK/wvIKXMjH0g+dUDICHXuGWYsMeBCQBxHYk+msIPoTYwldK0tcBpmy
 OrK79fZPB538eCMPkiqGH8NK+IJ1xcdJ5F6faARA+SlW/7nVN6xi7mdeJjV4D0VFWCIqH/y/P
 LodwvCBd64QInCDqFShg==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
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

--Sig_/_hMhZUq/sMde1ij=AUzzIzp
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


--Sig_/_hMhZUq/sMde1ij=AUzzIzp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBYuqMACgkQNasLKJxd
sljScg//QQ+UwwY/P/TaKgywVIu5jGyOn3PcTIPS+F/HjuCTIrUDBG+Vp1pHw6Ap
Cy8X7m0Iqu2WomUM11kwPwfhHKTf6zF/la+GCRYmh60GZ7W7dBAHhGIHXpWPXFmk
ELmTevrIkaXQc5GvcLB/pDAjLKhbPsXfKL5eT3HRhlxAMPHXs8gFUkJo7p4eDYCS
/PZwNpzrA1kDZd/T3iLAhiHvoqSQgaw/kpkUJnC320Y0yEW+HHFudr+LssoJHDpZ
R8gYyVtr5R7L68TF6YmSPrDK5fhbarVPqfi1RTfmx42FVkUHjKXBxGNRorfA9210
UM7o4MmP1x7UylYYCwx29IVIWcAgb42ZvaFex7BgoKbyIpHmVhgAtPPRrN7lnio8
IpjQI/U9kSIfscWZ3EFe2GvkD6tFOmXZNjPXMv/dWr5VKTy9oMdBX45FGwzVIP9f
vY1ganuQ1JGfn8VMS0C3tZJyZPpaspvdF9GsY6/jlQvzR/JbeXjS3xc+FTEH+bAu
P1ee6VlRk52DZEAiCOjGeXm7EUrcHQp6tKY0uEWuSVJUXu5fftI4wXQuT4QZTzlo
kWcSgI2bRLGmLDzlW6a9K1stc+Si46AXjDmBO5ZzxqsdbCCju57T6ReuqaiUU1Yp
F4FnEcGmADo+PkqTP+wHEBdOQjtzGC0cmKRCR74QSdgoa6EWrbg=
=VMmg
-----END PGP SIGNATURE-----

--Sig_/_hMhZUq/sMde1ij=AUzzIzp--

