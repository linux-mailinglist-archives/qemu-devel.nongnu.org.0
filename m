Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1086D571E2E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:06:46 +0200 (CEST)
Received: from localhost ([::1]:42590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHTI-00069q-Nk
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHNE-0000xN-90
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:00:28 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:38417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHNC-0003s4-HH
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:00:28 -0400
Received: by mail-vs1-xe34.google.com with SMTP id k2so8063733vsc.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 08:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ig0DW22a6HJraWUZcXC1C2HS+YYiaLjEPXbYvFDDjV4=;
 b=fbXRSu3QnfmQR5jJVNI3EGWpPV7cQnL2WuW6f14C7lLD4ffcA26otp4bBDkNopeT3B
 MAe5fqirql08WcrjO2kK2GcS0yV6LJj+HY+sYbteQHiBBxoq0kRrLG984uCMrNjwCrto
 waUAiHMSgcbwYRSAt+m9gWJYQRvgiQfzbgedPNh+WaGUyNWxPnxjaTh4mXkpxaJd13kf
 2yuiQ6A5Der6j+ufZLRL7XbsFdOAq/tgsArB2zeOrsIifeXSDno9CYHqAgu6H4oH7+s1
 C/pKLT+0mjUsa2aU4dm0h8HVHdjL82lD4ZjRPuYUW35fDV0/ZQR6fIo3/I7/cyUcLBwI
 +lDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ig0DW22a6HJraWUZcXC1C2HS+YYiaLjEPXbYvFDDjV4=;
 b=Mt93IquiG7lXEQbXuec8BDM5ugZ0hDwXtWxU/DRUjq1JeHPFRYUBw10bG1otgAu0IZ
 /OjihHmxxfxtSAZztmxU1Iw1+2aUgC2u3ReUvSQI94t++APOANQmZwHqxHYzwOtsFbnp
 WYnf6vWy7fnzq5d4Yl5UAnFSlO6hdWQyX6x0dw7ndGCG4e/oSPHFKXAPpvhyeEReFGIb
 Y6xOU4522IH4z2qS/V3k7RfMArosyrNXV8uZEVxFL3EndRN86CG510LNicOhg0k4WKRz
 VwbIK0BGsziG/pvbGINWADpMradydxQYMsTCHGxxId8weYoMLGiwC66YsqJfF4NKL8QD
 AwxQ==
X-Gm-Message-State: AJIora/SJC9WR0NNB8Wgccb2ae5PC43Wtyggqo5aAoN9hsuR1Dz8PgWV
 4Y8rmAtJSXsIuktEeQ+AIH3/VMsuINSudPqbU8DFEQ==
X-Google-Smtp-Source: AGRyM1sIx9kCe1PPc/qw0PlzYIaioQu4+UB3kQj5hWrH+pr6IA7AkjYEDizzXz4+M4UZnggTdHvnv+LyGE9nNe4iD44=
X-Received: by 2002:a05:6102:346:b0:357:79f5:63ae with SMTP id
 e6-20020a056102034600b0035779f563aemr1495207vsa.40.1657638025352; Tue, 12 Jul
 2022 08:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-13-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-13-marcandre.lureau@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 12 Jul 2022 09:00:14 -0600
Message-ID: <CANCZdfonK_uw_nsbaOhhMqXLdV=uQy3_-j9Ook3uecijvcnVEw@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] qemu-common: move glib-compat.h
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000aaeb6305e39cedcd"
Received-SPF: none client-ip=2607:f8b0:4864:20::e34;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000aaeb6305e39cedcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 3:37 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> qemu-common will have compatible dependency requirements with QEMU.
>
> Since qemu-common won't have a toplevel qemu/osdep.h which would include
> various system headers, include stdbool.h (bool is used for some
> declarations here).
>
> Replace getenv() with g_getenv() to avoid extra header inclusion.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  {include =3D> subprojects/qemu-common/include}/glib-compat.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename {include =3D> subprojects/qemu-common/include}/glib-compat.h (97%=
)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


>
> diff --git a/include/glib-compat.h
> b/subprojects/qemu-common/include/glib-compat.h
> similarity index 97%
> rename from include/glib-compat.h
> rename to subprojects/qemu-common/include/glib-compat.h
> index 43a562974d80..2b0f2962f322 100644
> --- a/include/glib-compat.h
> +++ b/subprojects/qemu-common/include/glib-compat.h
> @@ -30,6 +30,8 @@
>  #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
>
>  #include <glib.h>
> +#include <stdbool.h>
> +
>  #if defined(G_OS_UNIX)
>  #include <glib-unix.h>
>  #include <sys/types.h>
> @@ -133,7 +135,7 @@ qemu_g_test_slow(void)
>  {
>      static int cached =3D -1;
>      if (cached =3D=3D -1) {
> -        cached =3D g_test_slow() || getenv("G_TEST_SLOW") !=3D NULL;
> +        cached =3D g_test_slow() || g_getenv("G_TEST_SLOW") !=3D NULL;
>      }
>      return cached;
>  }
> --
> 2.37.0.rc0
>
>

--000000000000aaeb6305e39cedcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 3:37 AM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
qemu-common will have compatible dependency requirements with QEMU.<br>
<br>
Since qemu-common won&#39;t have a toplevel qemu/osdep.h which would includ=
e<br>
various system headers, include stdbool.h (bool is used for some<br>
declarations here).<br>
<br>
Replace getenv() with g_getenv() to avoid extra header inclusion.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0{include =3D&gt; subprojects/qemu-common/include}/glib-compat.h | 4 +=
++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
=C2=A0rename {include =3D&gt; subprojects/qemu-common/include}/glib-compat.=
h (97%)<br></blockquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a=
 href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/include/glib-compat.h b/subprojects/qemu-common/include/glib-c=
ompat.h<br>
similarity index 97%<br>
rename from include/glib-compat.h<br>
rename to subprojects/qemu-common/include/glib-compat.h<br>
index 43a562974d80..2b0f2962f322 100644<br>
--- a/include/glib-compat.h<br>
+++ b/subprojects/qemu-common/include/glib-compat.h<br>
@@ -30,6 +30,8 @@<br>
=C2=A0#pragma GCC diagnostic ignored &quot;-Wdeprecated-declarations&quot;<=
br>
<br>
=C2=A0#include &lt;glib.h&gt;<br>
+#include &lt;stdbool.h&gt;<br>
+<br>
=C2=A0#if defined(G_OS_UNIX)<br>
=C2=A0#include &lt;glib-unix.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
@@ -133,7 +135,7 @@ qemu_g_test_slow(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0static int cached =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0if (cached =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cached =3D g_test_slow() || getenv(&quot;G_TES=
T_SLOW&quot;) !=3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cached =3D g_test_slow() || g_getenv(&quot;G_T=
EST_SLOW&quot;) !=3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return cached;<br>
=C2=A0}<br>
-- <br>
2.37.0.rc0<br>
<br>
</blockquote></div></div>

--000000000000aaeb6305e39cedcd--

