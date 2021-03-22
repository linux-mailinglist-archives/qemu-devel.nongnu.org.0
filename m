Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751D6343B42
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 09:07:45 +0100 (CET)
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOFbE-0007vQ-1R
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 04:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOFYK-0007Cr-0S
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:04:44 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOFYH-0006op-9X
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:04:43 -0400
Received: by mail-ej1-x629.google.com with SMTP id r12so19675253ejr.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K6Hzkymtj3slCOwTwQEOrVge41gPBeUC3tOSP4RsOtc=;
 b=D7xDSGDnwxEK7BZ8hsC3gqrk5+RiuvzpcaocTjMSzsTzcnKIT2fGesIHYh6wLJkx3U
 bSdqWTsIi2zWEQpylTBWPmENYJqEhvqd9JXWcgFUatTz971Zcy+BB7w4lnfgtAkcPRCm
 nLCeZBoSb+DxDmiCTTcuiE37v3KN1eeGx8FMSCeD/m5aC5p6IQhVXdhvwuCxunvcrBVI
 m/+YDqjFwgxQvpdzIwYIV6FBbxnAtrMDgUPpinyHBgbhWhTIdJ8W2qGA49L0/jCZy5rb
 6ViqCDZIMsx3Kl0Ix0PkzW/oOfXK1hjFbuOceHQsGbapmJLAR9fAYDxhSrNL6VAplJhN
 jYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K6Hzkymtj3slCOwTwQEOrVge41gPBeUC3tOSP4RsOtc=;
 b=j5O4+BoXj8PGJMeUMzG7IPYlAgXIo2cgygmt8+BkbFO9KvP8KIMzu9G6GEGwwPzwVr
 5U2ufUHwxG+74JN5aoO41OWdVENTjn/Xt48bd7GpwaMXzwMBbhG9xO/Oplyg3t3CPcV3
 61yDj2JtQC4N+NAfUL6bVfb0ATztEICG+g8dOLbXhLYFhG1Z80udR35xMy4VnEhgjo2O
 1wRCNpdrmIh2YEV/0tjWutHJbY2tzysb4kOfPFW1MDGLDCr51mke/TaLrTSwVDasnksn
 9aJ7p4jBoCqwUoRjBjyNhyuX3EZ9wuwpaPsDo8L9ne/d5lHZs9NpQo04VxTlmSxpdJZj
 /2lg==
X-Gm-Message-State: AOAM531QRyLzcC5+rCTWzvMaIkafOcVkFkWIbpfY4gQDjoxU2CYx+moy
 qaLMEnx7pyl2qCc2uZd8cWv4NTWvDtBwtWCQxWQ=
X-Google-Smtp-Source: ABdhPJzqFJhvBjtH6fG8vteJZJlOwVqhD+L63ebeC6IbXBj+b8unBB9sVnYC2r2HQPC1VX+04QlvitMa4L1a8XMcOmY=
X-Received: by 2002:a17:906:3643:: with SMTP id
 r3mr17640667ejb.527.1616400278410; 
 Mon, 22 Mar 2021 01:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616368879.git.lukasstraub2@web.de>
 <a9bbe2d090df2a88ff5d71f95ff3888873c5e4ad.1616368879.git.lukasstraub2@web.de>
In-Reply-To: <a9bbe2d090df2a88ff5d71f95ff3888873c5e4ad.1616368879.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 22 Mar 2021 12:04:26 +0400
Message-ID: <CAJ+F1CLtBKs4DqMCncvFP+sTaYtrSzBakhah3A+-dRV6p+C21Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] tests: Add tests for yank with the chardev-change
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="00000000000068dd1f05be1b844a"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x629.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Li Zhang <zhlcindy@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000068dd1f05be1b844a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 3:31 AM Lukas Straub <lukasstraub2@web.de> wrote:

> Add tests for yank with the chardev-change case.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  MAINTAINERS            |   1 +
>  tests/unit/meson.build |   3 +-
>  tests/unit/test-yank.c | 240 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 243 insertions(+), 1 deletion(-)
>  create mode 100644 tests/unit/test-yank.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa024eed17..a8a7f0d1c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2817,6 +2817,7 @@ F: monitor/yank.c
>  F: stubs/yank.c
>  F: include/qemu/yank.h
>  F: qapi/yank.json
> +F: tests/unit/test-yank.c
>
>  COLO Framework
>  M: zhanghailiang <zhang.zhanghailiang@huawei.com>
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index 8ccf60af66..38e5dba920 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -123,7 +123,8 @@ if have_system
>      'test-util-sockets': ['socket-helpers.c'],
>      'test-base64': [],
>      'test-bufferiszero': [],
> -    'test-vmstate': [migration, io, '../../monitor/yank.c']
> +    'test-vmstate': [migration, io, '../../monitor/yank.c'],
> +    'test-yank': ['socket-helpers.c', qom, io, chardev,
> '../../monitor/yank.c']
>    }
>    if 'CONFIG_INOTIFY1' in config_host
>      tests +=3D {'test-util-filemonitor': []}
> diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c
> new file mode 100644
> index 0000000000..44f24c45a8
> --- /dev/null
> +++ b/tests/unit/test-yank.c
> @@ -0,0 +1,240 @@
> +#include "qemu/osdep.h"
> +#include <glib/gstdio.h>
> +
> +#include "qemu/config-file.h"
> +#include "qemu/module.h"
> +#include "qemu/option.h"
> +#include "qemu/sockets.h"
> +#include "chardev/char-fe.h"
> +#include "sysemu/sysemu.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-char.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qom/qom-qobject.h"
> +#include "io/channel-socket.h"
> +#include "qapi/qobject-input-visitor.h"
> +#include "qapi/qapi-visit-sockets.h"
> +#include "socket-helpers.h"
> +#include "qapi/qapi-commands-yank.h"
> +#include "qapi/qapi-types-yank.h"
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
> +static void char_change_to_yank_test(gconstpointer opaque)
> +{
> +    SocketAddress *addr =3D (gpointer) opaque;
> +    Chardev *chr;
> +    CharBackend be;
> +    ChardevReturn *ret;
> +    QIOChannelSocket *ioc;
> +
> +    /*
> +     * Setup a listener socket and determine its address
> +     * so we know the TCP port for the client later
> +     */
> +    ioc =3D qio_channel_socket_new();
> +    g_assert_nonnull(ioc);
> +    qio_channel_socket_listen_sync(ioc, addr, 1, &error_abort);
> +    addr =3D qio_channel_socket_get_local_address(ioc, &error_abort);
> +    g_assert_nonnull(addr);
> +
> +    ChardevBackend old_backend =3D { .type =3D CHARDEV_BACKEND_KIND_NULL=
 };
> +    ChardevBackend new_backend =3D {
> +            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
> +            .u.socket.data =3D &(ChardevSocket) {
> +                .addr =3D &(SocketAddressLegacy) {
> +                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
> +                    .u.inet.data =3D &addr->u.inet
> +                },
> +                .has_server =3D true,
> +                .server =3D false
> +            } };
> +
>

It looks like you should be able to factorize the code with a common
function:
test_yank_change(first, second, first_registerd, second_registered)
or something like that.

thanks

+    g_assert(!is_yank_instance_registered());
> +
> +    ret =3D qmp_chardev_add("chardev", &old_backend, &error_abort);
> +    qapi_free_ChardevReturn(ret);
> +    chr =3D qemu_chr_find("chardev");
> +    g_assert_nonnull(chr);
> +
> +    g_assert(!is_yank_instance_registered());
> +
> +    qemu_chr_wait_connected(chr, &error_abort);
> +    qemu_chr_fe_init(&be, chr, &error_abort);
> +    /* allow chardev-change */
> +    qemu_chr_fe_set_handlers(&be, NULL, NULL,
> +                             NULL, chardev_change, NULL, NULL, true);
> +
> +    ret =3D qmp_chardev_change("chardev", &new_backend, &error_abort);
> +    g_assert_nonnull(ret);
> +    g_assert(be.chr !=3D chr);
> +    g_assert(is_yank_instance_registered());
> +
> +    object_unparent(OBJECT(be.chr));
> +    object_unref(OBJECT(ioc));
> +    qapi_free_ChardevReturn(ret);
> +}
> +
> +static void char_change_yank_to_yank_test(gconstpointer opaque)
> +{
> +    SocketAddress *addr =3D (gpointer) opaque;
> +    Chardev *chr;
> +    CharBackend be;
> +    ChardevReturn *ret;
> +    QIOChannelSocket *ioc;
> +
> +    /*
> +     * Setup a listener socket and determine its address
> +     * so we know the TCP port for the client later
> +     */
> +    ioc =3D qio_channel_socket_new();
> +    g_assert_nonnull(ioc);
> +    qio_channel_socket_listen_sync(ioc, addr, 1, &error_abort);
> +    addr =3D qio_channel_socket_get_local_address(ioc, &error_abort);
> +    g_assert_nonnull(addr);
> +
> +    ChardevBackend backend =3D {
> +            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
> +            .u.socket.data =3D &(ChardevSocket) {
> +                .addr =3D &(SocketAddressLegacy) {
> +                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
> +                    .u.inet.data =3D &addr->u.inet
> +                },
> +                .has_server =3D true,
> +                .server =3D false
> +            } };
> +
> +    g_assert(!is_yank_instance_registered());
> +
> +    ret =3D qmp_chardev_add("chardev", &backend, &error_abort);
> +    qapi_free_ChardevReturn(ret);
> +    chr =3D qemu_chr_find("chardev");
> +    g_assert_nonnull(chr);
> +
> +    g_assert(is_yank_instance_registered());
> +
> +    qemu_chr_wait_connected(chr, &error_abort);
> +    qemu_chr_fe_init(&be, chr, &error_abort);
> +    /* allow chardev-change */
> +    qemu_chr_fe_set_handlers(&be, NULL, NULL,
> +                             NULL, chardev_change, NULL, NULL, true);
> +
> +    ret =3D qmp_chardev_change("chardev", &backend, &error_abort);
> +    g_assert_nonnull(ret);
> +    g_assert(be.chr !=3D chr);
> +    g_assert(is_yank_instance_registered());
> +
> +    object_unparent(OBJECT(be.chr));
> +    object_unref(OBJECT(ioc));
> +    qapi_free_ChardevReturn(ret);
> +}
> +
> +static void char_change_from_yank_test(gconstpointer opaque)
> +{
> +    SocketAddress *addr =3D (gpointer) opaque;
> +    Chardev *chr;
> +    CharBackend be;
> +    ChardevReturn *ret;
> +    QIOChannelSocket *ioc;
> +
> +    /*
> +     * Setup a listener socket and determine its address
> +     * so we know the TCP port for the client later
> +     */
> +    ioc =3D qio_channel_socket_new();
> +    g_assert_nonnull(ioc);
> +    qio_channel_socket_listen_sync(ioc, addr, 1, &error_abort);
> +    addr =3D qio_channel_socket_get_local_address(ioc, &error_abort);
> +    g_assert_nonnull(addr);
> +
> +    ChardevBackend old_backend =3D {
> +            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
> +            .u.socket.data =3D &(ChardevSocket) {
> +                .addr =3D &(SocketAddressLegacy) {
> +                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
> +                    .u.inet.data =3D &addr->u.inet
> +                },
> +                .has_server =3D true,
> +                .server =3D false
> +            } };
> +    ChardevBackend new_backend =3D { .type =3D CHARDEV_BACKEND_KIND_NULL=
 };
> +
> +    g_assert(!is_yank_instance_registered());
> +
> +    ret =3D qmp_chardev_add("chardev", &old_backend, &error_abort);
> +    qapi_free_ChardevReturn(ret);
> +    chr =3D qemu_chr_find("chardev");
> +    g_assert_nonnull(chr);
> +
> +    g_assert(is_yank_instance_registered());
> +
> +    qemu_chr_wait_connected(chr, &error_abort);
> +    qemu_chr_fe_init(&be, chr, &error_abort);
> +    /* allow chardev-change */
> +    qemu_chr_fe_set_handlers(&be, NULL, NULL,
> +                             NULL, chardev_change, NULL, NULL, true);
> +
> +    ret =3D qmp_chardev_change("chardev", &new_backend, &error_abort);
> +    g_assert_nonnull(ret);
> +    g_assert(be.chr !=3D chr);
> +    g_assert(!is_yank_instance_registered());
> +
> +    object_unparent(OBJECT(be.chr));
> +    object_unref(OBJECT(ioc));
> +    qapi_free_ChardevReturn(ret);
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
> +    g_test_add_data_func("/yank/char_change_to_yank", &tcpaddr,
> +                         char_change_to_yank_test);
> +    g_test_add_data_func("/yank/char_change_yank_to_yank", &tcpaddr,
> +                         char_change_yank_to_yank_test);
> +    g_test_add_data_func("/yank/char_change_from_yank", &tcpaddr,
> +                         char_change_from_yank_test);
> +
> +end:
> +    return g_test_run();
> +}
> --
> 2.30.2
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000068dd1f05be1b844a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 2021 at 3:31 AM Lukas=
 Straub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web.de</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add t=
ests for yank with the chardev-change case.<br>
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 =
+<br>
=C2=A0tests/unit/meson.build |=C2=A0 =C2=A03 +-<br>
=C2=A0tests/unit/test-yank.c | 240 ++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A03 files changed, 243 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 tests/unit/test-yank.c<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index aa024eed17..a8a7f0d1c2 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2817,6 +2817,7 @@ F: monitor/yank.c<br>
=C2=A0F: stubs/yank.c<br>
=C2=A0F: include/qemu/yank.h<br>
=C2=A0F: qapi/yank.json<br>
+F: tests/unit/test-yank.c<br>
<br>
=C2=A0COLO Framework<br>
=C2=A0M: zhanghailiang &lt;<a href=3D"mailto:zhang.zhanghailiang@huawei.com=
" target=3D"_blank">zhang.zhanghailiang@huawei.com</a>&gt;<br>
diff --git a/tests/unit/meson.build b/tests/unit/meson.build<br>
index 8ccf60af66..38e5dba920 100644<br>
--- a/tests/unit/meson.build<br>
+++ b/tests/unit/meson.build<br>
@@ -123,7 +123,8 @@ if have_system<br>
=C2=A0 =C2=A0 =C2=A0&#39;test-util-sockets&#39;: [&#39;socket-helpers.c&#39=
;],<br>
=C2=A0 =C2=A0 =C2=A0&#39;test-base64&#39;: [],<br>
=C2=A0 =C2=A0 =C2=A0&#39;test-bufferiszero&#39;: [],<br>
-=C2=A0 =C2=A0 &#39;test-vmstate&#39;: [migration, io, &#39;../../monitor/y=
ank.c&#39;]<br>
+=C2=A0 =C2=A0 &#39;test-vmstate&#39;: [migration, io, &#39;../../monitor/y=
ank.c&#39;],<br>
+=C2=A0 =C2=A0 &#39;test-yank&#39;: [&#39;socket-helpers.c&#39;, qom, io, c=
hardev, &#39;../../monitor/yank.c&#39;]<br>
=C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0if &#39;CONFIG_INOTIFY1&#39; in config_host<br>
=C2=A0 =C2=A0 =C2=A0tests +=3D {&#39;test-util-filemonitor&#39;: []}<br>
diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c<br>
new file mode 100644<br>
index 0000000000..44f24c45a8<br>
--- /dev/null<br>
+++ b/tests/unit/test-yank.c<br>
@@ -0,0 +1,240 @@<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &lt;glib/gstdio.h&gt;<br>
+<br>
+#include &quot;qemu/config-file.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/option.h&quot;<br>
+#include &quot;qemu/sockets.h&quot;<br>
+#include &quot;chardev/char-fe.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qapi/qapi-commands-char.h&quot;<br>
+#include &quot;qapi/qmp/qdict.h&quot;<br>
+#include &quot;qom/qom-qobject.h&quot;<br>
+#include &quot;io/channel-socket.h&quot;<br>
+#include &quot;qapi/qobject-input-visitor.h&quot;<br>
+#include &quot;qapi/qapi-visit-sockets.h&quot;<br>
+#include &quot;socket-helpers.h&quot;<br>
+#include &quot;qapi/qapi-commands-yank.h&quot;<br>
+#include &quot;qapi/qapi-types-yank.h&quot;<br>
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
+static void char_change_to_yank_test(gconstpointer opaque)<br>
+{<br>
+=C2=A0 =C2=A0 SocketAddress *addr =3D (gpointer) opaque;<br>
+=C2=A0 =C2=A0 Chardev *chr;<br>
+=C2=A0 =C2=A0 CharBackend be;<br>
+=C2=A0 =C2=A0 ChardevReturn *ret;<br>
+=C2=A0 =C2=A0 QIOChannelSocket *ioc;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Setup a listener socket and determine its address<br=
>
+=C2=A0 =C2=A0 =C2=A0* so we know the TCP port for the client later<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 ioc =3D qio_channel_socket_new();<br>
+=C2=A0 =C2=A0 g_assert_nonnull(ioc);<br>
+=C2=A0 =C2=A0 qio_channel_socket_listen_sync(ioc, addr, 1, &amp;error_abor=
t);<br>
+=C2=A0 =C2=A0 addr =3D qio_channel_socket_get_local_address(ioc, &amp;erro=
r_abort);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(addr);<br>
+<br>
+=C2=A0 =C2=A0 ChardevBackend old_backend =3D { .type =3D CHARDEV_BACKEND_K=
IND_NULL };<br>
+=C2=A0 =C2=A0 ChardevBackend new_backend =3D {<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } };<br>
+<br></blockquote><div><br></div><div>It looks like you should be able to f=
actorize the code with a common function:</div><div>test_yank_change(first,=
 second, first_registerd, second_registered)</div><div>or something like th=
at.<br></div><div><br></div><div>thanks</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 g_assert(!is_yank_instance_registered());<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qmp_chardev_add(&quot;chardev&quot;, &amp;old_backen=
d, &amp;error_abort);<br>
+=C2=A0 =C2=A0 qapi_free_ChardevReturn(ret);<br>
+=C2=A0 =C2=A0 chr =3D qemu_chr_find(&quot;chardev&quot;);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(chr);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(!is_yank_instance_registered());<br>
+<br>
+=C2=A0 =C2=A0 qemu_chr_wait_connected(chr, &amp;error_abort);<br>
+=C2=A0 =C2=A0 qemu_chr_fe_init(&amp;be, chr, &amp;error_abort);<br>
+=C2=A0 =C2=A0 /* allow chardev-change */<br>
+=C2=A0 =C2=A0 qemu_chr_fe_set_handlers(&amp;be, NULL, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, chardev_change, NULL, NULL, true);<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qmp_chardev_change(&quot;chardev&quot;, &amp;new_bac=
kend, &amp;error_abort);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(ret);<br>
+=C2=A0 =C2=A0 g_assert(be.chr !=3D chr);<br>
+=C2=A0 =C2=A0 g_assert(is_yank_instance_registered());<br>
+<br>
+=C2=A0 =C2=A0 object_unparent(OBJECT(be.chr));<br>
+=C2=A0 =C2=A0 object_unref(OBJECT(ioc));<br>
+=C2=A0 =C2=A0 qapi_free_ChardevReturn(ret);<br>
+}<br>
+<br>
+static void char_change_yank_to_yank_test(gconstpointer opaque)<br>
+{<br>
+=C2=A0 =C2=A0 SocketAddress *addr =3D (gpointer) opaque;<br>
+=C2=A0 =C2=A0 Chardev *chr;<br>
+=C2=A0 =C2=A0 CharBackend be;<br>
+=C2=A0 =C2=A0 ChardevReturn *ret;<br>
+=C2=A0 =C2=A0 QIOChannelSocket *ioc;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Setup a listener socket and determine its address<br=
>
+=C2=A0 =C2=A0 =C2=A0* so we know the TCP port for the client later<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 ioc =3D qio_channel_socket_new();<br>
+=C2=A0 =C2=A0 g_assert_nonnull(ioc);<br>
+=C2=A0 =C2=A0 qio_channel_socket_listen_sync(ioc, addr, 1, &amp;error_abor=
t);<br>
+=C2=A0 =C2=A0 addr =3D qio_channel_socket_get_local_address(ioc, &amp;erro=
r_abort);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(addr);<br>
+<br>
+=C2=A0 =C2=A0 ChardevBackend backend =3D {<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } };<br>
+<br>
+=C2=A0 =C2=A0 g_assert(!is_yank_instance_registered());<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qmp_chardev_add(&quot;chardev&quot;, &amp;backend, &=
amp;error_abort);<br>
+=C2=A0 =C2=A0 qapi_free_ChardevReturn(ret);<br>
+=C2=A0 =C2=A0 chr =3D qemu_chr_find(&quot;chardev&quot;);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(chr);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(is_yank_instance_registered());<br>
+<br>
+=C2=A0 =C2=A0 qemu_chr_wait_connected(chr, &amp;error_abort);<br>
+=C2=A0 =C2=A0 qemu_chr_fe_init(&amp;be, chr, &amp;error_abort);<br>
+=C2=A0 =C2=A0 /* allow chardev-change */<br>
+=C2=A0 =C2=A0 qemu_chr_fe_set_handlers(&amp;be, NULL, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, chardev_change, NULL, NULL, true);<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qmp_chardev_change(&quot;chardev&quot;, &amp;backend=
, &amp;error_abort);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(ret);<br>
+=C2=A0 =C2=A0 g_assert(be.chr !=3D chr);<br>
+=C2=A0 =C2=A0 g_assert(is_yank_instance_registered());<br>
+<br>
+=C2=A0 =C2=A0 object_unparent(OBJECT(be.chr));<br>
+=C2=A0 =C2=A0 object_unref(OBJECT(ioc));<br>
+=C2=A0 =C2=A0 qapi_free_ChardevReturn(ret);<br>
+}<br>
+<br>
+static void char_change_from_yank_test(gconstpointer opaque)<br>
+{<br>
+=C2=A0 =C2=A0 SocketAddress *addr =3D (gpointer) opaque;<br>
+=C2=A0 =C2=A0 Chardev *chr;<br>
+=C2=A0 =C2=A0 CharBackend be;<br>
+=C2=A0 =C2=A0 ChardevReturn *ret;<br>
+=C2=A0 =C2=A0 QIOChannelSocket *ioc;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Setup a listener socket and determine its address<br=
>
+=C2=A0 =C2=A0 =C2=A0* so we know the TCP port for the client later<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 ioc =3D qio_channel_socket_new();<br>
+=C2=A0 =C2=A0 g_assert_nonnull(ioc);<br>
+=C2=A0 =C2=A0 qio_channel_socket_listen_sync(ioc, addr, 1, &amp;error_abor=
t);<br>
+=C2=A0 =C2=A0 addr =3D qio_channel_socket_get_local_address(ioc, &amp;erro=
r_abort);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(addr);<br>
+<br>
+=C2=A0 =C2=A0 ChardevBackend old_backend =3D {<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } };<br>
+=C2=A0 =C2=A0 ChardevBackend new_backend =3D { .type =3D CHARDEV_BACKEND_K=
IND_NULL };<br>
+<br>
+=C2=A0 =C2=A0 g_assert(!is_yank_instance_registered());<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qmp_chardev_add(&quot;chardev&quot;, &amp;old_backen=
d, &amp;error_abort);<br>
+=C2=A0 =C2=A0 qapi_free_ChardevReturn(ret);<br>
+=C2=A0 =C2=A0 chr =3D qemu_chr_find(&quot;chardev&quot;);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(chr);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(is_yank_instance_registered());<br>
+<br>
+=C2=A0 =C2=A0 qemu_chr_wait_connected(chr, &amp;error_abort);<br>
+=C2=A0 =C2=A0 qemu_chr_fe_init(&amp;be, chr, &amp;error_abort);<br>
+=C2=A0 =C2=A0 /* allow chardev-change */<br>
+=C2=A0 =C2=A0 qemu_chr_fe_set_handlers(&amp;be, NULL, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, chardev_change, NULL, NULL, true);<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qmp_chardev_change(&quot;chardev&quot;, &amp;new_bac=
kend, &amp;error_abort);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(ret);<br>
+=C2=A0 =C2=A0 g_assert(be.chr !=3D chr);<br>
+=C2=A0 =C2=A0 g_assert(!is_yank_instance_registered());<br>
+<br>
+=C2=A0 =C2=A0 object_unparent(OBJECT(be.chr));<br>
+=C2=A0 =C2=A0 object_unref(OBJECT(ioc));<br>
+=C2=A0 =C2=A0 qapi_free_ChardevReturn(ret);<br>
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
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change_to_yank&quot;, =
&amp;tcpaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char_change_to_yank_test);<br>
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change_yank_to_yank&qu=
ot;, &amp;tcpaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char_change_yank_to_yank_test);<br>
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change_from_yank&quot;=
, &amp;tcpaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char_change_from_yank_test);<br>
+<br>
+end:<br>
+=C2=A0 =C2=A0 return g_test_run();<br>
+}<br>
--<br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000068dd1f05be1b844a--

