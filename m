Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FCB445287
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 12:52:04 +0100 (CET)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mibHn-00049X-P1
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 07:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mibEB-0001KM-Id
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:48:21 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mibE8-00059x-9B
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:48:19 -0400
Received: by mail-ed1-x534.google.com with SMTP id f8so20455264edy.4
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EtvTdyRWiBAsBHuk9zXxHCBEqxeWQ0C5XA1mqTkjf9c=;
 b=nhMTqU6rEf2yH+2VyCkCU/JXk23AvgKGCfq7hty/3+pzrdwIy6foyhUfr7jxIXz0er
 kV+bdv7nMsHpArdMr6SrlZzap1mngoK++WqDAZ6+GqHqvj09zdS0KrpWJrLp7l/oqetH
 K1iM0hW5Wl5HjUgJTzX/CUHC8SfXez3tieRULm3ZxQ8dW75qNkhDlr/8zFgs0qHvio9L
 PCBAY2xMeU/RcjZSQuuXG1LzG3cxOBlIYGC5Z6Bjoj/nQTN3s2CBZLOAplZiSFpZELoM
 hboDOrUgFTWqn+iKQl9FJmKgYilGK+eawsckS3nl2C4XjQad60LZjkLxGWcnI5NkZOai
 PU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EtvTdyRWiBAsBHuk9zXxHCBEqxeWQ0C5XA1mqTkjf9c=;
 b=JR8HyNSZ4LUGUabQFVDBl25vq7knIbZkrBPFVAEjtqEDE/OM0JY5ELcDPuTYjDDBMa
 /+2H+35ZaF8Y9dMJ10fcaZ6ZWJxt1Yl0eZIcbgI18lzucZE6MncUKXJpvzWUKpihqafH
 u0h2IUclplEEn+6HRFozUBwk3ErBxgGNFjtSnYYzagIeSwm//VRGlRHWrLZWe43dwJ4H
 3H98dOIIEXRx2Eioe1/xphWYKYLMic0FmCU3FahH5HxzY8E0iTomXOlOvPMnHfMlzrq6
 Pjz46PlbriMo9Kxj2hMt7CQhTeWKy0NZAaowRUO3o1/kKqJ0rpcoDm0oTbU8TRQvXCZc
 x6Tw==
X-Gm-Message-State: AOAM533VzlbC+RhBwrMRZlLvEP1P6NlKo0yvYZ6X7dP5AFgKP92sQ3q+
 ehhJASi+GFUJ4NZWPdtU4QNJC0MiJRCwHOAb8XxiiQ==
X-Google-Smtp-Source: ABdhPJwNO6YukHmWnLkVbyTP91pePpDLyZNFTe7ppi8y+aQMBeDJtHGiTgggPwWG7H4ikf2xJ6FvlORA5U2+XgMjlA4=
X-Received: by 2002:a05:6402:2693:: with SMTP id
 w19mr4743920edd.257.1636026492563; 
 Thu, 04 Nov 2021 04:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <20211101180707.GJ24579@bill-the-cat>
 <CAPnjgZ0XeFHrXwBuTZ=eoKHCo7cMSuM_gUiTfv-Sqt8o6tPOXw@mail.gmail.com>
 <20211102172833.GS24579@bill-the-cat>
 <CAPnjgZ1zDeXMCtccy6=cQzjjAz92xJZunObm2OYKZ2eyP=Sdsw@mail.gmail.com>
 <CAHFG_=UTbUkZ3EUss4qoJwL6nJcL6tvZQATfPrH1WFQpRgqubQ@mail.gmail.com>
 <20211103144125.GZ24579@bill-the-cat>
 <CAFEAcA955NWTGhaEHYqjWppsDxH4BDEX4NiAew69mkwCVvjnLw@mail.gmail.com>
 <CAHFG_=WhM2-oByH2-WZO5prQx548JJFFGf2+TsUWOg_Sw+-6hA@mail.gmail.com>
 <CAFEAcA9WSzk5qYwm9U0BSiM_DUXnERV_59WKbdQU-PwaY18gAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9WSzk5qYwm9U0BSiM_DUXnERV_59WKbdQU-PwaY18gAQ@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Thu, 4 Nov 2021 12:48:01 +0100
Message-ID: <CAHFG_=WbVExqerobsP1iPeoZip5mVE3ge_7xDU5LB63t5bnp3w@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000eeccba05cff51936"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Tom Rini <trini@konsulko.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eeccba05cff51936
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter

Le jeu. 4 nov. 2021 =C3=A0 12:41, Peter Maydell <peter.maydell@linaro.org> =
a
=C3=A9crit :

> On Thu, 4 Nov 2021 at 11:22, Fran=C3=A7ois Ozog <francois.ozog@linaro.org=
>
> wrote:
> > Le jeu. 4 nov. 2021 =C3=A0 12:09, Peter Maydell <peter.maydell@linaro.o=
rg> a
> =C3=A9crit :
> >>
> >> Well, our recommendation really was that the ideal thing would
> >> be "you take the dtb that QEMU passes you at runtime, and at
> >> runtime combine that with whatever extra information you want".
> >
> > That looks just reasonable this way.
>
> > So we need a =C2=AB -mergedtb =C2=BB option for Qemu to have the same
> > capability. This would merge the QEMU generated one with the
> > command line provided.
>
> No, I mean that the guest, ie u-boot, should do the merging,
> not QEMU.

for most of the cases it works. But, as I tried to explain some cases need
earlier merging hence trying to get QEMU do the same thing as TFA as =C2=AB
prior loaders =C2=BB in the boot chain. Worst case we can have the behavior=
 by
booting TFA then U-Boot then Linux under QEMU, but the best would be to get
the facility directly when TFA is not on the path of the boot like with the
VBE boot flow.

>
>
> -- PMM
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000eeccba05cff51936
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Peter</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 4 nov. 2021 =C3=A0 12:41, Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On Thu, 4 Nov 2021 at 11:22, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:franc=
ois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wro=
te:<br>
&gt; Le jeu. 4 nov. 2021 =C3=A0 12:09, Peter Maydell &lt;<a href=3D"mailto:=
peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt=
; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; Well, our recommendation really was that the ideal thing would<br>
&gt;&gt; be &quot;you take the dtb that QEMU passes you at runtime, and at<=
br>
&gt;&gt; runtime combine that with whatever extra information you want&quot=
;.<br>
&gt;<br>
&gt; That looks just reasonable this way.<br>
<br>
&gt; So we need a =C2=AB -mergedtb =C2=BB option for Qemu to have the same<=
br>
&gt; capability. This would merge the QEMU generated one with the<br>
&gt; command line provided.<br>
<br>
No, I mean that the guest, ie u-boot, should do the merging,<br>
not QEMU.</blockquote><div dir=3D"auto">for most of the cases it works. But=
, as I tried to explain some cases need earlier merging hence trying to get=
 QEMU do the same thing as TFA as =C2=AB prior loaders =C2=BB in the boot c=
hain. Worst case we can have the behavior by booting TFA then U-Boot then L=
inux under QEMU, but the best would be to get the facility directly when TF=
A is not on the path of the boot like with the VBE boot flow.</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex" dir=3D"auto"><br>
<br>
-- PMM<br>
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

--000000000000eeccba05cff51936--

