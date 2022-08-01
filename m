Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E558658B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 09:15:00 +0200 (CEST)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIPdi-0004el-5R
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 03:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIPYa-0001Fs-7h
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:09:41 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:35419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIPYY-0005qO-2B
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:09:39 -0400
Received: by mail-lf1-x12f.google.com with SMTP id z25so15918629lfr.2
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L8ZVpFGF6iPIrHrFGUncg3NISTQVc8zZqfzSMmLSnZE=;
 b=GXgXbBQaXJFCApWzgAI1qhNRGrzQ+yWIvu6UgqM5TzrU4Xu9Mvgfprktth7euj4Gmc
 A4VcXQK3fhVzCwZRPhhq6L5VKtOa4GMXLtSy1YKnkxQ7HvtG+Zkoc1Jhhgu3xLZU1x+m
 A7q96QZgcgD5oiWKc/6e0KSUicXxa/lNiAZR4rW/DDxsyd+tFNXmQTKq6WxnbsjXVsyx
 nLRtCYV8prkKpyNBuKcCKJuB14x1GjjlwhuVTKnhrYTYhW/agGHH/DnazCYHL4nAPVkY
 uyds7sK3mBQ4tJ2ILygDkb2dtRrSopIDIizS1o18+gjX3jarOIU5ekvDXGNcOCe2e8rI
 jlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L8ZVpFGF6iPIrHrFGUncg3NISTQVc8zZqfzSMmLSnZE=;
 b=w/5lCI1vdgcxCelmZNp4+qpoNQXCFzc0nbvTiAGl/pC745uHTVwLbFhOEwck6+mFPP
 oFQqx8S1C8ZQN/mOt/WaT3OoqDK6efn7uShWmxBKX8T/86V3ui5jlEK0/1mDcO4euhvO
 z59jOC1XQPBR8k0ax81UsfHQS9IWBJ8duDWhsPgKKEwbq71EzJ7CQju5T7st6WbWW+w1
 8PYiWYz2mVcVoadFTItjOJWvLUqr7YG+wJ65qj7Laq3DKUEwQid6cxx59Ezia03lyutw
 Iye6gdFOq+WnXgbNz7vJ2zB6n+vjjGIX+foMUJNk7u9qN3e5piTN5no8hICO6vfFm/Kb
 Al0g==
X-Gm-Message-State: AJIora812a8lOiMG8LvrAN6fl+ybyD9YQSKBty1BjRZLrlyxeEoDYCXS
 JsD+C9OzzIdn483HhceQR8mpw5eAKWisU3iZ59A=
X-Google-Smtp-Source: AGRyM1vdXfbauwGvQ8qa7k1hVI4guRCW1X42vwq57R3eD2r/QyGMilYu5kvxAHMDXpKm6KG7HIJhZRKtdI6bJu9rVI8=
X-Received: by 2002:a19:6b16:0:b0:48a:b377:f161 with SMTP id
 d22-20020a196b16000000b0048ab377f161mr5849747lfa.218.1659337775722; Mon, 01
 Aug 2022 00:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220730145036.865854-1-bmeng.cn@gmail.com>
 <20220730145036.865854-3-bmeng.cn@gmail.com>
In-Reply-To: <20220730145036.865854-3-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 1 Aug 2022 11:09:24 +0400
Message-ID: <CAJ+F1CK7CPiWY8GLO+0VJNLkVj=RERf4gcFw_j6RZgjW7q6XQQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] util/qemu-sockets: Enable unix socket support on
 Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="000000000000af36dd05e528aeef"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000af36dd05e528aeef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Jul 30, 2022 at 6:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Support for the unix socket has existed both in BSD and Linux for the
> longest time, but not on Windows. Since Windows 10 build 17063 [1],
> the native support for the unix socket has come to Windows. Starting
> this build, two Win32 processes can use the AF_UNIX address family
> over Winsock API to communicate with each other.
>
> [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v3:
> - drop the run-time check afunix_available()
>
> Changes in v2:
> - move #include <afunix.h> to os-win32.h
> - define WIN_BUILD_AF_UNIX only when CONFIG_WIN32
>
>  meson.build               |  6 ++++++
>  include/sysemu/os-win32.h |  4 ++++
>  util/qemu-sockets.c       | 14 +++++++-------
>  3 files changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 294e9a8f32..3663b925d4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2327,6 +2327,12 @@ have_afalg =3D get_option('crypto_afalg') \
>    '''), error_message: 'AF_ALG requested but could not be
> detected').allowed()
>  config_host_data.set('CONFIG_AF_ALG', have_afalg)
>
> +if targetos !=3D 'windows'
> +  config_host_data.set('CONFIG_AF_UNIX', true)
>

Imho, we should simply define CONFIG_AFUNIX_H, regardless of the OS.


> +else
> +  config_host_data.set('CONFIG_AF_UNIX', cc.has_header('afunix.h'))
> +endif
>
+
>  config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
>    'linux/vm_sockets.h', 'AF_VSOCK',
>    prefix: '#include <sys/socket.h>',
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index edc3b38a57..cebf260694 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -30,6 +30,10 @@
>  #include <windows.h>
>  #include <ws2tcpip.h>
>
> +#ifdef CONFIG_AF_UNIX
> +# include <afunix.h>
> +#endif
>

we could also provide a fallback, the same I did for glib:
https://gitlab.gnome.org/GNOME/glib/-/commit/4339192b5391a37ecd55816c713537=
fb1990cd07

So all Windows build will have afunix code compiled.

+
>  #ifdef __cplusplus
>  extern "C" {
>  #endif
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 0e2298278f..f9892506de 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -880,7 +880,7 @@ static int vsock_parse(VsockSocketAddress *addr, cons=
t
> char *str,
>  }
>  #endif /* CONFIG_AF_VSOCK */
>
> -#ifndef _WIN32
> +#ifdef CONFIG_AF_UNIX
>
>  static bool saddr_is_abstract(UnixSocketAddress *saddr)
>  {
> @@ -1060,14 +1060,14 @@ static int unix_listen_saddr(UnixSocketAddress
> *saddr,
>                               int num,
>                               Error **errp)
>  {
> -    error_setg(errp, "unix sockets are not available on windows");
> +    error_setg(errp, "unix sockets are not available on your host");
>      errno =3D ENOTSUP;
>      return -1;
>  }
>
>  static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
>  {
> -    error_setg(errp, "unix sockets are not available on windows");
> +    error_setg(errp, "unix sockets are not available on your host");
>      errno =3D ENOTSUP;
>      return -1;
>  }
> @@ -1335,7 +1335,7 @@ socket_sockaddr_to_address_inet(struct
> sockaddr_storage *sa,
>  }
>
>
> -#ifndef WIN32
> +#ifdef CONFIG_AF_UNIX
>  static SocketAddress *
>  socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>                                  socklen_t salen,
> @@ -1362,7 +1362,7 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
>      addr->u.q_unix.path =3D g_strndup(su->sun_path, salen);
>      return addr;
>  }
> -#endif /* WIN32 */
> +#endif /* CONFIG_AF_UNIX */
>
>  #ifdef CONFIG_AF_VSOCK
>  static SocketAddress *
> @@ -1394,10 +1394,10 @@ socket_sockaddr_to_address(struct sockaddr_storag=
e
> *sa,
>      case AF_INET6:
>          return socket_sockaddr_to_address_inet(sa, salen, errp);
>
> -#ifndef WIN32
> +#ifdef CONFIG_AF_UNIX
>      case AF_UNIX:
>          return socket_sockaddr_to_address_unix(sa, salen, errp);
> -#endif /* WIN32 */
> +#endif
>
>  #ifdef CONFIG_AF_VSOCK
>      case AF_VSOCK:
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000af36dd05e528aeef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 30, 2022 at 6:52 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Support for the unix socket has existed both in BSD and Linux for the<br>
longest time, but not on Windows. Since Windows 10 build 17063 [1],<br>
the native support for the unix socket has come to Windows. Starting<br>
this build, two Win32 processes can use the AF_UNIX address family<br>
over Winsock API to communicate with each other.<br>
<br>
[1] <a href=3D"https://devblogs.microsoft.com/commandline/af_unix-comes-to-=
windows/" rel=3D"noreferrer" target=3D"_blank">https://devblogs.microsoft.c=
om/commandline/af_unix-comes-to-windows/</a><br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v3:<br>
- drop the run-time check afunix_available()<br>
<br>
Changes in v2:<br>
- move #include &lt;afunix.h&gt; to os-win32.h<br>
- define WIN_BUILD_AF_UNIX only when CONFIG_WIN32<br>
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 6 ++++++<br>
=C2=A0include/sysemu/os-win32.h |=C2=A0 4 ++++<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++++-------<br>
=C2=A03 files changed, 17 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 294e9a8f32..3663b925d4 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2327,6 +2327,12 @@ have_afalg =3D get_option(&#39;crypto_afalg&#39;) \<=
br>
=C2=A0 =C2=A0&#39;&#39;&#39;), error_message: &#39;AF_ALG requested but cou=
ld not be detected&#39;).allowed()<br>
=C2=A0config_host_data.set(&#39;CONFIG_AF_ALG&#39;, have_afalg)<br>
<br>
+if targetos !=3D &#39;windows&#39;<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_AF_UNIX&#39;, true)<br></blockquot=
e><div><br></div><div>Imho, we should simply define CONFIG_AFUNIX_H, regard=
less of the OS.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
+else<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_AF_UNIX&#39;, cc.has_header(&#39;a=
funix.h&#39;))<br>
+endif<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0config_host_data.set(&#39;CONFIG_AF_VSOCK&#39;, cc.has_header_symbol(=
<br>
=C2=A0 =C2=A0&#39;linux/vm_sockets.h&#39;, &#39;AF_VSOCK&#39;,<br>
=C2=A0 =C2=A0prefix: &#39;#include &lt;sys/socket.h&gt;&#39;,<br>
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h<br>
index edc3b38a57..cebf260694 100644<br>
--- a/include/sysemu/os-win32.h<br>
+++ b/include/sysemu/os-win32.h<br>
@@ -30,6 +30,10 @@<br>
=C2=A0#include &lt;windows.h&gt;<br>
=C2=A0#include &lt;ws2tcpip.h&gt;<br>
<br>
+#ifdef CONFIG_AF_UNIX<br>
+# include &lt;afunix.h&gt;<br>
+#endif<br></blockquote><div><br></div><div>we could also provide a fallbac=
k, the same I did for glib:</div><div><a href=3D"https://gitlab.gnome.org/G=
NOME/glib/-/commit/4339192b5391a37ecd55816c713537fb1990cd07">https://gitlab=
.gnome.org/GNOME/glib/-/commit/4339192b5391a37ecd55816c713537fb1990cd07</a>=
</div><div>=C2=A0</div><div>So all Windows build will have afunix code comp=
iled.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+<br>
=C2=A0#ifdef __cplusplus<br>
=C2=A0extern &quot;C&quot; {<br>
=C2=A0#endif<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index 0e2298278f..f9892506de 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -880,7 +880,7 @@ static int vsock_parse(VsockSocketAddress *addr, const =
char *str,<br>
=C2=A0}<br>
=C2=A0#endif /* CONFIG_AF_VSOCK */<br>
<br>
-#ifndef _WIN32<br>
+#ifdef CONFIG_AF_UNIX<br>
<br>
=C2=A0static bool saddr_is_abstract(UnixSocketAddress *saddr)<br>
=C2=A0{<br>
@@ -1060,14 +1060,14 @@ static int unix_listen_saddr(UnixSocketAddress *sad=
dr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 error_setg(errp, &quot;unix sockets are not available on win=
dows&quot;);<br>
+=C2=A0 =C2=A0 error_setg(errp, &quot;unix sockets are not available on you=
r host&quot;);<br>
=C2=A0 =C2=A0 =C2=A0errno =3D ENOTSUP;<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
=C2=A0static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 error_setg(errp, &quot;unix sockets are not available on win=
dows&quot;);<br>
+=C2=A0 =C2=A0 error_setg(errp, &quot;unix sockets are not available on you=
r host&quot;);<br>
=C2=A0 =C2=A0 =C2=A0errno =3D ENOTSUP;<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
@@ -1335,7 +1335,7 @@ socket_sockaddr_to_address_inet(struct sockaddr_stora=
ge *sa,<br>
=C2=A0}<br>
<br>
<br>
-#ifndef WIN32<br>
+#ifdef CONFIG_AF_UNIX<br>
=C2=A0static SocketAddress *<br>
=C2=A0socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0socklen_t salen,<br>
@@ -1362,7 +1362,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_stora=
ge *sa,<br>
=C2=A0 =C2=A0 =C2=A0addr-&gt;u.q_unix.path =3D g_strndup(su-&gt;sun_path, s=
alen);<br>
=C2=A0 =C2=A0 =C2=A0return addr;<br>
=C2=A0}<br>
-#endif /* WIN32 */<br>
+#endif /* CONFIG_AF_UNIX */<br>
<br>
=C2=A0#ifdef CONFIG_AF_VSOCK<br>
=C2=A0static SocketAddress *<br>
@@ -1394,10 +1394,10 @@ socket_sockaddr_to_address(struct sockaddr_storage =
*sa,<br>
=C2=A0 =C2=A0 =C2=A0case AF_INET6:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return socket_sockaddr_to_address_inet(sa=
, salen, errp);<br>
<br>
-#ifndef WIN32<br>
+#ifdef CONFIG_AF_UNIX<br>
=C2=A0 =C2=A0 =C2=A0case AF_UNIX:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return socket_sockaddr_to_address_unix(sa=
, salen, errp);<br>
-#endif /* WIN32 */<br>
+#endif<br>
<br>
=C2=A0#ifdef CONFIG_AF_VSOCK<br>
=C2=A0 =C2=A0 =C2=A0case AF_VSOCK:<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000af36dd05e528aeef--

