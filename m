Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A285EF56D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:26:58 +0200 (CEST)
Received: from localhost ([::1]:33844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odscy-00066X-RS
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odrjK-0006ZA-M7
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:29:26 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odrjH-0007KO-Ej
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:29:26 -0400
Received: by mail-lj1-x230.google.com with SMTP id l12so1193928ljg.9
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZHVUunzX/lrWtELAam4Ip3dNbNdeuYFONn2Jl0ZffCQ=;
 b=eOygcIcjORDl8DtiEWoDiTQoN31bJ5Dml9rUfzlivGIE10qn0MzWE4ezMGZiBXt+Hx
 6Wr0+BfcNgrOn9j1gz68e0divWKuLiq4izCAVP7SdfGQClX2TgzPmKrlemL6sHCl0ypW
 +MUKYrGw8DL0te5hwWyZyPRtjA7zLNAClqOaZoYLdEPh+iNNrnfbjqgtvWu6OuOZFe1z
 vGjPZ9oER/5nb6ra92+HYEscNXHIdT8h4NdR6rNdgcx6y/31lRxN+iNxn+XLJq01dMO0
 WUejkcUdn6HJBo4NWoi6O00Cat1q8UfTZpEU5+7QJoirsSvjXp4ks6E6uBC+TIXr3srC
 DeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZHVUunzX/lrWtELAam4Ip3dNbNdeuYFONn2Jl0ZffCQ=;
 b=0Wne6Iq8cn8BgyS17DHWaniiAdqBU96kCG5Y086JckrrwCqrnMuuXNAXFEK3M76EG1
 gPWubnXoDVc+e9B25ZSTCHVhJEe9G6OVM7ynPF6lbIMhhd+VDyyNqOtwA3Vn4+i5x2ic
 tTU4QTjMvD1MPnUw+7TPTUhWwO1Dyjykk/bOe9T3OhkoP/LIfeP+dcJo46pxE4HU/TMm
 ZXbrtVWT9nijKuDHv+jQoISIKaWdx6T/CIUJMw7meI/TkMx920hwCQlMNG+FnoVEf7Aw
 TxO4juemTs6pSRp1M25eZXcMOGMHGnC9lWTr9yMHFYkTDV5mkrXh5FbWzAujBmIlafOk
 443g==
X-Gm-Message-State: ACrzQf3mijckM5D9xhqAyrXndLqZe7ss4RwRvulbBSoGcjlkbksutrWC
 jw61eCRlAuLJ8+XakP0GVJJFcJh+KG3LT0EHROQ=
X-Google-Smtp-Source: AMsMyM5rboKa3oDSLa3frkhIrurNBgx9lezW6Hia7C55mPgl/ZSIKH0YQZcvhLvkXPdmh4/V9Wd11rR54rCa49Hqk+8=
X-Received: by 2002:a2e:8917:0:b0:26a:a520:db52 with SMTP id
 d23-20020a2e8917000000b0026aa520db52mr954504lji.289.1664450962756; Thu, 29
 Sep 2022 04:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
 <20220929075239.1675374-2-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220929075239.1675374-2-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 29 Sep 2022 15:29:09 +0400
Message-ID: <CAJ+F1CK7ksUETpJteO1Uw_uS4VwiH5A9FRNKytvRmMFi0eyPOg@mail.gmail.com>
Subject: Re: [PATCH 1/7] qga: Add initial FreeBSD support
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="000000000000619b6105e9cf30a0"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
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

--000000000000619b6105e9cf30a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 11:56 AM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> - Fix device path.
> - Fix virtio-serial channel initialization.
> - Make the code buildable in FreeBSD.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  meson.build          |  2 +-
>  qga/channel-posix.c  | 14 ++++++++++++++
>  qga/commands-posix.c |  8 ++++++++
>  qga/main.c           |  6 +++++-
>  4 files changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 8dc661363f..5c11abc8aa 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -75,7 +75,7 @@ have_tools =3D get_option('tools') \
>    .allowed()
>  have_ga =3D get_option('guest_agent') \
>    .disable_auto_if(not have_system and not have_tools) \
> -  .require(targetos in ['sunos', 'linux', 'windows'],
> +  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
>             error_message: 'unsupported OS for QEMU guest agent') \
>    .allowed()
>  have_block =3D have_system or have_tools
> diff --git a/qga/channel-posix.c b/qga/channel-posix.c
> index 6796a02cff..0f14246563 100644
> --- a/qga/channel-posix.c
> +++ b/qga/channel-posix.c
> @@ -149,6 +149,20 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
>              return false;
>          }
>  #endif
> +#ifdef __FreeBSD__
> +        struct termios tio;
> +        if (tcgetattr(fd, &tio) < 0) {
> +            error_setg_errno(errp, errno, "error getting channel termios
> attrs");
> +            close(fd);
> +            return false;
> +        }
> +        tio.c_lflag &=3D ~ECHO;
> +        if (tcsetattr(fd, TCSAFLUSH, &tio) < 0) {
> +            error_setg_errno(errp, errno, "error setting channel termios
> attrs");
> +            close(fd);
> +            return false;
> +        }
> +#endif /* __FreeBSD__ */
>

It could help to document why this is needed. I assume this is correct, so:

Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>




>          ret =3D ga_channel_client_add(c, fd);
>          if (ret) {
>              error_setg(errp, "error adding channel to main loop");
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index eea819cff0..16d67e9f6d 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -51,6 +51,14 @@
>  #endif
>  #endif
>
> +#ifdef __FreeBSD__
> +/*
> + * The code under HAVE_GETIFADDRS condition can't be compiled in FreeBSD=
.
> + * Fix it in one of the following patches.
> + */
> +#undef HAVE_GETIFADDRS
> +#endif
> +
>  #ifdef HAVE_GETIFADDRS
>  #include <arpa/inet.h>
>  #include <sys/socket.h>
> diff --git a/qga/main.c b/qga/main.c
> index 5a9d8252e0..0d27c97d38 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -45,9 +45,13 @@
>  #endif
>
>  #ifndef _WIN32
> +#ifdef __FreeBSD__
> +#define QGA_VIRTIO_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
> +#else /* __FreeBSD__ */
>  #define QGA_VIRTIO_PATH_DEFAULT "/dev/virtio-ports/org.qemu.guest_agent.=
0"
> -#define QGA_STATE_RELATIVE_DIR  "run"
> +#endif /* __FreeBSD__ */
>  #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
> +#define QGA_STATE_RELATIVE_DIR  "run"
>  #else
>  #define QGA_VIRTIO_PATH_DEFAULT "\\\\.\\Global\\org.qemu.guest_agent.0"
>  #define QGA_STATE_RELATIVE_DIR  "qemu-ga"
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000619b6105e9cf30a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 11:56 AM Alex=
ander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com" target=
=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">- Fix device path.<br>
- Fix virtio-serial channel initialization.<br>
- Make the code buildable in FreeBSD.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0qga/channel-posix.c=C2=A0 | 14 ++++++++++++++<br>
=C2=A0qga/commands-posix.c |=C2=A0 8 ++++++++<br>
=C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++-<b=
r>
=C2=A04 files changed, 28 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 8dc661363f..5c11abc8aa 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -75,7 +75,7 @@ have_tools =3D get_option(&#39;tools&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
=C2=A0have_ga =3D get_option(&#39;guest_agent&#39;) \<br>
=C2=A0 =C2=A0.disable_auto_if(not have_system and not have_tools) \<br>
-=C2=A0 .require(targetos in [&#39;sunos&#39;, &#39;linux&#39;, &#39;window=
s&#39;],<br>
+=C2=A0 .require(targetos in [&#39;sunos&#39;, &#39;linux&#39;, &#39;window=
s&#39;, &#39;freebsd&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;unsupported O=
S for QEMU guest agent&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
=C2=A0have_block =3D have_system or have_tools<br>
diff --git a/qga/channel-posix.c b/qga/channel-posix.c<br>
index 6796a02cff..0f14246563 100644<br>
--- a/qga/channel-posix.c<br>
+++ b/qga/channel-posix.c<br>
@@ -149,6 +149,20 @@ static gboolean ga_channel_open(GAChannel *c, const gc=
har *path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
+#ifdef __FreeBSD__<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct termios tio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tcgetattr(fd, &amp;tio) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error getting channel termios attrs&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tio.c_lflag &amp;=3D ~ECHO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tcsetattr(fd, TCSAFLUSH, &amp;tio) &lt; 0)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error setting channel termios attrs&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+#endif /* __FreeBSD__ */<br></blockquote><div><br></div><div>It could help=
 to document why this is needed. I assume this is correct, so:</div><div><b=
r></div><div>Acked-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br><br><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ga_channel_client_add(c, fd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;erro=
r adding channel to main loop&quot;);<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index eea819cff0..16d67e9f6d 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -51,6 +51,14 @@<br>
=C2=A0#endif<br>
=C2=A0#endif<br>
<br>
+#ifdef __FreeBSD__<br>
+/*<br>
+ * The code under HAVE_GETIFADDRS condition can&#39;t be compiled in FreeB=
SD.<br>
+ * Fix it in one of the following patches.<br>
+ */<br>
+#undef HAVE_GETIFADDRS<br>
+#endif<br>
+<br>
=C2=A0#ifdef HAVE_GETIFADDRS<br>
=C2=A0#include &lt;arpa/inet.h&gt;<br>
=C2=A0#include &lt;sys/socket.h&gt;<br>
diff --git a/qga/main.c b/qga/main.c<br>
index 5a9d8252e0..0d27c97d38 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -45,9 +45,13 @@<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifndef _WIN32<br>
+#ifdef __FreeBSD__<br>
+#define QGA_VIRTIO_PATH_DEFAULT &quot;/dev/vtcon/org.qemu.guest_agent.0&qu=
ot;<br>
+#else /* __FreeBSD__ */<br>
=C2=A0#define QGA_VIRTIO_PATH_DEFAULT &quot;/dev/virtio-ports/org.qemu.gues=
t_agent.0&quot;<br>
-#define QGA_STATE_RELATIVE_DIR=C2=A0 &quot;run&quot;<br>
+#endif /* __FreeBSD__ */<br>
=C2=A0#define QGA_SERIAL_PATH_DEFAULT &quot;/dev/ttyS0&quot;<br>
+#define QGA_STATE_RELATIVE_DIR=C2=A0 &quot;run&quot;<br>
=C2=A0#else<br>
=C2=A0#define QGA_VIRTIO_PATH_DEFAULT &quot;\\\\.\\Global\\org.qemu.guest_a=
gent.0&quot;<br>
=C2=A0#define QGA_STATE_RELATIVE_DIR=C2=A0 &quot;qemu-ga&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000619b6105e9cf30a0--

