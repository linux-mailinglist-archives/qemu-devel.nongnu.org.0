Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC5234B116
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 22:12:21 +0100 (CET)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtkh-0001Wq-O6
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 17:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPtjV-0000ID-OQ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:11:05 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPtjT-00042A-54
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:11:05 -0400
Received: by mail-ed1-x52d.google.com with SMTP id w18so7904656edc.0
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 14:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+DIS4/RMXROZSW7G9YWHmzqGo4If6DaLuzFLqal031U=;
 b=RoQwj1uMhPXWl1KsM3kXz+093JYKdUwuHdCrjfa4iRflpAHbX4xO9Imm/HMkpknEeT
 niZTjzZYrcNBlqrZK6ayUvxgeK6zSR3w3jPTB0uNZVVU5PJY3K/i+Tmd8t60iq48ki/s
 c5bspe5+3Lyfnlhie2cYk3w/A/SP/nwlDsyCqyBt1Stn9b+Rai76KSaAsWJDM3reiZBO
 /xf1F22exOTRIfkxaYygeBPOPPW9Z9HS08KfnJxF77j6W9cxC6qx5hEsPMj6iu7829Oz
 gcIvv6+II2XS7RwedJ1t09ve8gUeNXHr/UFmz0r//qTR7jA8Yn0eYjdsK83hTZPFMqep
 H68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+DIS4/RMXROZSW7G9YWHmzqGo4If6DaLuzFLqal031U=;
 b=adf6KltvLchTPPWfycStbw1iKpeQrKYAUuDG/jnSnSpY9W7rrX803JKM0EFbRtEunN
 QLFV9Txv+aCavfuq2aZj46h2kwstKUiAIklfpKlS5PrrIm76/Q0GYrLUODwT0V3uGvJ/
 Xg2ksMfSnQ+X0SwWfo6TgY47d5NxqS1xz5SGPBmN5mjaYI4dVrV0N5TFU3NTNCjWmAEG
 uhPxTggmQ2jXcE5ne4SAVHAilU8/ZgDDd8KTwt/ubJb5q8HWB19FqZR/J5X8ooVeqbP6
 gWZl6xbYdAZiSRxfYaiWfPwSkMYiIq0FVCbO9v464Jjd1sH93N/uvkMC+3qMlnZ+JnuP
 LSoQ==
X-Gm-Message-State: AOAM531NacR3/H1bge10q5LG2E/1Q9ivIOMmsZ09BvuPLeGRrJXQ8PD+
 b4IbX7/l8aNtmr069NSANqnsLMvCcBMtDq5DlO4=
X-Google-Smtp-Source: ABdhPJzBpNtoVNKhfrNBSHaHYfJX/grt5FpAKAYhkBfr7+qCQvgJgKZgzPBW4kSmv3L1BwZe3/2vThycYA/u/RHyOzA=
X-Received: by 2002:aa7:dd4d:: with SMTP id o13mr17740407edw.53.1616793061624; 
 Fri, 26 Mar 2021 14:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616744509.git.lukasstraub2@web.de>
 <b0dd0e40c2635fcb3bc23cb26f884bf585abee95.1616744509.git.lukasstraub2@web.de>
In-Reply-To: <b0dd0e40c2635fcb3bc23cb26f884bf585abee95.1616744509.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 27 Mar 2021 01:10:50 +0400
Message-ID: <CAJ+F1CJL3GL=EmbkqM7Y25+-riUnq=6zY8dUh4p5=FmXH-mtyQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] tests: Add tests for yank with the chardev-change
 case
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="0000000000001d0eec05be76f888"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52d.google.com
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

--0000000000001d0eec05be76f888
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Lukas

On Fri, Mar 26, 2021 at 11:48 AM Lukas Straub <lukasstraub2@web.de> wrote:

> Add tests for yank with the chardev-change case.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  MAINTAINERS            |   1 +
>  tests/unit/meson.build |   3 +-
>  tests/unit/test-yank.c | 199 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 202 insertions(+), 1 deletion(-)
>  create mode 100644 tests/unit/test-yank.c
>
>
Please run the tests with ASAN. Can you resend with the leaks fixed?
thanks

diff --git a/MAINTAINERS b/MAINTAINERS
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
> index 0000000000..8bc8291a82
> --- /dev/null
> +++ b/tests/unit/test-yank.c
> @@ -0,0 +1,199 @@
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
> +
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
> +#define CHAR_CHANGE_TEST(name, _old_yank, _new_yank)
>      \
> +        g_test_add_data_func("/yank/char_change/success/" # name,
>       \
> +                             &(CharChangeTestConfig) { .addr =3D &tcpadd=
r,
>      \
> +                                                       .old_yank =3D
> (_old_yank),\
> +                                                       .new_yank =3D
> (_new_yank),\
> +                                                       .fail =3D false }=
,
>       \
> +                             char_change_test);
>       \
> +        g_test_add_data_func("/yank/char_change/fail/" # name,
>      \
> +                             &(CharChangeTestConfig) { .addr =3D &tcpadd=
r,
>      \
> +                                                       .old_yank =3D
> (_old_yank),\
> +                                                       .new_yank =3D
> (_new_yank),\
> +                                                       .fail =3D true },
>      \
> +                             char_change_test);
> +
> +    CHAR_CHANGE_TEST(to_yank, false, true);
> +    CHAR_CHANGE_TEST(yank_to_yank, true, true);
> +    CHAR_CHANGE_TEST(from_yank, true, false);
> +
> +end:
> +    return g_test_run();
> +}
> --
> 2.30.2
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000001d0eec05be76f888
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">=C2=A0Hi Lukas<br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 26, 2021 at=
 11:48 AM Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstra=
ub2@web.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add tests for yank with the chardev-change case.<br>
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 =
+<br>
=C2=A0tests/unit/meson.build |=C2=A0 =C2=A03 +-<br>
=C2=A0tests/unit/test-yank.c | 199 ++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A03 files changed, 202 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 tests/unit/test-yank.c<br>
<br></blockquote><div><br></div><div>Please run the tests with ASAN. Can yo=
u resend with the leaks fixed?</div><div>thanks<br></div><div> <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
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
index 0000000000..8bc8291a82<br>
--- /dev/null<br>
+++ b/tests/unit/test-yank.c<br>
@@ -0,0 +1,199 @@<br>
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
+#define CHAR_CHANGE_TEST(name, _old_yank, _new_yank)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change/s=
uccess/&quot; # name,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;(CharChangeTestConfig) { .addr =3D &amp=
;tcpaddr,=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.old_yank =3D (_old_yank),\=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.new_yank =3D (_new_yank),\=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fail =3D false },=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_change_test);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_add_data_func(&quot;/yank/char_change/f=
ail/&quot; # name,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;(CharChangeTestConfig) { .addr =3D &amp=
;tcpaddr,=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.old_yank =3D (_old_yank),\=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.new_yank =3D (_new_yank),\=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fail =3D true },=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_change_test);<br>
+<br>
+=C2=A0 =C2=A0 CHAR_CHANGE_TEST(to_yank, false, true);<br>
+=C2=A0 =C2=A0 CHAR_CHANGE_TEST(yank_to_yank, true, true);<br>
+=C2=A0 =C2=A0 CHAR_CHANGE_TEST(from_yank, true, false);<br>
+<br>
+end:<br>
+=C2=A0 =C2=A0 return g_test_run();<br>
+}<br>
--<br>
2.30.2<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001d0eec05be76f888--

