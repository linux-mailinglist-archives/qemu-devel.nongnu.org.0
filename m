Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2123FC7AF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 14:57:17 +0200 (CEST)
Received: from localhost ([::1]:35586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3KG-0005kd-IB
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 08:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mL2kj-0001gV-Jb
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:20:33 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mL2kh-0007xh-KD
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:20:33 -0400
Received: by mail-ed1-x52a.google.com with SMTP id i6so26522560edu.1
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 05:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G9ph7HfEb5LaS/0pIVfDNtyjKp58+ZKl39AxM9+dyKQ=;
 b=QnOnQfJ+q02Wgqgg41KvzVvJFfcWJ0dUsiQb/FQ5HwfkSfPHPcT9Jwf02oeBnJNvAi
 PNixFUlD4NNOuFoTucGs+kN46vDxr6gb6npOIppcbt4y4q1ahrbHufcMxaQS5SjoMWZJ
 Lg0moMgKaiLmJTtR4QC1Eo6QXlBm11GU+GYPU/G9AuR5QJ7stQv7L9JsEbHROFmF5XpA
 vwn4h6tkxBQa3FfeXPKJwtRrEGVmLNM59DXzLVc6C8+/ecgmvFQrfQBkIKWQfn1kX8GH
 KjBUnSYRpB+d5s7yQjyuK+KLpBRZvc1PPNzbg0NH1NrYPBeQhZxP6RHrmhl/CMOevX7V
 rfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G9ph7HfEb5LaS/0pIVfDNtyjKp58+ZKl39AxM9+dyKQ=;
 b=lVpPf/GBmSZUmmCfSL1LGWabqVT9ptyu5BhoWMRbqUDxYA73uH7vy/bDpqzijw7n9d
 +uT82CDLXAvMWCvV34/48WKFzeiWIjJY6NesDNx5o32AcGTBa6OKwp0nGynfszyZ2SKm
 oABQugEeDtuqrK9hNQk2/jP65sGGTb4dFTGQKuPMF96JLBmuUyHlmlPBhTlcCdu1e1IY
 bfeaBIVHtOitvxJZPDh+KCMoKaNa8w7fraIO32X9waUZwOIiD7KkIxzSICkc7bMoBY1p
 NpCcj2IeR4fDsj9gLYwdRID6x446oEgfKbztlAZ/CBBqTNS5DPJoCZM+g0vytKsSmXJo
 cV8Q==
X-Gm-Message-State: AOAM531UvZS6ifnOL79dKStZ3Yy+XmhdWH80mhrXxZ2blOyf2Oduqa/Z
 ckdV4ieu3ahkMo/MkrNVWrqtuKZZfOeoAfU/hRA=
X-Google-Smtp-Source: ABdhPJyZG7/50e+Lu2nL6N1oVrTysD68sBHG15bR5zeTcGk7O7Y0sgtwHRFICQU0jCh5ig7AIX3X8b3lVjiFFBMXcCs=
X-Received: by 2002:aa7:ccda:: with SMTP id y26mr21824687edt.245.1630412430145; 
 Tue, 31 Aug 2021 05:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
 <12894fce-38cd-8d29-9c2b-fc2d8f73a42f@msgid.tls.msk.ru>
 <1706f18b-d6e3-e88c-ac12-decdfbd7d9b2@msgid.tls.msk.ru>
 <6dd4a9d9-c264-a747-0fb5-2d470f19ad16@msgid.tls.msk.ru>
 <CAFEAcA-XyxFpVD--uO9QzVWirYb7RE=OoAewueFy1AN0zyz++Q@mail.gmail.com>
 <314d03f8-1270-e146-3806-74752fe970f5@msgid.tls.msk.ru>
 <CAFEAcA-sZ_BMeydW6-iqdGQnETC5Gb0FLaCFgCgnZWZecMaD8g@mail.gmail.com>
In-Reply-To: <CAFEAcA-sZ_BMeydW6-iqdGQnETC5Gb0FLaCFgCgnZWZecMaD8g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 31 Aug 2021 16:20:17 +0400
Message-ID: <CAJ+F1C+YK75sQo2rmM18fZ31tDaV2Pi-XeLcCTtSuXL3ORVPmw@mail.gmail.com>
Subject: Re: [PATCH] util: fix abstract socket path copy
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bc7e5a05cad9f9e6"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: xiaoqiang zhao <zxq_yx_007@163.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bc7e5a05cad9f9e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 31, 2021 at 2:32 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 31 Aug 2021 at 11:17, Michael Tokarev <mjt@tls.msk.ru> wrote:
> >
> > 31.08.2021 12:53, Peter Maydell wrote:
> > > On Mon, 30 Aug 2021 at 23:30, Michael Tokarev <mjt@tls.msk.ru> wrote:
> > >>
> > >> 31.08.2021 01:06, Michael Tokarev wrote:
> > >> ...
> > >>> And this is the value used to be returned in the
> getsockname/getpeername
> > >>> calls.
> > >>>
> > >>> So this has nothing to do with socket being abstract or not. We
> asked for
> > >>> larger storage for the sockaddr structure, and the kernel was able
> to build
> > >>> one for us, including the trailing \0 byte.
> > >
> > >> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > >> index f2f3676d1f..83926dc2bc 100644
> > >> --- a/util/qemu-sockets.c
> > >> +++ b/util/qemu-sockets.c
> > >> @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
> > >>        SocketAddress *addr;
> > >>        struct sockaddr_un *su =3D (struct sockaddr_un *)sa;
> > >>
> > >> +    /* kernel might have added \0 terminator to non-abstract socket
> */
> > >>        assert(salen >=3D sizeof(su->sun_family) + 1 &&
> > >> -           salen <=3D sizeof(struct sockaddr_un));
> > >> +           salen <=3D sizeof(struct sockaddr_un) + su->sun_path[0] =
? 1
> : 0);
> > >
> > > Q: Why are we imposing an upper limit on salen anyway?
> > > We need the lower limit because salen is supposed to include
> > > the whole of the 'struct sockaddr_un' and we assume that.
> > > But what's the upper limit here protecting?
> >
> > It is not about protection really, it is about correctness.
> > This is actually a grey area. This single trailing \0 byte
> > depends on the implementation. Please read man 7 unix -
> > especially the "Pathname sockets" and BUGS sections.
>
> Yes, I know about that. Why are we assert()ing ? Our
> implementation here doesn't care whether the struct
> we're passed is exactly the size of a sockaddr_un,
> a bit bigger than it, or 5 bytes bigger. We're not going
> to crash or misbehave if the caller passes us in an oversized
> buffer.
>

The minimal len check seems appropriate, since the function accesses at
least the first X bytes (3 I suppose).

While at it I probably added an upper bound that I thought made sense (the
size of sockaddr_un), but I did wrong.

But now, I also think we can remove the upper bound check.


> > > Q2: why does our required upper limit change depending on whether
> > > there happens to be a string in the sun_path array or not ?
> >
> > Because for abstract sockets (the ones whos name starts with \0
> > byte) the sun_path is treated as a blob of given length, without
> > the additional trailing \0, and neither the kernel nor userspace
> > is trying to add the terminator, while for pathname sockets this
> > is not the case and someone has to add the trailing \0 somewhere.
>
> Ah, I hadn't realized about the abstract-sockets case. Thanks.
>
> -- PMM
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bc7e5a05cad9f9e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 31, 2021 at 2:32 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Tue, 31 Aug 2021 at 11:17, Michael Tokarev &lt;<a href=3D"mailto=
:mjt@tls.msk.ru" target=3D"_blank">mjt@tls.msk.ru</a>&gt; wrote:<br>
&gt;<br>
&gt; 31.08.2021 12:53, Peter Maydell wrote:<br>
&gt; &gt; On Mon, 30 Aug 2021 at 23:30, Michael Tokarev &lt;<a href=3D"mail=
to:mjt@tls.msk.ru" target=3D"_blank">mjt@tls.msk.ru</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 31.08.2021 01:06, Michael Tokarev wrote:<br>
&gt; &gt;&gt; ...<br>
&gt; &gt;&gt;&gt; And this is the value used to be returned in the getsockn=
ame/getpeername<br>
&gt; &gt;&gt;&gt; calls.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; So this has nothing to do with socket being abstract or n=
ot. We asked for<br>
&gt; &gt;&gt;&gt; larger storage for the sockaddr structure, and the kernel=
 was able to build<br>
&gt; &gt;&gt;&gt; one for us, including the trailing \0 byte.<br>
&gt; &gt;<br>
&gt; &gt;&gt; diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
&gt; &gt;&gt; index f2f3676d1f..83926dc2bc 100644<br>
&gt; &gt;&gt; --- a/util/qemu-sockets.c<br>
&gt; &gt;&gt; +++ b/util/qemu-sockets.c<br>
&gt; &gt;&gt; @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct =
sockaddr_storage *sa,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 SocketAddress *addr;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sockaddr_un *su =3D (struct=
 sockaddr_un *)sa;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 /* kernel might have added \0 terminator to no=
n-abstract socket */<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(salen &gt;=3D sizeof(su-&gt=
;sun_family) + 1 &amp;&amp;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeo=
f(struct sockaddr_un));<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeo=
f(struct sockaddr_un) + su-&gt;sun_path[0] ? 1 : 0);<br>
&gt; &gt;<br>
&gt; &gt; Q: Why are we imposing an upper limit on salen anyway?<br>
&gt; &gt; We need the lower limit because salen is supposed to include<br>
&gt; &gt; the whole of the &#39;struct sockaddr_un&#39; and we assume that.=
<br>
&gt; &gt; But what&#39;s the upper limit here protecting?<br>
&gt;<br>
&gt; It is not about protection really, it is about correctness.<br>
&gt; This is actually a grey area. This single trailing \0 byte<br>
&gt; depends on the implementation. Please read man 7 unix -<br>
&gt; especially the &quot;Pathname sockets&quot; and BUGS sections.<br>
<br>
Yes, I know about that. Why are we assert()ing ? Our<br>
implementation here doesn&#39;t care whether the struct<br>
we&#39;re passed is exactly the size of a sockaddr_un,<br>
a bit bigger than it, or 5 bytes bigger. We&#39;re not going<br>
to crash or misbehave if the caller passes us in an oversized<br>
buffer.<br></blockquote><div><br></div><div>The minimal len check seems app=
ropriate, since the function accesses at least the first X bytes (3 I suppo=
se).<br></div><div><br></div><div>While at it I probably added an upper bou=
nd that I thought made sense (the size of sockaddr_un), but I did wrong.</d=
iv><div><br></div><div>But now, I also think we can remove the upper bound =
check.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
&gt; &gt; Q2: why does our required upper limit change depending on whether=
<br>
&gt; &gt; there happens to be a string in the sun_path array or not ?<br>
&gt;<br>
&gt; Because for abstract sockets (the ones whos name starts with \0<br>
&gt; byte) the sun_path is treated as a blob of given length, without<br>
&gt; the additional trailing \0, and neither the kernel nor userspace<br>
&gt; is trying to add the terminator, while for pathname sockets this<br>
&gt; is not the case and someone has to add the trailing \0 somewhere.<br>
<br>
Ah, I hadn&#39;t realized about the abstract-sockets case. Thanks.<br>
<br>
-- PMM<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bc7e5a05cad9f9e6--

