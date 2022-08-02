Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3881587BBC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 13:44:48 +0200 (CEST)
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIqKM-00025j-G9
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 07:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIqF9-0007FJ-NK
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 07:39:25 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:46595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIqF3-00058E-8W
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 07:39:20 -0400
Received: by mail-lf1-x131.google.com with SMTP id d14so9647465lfl.13
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 04:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UlxTErQTIKYb6bLutO1TcXfJTW3Yst05P4dcpHYFNHo=;
 b=Xj96kbkvlWr4RsF1Q8qf6w65WMsJ5nGrl0uNNgwF4U/zg97qDEVVAlYRiIH25+5eHP
 0adT5y0Z/B+8cOynaE5J/RwmLwkl/SFIjM8OKbSHREifB5x2/Agcf8ufflzHvRDz5t6O
 MalkVUMIRoYm8HrcmMswXqmm5EHDb8Xi7fDxrTzEoI654j5BLpBuTMajDh7cEPDkAjhg
 iAarbGm4GNqm4r6PA1erUr05mOs4sAmxQKDtgUjzVYY8cO2sHhj9+OH9G6uRJo/p0kp+
 ze5/vnH3WF1wbgRHIcqm5XJk73PtqAF51qoJDlD1HHNwkuljItxyMMlXb7ME7eeDsPBi
 1uJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UlxTErQTIKYb6bLutO1TcXfJTW3Yst05P4dcpHYFNHo=;
 b=Yqiu3nIFDBwLM/H1zP3uSmjrFXLmelROA6mxO/SpEKqIrhT0R0f5fNhFx794yIsqQ6
 lE11YFNMJvMaRtdYh6ZLyGsqxAmLbh18DfA9Zj7+0E7uru4upJRbh+T1VOraEPAjyO+p
 BHresvZ0KUhU3mJDm2A5mHjsxh3f3Fb5AshJVk8S3L4gVFONAwo0gRYEfv8OgZYTevzx
 fDLkTD+QmC6JCJvbk6UsFeHSZHiYg1jidSMht5vnYjMPKBKM+yR922Fy1MOUOF0mTEf1
 YXd6s3StenICGUNHn2PiiLepxQ5s/YQOxGYjA7dNuHyx1wc2ycbM8nFCSg7IMfkjokTe
 9y6Q==
X-Gm-Message-State: AJIora/iiIX/ykR5Mb8O2BO9Kh7BBkcgunpzhCjWx6bt8WxgXBHHyULK
 Z6BN1wvpTimarIa8NxIhoV0Q8KVy5D2aw34jemY=
X-Google-Smtp-Source: AGRyM1uW5WLpMoqwq+IjI8Vvm5H2wrAIOfsQuksSPHpYMUWoYb7PevZajiJV+LV8MO6e4cvGhONrcz7z3573uHtGysw=
X-Received: by 2002:a05:6512:158e:b0:48a:848a:27f6 with SMTP id
 bp14-20020a056512158e00b0048a848a27f6mr7069320lfb.520.1659440352683; Tue, 02
 Aug 2022 04:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220802075200.907360-1-bmeng.cn@gmail.com>
 <20220802075200.907360-3-bmeng.cn@gmail.com>
In-Reply-To: <20220802075200.907360-3-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 2 Aug 2022 15:39:01 +0400
Message-ID: <CAJ+F1C+8POMfmDbqzAK3_3V5D1Nmkti5k3J+ujgAhwGbp05PRQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets: Enable unix socket support on
 Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="000000000000bf6b5505e54090c0"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
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

--000000000000bf6b5505e54090c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 2, 2022 at 12:39 PM Bin Meng <bmeng.cn@gmail.com> wrote:

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
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> Changes in v4:
> - instead of introducing CONFIG_AF_UNIX, add fallback afunix.h header
>   in os-win32.h, and compile the AF_UNIX stuff for all Windows hosts
>
> Changes in v3:
> - drop the run-time check afunix_available()
>
> Changes in v2:
> - move #include <afunix.h> to os-win32.h
> - define WIN_BUILD_AF_UNIX only when CONFIG_WIN32
>
>  meson.build               |  3 +++
>  include/sysemu/os-win32.h | 17 +++++++++++++++++
>  util/qemu-sockets.c       | 25 -------------------------
>  3 files changed, 20 insertions(+), 25 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 294e9a8f32..6749223f1a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1890,6 +1890,9 @@ config_host_data.set('HAVE_PTY_H',
> cc.has_header('pty.h'))
>  config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>  config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
> +if targetos =3D=3D 'windows'
> +  config_host_data.set('HAVE_AFUNIX_H', cc.has_header('afunix.h'))
> +endif
>
>  # has_function
>  config_host_data.set('CONFIG_ACCEPT4', cc.has_function('accept4'))
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index edc3b38a57..5b38c7bd04 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -30,6 +30,23 @@
>  #include <windows.h>
>  #include <ws2tcpip.h>
>
> +#ifdef HAVE_AFUNIX_H
> +#include <afunix.h>
> +#else
> +/*
> + * Fallback definitions of things we need in afunix.h, if not available
> from
> + * the used Windows SDK or MinGW headers.
> + */
> +#define UNIX_PATH_MAX 108
> +
> +typedef struct sockaddr_un {
> +    ADDRESS_FAMILY sun_family;
> +    char sun_path[UNIX_PATH_MAX];
> +} SOCKADDR_UN, *PSOCKADDR_UN;
> +
> +#define SIO_AF_UNIX_GETPEERPID _WSAIOR(IOC_VENDOR, 256)
> +#endif
> +
>  #ifdef __cplusplus
>  extern "C" {
>  #endif
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 0e2298278f..83f4bd6fd2 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -880,8 +880,6 @@ static int vsock_parse(VsockSocketAddress *addr, cons=
t
> char *str,
>  }
>  #endif /* CONFIG_AF_VSOCK */
>
> -#ifndef _WIN32
> -
>  static bool saddr_is_abstract(UnixSocketAddress *saddr)
>  {
>  #ifdef CONFIG_LINUX
> @@ -1054,25 +1052,6 @@ static int unix_connect_saddr(UnixSocketAddress
> *saddr, Error **errp)
>      return -1;
>  }
>
> -#else
> -
> -static int unix_listen_saddr(UnixSocketAddress *saddr,
> -                             int num,
> -                             Error **errp)
> -{
> -    error_setg(errp, "unix sockets are not available on windows");
> -    errno =3D ENOTSUP;
> -    return -1;
> -}
> -
> -static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
> -{
> -    error_setg(errp, "unix sockets are not available on windows");
> -    errno =3D ENOTSUP;
> -    return -1;
> -}
> -#endif
> -
>  /* compatibility wrapper */
>  int unix_listen(const char *str, Error **errp)
>  {
> @@ -1335,7 +1314,6 @@ socket_sockaddr_to_address_inet(struct
> sockaddr_storage *sa,
>  }
>
>
> -#ifndef WIN32
>  static SocketAddress *
>  socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>                                  socklen_t salen,
> @@ -1362,7 +1340,6 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
>      addr->u.q_unix.path =3D g_strndup(su->sun_path, salen);
>      return addr;
>  }
> -#endif /* WIN32 */
>
>  #ifdef CONFIG_AF_VSOCK
>  static SocketAddress *
> @@ -1394,10 +1371,8 @@ socket_sockaddr_to_address(struct sockaddr_storage
> *sa,
>      case AF_INET6:
>          return socket_sockaddr_to_address_inet(sa, salen, errp);
>
> -#ifndef WIN32
>      case AF_UNIX:
>          return socket_sockaddr_to_address_unix(sa, salen, errp);
> -#endif /* WIN32 */
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

--000000000000bf6b5505e54090c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 2, 2022 at 12:39 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
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
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v4:<br>
- instead of introducing CONFIG_AF_UNIX, add fallback afunix.h header<br>
=C2=A0 in os-win32.h, and compile the AF_UNIX stuff for all Windows hosts<b=
r>
<br>
Changes in v3:<br>
- drop the run-time check afunix_available()<br>
<br>
Changes in v2:<br>
- move #include &lt;afunix.h&gt; to os-win32.h<br>
- define WIN_BUILD_AF_UNIX only when CONFIG_WIN32<br>
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 +++<br>
=C2=A0include/sysemu/os-win32.h | 17 +++++++++++++++++<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 ------------------=
-------<br>
=C2=A03 files changed, 20 insertions(+), 25 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 294e9a8f32..6749223f1a 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1890,6 +1890,9 @@ config_host_data.set(&#39;HAVE_PTY_H&#39;, cc.has_hea=
der(&#39;pty.h&#39;))<br>
=C2=A0config_host_data.set(&#39;HAVE_SYS_DISK_H&#39;, cc.has_header(&#39;sy=
s/disk.h&#39;))<br>
=C2=A0config_host_data.set(&#39;HAVE_SYS_IOCCOM_H&#39;, cc.has_header(&#39;=
sys/ioccom.h&#39;))<br>
=C2=A0config_host_data.set(&#39;HAVE_SYS_KCOV_H&#39;, cc.has_header(&#39;sy=
s/kcov.h&#39;))<br>
+if targetos =3D=3D &#39;windows&#39;<br>
+=C2=A0 config_host_data.set(&#39;HAVE_AFUNIX_H&#39;, cc.has_header(&#39;af=
unix.h&#39;))<br>
+endif<br>
<br>
=C2=A0# has_function<br>
=C2=A0config_host_data.set(&#39;CONFIG_ACCEPT4&#39;, cc.has_function(&#39;a=
ccept4&#39;))<br>
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h<br>
index edc3b38a57..5b38c7bd04 100644<br>
--- a/include/sysemu/os-win32.h<br>
+++ b/include/sysemu/os-win32.h<br>
@@ -30,6 +30,23 @@<br>
=C2=A0#include &lt;windows.h&gt;<br>
=C2=A0#include &lt;ws2tcpip.h&gt;<br>
<br>
+#ifdef HAVE_AFUNIX_H<br>
+#include &lt;afunix.h&gt;<br>
+#else<br>
+/*<br>
+ * Fallback definitions of things we need in afunix.h, if not available fr=
om<br>
+ * the used Windows SDK or MinGW headers.<br>
+ */<br>
+#define UNIX_PATH_MAX 108<br>
+<br>
+typedef struct sockaddr_un {<br>
+=C2=A0 =C2=A0 ADDRESS_FAMILY sun_family;<br>
+=C2=A0 =C2=A0 char sun_path[UNIX_PATH_MAX];<br>
+} SOCKADDR_UN, *PSOCKADDR_UN;<br>
+<br>
+#define SIO_AF_UNIX_GETPEERPID _WSAIOR(IOC_VENDOR, 256)<br>
+#endif<br>
+<br>
=C2=A0#ifdef __cplusplus<br>
=C2=A0extern &quot;C&quot; {<br>
=C2=A0#endif<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index 0e2298278f..83f4bd6fd2 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -880,8 +880,6 @@ static int vsock_parse(VsockSocketAddress *addr, const =
char *str,<br>
=C2=A0}<br>
=C2=A0#endif /* CONFIG_AF_VSOCK */<br>
<br>
-#ifndef _WIN32<br>
-<br>
=C2=A0static bool saddr_is_abstract(UnixSocketAddress *saddr)<br>
=C2=A0{<br>
=C2=A0#ifdef CONFIG_LINUX<br>
@@ -1054,25 +1052,6 @@ static int unix_connect_saddr(UnixSocketAddress *sad=
dr, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
-#else<br>
-<br>
-static int unix_listen_saddr(UnixSocketAddress *saddr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int num,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 error_setg(errp, &quot;unix sockets are not available on win=
dows&quot;);<br>
-=C2=A0 =C2=A0 errno =3D ENOTSUP;<br>
-=C2=A0 =C2=A0 return -1;<br>
-}<br>
-<br>
-static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 error_setg(errp, &quot;unix sockets are not available on win=
dows&quot;);<br>
-=C2=A0 =C2=A0 errno =3D ENOTSUP;<br>
-=C2=A0 =C2=A0 return -1;<br>
-}<br>
-#endif<br>
-<br>
=C2=A0/* compatibility wrapper */<br>
=C2=A0int unix_listen(const char *str, Error **errp)<br>
=C2=A0{<br>
@@ -1335,7 +1314,6 @@ socket_sockaddr_to_address_inet(struct sockaddr_stora=
ge *sa,<br>
=C2=A0}<br>
<br>
<br>
-#ifndef WIN32<br>
=C2=A0static SocketAddress *<br>
=C2=A0socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0socklen_t salen,<br>
@@ -1362,7 +1340,6 @@ socket_sockaddr_to_address_unix(struct sockaddr_stora=
ge *sa,<br>
=C2=A0 =C2=A0 =C2=A0addr-&gt;u.q_unix.path =3D g_strndup(su-&gt;sun_path, s=
alen);<br>
=C2=A0 =C2=A0 =C2=A0return addr;<br>
=C2=A0}<br>
-#endif /* WIN32 */<br>
<br>
=C2=A0#ifdef CONFIG_AF_VSOCK<br>
=C2=A0static SocketAddress *<br>
@@ -1394,10 +1371,8 @@ socket_sockaddr_to_address(struct sockaddr_storage *=
sa,<br>
=C2=A0 =C2=A0 =C2=A0case AF_INET6:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return socket_sockaddr_to_address_inet(sa=
, salen, errp);<br>
<br>
-#ifndef WIN32<br>
=C2=A0 =C2=A0 =C2=A0case AF_UNIX:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return socket_sockaddr_to_address_unix(sa=
, salen, errp);<br>
-#endif /* WIN32 */<br>
<br>
=C2=A0#ifdef CONFIG_AF_VSOCK<br>
=C2=A0 =C2=A0 =C2=A0case AF_VSOCK:<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bf6b5505e54090c0--

