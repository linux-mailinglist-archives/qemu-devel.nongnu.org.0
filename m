Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EB85EA751
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:31:40 +0200 (CEST)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoCx-0002Ux-PI
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco2u-00015b-TW
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:21:25 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:34493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco2t-0002yW-1C
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:21:16 -0400
Received: by mail-lj1-x234.google.com with SMTP id h3so7451391lja.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=yH8tONTEzEqMLee65wKxXj+2LvP20WSn+BOw0a4dUyA=;
 b=dn/wzUgcDKXEGR4f0SmeLGdXgPd62jHPfiYZg7t5jQunJ3Og7uR+P/0p/J0MCh93rS
 lguAm2Pi0rGKCLN2bFwbMVjPWKg2WA/2B+H61OXZx4thAhU7Mi9NVTa/PeC+j0iA8XlP
 4s71W5rT4jRx0pgm3FvK8Y0Jjs14QzuGGxFm7uTGbu9ZqJ/RapA2rFpU1w1QRQCzL+1z
 Gk6VGlfXivIU2ITkfP3sC//p9G9L5ygZ6P0oNg0jAWfKmgOtJ9cYJCeUYu5OsiuqWM2C
 Lq6wYyxAhLdNPOy8HeZpl2xs8Ex3CoIqyU4WMGQDUIrXAGoZK55JlHFy3qTWuNo4ITXl
 bghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yH8tONTEzEqMLee65wKxXj+2LvP20WSn+BOw0a4dUyA=;
 b=KEQePe6QU/cnHBD9eG74pWA55yd32axcLTP58SKmFWNETsa7qIWI3/zBd5Izcod8VJ
 UIjyaqvmkInk1aT8kkxhvfXgz5sxarQzb9tysvaLVLUcyRO78asfsGBZuL4OTa3RHte7
 Bi4QCHSrW8xlcktxkEJYoqeX1EC1EroJBsZCc9sP6f4CtmTFJlJ2iZJzlqHlnkJ/gYLx
 UvT6IbXYzuPI33ytunt1G6BSsY2UNYS9+X/0MGtXWGKfnn83uYcL9b1OgujmJ8b/11k9
 LZwWCRycTv+Sbu0Dok4k96eZnqqkVxyGUQ2EJcCOBtZlxkhx727XgNJ7ARpZNsNwP9Va
 QLLg==
X-Gm-Message-State: ACrzQf3n6HfcNO49NnKFeNVq1+L3Aq4qFwC2H4awnIl+kvndoLl8YxOL
 wVhWQLwOsQnzgiTkkD+Y8mOLcZ1I6+YyYyOFzz0=
X-Google-Smtp-Source: AMsMyM4aGjyR0LR3BMkwc04VrGiRwJd9eVpnzWbgMWB5xVHXSOgcEOHzLklOeSFRPde0gkHhoavtfOG4ZcO66YRkKJA=
X-Received: by 2002:a2e:9b17:0:b0:26c:4ede:512c with SMTP id
 u23-20020a2e9b17000000b0026c4ede512cmr7569171lji.529.1664198473322; Mon, 26
 Sep 2022 06:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-19-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-19-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:21:01 +0400
Message-ID: <CAJ+F1CJNyNJ=+vqh0q4e2yy5spPCyLYKo2ESO_r7mVCk=HczPA@mail.gmail.com>
Subject: Re: [PATCH v3 18/54] tests/qtest: vhost-user-test: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d69a1505e9946698"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
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

--000000000000d69a1505e9946698
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 4:13 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_dir_make_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
>
>  tests/qtest/vhost-user-test.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.=
c
> index d7d6cfc9bd..448fda3e7f 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -482,8 +482,7 @@ static TestServer *test_server_new(const gchar *name,
>          struct vhost_user_ops *ops)
>  {
>      TestServer *server =3D g_new0(TestServer, 1);
> -    char template[] =3D "/tmp/vhost-test-XXXXXX";
> -    const char *tmpfs;
> +    g_autofree const char *tmpfs =3D NULL;
>
>      server->context =3D g_main_context_new();
>      server->loop =3D g_main_loop_new(server->context, FALSE);
> @@ -491,9 +490,10 @@ static TestServer *test_server_new(const gchar *name=
,
>      /* run the main loop thread so the chardev may operate */
>      server->thread =3D g_thread_new(NULL, thread_function, server->loop)=
;
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("vhost-test-XXXXXX", NULL);
>      if (!tmpfs) {
> -        g_test_message("g_mkdtemp on path (%s): %s", template,
> strerror(errno));
> +        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> +                       strerror(errno));
>

Same remark about error reporting as other patches in the series


>      }
>      g_assert(tmpfs);
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d69a1505e9946698
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 4:13 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_dir_make_tmp() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
<br>
=C2=A0tests/qtest/vhost-user-test.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c<=
br>
index d7d6cfc9bd..448fda3e7f 100644<br>
--- a/tests/qtest/vhost-user-test.c<br>
+++ b/tests/qtest/vhost-user-test.c<br>
@@ -482,8 +482,7 @@ static TestServer *test_server_new(const gchar *name,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vhost_user_ops *ops)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TestServer *server =3D g_new0(TestServer, 1);<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/vhost-test-XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 const char *tmpfs;<br>
+=C2=A0 =C2=A0 g_autofree const char *tmpfs =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0server-&gt;context =3D g_main_context_new();<br>
=C2=A0 =C2=A0 =C2=A0server-&gt;loop =3D g_main_loop_new(server-&gt;context,=
 FALSE);<br>
@@ -491,9 +490,10 @@ static TestServer *test_server_new(const gchar *name,<=
br>
=C2=A0 =C2=A0 =C2=A0/* run the main loop thread so the chardev may operate =
*/<br>
=C2=A0 =C2=A0 =C2=A0server-&gt;thread =3D g_thread_new(NULL, thread_functio=
n, server-&gt;loop);<br>
<br>
-=C2=A0 =C2=A0 tmpfs =3D g_mkdtemp(template);<br>
+=C2=A0 =C2=A0 tmpfs =3D g_dir_make_tmp(&quot;vhost-test-XXXXXX&quot;, NULL=
);<br>
=C2=A0 =C2=A0 =C2=A0if (!tmpfs) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_message(&quot;g_mkdtemp on path (%s): %=
s&quot;, template, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_message(&quot;g_dir_make_tmp on path (%=
s): %s&quot;, tmpfs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0strerror(errno));<br></blockquote><div><br></div><div>Same remark=
 about error reporting as other patches in the series</div><div>=C2=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_assert(tmpfs);<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d69a1505e9946698--

