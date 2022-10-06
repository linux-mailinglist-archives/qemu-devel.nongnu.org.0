Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571AB5F68AD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:59:08 +0200 (CEST)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogRP0-0001NV-Rt
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ogRHP-0006nc-Qs
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:51:15 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ogRHJ-0008KD-IO
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:51:15 -0400
Received: by mail-lf1-x12a.google.com with SMTP id r14so2830696lfm.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=nwt1T7wuiv65nGPmvrlkSkUUBn9pvW91Bm3XCuwwclE=;
 b=M0UZTuA5H7HOZtdCm8xoOsvYCbSHZ1I+t85VHDSkLd470KaObXRBLkFoX/aPtOpb4S
 vEQ5BPf8FbEjSWttwKykL7dPNQdOiftXtjXKKeiv+OySX5tqQ3u0tUUSbhz34trkZgS7
 f9GAEIMX8brV2YRzJvVKaNXXyEU55rVK1QX9ILzYwDxjoATbSCj5FjIZolUOgddSNsd1
 PkPe2CM/8xH3VlrYVmvx8lIQFRmy6SAFfUnEB30NXuC/xnRMWD9EaFozqOvmM/G/U9a3
 ZoWwY68d1+jzrdNMXbPQtEMx2/4Xjh4bjX5HczxIkqUIymCRyBsScB4iTr4wMZVCDLw0
 V64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=nwt1T7wuiv65nGPmvrlkSkUUBn9pvW91Bm3XCuwwclE=;
 b=jzsNkCcJhsYi6wpQT8H8pRokOzTgZthfzuARROcChxBpDJWpbJmuWIoYIqqSwKDqkz
 G8qtGrBcOPYuDLsHBVz4+WbbOrxYEmvnyZ1veOHoUbUYaJKBMdKcSCbNjkdqFq3LSZeq
 EQAq+qrjgUTHpAjZksi6gfJ4fm2Jnaue6PZKwXl9aweZmGg2F/ILHTtiKOfba5ElH5LO
 HMMcGgqNJA2MahGvbE74bU+FeXNqthLdf5xrArJPHNite3Le/j3WnUPZ5GSFYUkMBNBu
 xqpnVjhZYlApgvpP8Z5S7doKV73QNllAJ31ByesImKZYv9Uy5xBqWfPqVaSWnuxa5pVe
 6acQ==
X-Gm-Message-State: ACrzQf1HZv1GywNPNvW2KDDfr+SfKN7dfbZfyyMkjaZWAM1gQueRAlLa
 jQypA5lA9hxUluMhxJ6KmIrLk7QmYhjQRWNfVjU=
X-Google-Smtp-Source: AMsMyM7I70+fTuR2RtMbTkzVtE9J9OrDq/NwKXcV2yvIi1ty4lg6eoAHLTkNZYf+Wxs7v+9A9KvZYWG6K1t+HEA9ItU=
X-Received: by 2002:a05:6512:419:b0:4a2:2e45:bf0 with SMTP id
 u25-20020a056512041900b004a22e450bf0mr27515lfk.356.1665064265616; Thu, 06 Oct
 2022 06:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221006130513.2683873-1-marcandre.lureau@redhat.com>
 <Yz7bVdjGtnfmZ/Uj@redhat.com>
In-Reply-To: <Yz7bVdjGtnfmZ/Uj@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 6 Oct 2022 17:50:54 +0400
Message-ID: <CAJ+F1CLRpgY4X5LQitKgH7=MgHR0H544p4KjoLs=Hb4drfv5Bg@mail.gmail.com>
Subject: Re: [PATCH] qtest: start a VNC test
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000014943d05ea5dfc6c"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000014943d05ea5dfc6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 6, 2022 at 5:43 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Thu, Oct 06, 2022 at 05:05:13PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This is some of the simplest test we could perform, it simply connects
> > to the VNC server via passed-in socket FDs and checks the connection ca=
n
> > be established.
> >
> > Another series will make this test work on Windows as well.
> >
> > As always, more tests can be added later! :)
>
> This test program uses GTK-VNC's  VncConnection class, which makes sense
> for testing the expected behaviour, not least because GTK-VNC is what
> alot of QEMU clients will use. IOW, its good to ensure we don't regress
> with GTK-VNC.
>
> Looking at testing from a robustness POV though, it is desirable to be
> able to try various bad things in an attempt to trip up QEMU's VNC server
> and potentially exploit it. This will be pretty much impossible todo usin=
g
> VncConnection, and would require being able to speak the raw VNC protocol
> on the sockets, and take unsual actions like sending requests but not
> processing the results.
>
> Any thoughts on the "bad" testing ?
>

Well, that requires some exploration I guess, using fuzzing. That's another
story imho :)
thanks


>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/qtest/vnc-display-test.c | 103 +++++++++++++++++++++++++++++++++
> >  tests/qtest/meson.build        |   8 ++-
> >  2 files changed, 110 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/qtest/vnc-display-test.c
> >
> > diff --git a/tests/qtest/vnc-display-test.c
> b/tests/qtest/vnc-display-test.c
> > new file mode 100644
> > index 0000000000..e2a9d682bb
> > --- /dev/null
> > +++ b/tests/qtest/vnc-display-test.c
> > @@ -0,0 +1,103 @@
> > +/*
> > + * VNC display tests
> > + *
> > + * Copyright (c) 2022 Red Hat, Inc.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/sockets.h"
> > +#include "libqtest.h"
> > +#include <gio/gio.h>
> > +#include <gvnc.h>
> > +
> > +typedef struct Test {
> > +    QTestState *qts;
> > +    VncConnection *conn;
> > +    GMainLoop *loop;
> > +} Test;
> > +
> > +static void on_vnc_error(VncConnection* self,
> > +                         const char* msg)
> > +{
> > +    g_error("vnc-error: %s", msg);
> > +}
> > +
> > +static void on_vnc_auth_failure(VncConnection *self,
> > +                                const char *msg)
> > +{
> > +    g_error("vnc-auth-failure: %s", msg);
> > +}
> > +
> > +static bool
> > +test_setup(Test *test)
> > +{
> > +#ifdef WIN32
> > +    g_test_skip("Not supported on Windows yet");
> > +    return false;
> > +#else
> > +    int pair[2];
> > +
> > +    test->qts =3D qtest_init("-vnc none -name vnc-test");
> > +
> > +    g_assert_cmpint(qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, pair), =
=3D=3D,
> 0);
> > +
> > +    qtest_qmp_add_client(test->qts, "vnc", pair[1]);
> > +
> > +    test->conn =3D vnc_connection_new();
> > +    g_signal_connect(test->conn, "vnc-error",
> > +                     G_CALLBACK(on_vnc_error), NULL);
> > +    g_signal_connect(test->conn, "vnc-auth-failure",
> > +                     G_CALLBACK(on_vnc_auth_failure), NULL);
> > +    vnc_connection_set_auth_type(test->conn, VNC_CONNECTION_AUTH_NONE)=
;
> > +    vnc_connection_open_fd(test->conn, pair[0]);
> > +
> > +    test->loop =3D g_main_loop_new(NULL, FALSE);
> > +    return true;
> > +#endif
> > +}
> > +
> > +static void
> > +test_vnc_basic_on_vnc_initialized(VncConnection *self,
> > +                                 Test *test)
> > +{
> > +    const char *name =3D vnc_connection_get_name(test->conn);
> > +
> > +    g_assert_cmpstr(name, =3D=3D, "QEMU (vnc-test)");
> > +    g_main_loop_quit(test->loop);
> > +}
> > +
> > +static void
> > +test_vnc_basic(void)
> > +{
> > +    Test test;
> > +
> > +    if (!test_setup(&test)) {
> > +        return;
> > +    }
> > +
> > +    g_signal_connect(test.conn, "vnc-initialized",
> > +                     G_CALLBACK(test_vnc_basic_on_vnc_initialized),
> &test);
> > +
> > +    g_main_loop_run(test.loop);
> > +
> > +    qtest_quit(test.qts);
> > +    g_object_unref(test.conn);
> > +    g_main_loop_unref(test.loop);
> > +}
> > +
> > +int
> > +main(int argc, char **argv)
> > +{
> > +    if (getenv("GTK_VNC_DEBUG")) {
> > +        vnc_util_set_debug(true);
> > +    }
> > +
> > +    g_test_init(&argc, &argv, NULL);
> > +
> > +    qtest_add_func("/vnc-display/basic", test_vnc_basic);
> > +
> > +    return g_test_run();
> > +}
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index 455f1bbb7e..c07a5b1a5f 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -306,8 +306,14 @@ qtests =3D {
> >    'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
> >  }
> >
> > +gvnc =3D dependency('gvnc-1.0', required: false)
> > +if gvnc.found()
> > +  qtests +=3D {'vnc-display-test': [gvnc]}
> > +  qtests_generic +=3D [ 'vnc-display-test' ]
> > +endif
> > +
> >  if dbus_display
> > -qtests +=3D {'dbus-display-test': [dbus_display1, gio]}
> > +  qtests +=3D {'dbus-display-test': [dbus_display1, gio]}
> >  endif
> >
> >  qtest_executables =3D {}
> > --
> > 2.37.3
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000014943d05ea5dfc6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 5:43 PM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Thu, Oct 06, 2022 at 05:05:13PM +0400, <a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrot=
e:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; This is some of the simplest test we could perform, it simply connects=
<br>
&gt; to the VNC server via passed-in socket FDs and checks the connection c=
an<br>
&gt; be established.<br>
&gt; <br>
&gt; Another series will make this test work on Windows as well.<br>
&gt; <br>
&gt; As always, more tests can be added later! :)<br>
<br>
This test program uses GTK-VNC&#39;s=C2=A0 VncConnection class, which makes=
 sense<br>
for testing the expected behaviour, not least because GTK-VNC is what<br>
alot of QEMU clients will use. IOW, its good to ensure we don&#39;t regress=
<br>
with GTK-VNC.<br>
<br>
Looking at testing from a robustness POV though, it is desirable to be<br>
able to try various bad things in an attempt to trip up QEMU&#39;s VNC serv=
er<br>
and potentially exploit it. This will be pretty much impossible todo using<=
br>
VncConnection, and would require being able to speak the raw VNC protocol<b=
r>
on the sockets, and take unsual actions like sending requests but not<br>
processing the results.<br>
<br>
Any thoughts on the &quot;bad&quot; testing ?<br></blockquote><div><br></di=
v><div>Well, that requires some exploration I guess, using fuzzing. That&#3=
9;s another story imho :)</div><div>thanks<br></div><div>=C2=A0<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 tests/qtest/vnc-display-test.c | 103 +++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A08 ++-<br>
&gt;=C2=A0 2 files changed, 110 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 tests/qtest/vnc-display-test.c<br>
&gt; <br>
&gt; diff --git a/tests/qtest/vnc-display-test.c b/tests/qtest/vnc-display-=
test.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e2a9d682bb<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/qtest/vnc-display-test.c<br>
&gt; @@ -0,0 +1,103 @@<br>
&gt; +/*<br>
&gt; + * VNC display tests<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 Red Hat, Inc.<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/sockets.h&quot;<br>
&gt; +#include &quot;libqtest.h&quot;<br>
&gt; +#include &lt;gio/gio.h&gt;<br>
&gt; +#include &lt;gvnc.h&gt;<br>
&gt; +<br>
&gt; +typedef struct Test {<br>
&gt; +=C2=A0 =C2=A0 QTestState *qts;<br>
&gt; +=C2=A0 =C2=A0 VncConnection *conn;<br>
&gt; +=C2=A0 =C2=A0 GMainLoop *loop;<br>
&gt; +} Test;<br>
&gt; +<br>
&gt; +static void on_vnc_error(VncConnection* self,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0const char* msg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 g_error(&quot;vnc-error: %s&quot;, msg);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void on_vnc_auth_failure(VncConnection *self,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *msg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 g_error(&quot;vnc-auth-failure: %s&quot;, msg);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool<br>
&gt; +test_setup(Test *test)<br>
&gt; +{<br>
&gt; +#ifdef WIN32<br>
&gt; +=C2=A0 =C2=A0 g_test_skip(&quot;Not supported on Windows yet&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 return false;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 int pair[2];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 test-&gt;qts =3D qtest_init(&quot;-vnc none -name vnc-t=
est&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpint(qemu_socketpair(AF_UNIX, SOCK_STREAM, 0=
, pair), =3D=3D, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_qmp_add_client(test-&gt;qts, &quot;vnc&quot;, pai=
r[1]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 test-&gt;conn =3D vnc_connection_new();<br>
&gt; +=C2=A0 =C2=A0 g_signal_connect(test-&gt;conn, &quot;vnc-error&quot;,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0G_CALLBACK(on_vnc_error), NULL);<br>
&gt; +=C2=A0 =C2=A0 g_signal_connect(test-&gt;conn, &quot;vnc-auth-failure&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0G_CALLBACK(on_vnc_auth_failure), NULL);<br>
&gt; +=C2=A0 =C2=A0 vnc_connection_set_auth_type(test-&gt;conn, VNC_CONNECT=
ION_AUTH_NONE);<br>
&gt; +=C2=A0 =C2=A0 vnc_connection_open_fd(test-&gt;conn, pair[0]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 test-&gt;loop =3D g_main_loop_new(NULL, FALSE);<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +#endif<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +test_vnc_basic_on_vnc_initialized(VncConnection *self,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Test *test)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const char *name =3D vnc_connection_get_name(test-&gt;c=
onn);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpstr(name, =3D=3D, &quot;QEMU (vnc-test)&quo=
t;);<br>
&gt; +=C2=A0 =C2=A0 g_main_loop_quit(test-&gt;loop);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +test_vnc_basic(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 Test test;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!test_setup(&amp;test)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_signal_connect(test.conn, &quot;vnc-initialized&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0G_CALLBACK(test_vnc_basic_on_vnc_initialized), &amp;test);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_main_loop_run(test.loop);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(test.qts);<br>
&gt; +=C2=A0 =C2=A0 g_object_unref(test.conn);<br>
&gt; +=C2=A0 =C2=A0 g_main_loop_unref(test.loop);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int<br>
&gt; +main(int argc, char **argv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (getenv(&quot;GTK_VNC_DEBUG&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_util_set_debug(true);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_test_init(&amp;argc, &amp;argv, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;/vnc-display/basic&quot;, test_vnc=
_basic);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return g_test_run();<br>
&gt; +}<br>
&gt; diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
&gt; index 455f1bbb7e..c07a5b1a5f 100644<br>
&gt; --- a/tests/qtest/meson.build<br>
&gt; +++ b/tests/qtest/meson.build<br>
&gt; @@ -306,8 +306,14 @@ qtests =3D {<br>
&gt;=C2=A0 =C2=A0 &#39;vmgenid-test&#39;: files(&#39;boot-sector.c&#39;, &#=
39;acpi-utils.c&#39;),<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +gvnc =3D dependency(&#39;gvnc-1.0&#39;, required: false)<br>
&gt; +if gvnc.found()<br>
&gt; +=C2=A0 qtests +=3D {&#39;vnc-display-test&#39;: [gvnc]}<br>
&gt; +=C2=A0 qtests_generic +=3D [ &#39;vnc-display-test&#39; ]<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 if dbus_display<br>
&gt; -qtests +=3D {&#39;dbus-display-test&#39;: [dbus_display1, gio]}<br>
&gt; +=C2=A0 qtests +=3D {&#39;dbus-display-test&#39;: [dbus_display1, gio]=
}<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 qtest_executables =3D {}<br>
&gt; -- <br>
&gt; 2.37.3<br>
&gt; <br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000014943d05ea5dfc6c--

