Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F116D44E4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:52:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJfE-0007Uo-Ad; Mon, 03 Apr 2023 08:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pjJf9-0007NA-LL
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:51:55 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pjJf7-0002Ev-7k
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:51:55 -0400
Received: by mail-ed1-x536.google.com with SMTP id r11so116903856edd.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680526311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XZQJ/SrYT2XIXIybDEy8fy9yAPBlgN02xPp8TzIOe1c=;
 b=AeL9jhMVDHtjt7zUi5FEnjT0ynv5jDd6G+GNP1B5/IC+0GYgSVEf1fADuAeUgy1HeU
 anDuUAKFfqJQxOAfesN17pCekg9Fd9HdToD4CA7kEnHQAu1gVllG67tQrUXgU05ahNdm
 TSRWc8Jlkx28HHcQwVWjggSA6qCQnQYnIS3OJXm6fBUYJASNKAHUEuK7x/IF7X5dsWLI
 a42l5UUoV4OXYYILX/nwBJKACAu2WTCuy1Fzh8ZFli4wjMaJ6L5ey5x7HPEehDNN2vBv
 Rr7/vtgOHbgRfQniRshziFJxLsq//zt/BijS2VeUKBN0c2qp4VBf5+0YlFc6jijuTfOK
 87oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680526311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XZQJ/SrYT2XIXIybDEy8fy9yAPBlgN02xPp8TzIOe1c=;
 b=xjqIiQcImYJ/ai/AdWhcr9Tsi6bzGgy3n/zqhOzx94HITnIcViK3dcogj3QGD8KdeE
 HGmFaUsKjgo+kgaFitdoUlrTe2GkMZMN7cUW5ZkqwyR22dLHfq/DsxCAx2gKujaqCyWv
 5AQHZLTh+0tAjii+k0JKBUN/s5mtDTlf4XIFP3dpVk1FwLGFTQQdfOiLE5BUh2UugYew
 FFe6Sy0cUmRokPC8++JxugnJbSD+iIKTt6a7Uut9+ecYydpcQrSPXCwzY0Y3HgcITwJ+
 r0xCqaeWCcXxc2tE1iSBPQRW/68UX3fLDEg7XRqhdTlc1NE2r0/lvrN2A0WqmsYsyn40
 jz/g==
X-Gm-Message-State: AAQBX9foH9PmRiYYKI3mQ6WOn8EvSgSP6Gxzs0K4SPhaNCQdMUWIhZfQ
 P6wVeYG237Lo18YZm1D+EWWTXm+0P7ZVAHR8cTPkIlrD7lZG6tCO
X-Google-Smtp-Source: AKy350ZOwiY2n6Mr3RTl3w4X9d5ioymnbgLgvPTeiEHgmgovO0zMa3nVX7jEzC0LmBA/cEeoMKEvCRTfvAzjZBguigE=
X-Received: by 2002:a50:bac7:0:b0:4ad:6052:ee90 with SMTP id
 x65-20020a50bac7000000b004ad6052ee90mr17501610ede.7.1680526311536; Mon, 03
 Apr 2023 05:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230403120250.2071560-1-alex.bennee@linaro.org>
 <64964f55-345a-843a-aca1-ba28e10bf75e@linaro.org>
In-Reply-To: <64964f55-345a-843a-aca1-ba28e10bf75e@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 3 Apr 2023 06:51:40 -0600
Message-ID: <CANCZdfr=0rxY=os4DPJv99vJX-GiGZ9GVOP8uQh1UYLX-7=5=A@mail.gmail.com>
Subject: Re: [RFC PATCH] gdbstub: don't report auxv feature unless on Linux
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Lirong Yuan <yuanzi@google.com>
Content-Type: multipart/alternative; boundary="000000000000d5cf4905f86e05fc"
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000d5cf4905f86e05fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023, 6:37 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
>
wrote:

> On 3/4/23 14:02, Alex Benn=C3=A9e wrote:
> > The later handler if conditionally compiled only for Linux but we
> > forgot to ensure we don't advertise it lest we confuse our BSD
> > brethren.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   gdbstub/gdbstub.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> > index 2a66371aa5..0760d78685 100644
> > --- a/gdbstub/gdbstub.c
> > +++ b/gdbstub/gdbstub.c
> > @@ -1468,7 +1468,7 @@ static void handle_query_supported(GArray *params=
,
> void *user_ctx)
> >               ";ReverseStep+;ReverseContinue+");
> >       }
> >
> > -#ifdef CONFIG_USER_ONLY
> > +#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
> >       if (gdbserver_state.c_cpu->opaque) {
> >           g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+")=
;
> >       }
>
> Fixes: 51c623b0de ("gdbstub: add support to Xfer:auxv:read: packet")
> Reported-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>
Tested-by: Warner Losh <imp@bsdimp.com>

I can debug with this now. Cross debugging of binaries in a chroot with gdb
has issues though... that's orthogonal to this patch...

Warner

>

--000000000000d5cf4905f86e05fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 3, 2023, 6:37 AM Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On 3/4/23 14:02, Alex Benn=C3=A9=
e wrote:<br>
&gt; The later handler if conditionally compiled only for Linux but we<br>
&gt; forgot to ensure we don&#39;t advertise it lest we confuse our BSD<br>
&gt; brethren.<br>
&gt; <br>
&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0gdbstub/gdbstub.c | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c<br>
&gt; index 2a66371aa5..0760d78685 100644<br>
&gt; --- a/gdbstub/gdbstub.c<br>
&gt; +++ b/gdbstub/gdbstub.c<br>
&gt; @@ -1468,7 +1468,7 @@ static void handle_query_supported(GArray *param=
s, void *user_ctx)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;;ReverseSt=
ep+;ReverseContinue+&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -#ifdef CONFIG_USER_ONLY<br>
&gt; +#if defined(CONFIG_USER_ONLY) &amp;&amp; defined(CONFIG_LINUX)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gdbserver_state.c_cpu-&gt;opaque) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_append(gdbserver_stat=
e.str_buf, &quot;;qXfer:auxv:read+&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Fixes: 51c623b0de (&quot;gdbstub: add support to Xfer:auxv:read: packet&quo=
t;)<br>
Reported-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_b=
lank" rel=3D"noreferrer">imp@bsdimp.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank" rel=3D"noreferrer">philmd@linaro.org</a>&gt;<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Review=
ed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>=
&gt;</div><div dir=3D"auto">Tested-by: Warner Losh &lt;<a href=3D"mailto:im=
p@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I can debug with this now. Cross debugging of binaries in a ch=
root with gdb has issues though... that&#39;s orthogonal to this patch...</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Warner=C2=A0</div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000d5cf4905f86e05fc--

