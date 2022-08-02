Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FCF587BCD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 13:52:22 +0200 (CEST)
Received: from localhost ([::1]:49974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIqRg-0006WM-Lq
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 07:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIqJd-0001dX-VE
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 07:44:04 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:40812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIqJb-0005z3-K5
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 07:44:01 -0400
Received: by mail-lj1-x232.google.com with SMTP id h12so15311161ljg.7
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ftz/H85StymgI+9riBxApytebcsbfmXmhHvetb/3GKE=;
 b=WXZmR71evilfqzn+vmpCD3Elb8zD1MX2yc/AkqB0aWjbTHYQ627xGMnjxV9DXn9I1i
 lcb81BcsCHVhzDpdFNgXyUBlnfbGD6v3o9VNcjr+GtpYv22Pp6/YZQU304PKmSOK+7Wh
 hqb8WZ50htc/ogRES7PujbZkduzJz8XfHBTiHVA9uYP7gUexg6frZd/2V5l0k7KT0vgc
 PWQQBJV451P3xHbRP3Dp8FAsJBXo32KwflGss7CgFwqMgCgnVVjYwfc50tDuxS2iB52q
 vleLRRg8lRP9JtOsOxGZXWMeikZgsqSdvWTjlzX3u0K5kcoPAXNjKhs52h6AchowrlkA
 mZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ftz/H85StymgI+9riBxApytebcsbfmXmhHvetb/3GKE=;
 b=XkGPFDbyoy3FjYAmBJDAROXLHbnuLjNNkbTnwIkhDfmNqZi8MN7f/TdXMrVW7etsMk
 3thmE5bHJpdlTkDyVNX9IMAuGsXQpO1EaBflHAV6Qt+/8m4S6ZZ+b5sKGcAfdUbwzS/w
 WhCiPqHYngh2ZtSowFN5ctBJfo7DZ3QQKtd2Y8ngpa+WTf+SvwJtTMy+EVu+QLt6GJxz
 gUwFMy/er2E1iZKI8gNWAsIHStnsdvSPZHDE6ohpYch8AX7QhY3C1UJerR3bmEOQh+Wc
 MpL3824nSY/JtARNq3mkwUwXxaRJ/4B54jR8V+yKZr+gHIZS+KeOFEQ7KhUv9FqEYPX7
 vYdg==
X-Gm-Message-State: AJIora+fGkIHc39jGZnEgUprI1+CQvEA4s9n6B24RqVLBDLlM6feweLu
 bfhbdGSaTjhJkdzW3ESTHUXNjf+bwth0iqUBUkqOlbapcci5/g==
X-Google-Smtp-Source: AGRyM1spZQxB2jLtwmgyFiMVpmfc8G2s7h+45dDUJFFu14h2pqbRoVYOKICLYVbzBEHWQl4DW4X6rodEbb4YubFF56U=
X-Received: by 2002:a2e:6e0b:0:b0:25b:bf22:47a with SMTP id
 j11-20020a2e6e0b000000b0025bbf22047amr6434804ljc.524.1659440637890; Tue, 02
 Aug 2022 04:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220802075200.907360-1-bmeng.cn@gmail.com>
 <20220802075200.907360-5-bmeng.cn@gmail.com>
In-Reply-To: <20220802075200.907360-5-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 2 Aug 2022 15:43:46 +0400
Message-ID: <CAJ+F1CK6WVAcxC67ReP+obGJZXH89L96sC7oJfVN0JiL66B1+Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] tests/unit: Update test-io-channel-socket.c for
 Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bf565105e540a15b"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
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

--000000000000bf565105e540a15b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 2, 2022 at 1:21 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Change to dynamically include the test cases by checking AF_UNIX
> availability using a new helper socket_check_afunix_support().
> With such changes testing on a Windows host can be covered as well.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v4:
> - introduce a new helper socket_check_afunix_support() to runtime-check
>   the availability of AF_UNIX socket, and skip those appropriately
>
> Changes in v2:
> - new patch: tests/unit: Update test-io-channel-socket.c for Windows
>
>  tests/unit/socket-helpers.h         |  9 +++++++
>  tests/unit/socket-helpers.c         | 16 +++++++++++++
>  tests/unit/test-io-channel-socket.c | 37 ++++++++++++++++++-----------
>  3 files changed, 48 insertions(+), 14 deletions(-)
>
> diff --git a/tests/unit/socket-helpers.h b/tests/unit/socket-helpers.h
> index 512a004811..ed8477ceb3 100644
> --- a/tests/unit/socket-helpers.h
> +++ b/tests/unit/socket-helpers.h
> @@ -32,4 +32,13 @@
>   */
>  int socket_check_protocol_support(bool *has_ipv4, bool *has_ipv6);
>
> +/*
> + * @has_afunix: set to true on return if unix socket support is availabl=
e
> + *
> + * Check whether unix domain socket support is available for use.
> + * On success, @has_afunix will be set to indicate whether AF_UNIX
> protocol
> + * is available.
> + */
> +void socket_check_afunix_support(bool *has_afunix);
> +
>  #endif
> diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
> index 5af4de513b..eecadf3a3c 100644
> --- a/tests/unit/socket-helpers.c
> +++ b/tests/unit/socket-helpers.c
> @@ -154,3 +154,19 @@ int socket_check_protocol_support(bool *has_ipv4,
> bool *has_ipv6)
>
>      return 0;
>  }
> +
> +void socket_check_afunix_support(bool *has_afunix)
>

Why not return TRUE for success? Ah, for consistency with
socket_check_protocol_support (). Maybe you should extend that function
instead then?


> +{
> +    int fd;
> +
> +    fd =3D socket(PF_UNIX, SOCK_STREAM, 0);
> +    closesocket(fd);
> +
> +#ifdef _WIN32
> +    *has_afunix =3D (fd !=3D (int)INVALID_SOCKET);
> +#else
> +    *has_afunix =3D (fd >=3D 0);
> +#endif
> +
> +    return;
> +}
> diff --git a/tests/unit/test-io-channel-socket.c
> b/tests/unit/test-io-channel-socket.c
> index 6713886d02..b36a5d972a 100644
> --- a/tests/unit/test-io-channel-socket.c
> +++ b/tests/unit/test-io-channel-socket.c
> @@ -179,10 +179,12 @@ static void test_io_channel(bool async,
>          test_io_channel_setup_async(listen_addr, connect_addr,
>                                      &srv, &src, &dst);
>
> +#ifndef _WIN32
>          g_assert(!passFD ||
>                   qio_channel_has_feature(src,
> QIO_CHANNEL_FEATURE_FD_PASS));
>          g_assert(!passFD ||
>                   qio_channel_has_feature(dst,
> QIO_CHANNEL_FEATURE_FD_PASS));
> +#endif
>          g_assert(qio_channel_has_feature(src,
> QIO_CHANNEL_FEATURE_SHUTDOWN));
>          g_assert(qio_channel_has_feature(dst,
> QIO_CHANNEL_FEATURE_SHUTDOWN));
>
> @@ -206,10 +208,12 @@ static void test_io_channel(bool async,
>          test_io_channel_setup_async(listen_addr, connect_addr,
>                                      &srv, &src, &dst);
>
> +#ifndef _WIN32
>          g_assert(!passFD ||
>                   qio_channel_has_feature(src,
> QIO_CHANNEL_FEATURE_FD_PASS));
>          g_assert(!passFD ||
>                   qio_channel_has_feature(dst,
> QIO_CHANNEL_FEATURE_FD_PASS));
> +#endif
>          g_assert(qio_channel_has_feature(src,
> QIO_CHANNEL_FEATURE_SHUTDOWN));
>          g_assert(qio_channel_has_feature(dst,
> QIO_CHANNEL_FEATURE_SHUTDOWN));
>
> @@ -236,10 +240,12 @@ static void test_io_channel(bool async,
>          test_io_channel_setup_sync(listen_addr, connect_addr,
>                                     &srv, &src, &dst);
>
> +#ifndef _WIN32
>          g_assert(!passFD ||
>                   qio_channel_has_feature(src,
> QIO_CHANNEL_FEATURE_FD_PASS));
>          g_assert(!passFD ||
>                   qio_channel_has_feature(dst,
> QIO_CHANNEL_FEATURE_FD_PASS));
> +#endif
>          g_assert(qio_channel_has_feature(src,
> QIO_CHANNEL_FEATURE_SHUTDOWN));
>          g_assert(qio_channel_has_feature(dst,
> QIO_CHANNEL_FEATURE_SHUTDOWN));
>
> @@ -263,10 +269,12 @@ static void test_io_channel(bool async,
>          test_io_channel_setup_sync(listen_addr, connect_addr,
>                                     &srv, &src, &dst);
>
> +#ifndef _WIN32
>          g_assert(!passFD ||
>                   qio_channel_has_feature(src,
> QIO_CHANNEL_FEATURE_FD_PASS));
>          g_assert(!passFD ||
>                   qio_channel_has_feature(dst,
> QIO_CHANNEL_FEATURE_FD_PASS));
> +#endif
>          g_assert(qio_channel_has_feature(src,
> QIO_CHANNEL_FEATURE_SHUTDOWN));
>          g_assert(qio_channel_has_feature(dst,
> QIO_CHANNEL_FEATURE_SHUTDOWN));
>
> @@ -367,7 +375,6 @@ static void test_io_channel_ipv6_async(void)
>  }
>
>
> -#ifndef _WIN32
>  static void test_io_channel_unix(bool async)
>  {
>      SocketAddress *listen_addr =3D g_new0(SocketAddress, 1);
> @@ -398,6 +405,7 @@ static void test_io_channel_unix_async(void)
>      return test_io_channel_unix(true);
>  }
>
> +#ifndef _WIN32
>  static void test_io_channel_unix_fd_pass(void)
>  {
>      SocketAddress *listen_addr =3D g_new0(SocketAddress, 1);
> @@ -491,6 +499,7 @@ static void test_io_channel_unix_fd_pass(void)
>      }
>      g_free(fdrecv);
>  }
> +#endif /* _WIN32 */
>
>  static void test_io_channel_unix_listen_cleanup(void)
>  {
> @@ -522,9 +531,6 @@ static void test_io_channel_unix_listen_cleanup(void)
>      unlink(TEST_SOCKET);
>  }
>
> -#endif /* _WIN32 */
> -
> -
>  static void test_io_channel_ipv4_fd(void)
>  {
>      QIOChannel *ioc;
> @@ -555,7 +561,7 @@ static void test_io_channel_ipv4_fd(void)
>
>  int main(int argc, char **argv)
>  {
> -    bool has_ipv4, has_ipv6;
> +    bool has_ipv4, has_ipv6, has_afunix;
>
>      module_call_init(MODULE_INIT_QOM);
>      qemu_init_main_loop(&error_abort);
> @@ -588,16 +594,19 @@ int main(int argc, char **argv)
>                          test_io_channel_ipv6_async);
>      }
>
> +    socket_check_afunix_support(&has_afunix);
> +    if (has_afunix) {
> +        g_test_add_func("/io/channel/socket/unix-sync",
> +                        test_io_channel_unix_sync);
> +        g_test_add_func("/io/channel/socket/unix-async",
> +                        test_io_channel_unix_async);
>

(I would also have g_test_skip() inside the tests, but that's pre-existing
too)

 #ifndef _WIN32
> -    g_test_add_func("/io/channel/socket/unix-sync",
> -                    test_io_channel_unix_sync);
> -    g_test_add_func("/io/channel/socket/unix-async",
> -                    test_io_channel_unix_async);
> -    g_test_add_func("/io/channel/socket/unix-fd-pass",
> -                    test_io_channel_unix_fd_pass);
> -    g_test_add_func("/io/channel/socket/unix-listen-cleanup",
> -                    test_io_channel_unix_listen_cleanup);
> -#endif /* _WIN32 */
> +        g_test_add_func("/io/channel/socket/unix-fd-pass",
> +                        test_io_channel_unix_fd_pass);
> +#endif
> +        g_test_add_func("/io/channel/socket/unix-listen-cleanup",
> +                        test_io_channel_unix_listen_cleanup);
> +    }
>
>  end:
>      return g_test_run();
> --
> 2.34.1
>
>
>
So, lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000bf565105e540a15b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 2, 2022 at 1:21 PM Bin =
Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin =
Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.me=
ng@windriver.com</a>&gt;<br>
<br>
Change to dynamically include the test cases by checking AF_UNIX<br>
availability using a new helper socket_check_afunix_support().<br>
With such changes testing on a Windows host can be covered as well.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v4:<br>
- introduce a new helper socket_check_afunix_support() to runtime-check<br>
=C2=A0 the availability of AF_UNIX socket, and skip those appropriately<br>
<br>
Changes in v2:<br>
- new patch: tests/unit: Update test-io-channel-socket.c for Windows<br>
<br>
=C2=A0tests/unit/socket-helpers.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
9 +++++++<br>
=C2=A0tests/unit/socket-helpers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 +++=
++++++++++<br>
=C2=A0tests/unit/test-io-channel-socket.c | 37 ++++++++++++++++++----------=
-<br>
=C2=A03 files changed, 48 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/tests/unit/socket-helpers.h b/tests/unit/socket-helpers.h<br>
index 512a004811..ed8477ceb3 100644<br>
--- a/tests/unit/socket-helpers.h<br>
+++ b/tests/unit/socket-helpers.h<br>
@@ -32,4 +32,13 @@<br>
=C2=A0 */<br>
=C2=A0int socket_check_protocol_support(bool *has_ipv4, bool *has_ipv6);<br=
>
<br>
+/*<br>
+ * @has_afunix: set to true on return if unix socket support is available<=
br>
+ *<br>
+ * Check whether unix domain socket support is available for use.<br>
+ * On success, @has_afunix will be set to indicate whether AF_UNIX protoco=
l<br>
+ * is available.<br>
+ */<br>
+void socket_check_afunix_support(bool *has_afunix);<br>
+<br>
=C2=A0#endif<br>
diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c<br>
index 5af4de513b..eecadf3a3c 100644<br>
--- a/tests/unit/socket-helpers.c<br>
+++ b/tests/unit/socket-helpers.c<br>
@@ -154,3 +154,19 @@ int socket_check_protocol_support(bool *has_ipv4, bool=
 *has_ipv6)<br>
<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
+<br>
+void socket_check_afunix_support(bool *has_afunix)<br></blockquote><div><b=
r></div><div>Why not return TRUE for success? Ah, for consistency with sock=
et_check_protocol_support (). Maybe you should extend that function instead=
 then?<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+{<br>
+=C2=A0 =C2=A0 int fd;<br>
+<br>
+=C2=A0 =C2=A0 fd =3D socket(PF_UNIX, SOCK_STREAM, 0);<br>
+=C2=A0 =C2=A0 closesocket(fd);<br>
+<br>
+#ifdef _WIN32<br>
+=C2=A0 =C2=A0 *has_afunix =3D (fd !=3D (int)INVALID_SOCKET);<br>
+#else<br>
+=C2=A0 =C2=A0 *has_afunix =3D (fd &gt;=3D 0);<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 return;<br>
+}<br>
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-chann=
el-socket.c<br>
index 6713886d02..b36a5d972a 100644<br>
--- a/tests/unit/test-io-channel-socket.c<br>
+++ b/tests/unit/test-io-channel-socket.c<br>
@@ -179,10 +179,12 @@ static void test_io_channel(bool async,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_io_channel_setup_async(listen_addr, =
connect_addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;srv, &amp;s=
rc, &amp;dst);<br>
<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(!passFD ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_=
has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(!passFD ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_=
has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qio_channel_has_feature(src, QIO=
_CHANNEL_FEATURE_SHUTDOWN));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qio_channel_has_feature(dst, QIO=
_CHANNEL_FEATURE_SHUTDOWN));<br>
<br>
@@ -206,10 +208,12 @@ static void test_io_channel(bool async,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_io_channel_setup_async(listen_addr, =
connect_addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;srv, &amp;s=
rc, &amp;dst);<br>
<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(!passFD ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_=
has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(!passFD ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_=
has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qio_channel_has_feature(src, QIO=
_CHANNEL_FEATURE_SHUTDOWN));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qio_channel_has_feature(dst, QIO=
_CHANNEL_FEATURE_SHUTDOWN));<br>
<br>
@@ -236,10 +240,12 @@ static void test_io_channel(bool async,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_io_channel_setup_sync(listen_addr, c=
onnect_addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;srv, &amp;src, &a=
mp;dst);<br>
<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(!passFD ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_=
has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(!passFD ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_=
has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qio_channel_has_feature(src, QIO=
_CHANNEL_FEATURE_SHUTDOWN));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qio_channel_has_feature(dst, QIO=
_CHANNEL_FEATURE_SHUTDOWN));<br>
<br>
@@ -263,10 +269,12 @@ static void test_io_channel(bool async,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_io_channel_setup_sync(listen_addr, c=
onnect_addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;srv, &amp;src, &a=
mp;dst);<br>
<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(!passFD ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_=
has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(!passFD ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_=
has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qio_channel_has_feature(src, QIO=
_CHANNEL_FEATURE_SHUTDOWN));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(qio_channel_has_feature(dst, QIO=
_CHANNEL_FEATURE_SHUTDOWN));<br>
<br>
@@ -367,7 +375,6 @@ static void test_io_channel_ipv6_async(void)<br>
=C2=A0}<br>
<br>
<br>
-#ifndef _WIN32<br>
=C2=A0static void test_io_channel_unix(bool async)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SocketAddress *listen_addr =3D g_new0(SocketAddress, 1)=
;<br>
@@ -398,6 +405,7 @@ static void test_io_channel_unix_async(void)<br>
=C2=A0 =C2=A0 =C2=A0return test_io_channel_unix(true);<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
=C2=A0static void test_io_channel_unix_fd_pass(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SocketAddress *listen_addr =3D g_new0(SocketAddress, 1)=
;<br>
@@ -491,6 +499,7 @@ static void test_io_channel_unix_fd_pass(void)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(fdrecv);<br>
=C2=A0}<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0static void test_io_channel_unix_listen_cleanup(void)<br>
=C2=A0{<br>
@@ -522,9 +531,6 @@ static void test_io_channel_unix_listen_cleanup(void)<b=
r>
=C2=A0 =C2=A0 =C2=A0unlink(TEST_SOCKET);<br>
=C2=A0}<br>
<br>
-#endif /* _WIN32 */<br>
-<br>
-<br>
=C2=A0static void test_io_channel_ipv4_fd(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QIOChannel *ioc;<br>
@@ -555,7 +561,7 @@ static void test_io_channel_ipv4_fd(void)<br>
<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 bool has_ipv4, has_ipv6;<br>
+=C2=A0 =C2=A0 bool has_ipv4, has_ipv6, has_afunix;<br>
<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_QOM);<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_main_loop(&amp;error_abort);<br>
@@ -588,16 +594,19 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0test_io_channel_ipv6_async);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 socket_check_afunix_support(&amp;has_afunix);<br>
+=C2=A0 =C2=A0 if (has_afunix) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_add_func(&quot;/io/channel/socket/unix-=
sync&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 test_io_channel_unix_sync);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_add_func(&quot;/io/channel/socket/unix-=
async&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 test_io_channel_unix_async);<br></blockquote><div><br></div><div=
>(I would also have g_test_skip() inside the tests, but that&#39;s pre-exis=
ting too)<br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0#ifndef _WIN32<br>
-=C2=A0 =C2=A0 g_test_add_func(&quot;/io/channel/socket/unix-sync&quot;,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test=
_io_channel_unix_sync);<br>
-=C2=A0 =C2=A0 g_test_add_func(&quot;/io/channel/socket/unix-async&quot;,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test=
_io_channel_unix_async);<br>
-=C2=A0 =C2=A0 g_test_add_func(&quot;/io/channel/socket/unix-fd-pass&quot;,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test=
_io_channel_unix_fd_pass);<br>
-=C2=A0 =C2=A0 g_test_add_func(&quot;/io/channel/socket/unix-listen-cleanup=
&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test=
_io_channel_unix_listen_cleanup);<br>
-#endif /* _WIN32 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_add_func(&quot;/io/channel/socket/unix-=
fd-pass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 test_io_channel_unix_fd_pass);<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_add_func(&quot;/io/channel/socket/unix-=
listen-cleanup&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 test_io_channel_unix_listen_cleanup);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0end:<br>
=C2=A0 =C2=A0 =C2=A0return g_test_run();<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div>So, lgtm</div><div>Reviewed-by: M=
arc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">ma=
rcandre.lureau@redhat.com</a>&gt;<br></div><div><br></div><div><br></div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br><=
/div></div>

--000000000000bf565105e540a15b--

