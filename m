Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F9D4C43F7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 12:53:45 +0100 (CET)
Received: from localhost ([::1]:60518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZAO-00068R-IR
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 06:53:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1nNZ1h-0007aC-6i; Fri, 25 Feb 2022 06:44:45 -0500
Received: from [2a00:1450:4864:20::632] (port=44670
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1nNZ1d-0001ST-T4; Fri, 25 Feb 2022 06:44:44 -0500
Received: by mail-ej1-x632.google.com with SMTP id p14so10264352ejf.11;
 Fri, 25 Feb 2022 03:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUHQicd6FQDPefJ9NMTQz9Tys3iyG0hW5qYJnYhCt28=;
 b=ICUYvLvwcZP9Tk8MNtr1G+6xqbmkJuHbw3lywqsl1rO4zld+WVJ0RPZ1H08di/jgUn
 gOOep89tsJPpi2au3DRqj8hhl1PDRzfDs1319x9LdP9NnMc/Dn+B73eXKc6YxIWodcRn
 udngohSrELC1FlV+YqErIuSLOlDppDhKjfZlmp+CnMV0yL+mPNoCbFK/NOakzLoJ9/gB
 9HXg54yS+n+P1BgqEN5L7DHi6ikQjelMiBeRyuMue1+NQdSUaY3tCKCx1xhvGK9yllBT
 YPRoeB+63RnEAKS5Z5DPRnwIO8X+ttMYSGh9KsUAX5poXi9gPqPFuA3lL5l1SLFV/Wv/
 BnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUHQicd6FQDPefJ9NMTQz9Tys3iyG0hW5qYJnYhCt28=;
 b=NZ68jhfnvUMzKXaaXIOed6GQ7VvtZV/dClxw3psflOzNwFjwXk3jzTR7Ao3u3VbZkN
 xGP+rsXMvaTQE+Dl/pcnTh/4vx6BnEhLjZWSaw/AL8CYqECa8jwkBTxor19DtdO8CIns
 hINiK66BDI0xy+wwF8AjVGfas+ELxRcXQs0ywZNaTSY0ryHv8Ct6EVCf0tQOazkmZp2V
 eFCdCAGFu/pGaUT8NaYOvCD9nGNDfEJ5HCh5hKJtw4eQ0cOAHp/gPOxl3j1Vn3FSGgKk
 Jogr73qDPYRuHInYvI1EiVS9Uo+CZY+QYSqhR5fD2/dhz+ru1DXz/jkx7KY9LyG3Ul00
 Arfg==
X-Gm-Message-State: AOAM531OqwYh/aq5Ob9iSrPxPUZwtEKqUo2+BMBQZ0rIYXLv1smCMmdx
 7B31JU/lBKaSyk/NSBEb/a1qpNSbL458D5autyc=
X-Google-Smtp-Source: ABdhPJzryof5GDlf7/E3P33WgDmTPQUPQdK38UsaEBc3Y2RdvRFCPKXk1fGzdKVpXcrYdHMvLVcssHnLj5w+Ub7xCBo=
X-Received: by 2002:a17:906:4783:b0:6d0:9b6e:b5a5 with SMTP id
 cw3-20020a170906478300b006d09b6eb5a5mr6138216ejc.526.1645789479419; Fri, 25
 Feb 2022 03:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20220224122110.22371-1-evgeny.v.ermakov@gmail.com>
 <CAFEAcA8zKcZ7=gRmKX0fygpdmYfEf-HEodfH+SXwS_fT+rt2Ag@mail.gmail.com>
In-Reply-To: <CAFEAcA8zKcZ7=gRmKX0fygpdmYfEf-HEodfH+SXwS_fT+rt2Ag@mail.gmail.com>
From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Date: Fri, 25 Feb 2022 22:44:27 +1100
Message-ID: <CABbZYZJhiA6GoTDjNX6W1tAX3c-1TCAQuX2SczGyZXjrO3grmA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/armv7m_nvic: Fix typo in comment
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004bc2e405d8d63930"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=evgeny.v.ermakov@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004bc2e405d8d63930
Content-Type: text/plain; charset="UTF-8"

Ah, indeed.

Sorry for having bothered you.


On Thu, 24 Feb 2022, 23:46 Peter Maydell, <peter.maydell@linaro.org> wrote:

> On Thu, 24 Feb 2022 at 12:22, Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
> wrote:
> >
> > Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
> > ---
> >  hw/intc/armv7m_nvic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> > index 13df002ce4..a08a0fdc50 100644
> > --- a/hw/intc/armv7m_nvic.c
> > +++ b/hw/intc/armv7m_nvic.c
> > @@ -97,7 +97,7 @@ static int nvic_pending_prio(NVICState *s)
> >   * this is only different in the obscure corner case where guest
> >   * code has manually deactivated an exception and is about
> >   * to fail an exception-return integrity check. The definition
> > - * above is the one from the v8M ARM ARM and is also in line
> > + * above is the one from the v8M ARM and is also in line
> >   * with the behaviour documented for the Cortex-M3.
> >   */
>
> This is not a typo. The "ARM ARM" (or "Arm ARM" these days if
> you want to follow the official corporate name capitalization)
> is the standard abbreviated way to refer to the
> Arm Architecture Reference Manual. "git grep -i 'arm arm'"
> finds over 50 uses of it in various comments.
>
> thanks
> -- PMM
>

--0000000000004bc2e405d8d63930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Ah, indeed.<div dir=3D"auto"><br></div><div dir=3D"a=
uto">Sorry for having bothered you.<br></div><br><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 24 Feb 2022, 23:46 Peter=
 Maydell, &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank"=
 rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Thu, 24 Feb 2022 at 12:22, Evgeny Ermakov &lt;<=
a href=3D"mailto:evgeny.v.ermakov@gmail.com" rel=3D"noreferrer noreferrer" =
target=3D"_blank">evgeny.v.ermakov@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Evgeny Ermakov &lt;<a href=3D"mailto:evgeny.v.ermakov@g=
mail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">evgeny.v.ermakov@=
gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/intc/armv7m_nvic.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c<br>
&gt; index 13df002ce4..a08a0fdc50 100644<br>
&gt; --- a/hw/intc/armv7m_nvic.c<br>
&gt; +++ b/hw/intc/armv7m_nvic.c<br>
&gt; @@ -97,7 +97,7 @@ static int nvic_pending_prio(NVICState *s)<br>
&gt;=C2=A0 =C2=A0* this is only different in the obscure corner case where =
guest<br>
&gt;=C2=A0 =C2=A0* code has manually deactivated an exception and is about<=
br>
&gt;=C2=A0 =C2=A0* to fail an exception-return integrity check. The definit=
ion<br>
&gt; - * above is the one from the v8M ARM ARM and is also in line<br>
&gt; + * above is the one from the v8M ARM and is also in line<br>
&gt;=C2=A0 =C2=A0* with the behaviour documented for the Cortex-M3.<br>
&gt;=C2=A0 =C2=A0*/<br>
<br>
This is not a typo. The &quot;ARM ARM&quot; (or &quot;Arm ARM&quot; these d=
ays if<br>
you want to follow the official corporate name capitalization)<br>
is the standard abbreviated way to refer to the<br>
Arm Architecture Reference Manual. &quot;git grep -i &#39;arm arm&#39;&quot=
;<br>
finds over 50 uses of it in various comments.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div></div>

--0000000000004bc2e405d8d63930--

