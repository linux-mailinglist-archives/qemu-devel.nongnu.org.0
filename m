Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0727634E2BB
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 10:07:17 +0200 (CEST)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR9P9-0000ZL-GK
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 04:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lR9Nj-00005y-2s
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 04:05:47 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lR9Nf-0001ey-C3
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 04:05:46 -0400
Received: by mail-ej1-x630.google.com with SMTP id r12so23427791ejr.5
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 01:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y/PhbwwmztK+if1OOg9B3DDGlMEkXQOXyuEbM2m7jFg=;
 b=UZN31zOQRH1o3Wpd6isOffGvakZvFQrZ2toyLEEkm4eP3qTKhvis51KHcW9q8ji65H
 +B00Ywwn0fEBf2emh7M2zjjUYtGC4ZN0k1aoVwHPq7djm9iJHgsfXcBxqA7kSkJ1VQfm
 XZW123jfAPOgeHJVeieopV4jZzohx3Fl+1zjVwOkTT3gnyDEZPrkzPDIQN+MPmMLGI2w
 JLVwgk4Deuxy1o3INU3YMK3NVV3sTpo1fdCNNnSuytdNKMjWNq4h0G/IaQsb7cuKd2bT
 4e2T6pgU2UpayMYi/Hjqcjfs61FArMS4jzsR5qaYH+xZSGDpoVaX/q0r2yYcVIm2Yesb
 6SqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y/PhbwwmztK+if1OOg9B3DDGlMEkXQOXyuEbM2m7jFg=;
 b=K9zS+jsKZ+8ktKmlGR2e1a7rRwwTG8PFRRsv+wPdN1swh58xk+GO1sdRdiI/lOvs3/
 bM0i8KwTu1/gigvam0Esv+s72Bu8WjiZ+2gBvWEDDPuwGtkIlRNvnG1vS4v1Snw2ZdQF
 2fWweI8rlZlAaSoADoky8U4imLZD2ZtD61pKNkb6LytZOkKcROF18mb3HzB97hVk0zmm
 px9GgKJMyFGeJhFE2qvqp1cp0j0KwKYOTj/Vg5sYV3tku6y9SiHSs8GOfpLFCYDAK92x
 M0TkwpG1O0v/XEuq1OK7vpSTwKk44QjncHGb4hyz7dlFeTz2aRHjn9wXRXT2lfnaoNse
 sUnw==
X-Gm-Message-State: AOAM532o1+H9iIIXEnquv81W/3/Vzzt2skAhG374OMj9pwtdlrlArJru
 uy+TFXzNq4XBND5BMOsL18u3ftN7JjgAoaXYet4=
X-Google-Smtp-Source: ABdhPJwrY9DLe/t3IUMVaqBQfWNSNbrtSrdfc4RTpt+5o1R+lXxE2qOP//e5yewb+OhfJh4PK+x4UhXuXAdn6D46T/c=
X-Received: by 2002:a17:906:3643:: with SMTP id
 r3mr31351358ejb.527.1617091540619; 
 Tue, 30 Mar 2021 01:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617043998.git.lukasstraub2@web.de>
 <f0d9f6be8bcf54254efd62cb13225b7d47ba22f7.1617043998.git.lukasstraub2@web.de>
In-Reply-To: <f0d9f6be8bcf54254efd62cb13225b7d47ba22f7.1617043998.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 30 Mar 2021 12:05:28 +0400
Message-ID: <CAJ+F1CL5COr0rqPThSwq_KKFR6zCdAqxQ6rttQ9b6gfEOcQwyg@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] tests: Add tests for yank with the chardev-change
 case
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="000000000000d9187405bebc763e"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000d9187405bebc763e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukas,

On Mon, Mar 29, 2021 at 10:55 PM Lukas Straub <lukasstraub2@web.de> wrote:

> Add tests for yank with the chardev-change case.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
> ---
>  MAINTAINERS            |   1 +
>  tests/unit/meson.build |   3 +-
>  tests/unit/test-yank.c | 227 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 230 insertions(+), 1 deletion(-)
>  create mode 100644 tests/unit/test-yank.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 77259c031d..accb683a55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2821,6 +2821,7 @@ M: Lukas Straub <lukasstraub2@web.de>
>  S: Odd fixes
>  F: util/yank.c
>  F: migration/yank_functions*
> +F: tests/unit/test-yank.c
>  F: include/qemu/yank.h
>  F: qapi/yank.json
>
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index 4bfe4627ba..b3bc2109da 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -123,7 +123,8 @@ if have_system
>      'test-util-sockets': ['socket-helpers.c'],
>      'test-base64': [],
>      'test-bufferiszero': [],
> -    'test-vmstate': [migration, io]
> +    'test-vmstate': [migration, io],
> +    'test-yank': ['socket-helpers.c', qom, io, chardev]
>    }
>    if 'CONFIG_INOTIFY1' in config_host
>      tests +=3D {'test-util-filemonitor': []}
> diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c
> new file mode 100644
> index 0000000000..c46946b642
> --- /dev/null
> +++ b/tests/unit/test-yank.c
> @@ -0,0 +1,227 @@
> +/*
> + * Tests for QEMU yank feature
> + *
> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include <glib/gstdio.h>
> +
> +#include "qemu/config-file.h"
> +#include "qemu/module.h"
> +#include "qemu/option.h"
> +#include "chardev/char-fe.h"
> +#include "sysemu/sysemu.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-char.h"
> +#include "qapi/qapi-types-char.h"
> +#include "qapi/qapi-commands-yank.h"
> +#include "qapi/qapi-types-yank.h"
> +#include "io/channel-socket.h"
> +#include "io/net-listener.h"
> +#include "socket-helpers.h"
> +
> +typedef struct {
> +    SocketAddress *addr;
> +    bool old_yank;
> +    bool new_yank;
> +    bool fail;
> +} CharChangeTestConfig;
> +
> +static int chardev_change(void *opaque)
> +{
> +    return 0;
> +}
> +
> +static bool is_yank_instance_registered(void)
> +{
> +    YankInstanceList *list;
> +    bool ret;
> +
> +    list =3D qmp_query_yank(&error_abort);
> +
> +    ret =3D !!list;
> +
> +    qapi_free_YankInstanceList(list);
> +
> +    return ret;
> +}
> +
> +static void char_change_test(gconstpointer opaque)
> +{
> +    CharChangeTestConfig *conf =3D (gpointer) opaque;
> +    SocketAddress *addr;
> +    Chardev *chr;
> +    CharBackend be;
> +    ChardevReturn *ret;
> +    QIOChannelSocket *ioc;
> +    QIONetListener *listener;
> +
> +    /*
> +     * Setup a listener socket and determine its address
> +     * so we know the TCP port for the client later
> +     */
> +    ioc =3D qio_channel_socket_new();
> +    g_assert_nonnull(ioc);
> +    qio_channel_socket_listen_sync(ioc, conf->addr, 1, &error_abort);
> +    addr =3D qio_channel_socket_get_local_address(ioc, &error_abort);
> +    g_assert_nonnull(addr);
> +    listener =3D qio_net_listener_new();
> +    g_assert_nonnull(listener);
> +    qio_net_listener_add(listener, ioc);
>

The listener doesn't work, as there is no loop running. This works for me.
Please update the patch & resend. Thanks

diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c
index 1596a3b98e..6e28648750 100644
--- a/tests/unit/test-yank.c
+++ b/tests/unit/test-yank.c
@@ -49,6 +49,16 @@ static bool is_yank_instance_registered(void)
     return ret;
 }

+static gpointer
+accept_thread(gpointer data)
+{
+    QIOChannelSocket *ioc =3D data;
+
+    qio_channel_socket_accept(ioc, &error_abort);
+
+    return NULL;
+}
+
 static void char_change_test(gconstpointer opaque)
 {
     CharChangeTestConfig *conf =3D (gpointer) opaque;
@@ -57,6 +67,7 @@ static void char_change_test(gconstpointer opaque)
     CharBackend be;
     ChardevReturn *ret;
     QIOChannelSocket *ioc;
+    QemuThread thread;

     /*
      * Setup a listener socket and determine its address
@@ -115,6 +126,11 @@ static void char_change_test(gconstpointer opaque)

     g_assert(!is_yank_instance_registered());

+    if (conf->old_yank) {
+        qemu_thread_create(&thread, "accept", accept_thread,
+                           ioc, QEMU_THREAD_JOINABLE);
+    }
+
     ret =3D qmp_chardev_add("chardev", &backend[conf->old_yank],
&error_abort);
     qapi_free_ChardevReturn(ret);
     chr =3D qemu_chr_find("chardev");
@@ -123,6 +139,10 @@ static void char_change_test(gconstpointer opaque)
     g_assert(is_yank_instance_registered() =3D=3D conf->old_yank);

     qemu_chr_wait_connected(chr, &error_abort);
+    if (conf->old_yank) {
+        qemu_thread_join(&thread);
+    }
+
     qemu_chr_fe_init(&be, chr, &error_abort);
     /* allow chardev-change */
     qemu_chr_fe_set_handlers(&be, NULL, NULL,

+
> +    ChardevBackend backend[2] =3D {
> +        /* doesn't support yank */
> +        { .type =3D CHARDEV_BACKEND_KIND_NULL },
> +        /* supports yank */
> +        {
> +            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
> +            .u.socket.data =3D &(ChardevSocket) {
> +                .addr =3D &(SocketAddressLegacy) {
> +                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
> +                    .u.inet.data =3D &addr->u.inet
> +                },
> +                .has_server =3D true,
> +                .server =3D false
> +            }
> +        } };
> +
> +    ChardevBackend fail_backend[2] =3D {
> +        /* doesn't support yank */
> +        {
> +            .type =3D CHARDEV_BACKEND_KIND_UDP,
> +            .u.udp.data =3D &(ChardevUdp) {
> +                .remote =3D &(SocketAddressLegacy) {
> +                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_UNIX,
> +                    .u.q_unix.data =3D &(UnixSocketAddress) {
> +                        .path =3D (char *)""
> +                    }
> +                }
> +            }
> +        },
> +        /* supports yank */
> +        {
> +            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
> +            .u.socket.data =3D &(ChardevSocket) {
> +                .addr =3D &(SocketAddressLegacy) {
> +                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
> +                    .u.inet.data =3D &(InetSocketAddress) {
> +                        .host =3D (char *)"127.0.0.1",
> +                        .port =3D (char *)"0"
> +                    }
> +                },
> +                .has_server =3D true,
> +                .server =3D false
> +            }
> +        } };
> +
> +    g_assert(!is_yank_instance_registered());
> +
> +    ret =3D qmp_chardev_add("chardev", &backend[conf->old_yank],
> &error_abort);
> +    qapi_free_ChardevReturn(ret);
> +    chr =3D qemu_chr_find("chardev");
> +    g_assert_nonnull(chr);
> +
> +    g_assert(is_yank_instance_registered() =3D=3D conf->old_yank);
> +
> +    qemu_chr_wait_connected(chr, &error_abort);
> +    qemu_chr_fe_init(&be, chr, &error_abort);
> +    /* allow chardev-change */
> +    qemu_chr_fe_set_handlers(&be, NULL, NULL,
> +                             NULL, chardev_change, NULL, NULL, true);
> +
> +    if (conf->fail) {
> +        g_setenv("QTEST_SILENT_ERRORS", "1", 1);
> +        ret =3D qmp_chardev_change("chardev", &fail_backend[conf->new_ya=
nk],
> +                                 NULL);
> +        g_assert_null(ret);
> +        g_assert(be.chr =3D=3D chr);
> +        g_assert(is_yank_instance_registered() =3D=3D conf->old_yank);
> +        g_unsetenv("QTEST_SILENT_ERRORS");
> +    } else {
> +        ret =3D qmp_chardev_change("chardev", &backend[conf->new_yank],
> +                                 &error_abort);
> +        g_assert_nonnull(ret);
> +        g_assert(be.chr !=3D chr);
> +        g_assert(is_yank_instance_registered() =3D=3D conf->new_yank);
> +    }
> +
> +    object_unparent(OBJECT(be.chr));
> +    object_unref(OBJECT(ioc));
> +    object_unref(OBJECT(listener));
> +    qapi_free_ChardevReturn(ret);
> +    qapi_free_SocketAddress(addr);
> +}
> +
> +static SocketAddress tcpaddr =3D {
> +    .type =3D SOCKET_ADDRESS_TYPE_INET,
> +    .u.inet.host =3D (char *)"127.0.0.1",
> +    .u.inet.port =3D (char *)"0",
> +};
> +
> +int main(int argc, char **argv)
> +{
> +    bool has_ipv4, has_ipv6;
> +
> +    qemu_init_main_loop(&error_abort);
> +    socket_init();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
> +        g_printerr("socket_check_protocol_support() failed\n");
> +        goto end;
> +    }
> +
> +    if (!has_ipv4) {
> +        goto end;
> +    }
> +
> +    module_call_init(MODULE_INIT_QOM);
> +    qemu_add_opts(&qemu_chardev_opts);
> +
> +    g_test_add_data_func("/yank/char_change/success/to_yank",
> +                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
> +                                                   .old_yank =3D false,
> +                                                   .new_yank =3D true,
> +                                                   .fail =3D false },
> +                         char_change_test);
> +    g_test_add_data_func("/yank/char_change/fail/to_yank",
> +                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
> +                                                   .old_yank =3D false,
> +                                                   .new_yank =3D true,
> +                                                   .fail =3D true },
> +                         char_change_test);
> +
> +    g_test_add_data_func("/yank/char_change/success/yank_to_yank",
> +                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
> +                                                   .old_yank =3D true,
> +                                                   .new_yank =3D true,
> +                                                   .fail =3D false },
> +                         char_change_test);
> +    g_test_add_data_func("/yank/char_change/fail/yank_to_yank",
> +                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
> +                                                   .old_yank =3D true,
> +                                                   .new_yank =3D true,
> +                                                   .fail =3D true },
> +                         char_change_test);
> +
> +    g_test_add_data_func("/yank/char_change/success/from_yank",
> +                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
> +                                                   .old_yank =3D true,
> +                                                   .new_yank =3D false,
> +                                                   .fail =3D false },
> +                         char_change_test);
> +    g_test_add_data_func("/yank/char_change/fail/from_yank",
> +                         &(CharChangeTestConfig) { .addr =3D &tcpaddr,
> +                                                   .old_yank =3D true,
> +                                                   .new_yank =3D false,
> +                                                   .fail =3D true },
> +                         char_change_test);
> +
> +end:
> +    return g_test_run();
> +}
> --
> 2.30.2
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000d9187405bebc763e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Lukas,<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 29, 2021 at 10:5=
5 PM Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@w=
eb.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Add tests for yank with the chardev-change case.<br>
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Tested-by: Li Zhang &lt;<a href=3D"mailto:li.zhang@cloud.ionos.com" target=
=3D"_blank">li.zhang@cloud.ionos.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 =
+<br>
=C2=A0tests/unit/meson.build |=C2=A0 =C2=A03 +-<br>
=C2=A0tests/unit/test-yank.c | 227 ++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A03 files changed, 230 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 tests/unit/test-yank.c<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 77259c031d..accb683a55 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2821,6 +2821,7 @@ M: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@we=
b.de" target=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
=C2=A0S: Odd fixes<br>
=C2=A0F: util/yank.c<br>
=C2=A0F: migration/yank_functions*<br>
+F: tests/unit/test-yank.c<br>
=C2=A0F: include/qemu/yank.h<br>
=C2=A0F: qapi/yank.json<br>
<br>
diff --git a/tests/unit/meson.build b/tests/unit/meson.build<br>
index 4bfe4627ba..b3bc2109da 100644<br>
--- a/tests/unit/meson.build<br>
+++ b/tests/unit/meson.build<br>
@@ -123,7 +123,8 @@ if have_system<br>
=C2=A0 =C2=A0 =C2=A0&#39;test-util-sockets&#39;: [&#39;socket-helpers.c&#39=
;],<br>
=C2=A0 =C2=A0 =C2=A0&#39;test-base64&#39;: [],<br>
=C2=A0 =C2=A0 =C2=A0&#39;test-bufferiszero&#39;: [],<br>
-=C2=A0 =C2=A0 &#39;test-vmstate&#39;: [migration, io]<br>
+=C2=A0 =C2=A0 &#39;test-vmstate&#39;: [migration, io],<br>
+=C2=A0 =C2=A0 &#39;test-yank&#39;: [&#39;socket-helpers.c&#39;, qom, io, c=
hardev]<br>
=C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0if &#39;CONFIG_INOTIFY1&#39; in config_host<br>
=C2=A0 =C2=A0 =C2=A0tests +=3D {&#39;test-util-filemonitor&#39;: []}<br>
diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c<br>
new file mode 100644<br>
index 0000000000..c46946b642<br>
--- /dev/null<br>
+++ b/tests/unit/test-yank.c<br>
@@ -0,0 +1,227 @@<br>
+/*<br>
+ * Tests for QEMU yank feature<br>
+ *<br>
+ * Copyright (c) Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" t=
arget=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &lt;glib/gstdio.h&gt;<br>
+<br>
+#include &quot;qemu/config-file.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/option.h&quot;<br>
+#include &quot;chardev/char-fe.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qapi/qapi-commands-char.h&quot;<br>
+#include &quot;qapi/qapi-types-char.h&quot;<br>
+#include &quot;qapi/qapi-commands-yank.h&quot;<br>
+#include &quot;qapi/qapi-types-yank.h&quot;<br>
+#include &quot;io/channel-socket.h&quot;<br>
+#include &quot;io/net-listener.h&quot;<br>
+#include &quot;socket-helpers.h&quot;<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 SocketAddress *addr;<br>
+=C2=A0 =C2=A0 bool old_yank;<br>
+=C2=A0 =C2=A0 bool new_yank;<br>
+=C2=A0 =C2=A0 bool fail;<br>
+} CharChangeTestConfig;<br>
+<br>
+static int chardev_change(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static bool is_yank_instance_registered(void)<br>
+{<br>
+=C2=A0 =C2=A0 YankInstanceList *list;<br>
+=C2=A0 =C2=A0 bool ret;<br>
+<br>
+=C2=A0 =C2=A0 list =3D qmp_query_yank(&amp;error_abort);<br>
+<br>
+=C2=A0 =C2=A0 ret =3D !!list;<br>
+<br>
+=C2=A0 =C2=A0 qapi_free_YankInstanceList(list);<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void char_change_test(gconstpointer opaque)<br>
+{<br>
+=C2=A0 =C2=A0 CharChangeTestConfig *conf =3D (gpointer) opaque;<br>
+=C2=A0 =C2=A0 SocketAddress *addr;<br>
+=C2=A0 =C2=A0 Chardev *chr;<br>
+=C2=A0 =C2=A0 CharBackend be;<br>
+=C2=A0 =C2=A0 ChardevReturn *ret;<br>
+=C2=A0 =C2=A0 QIOChannelSocket *ioc;<br>
+=C2=A0 =C2=A0 QIONetListener *listener;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Setup a listener socket and determine its address<br=
>
+=C2=A0 =C2=A0 =C2=A0* so we know the TCP port for the client later<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 ioc =3D qio_channel_socket_new();<br>
+=C2=A0 =C2=A0 g_assert_nonnull(ioc);<br>
+=C2=A0 =C2=A0 qio_channel_socket_listen_sync(ioc, conf-&gt;addr, 1, &amp;e=
rror_abort);<br>
+=C2=A0 =C2=A0 addr =3D qio_channel_socket_get_local_address(ioc, &amp;erro=
r_abort);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(addr);<br>
+=C2=A0 =C2=A0 listener =3D qio_net_listener_new();<br>
+=C2=A0 =C2=A0 g_assert_nonnull(listener);<br>
+=C2=A0 =C2=A0 qio_net_listener_add(listener, ioc);<br></blockquote><div><b=
r></div><div>The listener doesn&#39;t work, as there is no loop running. Th=
is works for me. Please update the patch &amp; resend. Thanks<br></div><div=
><br></div><div>diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.=
c<br>index 1596a3b98e..6e28648750 100644<br>--- a/tests/unit/test-yank.c<br=
>+++ b/tests/unit/test-yank.c<br>@@ -49,6 +49,16 @@ static bool is_yank_ins=
tance_registered(void)<br>=C2=A0 =C2=A0 =C2=A0return ret;<br>=C2=A0}<br>=C2=
=A0<br>+static gpointer<br>+accept_thread(gpointer data)<br>+{<br>+ =C2=A0 =
=C2=A0QIOChannelSocket *ioc =3D data;<br>+<br>+ =C2=A0 =C2=A0qio_channel_so=
cket_accept(ioc, &amp;error_abort);<br>+<br>+ =C2=A0 =C2=A0return NULL;<br>=
+}<br>+<br>=C2=A0static void char_change_test(gconstpointer opaque)<br>=C2=
=A0{<br>=C2=A0 =C2=A0 =C2=A0CharChangeTestConfig *conf =3D (gpointer) opaqu=
e;<br>@@ -57,6 +67,7 @@ static void char_change_test(gconstpointer opaque)<=
br>=C2=A0 =C2=A0 =C2=A0CharBackend be;<br>=C2=A0 =C2=A0 =C2=A0ChardevReturn=
 *ret;<br>=C2=A0 =C2=A0 =C2=A0QIOChannelSocket *ioc;<br>+ =C2=A0 =C2=A0Qemu=
Thread thread;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0/*<br>=C2=A0 =C2=A0 =C2=A0 =
* Setup a listener socket and determine its address<br>@@ -115,6 +126,11 @@=
 static void char_change_test(gconstpointer opaque)<br>=C2=A0<br>=C2=A0 =C2=
=A0 =C2=A0g_assert(!is_yank_instance_registered());<br>=C2=A0<br>+ =C2=A0 =
=C2=A0if (conf-&gt;old_yank) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_thread_=
create(&amp;thread, &quot;accept&quot;, accept_thread,<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ioc, QEMU_THREAD_JOINABLE);<br>+ =C2=A0 =C2=A0}<br>+<br>=C2=A0 =C2=A0 =
=C2=A0ret =3D qmp_chardev_add(&quot;chardev&quot;, &amp;backend[conf-&gt;ol=
d_yank], &amp;error_abort);<br>=C2=A0 =C2=A0 =C2=A0qapi_free_ChardevReturn(=
ret);<br>=C2=A0 =C2=A0 =C2=A0chr =3D qemu_chr_find(&quot;chardev&quot;);<br=
>@@ -123,6 +139,10 @@ static void char_change_test(gconstpointer opaque)<br=
>=C2=A0 =C2=A0 =C2=A0g_assert(is_yank_instance_registered() =3D=3D conf-&gt=
;old_yank);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0qemu_chr_wait_connected(chr, &=
amp;error_abort);<br>+ =C2=A0 =C2=A0if (conf-&gt;old_yank) {<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0qemu_thread_join(&amp;thread);<br>+ =C2=A0 =C2=A0}<br>+=
<br>=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_init(&amp;be, chr, &amp;error_abort);<b=
r>=C2=A0 =C2=A0 =C2=A0/* allow chardev-change */<br>=C2=A0 =C2=A0 =C2=A0qem=
u_chr_fe_set_handlers(&amp;be, NULL, NULL,<br></div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 ChardevBackend backend[2] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* doesn&#39;t support yank */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .type =3D CHARDEV_BACKEND_KIND_NULL },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* supports yank */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D CHARDEV_BACKEND_KIND_S=
OCKET,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .u.socket.data =3D &amp;(Chardev=
Socket) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D &amp;(So=
cketAddressLegacy) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .typ=
e =3D SOCKET_ADDRESS_LEGACY_KIND_INET,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .u.i=
net.data =3D &amp;addr-&gt;u.inet<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .has_server =3D tr=
ue,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .server =3D false<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } };<br>
+<br>
+=C2=A0 =C2=A0 ChardevBackend fail_backend[2] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* doesn&#39;t support yank */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D CHARDEV_BACKEND_KIND_U=
DP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .u.udp.data =3D &amp;(ChardevUdp=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .remote =3D &amp;(=
SocketAddressLegacy) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .typ=
e =3D SOCKET_ADDRESS_LEGACY_KIND_UNIX,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .u.q=
_unix.data =3D &amp;(UnixSocketAddress) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .path =3D (char *)&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* supports yank */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D CHARDEV_BACKEND_KIND_S=
OCKET,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .u.socket.data =3D &amp;(Chardev=
Socket) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D &amp;(So=
cketAddressLegacy) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .typ=
e =3D SOCKET_ADDRESS_LEGACY_KIND_INET,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .u.i=
net.data =3D &amp;(InetSocketAddress) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .host =3D (char *)&quot;127.0.0.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .port =3D (char *)&quot;0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .has_server =3D tr=
ue,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .server =3D false<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } };<br>
+<br>
+=C2=A0 =C2=A0 g_assert(!is_yank_instance_registered());<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qmp_chardev_add(&quot;chardev&quot;, &amp;backend[co=
nf-&gt;old_yank], &amp;error_abort);<br>
+=C2=A0 =C2=A0 qapi_free_ChardevReturn(ret);<br>
+=C2=A0 =C2=A0 chr =3D qemu_chr_find(&quot;chardev&quot;);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(chr);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(is_yank_instance_registered() =3D=3D conf-&gt;old_y=
ank);<br>
+<br>
+=C2=A0 =C2=A0 qemu_chr_wait_connected(chr, &amp;error_abort);<br>
+=C2=A0 =C2=A0 qemu_chr_fe_init(&amp;be, chr, &amp;error_abort);<br>
+=C2=A0 =C2=A0 /* allow chardev-change */<br>
+=C2=A0 =C2=A0 qemu_chr_fe_set_handlers(&amp;be, NULL, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, chardev_change, NULL, NULL, true);<br>
+<br>
+=C2=A0 =C2=A0 if (conf-&gt;fail) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_setenv(&quot;QTEST_SILENT_ERRORS&quot;, &quo=
t;1&quot;, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D qmp_chardev_change(&quot;chardev&quot;=
, &amp;fail_backend[conf-&gt;new_yank],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_null(ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(be.chr =3D=3D chr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(is_yank_instance_registered() =3D=3D =
conf-&gt;old_yank);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_unsetenv(&quot;QTEST_SILENT_ERRORS&quot;);<b=
r>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D qmp_chardev_change(&quot;chardev&quot;=
, &amp;backend[conf-&gt;new_yank],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_abort);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_nonnull(ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(be.chr !=3D chr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(is_yank_instance_registered() =3D=3D =
conf-&gt;new_yank);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 object_unparent(OBJECT(be.chr));<br>
+=C2=A0 =C2=A0 object_unref(OBJECT(ioc));<br>
+=C2=A0 =C2=A0 object_unref(OBJECT(listener));<br>
+=C2=A0 =C2=A0 qapi_free_ChardevReturn(ret);<br>
+=C2=A0 =C2=A0 qapi_free_SocketAddress(addr);<br>
+}<br>
+<br>
+static SocketAddress tcpaddr =3D {<br>
+=C2=A0 =C2=A0 .type =3D SOCKET_ADDRESS_TYPE_INET,<br>
+=C2=A0 =C2=A0 .u.inet.host =3D (char *)&quot;127.0.0.1&quot;,<br>
+=C2=A0 =C2=A0 .u.inet.port =3D (char *)&quot;0&quot;,<br>
+};<br>
+<br>
+int main(int argc, char **argv)<br>
+{<br>
+=C2=A0 =C2=A0 bool has_ipv4, has_ipv6;<br>
+<br>
+=C2=A0 =C2=A0 qemu_init_main_loop(&amp;error_abort);<br>
+=C2=A0 =C2=A0 socket_init();<br>
+<br>
+=C2=A0 =C2=A0 g_test_init(&amp;argc, &amp;argv, NULL);<br>
+<br>
+=C2=A0 =C2=A0 if (socket_check_protocol_support(&amp;has_ipv4, &amp;has_ip=
v6) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_printerr(&quot;socket_check_protocol_support=
() failed\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!has_ipv4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 module_call_init(MODULE_INIT_QOM);<br>
+=C2=A0 =C2=A0 qemu_add_opts(&amp;qemu_chardev_opts);<br>
+<br>
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change/success/to_yank=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;(CharChangeTestConfig) { .addr =3D &amp;tcpaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.old_yank =3D false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.new_yank =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fail =3D false },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char_change_test);<br>
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change/fail/to_yank&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;(CharChangeTestConfig) { .addr =3D &amp;tcpaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.old_yank =3D false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.new_yank =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fail =3D true },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char_change_test);<br>
+<br>
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change/success/yank_to=
_yank&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;(CharChangeTestConfig) { .addr =3D &amp;tcpaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.old_yank =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.new_yank =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fail =3D false },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char_change_test);<br>
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change/fail/yank_to_ya=
nk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;(CharChangeTestConfig) { .addr =3D &amp;tcpaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.old_yank =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.new_yank =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fail =3D true },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char_change_test);<br>
+<br>
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change/success/from_ya=
nk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;(CharChangeTestConfig) { .addr =3D &amp;tcpaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.old_yank =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.new_yank =3D false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fail =3D false },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char_change_test);<br>
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change/fail/from_yank&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;(CharChangeTestConfig) { .addr =3D &amp;tcpaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.old_yank =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.new_yank =3D false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fail =3D true },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char_change_test);<br>
+<br>
+end:<br>
+=C2=A0 =C2=A0 return g_test_run();<br>
+}<br>
--<br>
2.30.2<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d9187405bebc763e--

