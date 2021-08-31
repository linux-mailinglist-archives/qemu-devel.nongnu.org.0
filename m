Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2113FC7CA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:03:21 +0200 (CEST)
Received: from localhost ([::1]:48504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3Q6-00062h-B6
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mL2wd-0005gr-JD; Tue, 31 Aug 2021 08:32:52 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mL2wc-0003Uy-1r; Tue, 31 Aug 2021 08:32:51 -0400
Received: by mail-ej1-x635.google.com with SMTP id i21so38357569ejd.2;
 Tue, 31 Aug 2021 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oBbkUGUbQNQfW8zDCJh2GTovLeF/kSQLYf/CTezdX9o=;
 b=UjHd3puR1J51v1cHhi0pLY9HYHFJ5Iz2g3UTIMO3LTOl9wWXFjp4eEyTxEclv9oDWa
 r4+TbdRx8AGU0uVa1KVkTnImFfUsHhX19e4yz6XMBUG/ISG+/VG0BChzy2qmu+buUuLf
 jkgQl2flVZQDqQAOr8nDbut7mXjvXPTNMEYx23XUdFi+T9sz2ts7j6TzIzTFu6pmqm/R
 FJxBPBWEpoWCTsdzmGqqj7MRnO1I0vhq9/kcX3X/BBxt1CL62aR1+7WUSJ74gu0dlFHu
 dArbxVyHR4R45DdXRujrak+kFFPL+SWWgHUuX8ZhE4APUwaJlmWrDkGha/hxSZn7/Ckp
 aObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oBbkUGUbQNQfW8zDCJh2GTovLeF/kSQLYf/CTezdX9o=;
 b=hAAetzpXgu46AQZqJn/2XYYk2DIc41lEsDDAUuS5H+K1GnUCN2uvgdDh9GiVHURC/Y
 SWWK1P2hxVZR+qIYYZidbSlpmeLVeNy7WqcdAnGvnY4MBUJIxBqkFwfz6GRT5zDZZJMz
 Onmlfxv2o5Ik57m5hn6xBajHToPGQlzRcoRLouDbR9yHKrw60PUjeHfok7Wnztoi1ATc
 q9G5QT9KY7n8dVgfdoAwOXRlwdOFxLFOD3Nduc3zDJXpoAWf0225JnGlr4ZB0/CDjLnX
 vwg4E6PmlDZhMu/tRIt9xsYtGZ3VOP6GrVekaQ74EVheB3/cY1e50hHQbQT4Y0iU27Fi
 x7KA==
X-Gm-Message-State: AOAM530QbU1n8stiEFj+ida8faWiTtCy+o2vR4hiyxdp5hysmowImijB
 xfvLbyPZNH6e0V08a94QdAZnagByHq5gYnXtRzfBhoAefaZdlg==
X-Google-Smtp-Source: ABdhPJylX2lm0CLTAFwimmv4vPYxR76hwpaXklwR9n+7FR8tji+GzyzIktrI0wX9Gca6J4ZlW3VkzuDSunInyUptw1s=
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr31084900ejy.532.1630413168124; 
 Tue, 31 Aug 2021 05:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210830225449.1509719-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20210830225449.1509719-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 31 Aug 2021 16:32:36 +0400
Message-ID: <CAJ+F1CLXQmwD2u-a4tLeSkCj6hgM-mUSD8bGHqmgXCrAuQ-+WA@mail.gmail.com>
Subject: Re: qemu-sockets: account for trailing \0 byte in unix socket pathname
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: multipart/alternative; boundary="000000000000b928f505cada2580"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b928f505cada2580
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 31, 2021 at 3:00 AM Michael Tokarev <mjt@tls.msk.ru> wrote:

> Linux kernel can return size of af_unix socket to be
> one byte larger than sockaddr_un structure - adding
> the trailing zero byte.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)
> Cc: qemu-stable@nongnu.org
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index f2f3676d1f..83926dc2bc 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
>      SocketAddress *addr;
>      struct sockaddr_un *su =3D (struct sockaddr_un *)sa;
>
> +    /* kernel might have added \0 terminator to non-abstract socket */
>      assert(salen >=3D sizeof(su->sun_family) + 1 &&
> -           salen <=3D sizeof(struct sockaddr_un));
> +           salen <=3D sizeof(struct sockaddr_un) + su->sun_path[0] ? 1 :=
 0);
>
>
Looks right, but we may want to drop the upper bound check altogether. I
thought the path must always fit the sockaddr_un, but since that's not the
case it's only harmful here.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

     addr =3D g_new0(SocketAddress, 1);
>      addr->type =3D SOCKET_ADDRESS_TYPE_UNIX;
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b928f505cada2580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Aug 31, 2021 at 3:00 AM Michael Tokar=
ev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.ru</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Linux kernel can ret=
urn size of af_unix socket to be<br>
one byte larger than sockaddr_un structure - adding<br>
the trailing zero byte.<br>
<br>
Signed-off-by: Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru" target=
=3D"_blank">mjt@tls.msk.ru</a>&gt;<br>
Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)<br>
Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-stable=
@nongnu.org</a><br>
<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index f2f3676d1f..83926dc2bc 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct sockaddr_stora=
ge *sa,<br>
=C2=A0 =C2=A0 =C2=A0SocketAddress *addr;<br>
=C2=A0 =C2=A0 =C2=A0struct sockaddr_un *su =3D (struct sockaddr_un *)sa;<br=
>
<br>
+=C2=A0 =C2=A0 /* kernel might have added \0 terminator to non-abstract soc=
ket */<br>
=C2=A0 =C2=A0 =C2=A0assert(salen &gt;=3D sizeof(su-&gt;sun_family) + 1 &amp=
;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeof(struct socka=
ddr_un));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeof(struct socka=
ddr_un) + su-&gt;sun_path[0] ? 1 : 0);<br>
<br></blockquote><div><br></div><div>Looks right, but we may want to drop t=
he upper bound check altogether. I thought the path must always fit the soc=
kaddr_un, but since that&#39;s not the case it&#39;s only harmful here.<br>=
</div><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0addr =3D g_new0(SocketAddress, 1);<br>
=C2=A0 =C2=A0 =C2=A0addr-&gt;type =3D SOCKET_ADDRESS_TYPE_UNIX;<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b928f505cada2580--

