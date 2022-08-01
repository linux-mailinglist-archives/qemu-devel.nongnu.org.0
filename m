Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429C35865C1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 09:38:51 +0200 (CEST)
Received: from localhost ([::1]:55956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIQ0o-0000VA-2o
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 03:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIPv2-0005GH-7P
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:32:53 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:38681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIPv0-0000pP-27
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:32:51 -0400
Received: by mail-lf1-x134.google.com with SMTP id bq11so10858833lfb.5
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 00:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PKntVxlGZ5/QPGaV+GyfLC7itf4gtsgGVX2spkbCVls=;
 b=N+d6vfyQWEZxpd21M6ctNv5kjc3Pl+PeX5dMpv2eOC/ITrn7qYq6pgo0vujruepO8H
 6h+qgM5WrYvvcMpvdv5GTsX15TUMfzK56zfTuUQQwFqPPld7JA4kvEx2mxIapqOoVH3b
 1tIWYaDXP9yyVWEeoHXyF01uk3E6AcTUCGDSNLrB7yi+d6FV17wJb/5e7ufY7v1jTZ00
 n8NEXVlv6RUKzkexx4JsoNFyIdoHF8Rxvzsiq8yvBHo7/CjCQ+qUgV1sA0uOAugkCX4Z
 BtpGnQxqtzcrmtnc8f2LunXvBQjK5jXz6JyHIidaHPfwFCc5XaoWZE53o+/h8IaNVTNS
 /pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PKntVxlGZ5/QPGaV+GyfLC7itf4gtsgGVX2spkbCVls=;
 b=VJFfk6tcQfQxIycewrRoP744g2C4HhyA0ap5LIfivBYv/J4jtrDqfGR/Tj9B2q/bL5
 LiK+pwjh/ZArE+kgB/ePXt/Pgsv40TpFLVyjFpIekZiBD38B9+kjlZXo3vYWGICDAaQu
 7D6DJnrxt6Q5T+ET6xCSacl7qzhCBQ+6oCOCE+2ksQqXOd7MoRFzcsSh+suKBf776Yuw
 w/kS9oJZ/P587bmysBaWj2yitsrrxPILCS7VecfHd0Tcn+BmUr7ci4MKnj65+IyN9NnM
 ocv264bWAFg2VTRIrbCXTvAJVXtyyXLj+yDPjBcepBW8vpZIAoVWxJSFbbJywxLPM2QL
 mSuA==
X-Gm-Message-State: AJIora8zQlV0IbPtbk0/83+askgqu7pQXkz7X4ZKrVR/h4j7lJPNbj2t
 u6K2MtqcKJafObDTec3BhFhr/8WpE+PT0CfinAw=
X-Google-Smtp-Source: AGRyM1uhLIQkrpdQ+OZsEITrU639oqUDXIxXfbO1fqYS4EMLM9suCXdJ6laC1I1ivcfXlWBQe6iNTA7V++rLDV00hYo=
X-Received: by 2002:a05:6512:158e:b0:48a:848a:27f6 with SMTP id
 bp14-20020a056512158e00b0048a848a27f6mr5087797lfb.520.1659339168198; Mon, 01
 Aug 2022 00:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220730145036.865854-1-bmeng.cn@gmail.com>
 <20220730145036.865854-5-bmeng.cn@gmail.com>
In-Reply-To: <20220730145036.865854-5-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 1 Aug 2022 11:32:36 +0400
Message-ID: <CAJ+F1CJZ7q8FAS2ootk2sawDqPm4Vq2dARLtZw36s13-yhW3Mg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] tests/unit: Update test-io-channel-socket.c for
 Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000aeb8ec05e5290185"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
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

--000000000000aeb8ec05e5290185
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Jul 30, 2022 at 6:53 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Enable the following 3 test cases for Windows when AF_UNIX is available:
>
>   * test_io_channel_unix_sync
>   * test_io_channel_unix_async
>   * test_io_channel_unix_listen_cleanup
>

The test should runtime-check the availability of AF_UNIX socket, and skip
those appropriately (not failing the test).
(for ex, in glib I wrote
https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/tests/gdbus-peer.c#L305=
)


> diff --git a/tests/unit/test-io-channel-socket.c
> b/tests/unit/test-io-channel-socket.c
> index 6713886d02..ec5df32489 100644
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
> @@ -367,7 +375,7 @@ static void test_io_channel_ipv6_async(void)
>  }
>
>
> -#ifndef _WIN32
> +#ifdef CONFIG_AF_UNIX
>  static void test_io_channel_unix(bool async)
>  {
>      SocketAddress *listen_addr =3D g_new0(SocketAddress, 1);
> @@ -398,6 +406,7 @@ static void test_io_channel_unix_async(void)
>      return test_io_channel_unix(true);
>  }
>
> +#ifndef _WIN32
>  static void test_io_channel_unix_fd_pass(void)
>  {
>      SocketAddress *listen_addr =3D g_new0(SocketAddress, 1);
> @@ -491,6 +500,7 @@ static void test_io_channel_unix_fd_pass(void)
>      }
>      g_free(fdrecv);
>  }
> +#endif /* _WIN32 */
>
>  static void test_io_channel_unix_listen_cleanup(void)
>  {
> @@ -588,13 +598,15 @@ int main(int argc, char **argv)
>                          test_io_channel_ipv6_async);
>      }
>
> -#ifndef _WIN32
> +#ifdef CONFIG_AF_UNIX
>      g_test_add_func("/io/channel/socket/unix-sync",
>                      test_io_channel_unix_sync);
>      g_test_add_func("/io/channel/socket/unix-async",
>                      test_io_channel_unix_async);
> +#ifndef _WIN32
>      g_test_add_func("/io/channel/socket/unix-fd-pass",
>                      test_io_channel_unix_fd_pass);
> +#endif
>      g_test_add_func("/io/channel/socket/unix-listen-cleanup",
>                      test_io_channel_unix_listen_cleanup);
>  #endif /* _WIN32 */
>

The comments needs to be updated


--=20
Marc-Andr=C3=A9 Lureau

--000000000000aeb8ec05e5290185
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 30, 2022 at 6:53 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" tar=
get=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
<br>
Enable the following 3 test cases for Windows when AF_UNIX is available:<br=
>
<br>
=C2=A0 * test_io_channel_unix_sync<br>
=C2=A0 * test_io_channel_unix_async<br>
=C2=A0 * test_io_channel_unix_listen_cleanup<br></blockquote><div><br></div=
><div>The test should runtime-check the availability of AF_UNIX socket, and=
 skip those appropriately (not failing the test).</div></div><div class=3D"=
gmail_quote">(for ex, in glib I wrote <a href=3D"https://gitlab.gnome.org/G=
NOME/glib/-/blob/main/gio/tests/gdbus-peer.c#L305">https://gitlab.gnome.org=
/GNOME/glib/-/blob/main/gio/tests/gdbus-peer.c#L305</a>)</div><div class=3D=
"gmail_quote"><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-chann=
el-socket.c<br>
index 6713886d02..ec5df32489 100644<br>
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
@@ -367,7 +375,7 @@ static void test_io_channel_ipv6_async(void)<br>
=C2=A0}<br>
<br>
<br>
-#ifndef _WIN32<br>
+#ifdef CONFIG_AF_UNIX<br>
=C2=A0static void test_io_channel_unix(bool async)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SocketAddress *listen_addr =3D g_new0(SocketAddress, 1)=
;<br>
@@ -398,6 +406,7 @@ static void test_io_channel_unix_async(void)<br>
=C2=A0 =C2=A0 =C2=A0return test_io_channel_unix(true);<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
=C2=A0static void test_io_channel_unix_fd_pass(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SocketAddress *listen_addr =3D g_new0(SocketAddress, 1)=
;<br>
@@ -491,6 +500,7 @@ static void test_io_channel_unix_fd_pass(void)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(fdrecv);<br>
=C2=A0}<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0static void test_io_channel_unix_listen_cleanup(void)<br>
=C2=A0{<br>
@@ -588,13 +598,15 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0test_io_channel_ipv6_async);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-#ifndef _WIN32<br>
+#ifdef CONFIG_AF_UNIX<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/socket/unix-sync&quot=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0test_io_channel_unix_sync);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/socket/unix-async&quo=
t;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0test_io_channel_unix_async);<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/socket/unix-fd-pass&q=
uot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0test_io_channel_unix_fd_pass);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/socket/unix-listen-cl=
eanup&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0test_io_channel_unix_listen_cleanup);<br>
=C2=A0#endif /* _WIN32 */<br></blockquote><div><br></div><div>The comments =
needs to be updated</div><br clear=3D"all"></div><br>-- <br><div dir=3D"ltr=
">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000aeb8ec05e5290185--

