Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B61583F52
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:53:46 +0200 (CEST)
Received: from localhost ([::1]:41182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH31N-0004ld-Kh
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH2z4-0003Hy-05
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:51:22 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:41942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH2z2-00032H-9z
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:51:21 -0400
Received: by mail-lf1-x134.google.com with SMTP id t1so2687256lft.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ip6eWBQW05SA0snuKmP1KnUP59+YmnJoRMzzYhbgMw4=;
 b=cnWoovVtscjnopzFxvSb4nKwpTx3KaDqHdA4RILpA9L6H7eqfyQodCw79uP7aqZqH1
 1zj0O655LRuYDVoNbOIWoZWnDRklkUIEB5FTWs/zpCL/yx61I8nQZmcwlxbY/rDDaC4W
 6YQgSPF76MDAxJKv7nWx/vjRxiQeCaKdd/yuBeIMAKaSoOb56ZvBBFqOFcZ14OjlT1kr
 AkBLsaKqS0VFEB3CaCiZ7crUZyXuWtXAP73uMYM1DJDznnLme4LfjcF0GgDR/YUEzncH
 ug71l0bGZ1nNt74iuCO6yePQG4+GmU6DKPPJ62KIoU8WJrq2c7LbtNQ2q8CNaPGI/Px4
 6rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ip6eWBQW05SA0snuKmP1KnUP59+YmnJoRMzzYhbgMw4=;
 b=VpEa6w0srj53Z6Nyipfu+avUJmye5jONFfwhc0/ZAMylANuzxxr3Pp69kZefEMO9M6
 E7eu1L8gKXUJa23kiZkfta+sTTBqrIfAgKEKh/Qlv1aM/38bG7nYgXdO+r26jmPjqJMB
 O5a9nvnsOKw+WkSlkWr4lclyBNYHes4MqY8UKeyEa6NXJrIcCz+/rh1pe5kNWtvTtfAx
 5fwDYjgXrm/FoYcHrxSftCwL7nGgUd6+B2NqDcR213dkgI/+rGHCM3vKNniQ3izVu6iX
 J0ppFjo80twdHGq4654hp9i69vt8YG6x75/TTrnuHmzkjjkzaq+zglZ+9i8fR8FBL1Hl
 y0DQ==
X-Gm-Message-State: AJIora+FzDzabbj6ox50fHneugGtcwnpNjRFgAnnGfmxqznHv5G5PPqQ
 s34c8m6nL6zQr65EtoJtLmzqBDmGv/V/1W727jY=
X-Google-Smtp-Source: AGRyM1swLH21Ad4ccLGtimX3wGUIVtC521GjX6m5muHhmaYUBm5lLLmLb4RwVEAI6RZMn4ObQemARBwR2POpACQt+dA=
X-Received: by 2002:a05:6512:2621:b0:47f:d228:bdeb with SMTP id
 bt33-20020a056512262100b0047fd228bdebmr9138558lfb.121.1659012677689; Thu, 28
 Jul 2022 05:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220727132802.812580-1-bmeng.cn@gmail.com>
 <20220727132802.812580-2-bmeng.cn@gmail.com>
In-Reply-To: <20220727132802.812580-2-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jul 2022 16:51:06 +0400
Message-ID: <CAJ+F1CL5424FCqKcX9MQE+FQ8gzPrAttSbbstHYVhYyyQwK_eA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] util/qemu-sockets: Replace the call to close a
 socket with closesocket()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000054e46305e4dcfd34"
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

--00000000000054e46305e4dcfd34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 5:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> close() is a *nix function. It works on any file descriptor, and
> sockets in *nix are an example of a file descriptor.
>
> closesocket() is a Windows-specific function, which works only
> specifically with sockets. Sockets on Windows do not use *nix-style
> file descriptors, and socket() returns a handle to a kernel object
> instead, so it must be closed with closesocket().
>
> In QEMU there is already a logic to handle such platform difference
> in os-posix.h and os-win32.h, that:
>
>   * closesocket maps to close on POSIX
>   * closesocket maps to a wrapper that calls the real closesocket()
>     on Windows
>
> Replace the call to close a socket with closesocket() instead.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

This is a fix, could go in 7.1. Daniel, do you take it?

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Thanks

---
>
> (no changes since v1)
>
>  util/qemu-sockets.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 13b5b197f9..0e2298278f 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -487,7 +487,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Erro=
r
> **errp)
>
>          if (ret < 0) {
>              error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
> -            close(sock);
> +            closesocket(sock);
>              return -1;
>          }
>      }
> @@ -1050,7 +1050,7 @@ static int unix_connect_saddr(UnixSocketAddress
> *saddr, Error **errp)
>      return sock;
>
>   err:
> -    close(sock);
> +    closesocket(sock);
>      return -1;
>  }
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000054e46305e4dcfd34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 5:28 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
close() is a *nix function. It works on any file descriptor, and<br>
sockets in *nix are an example of a file descriptor.<br>
<br>
closesocket() is a Windows-specific function, which works only<br>
specifically with sockets. Sockets on Windows do not use *nix-style<br>
file descriptors, and socket() returns a handle to a kernel object<br>
instead, so it must be closed with closesocket().<br>
<br>
In QEMU there is already a logic to handle such platform difference<br>
in os-posix.h and os-win32.h, that:<br>
<br>
=C2=A0 * closesocket maps to close on POSIX<br>
=C2=A0 * closesocket maps to a wrapper that calls the real closesocket()<br=
>
=C2=A0 =C2=A0 on Windows<br>
<br>
Replace the call to close a socket with closesocket() instead.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>This is a fix, could go in 7.1. Daniel, do you take it?<br></div><div>=
<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; <br></div><d=
iv><br></div><div>Thanks</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
---<br>
<br>
(no changes since v1)<br>
<br>
=C2=A0util/qemu-sockets.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index 13b5b197f9..0e2298278f 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -487,7 +487,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error =
**errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errn=
o, &quot;Unable to set KEEPALIVE&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(sock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 closesocket(sock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1050,7 +1050,7 @@ static int unix_connect_saddr(UnixSocketAddress *sadd=
r, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return sock;<br>
<br>
=C2=A0 err:<br>
-=C2=A0 =C2=A0 close(sock);<br>
+=C2=A0 =C2=A0 closesocket(sock);<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000054e46305e4dcfd34--

