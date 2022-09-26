Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E85EA79D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:50:04 +0200 (CEST)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoUl-0000Wh-EE
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco41-0001y1-UP
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:22:26 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:34496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco40-00037y-3t
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:22:25 -0400
Received: by mail-lj1-x22b.google.com with SMTP id h3so7455435lja.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tcPBTBI2LnYgB0uqzHFyPR3l2hAtjiYdOD1yqf7u6Qw=;
 b=RpObMNHPmYiEPbeTuDgqudHUBOL/IgHJBUW245wAxUwMfKSPCImQSNincLOXG//sQB
 VwEY8SLQxssywRJVPJav+nKz2paV3OnIVNyCtpiesyK+QKMrIclgTKmje6t1ZtzmIUcU
 cu0taqxQ9kTvHYZtIBemJO8vBuxINdY/vc3s5bryjQj+cMhIFY82ZGNTVt5jVHtpoFv8
 O5XewpbmgzXLUDhG1Vq6W37OCL9JItnIT4MuW9ar/hoh+8FqhWJN5kybJ2T3h9H0kQfo
 nBgh4mMMTugnNgLGp+BQDm35MhVPuN+mDUiQLb3BTiws9MdJ9bpO4U6OeKISdkepEOg+
 qjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tcPBTBI2LnYgB0uqzHFyPR3l2hAtjiYdOD1yqf7u6Qw=;
 b=oaCo9nyVzl+RvA3GaVxajto2msb0A1EjZf9esVRPn7L2jab3N+BV4FWoAfXLs+n3rs
 TQ/a9QHw/bACipC4XPuT0LfJD0E6AdzHV8NsaV5X46TpOKR2yIoW8dbcDMWbmIHaVOVY
 q8OC1SrDtLJdbcj7X1xQX+Vh5TtiQTqKuVAks5oc+aUOcj3PNjwi6FYz7AeCltoxgP5X
 BJt1UW7o6yA5upvgpVuPx5s6468DxvS6BxX4d/CiQMWbBzSefADigr5uR5T57t5XF9VZ
 2MgFQQBxVrLepGLdYX4Idnej+2J+60kvrfiCPdIYdaDusgUqKZ8nNVSX+kCajazWpJ/6
 QuyQ==
X-Gm-Message-State: ACrzQf2MB7KHPmCbCjyeRHk2jhLg0IVJcE5qqiy8pfy9MdkeqeLeZ8pd
 5g3NXxsUA1okWhZSRU3BrFamrU3YCbYluQpwKmM=
X-Google-Smtp-Source: AMsMyM7bmLkzJrU1aYDbruNRm0wpHI3in6VT2RZG0Tk/PI0BoDNpHhQEIfpapkKLEjp496hLE2V6pI+XCOuMPGI90Xw=
X-Received: by 2002:a2e:a607:0:b0:26c:42c8:13af with SMTP id
 v7-20020a2ea607000000b0026c42c813afmr7370785ljp.267.1664198542217; Mon, 26
 Sep 2022 06:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-22-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-22-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:22:10 +0400
Message-ID: <CAJ+F1C+EF_kr3tyxL_noSdnDfbA3n+fyZj1mtEYaCRqsSvdHzQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/54] tests/qtest: libqtest: Avoid using hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f1d7e705e9946a97"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
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

--000000000000f1d7e705e9946a97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 3:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> The qtest library was written to use hardcoded /tmp directory for
> temporary files. Update to use g_get_tmp_dir() and g_dir_make_tmp()
> for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
>
>  tests/qtest/libqtest.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 7c9fc07de4..d8ffa0e7b1 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -265,8 +265,10 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>
>      s =3D g_new(QTestState, 1);
>
> -    socket_path =3D g_strdup_printf("/tmp/qtest-%d.sock", getpid());
> -    qmp_socket_path =3D g_strdup_printf("/tmp/qtest-%d.qmp", getpid());
> +    socket_path =3D g_strdup_printf("%s/qtest-%d.sock",
> +                                  g_get_tmp_dir(), getpid());
> +    qmp_socket_path =3D g_strdup_printf("%s/qtest-%d.qmp",
> +                                      g_get_tmp_dir(), getpid());
>
>      /* It's possible that if an earlier test run crashed it might
>       * have left a stale unix socket lying around. Delete any
> @@ -390,10 +392,12 @@ QTestState *qtest_initf(const char *fmt, ...)
>  QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
>  {
>      int sock_fd_init;
> -    char *sock_path, sock_dir[] =3D "/tmp/qtest-serial-XXXXXX";
> +    g_autofree char *sock_dir =3D NULL;
> +    char *sock_path;
>      QTestState *qts;
>
> -    g_assert_true(g_mkdtemp(sock_dir) !=3D NULL);
> +    sock_dir =3D g_dir_make_tmp("qtest-serial-XXXXXX", NULL);
> +    g_assert_true(sock_dir !=3D NULL);
>      sock_path =3D g_strdup_printf("%s/sock", sock_dir);
>
>      sock_fd_init =3D init_socket(sock_path);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f1d7e705e9946a97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:54 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
The qtest library was written to use hardcoded /tmp directory for<br>
temporary files. Update to use g_get_tmp_dir() and g_dir_make_tmp()<br>
for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
<br>
=C2=A0tests/qtest/libqtest.c | 12 ++++++++----<br>
=C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index 7c9fc07de4..d8ffa0e7b1 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -265,8 +265,10 @@ QTestState *qtest_init_without_qmp_handshake(const cha=
r *extra_args)<br>
<br>
=C2=A0 =C2=A0 =C2=A0s =3D g_new(QTestState, 1);<br>
<br>
-=C2=A0 =C2=A0 socket_path =3D g_strdup_printf(&quot;/tmp/qtest-%d.sock&quo=
t;, getpid());<br>
-=C2=A0 =C2=A0 qmp_socket_path =3D g_strdup_printf(&quot;/tmp/qtest-%d.qmp&=
quot;, getpid());<br>
+=C2=A0 =C2=A0 socket_path =3D g_strdup_printf(&quot;%s/qtest-%d.sock&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_get_tmp_dir(), getpid());<b=
r>
+=C2=A0 =C2=A0 qmp_socket_path =3D g_strdup_printf(&quot;%s/qtest-%d.qmp&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_get_tmp_dir()=
, getpid());<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* It&#39;s possible that if an earlier test run crashe=
d it might<br>
=C2=A0 =C2=A0 =C2=A0 * have left a stale unix socket lying around. Delete a=
ny<br>
@@ -390,10 +392,12 @@ QTestState *qtest_initf(const char *fmt, ...)<br>
=C2=A0QTestState *qtest_init_with_serial(const char *extra_args, int *sock_=
fd)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int sock_fd_init;<br>
-=C2=A0 =C2=A0 char *sock_path, sock_dir[] =3D &quot;/tmp/qtest-serial-XXXX=
XX&quot;;<br>
+=C2=A0 =C2=A0 g_autofree char *sock_dir =3D NULL;<br>
+=C2=A0 =C2=A0 char *sock_path;<br>
=C2=A0 =C2=A0 =C2=A0QTestState *qts;<br>
<br>
-=C2=A0 =C2=A0 g_assert_true(g_mkdtemp(sock_dir) !=3D NULL);<br>
+=C2=A0 =C2=A0 sock_dir =3D g_dir_make_tmp(&quot;qtest-serial-XXXXXX&quot;,=
 NULL);<br>
+=C2=A0 =C2=A0 g_assert_true(sock_dir !=3D NULL);<br>
=C2=A0 =C2=A0 =C2=A0sock_path =3D g_strdup_printf(&quot;%s/sock&quot;, sock=
_dir);<br>
<br>
=C2=A0 =C2=A0 =C2=A0sock_fd_init =3D init_socket(sock_path);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f1d7e705e9946a97--

