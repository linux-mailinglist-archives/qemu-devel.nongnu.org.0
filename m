Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B18442030
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:40:35 +0100 (CET)
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcEU-0001BI-47
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mhbBt-0006AT-JI
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:33:49 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mhbBr-0002fc-Fb
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:33:49 -0400
Received: by mail-ed1-x52e.google.com with SMTP id j21so43976808edt.11
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qNs+TidmQbrODkIyLVZFdZIg4ZB0UO355QpDXag/uaI=;
 b=WR5KYQI6hhJr4xSpFAbIJZlufAPvne4/4QG1mRjeFsw3EPnxBUZrW1/1YU3aH95pQa
 +Wpid8/VQDxp+5m/fGeNt3un30okBL3TuA3uULJeKsZWDaVSzOyHHMnGsu+ZhpsqhOlu
 X2uQxdgYkYODOkN/H6JY1mK634JJ06+oI7Dj/Zg5z9cGXOlYCtqiyIMM2CONaNmtzF3Y
 1RiIFIt0fVG6ShSbFSTM2b/jbeA+1ImKPYXgO1qqxMngDk0+uxJExrumgq3wPYNxTq2I
 IOvjlvlycTE65VW2u9cLWWK8sfRDgcrL+D4tc7P/gYLrt6G87QDwcjaQ+ruyvzNP0aq9
 TMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qNs+TidmQbrODkIyLVZFdZIg4ZB0UO355QpDXag/uaI=;
 b=y0shvald5YmfUvgNmEJdhGX42JFDd/vd/oD65hXY7VcLCrgLJMdCBs41QBfXBexPsK
 MFPZZjpAxHxTwpbRoL5jM39BJSqGQ3a7gABw0u9lAHhERVdBBocL002yqS6bb03B2oLp
 MZFZUbX7fQuBqDo9YDcTgk8T7QZN5nsk86snDjw9hhe8a7+hww8nEbSITqwsjsyMJPpq
 hxMlXRu1RijTtonOM1W3X3E+8LXqomuYthQuQ24H8tYRi9VlZFGr+gL8jDTSm+xJqOH2
 9FUvz1qKLtnyJ7Ne6Lv+cUPMnSA7uxIv4SpzINwCQs5/M4AEQ3NWadrgyC+tr55+vNgw
 h9YQ==
X-Gm-Message-State: AOAM530b6CrLv1Vmo+AKwts8MCaJuSpIbPJDVUmvXB3dSJkTroOsqygY
 pvArqA93sDwSldxbKiCgyOq3aBz483IROw7W3sXtoQ==
X-Google-Smtp-Source: ABdhPJzCB40rnhXAmZqE3YeALy86A/NDv/W59q0WhEBOhsvlSKBfwgXTlEE1tye0Db+A8EyXBtMNRqOrPIXwEKNpOQU=
X-Received: by 2002:a17:907:7803:: with SMTP id
 la3mr38663343ejc.235.1635788025872; 
 Mon, 01 Nov 2021 10:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
In-Reply-To: <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Mon, 1 Nov 2021 18:33:35 +0100
Message-ID: <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="00000000000035de0205cfbd94b4"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Tom Rini <trini@konsulko.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000035de0205cfbd94b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon

Le lun. 1 nov. 2021 =C3=A0 17:58, Simon Glass <sjg@chromium.org> a =C3=A9cr=
it :

> Hi Peter,
>
> On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wrote:
> > >
> > > Add this file, generated from qemu, so there is a reference devicetre=
e
> > > in the U-Boot tree.
> > >
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> >
> > Note that the dtb you get from QEMU is only guaranteed to work if:
> >  1) you run it on the exact same QEMU version you generated it with
> >  2) you pass QEMU the exact same command line arguments you used
> >     when you generated it
>
> Yes, I certainly understand that. In general this is not safe, but in
> practice it works well enough for development and CI.

You recognize that you hijack a product directory with development hack
facility. There is a test directory to keep things clear. There can be a
dev-dts or something similar for Dev time tools.
I have only seen push back on those fake dts files in the dts directory: I
guess that unless someone strongly favors a continuation of the discussion,
you may consider re-shaping the proposal to address concerns.

> I am able to use
> QEMU versions that differ by two years, partly because I am not trying
> to do anything clever.
>
> I have sent a patch to add an indication of where the devicetree came
> from, to help with visibility on this.
>
> Regards,
> Simon
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--00000000000035de0205cfbd94b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Simon</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 1 nov. 2021 =C3=A0 17:58, Simon=
 Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Peter,<br>
<br>
On Mon, 1 Nov 2021 at 04:48, Peter Maydell &lt;<a href=3D"mailto:peter.mayd=
ell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; On Tue, 26 Oct 2021 at 01:33, Simon Glass &lt;<a href=3D"mailto:sjg@ch=
romium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Add this file, generated from qemu, so there is a reference devic=
etree<br>
&gt; &gt; in the U-Boot tree.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org=
" target=3D"_blank">sjg@chromium.org</a>&gt;<br>
&gt;<br>
&gt; Note that the dtb you get from QEMU is only guaranteed to work if:<br>
&gt;=C2=A0 1) you run it on the exact same QEMU version you generated it wi=
th<br>
&gt;=C2=A0 2) you pass QEMU the exact same command line arguments you used<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0when you generated it<br>
<br>
Yes, I certainly understand that. In general this is not safe, but in<br>
practice it works well enough for development and CI. </blockquote><div dir=
=3D"auto">You recognize that you hijack a product directory with developmen=
t hack facility. There is a test directory to keep things clear. There can =
be a dev-dts or something similar for Dev time tools.=C2=A0</div><div dir=
=3D"auto">I have only seen push back on those fake dts files in the dts dir=
ectory: I guess that unless someone strongly favors a continuation of the d=
iscussion, you may consider re-shaping the proposal to address concerns.</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex" dir=3D"auto">I am able to use<br>
QEMU versions that differ by two years, partly because I am not trying<br>
to do anything clever.<br>
<br>
I have sent a patch to add an indication of where the devicetree came<br>
from, to help with visibility on this.<br>
<br>
Regards,<br>
Simon<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px=
" valign=3D"top"><img src=3D"https://static.linaro.org/common/images/linaro=
-logo-web.png"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&qu=
ot;Sans Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:=
rgb(87,87,87)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7oi=
s-Fr=C3=A9d=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)=
">|</span>=C2=A0<i>Director Business Development</i></td></tr><tr><td style=
=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;f=
ont-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a=
 value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><=
br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87)=
;text-decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0=
<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td=
></tr></tbody></table></td></tr></tbody></table></div></div></div></div></d=
iv><div><div><br style=3D"font-size:small"></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

--00000000000035de0205cfbd94b4--

