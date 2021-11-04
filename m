Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3417C44522A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 12:24:45 +0100 (CET)
Received: from localhost ([::1]:50950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miarL-0003wU-4V
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 07:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1miapO-0002QU-UC
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:22:42 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1miapL-0008Ic-Ie
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:22:42 -0400
Received: by mail-ed1-x52c.google.com with SMTP id w1so20228621edd.10
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 04:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zsfY9y4eme+dp5ysAplQ2qUaEQlvqhJGj9hVQcV/nr4=;
 b=wVnDeCxAlN/4f/T55eApLt+ASqPQxzmz9YcXoi9eR1RXbFvjKzvvZhVrmqhuapbxV9
 i/6ClSLA4R5kjAyKR6P7SmTGrQueVijQNJt5cKJT3NMRnVbIkdwelwA68XQJsqd1wYtD
 PIGdUe3gClVaZ51yQ7Hi+98W65mlIe05YL9Az4MWAvltDq6WlclvohGG82EWD59pxQhh
 CwqHtI1YkJUEpdir58Fs0W/K0owKoTdj5fZGIvl+y1Dzf+vvXe4by4VOTw529gYyO2pD
 +qpgEJWS1gGosBOuD8uwG/K/bSfihLNUIJny2E6bgNLaTnh5zui7WfarSIvrMKbYO2Up
 Mwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zsfY9y4eme+dp5ysAplQ2qUaEQlvqhJGj9hVQcV/nr4=;
 b=t8R0XHy5TkwJWp+8ipZ6/NIm5C/fyvbH6qiuyac82859xaJLkL+I0ev6ZibBnXGxMJ
 3g4WsEBmfOTcHjwhgmBz1qJ4v0glLD+C8bY3rcGyzL3TAnQESJ3xqlgO2o3DCqqo+Owz
 lhaDfvRp/7oiz7nzWFMjO7JY4u4obTBadYPoR1oShgFSIfS122uFk/Ji961Eif5YLN24
 /SG7tSP0qOESsPlW7yuxY5nGEAkbV9kbIWKGQI+0nQak8KBrDPSQ4gDCGD644+kyEgKX
 LgIPr7wG0u+3nhGcr2VAlOab4OXcIaNfhLUHXXGqYh1ReiJ6jzRBcK18X74DcqiCg7cD
 jmfA==
X-Gm-Message-State: AOAM531V1wwS25TSfI3HqyC5cTFdA5dd/tO9uGSMB/b1bBFmO/QZLxJO
 +F9if5jq/avf4F5Fzim6iB1Kf4Pk0iauk+oNifmotg==
X-Google-Smtp-Source: ABdhPJxHCwKLhS4ioEDYOPZ15dNzLjb91NT2cCro60zhzk8s4/bMheTGa6b3XBtjG1X5lYVW2XoVTUG2gQ2wPJvromA=
X-Received: by 2002:a17:906:b209:: with SMTP id
 p9mr11889997ejz.66.1636024956690; 
 Thu, 04 Nov 2021 04:22:36 -0700 (PDT)
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
In-Reply-To: <CAFEAcA955NWTGhaEHYqjWppsDxH4BDEX4NiAew69mkwCVvjnLw@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Thu, 4 Nov 2021 12:22:25 +0100
Message-ID: <CAHFG_=WhM2-oByH2-WZO5prQx548JJFFGf2+TsUWOg_Sw+-6hA@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000637c1d05cff4bed8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52c.google.com
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

--000000000000637c1d05cff4bed8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Peter

Le jeu. 4 nov. 2021 =C3=A0 12:09, Peter Maydell <peter.maydell@linaro.org> =
a
=C3=A9crit :

> On Wed, 3 Nov 2021 at 14:41, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Wed, Nov 03, 2021 at 06:29:20AM +0100, Fran=C3=A7ois Ozog wrote:
> > [snip]
> > > > 3. Anything else?
> > > >
> > > > For qemu_arm_spl, it *does not boot* unless the U-Boot SPL properti=
es
> > > > are present. There is no easy way to fix this.
> > >
> > > one clean and easy way would be to upstream a Qemu change to merge a
> > > supplied overlay to the generated one. This the same idea as applying
> the
> > > NT_FW_COnFIG overlay in the TFA world. In both cases previous loaders
> do
> > > their job properly for U-Boot : setting up the stage as needed.
> >
> > For the record, I believe Simon did propose this and the QEMU response
> > was that no, you should dumpdtb, combine externally and pass that
> > directly.
>
> Well, our recommendation really was that the ideal thing would
> be "you take the dtb that QEMU passes you at runtime, and at
> runtime combine that with whatever extra information you want".

That looks just reasonable this way. Runtime merging may need to be done
before control is actually transferred. We have that problem on real board
where we need to inject a TPM device for measured boot and it is not
=C3=A9numerable and pluggable. With TFA we have the option to add the TPM
description in the NT_FW_CONFIG and merge it at run time.
So we need a =C2=AB -mergedtb =C2=BB option for Qemu to have the same capab=
ility.
This would merge the QEMU generated one with the command line provided.

>
> The dumpdtb option is primarily intended as a debug feature,


> so you can have a look at the dtb QEMU created to see why your
> OS isn't booting; although you can script stuff up that does
> a dumpdtb-modify-pass-to-QEMU that is pretty clunky given the
> need to invoke QEMU twice with matching arguments both times.
>
> -- PMM
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000637c1d05cff4bed8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">hi Peter=C2=A0</div><div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 4 nov. 2021 =C3=A0 12:09,=
 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydel=
l@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On Wed, 3 Nov 2021 at 14:41, Tom Rini &lt;<a href=3D"mailto:trini@kon=
sulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Nov 03, 2021 at 06:29:20AM +0100, Fran=C3=A7ois Ozog wrote:<br=
>
&gt; [snip]<br>
&gt; &gt; &gt; 3. Anything else?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For qemu_arm_spl, it *does not boot* unless the U-Boot SPL p=
roperties<br>
&gt; &gt; &gt; are present. There is no easy way to fix this.<br>
&gt; &gt;<br>
&gt; &gt; one clean and easy way would be to upstream a Qemu change to merg=
e a<br>
&gt; &gt; supplied overlay to the generated one. This the same idea as appl=
ying the<br>
&gt; &gt; NT_FW_COnFIG overlay in the TFA world. In both cases previous loa=
ders do<br>
&gt; &gt; their job properly for U-Boot : setting up the stage as needed.<b=
r>
&gt;<br>
&gt; For the record, I believe Simon did propose this and the QEMU response=
<br>
&gt; was that no, you should dumpdtb, combine externally and pass that<br>
&gt; directly.<br>
<br>
Well, our recommendation really was that the ideal thing would<br>
be &quot;you take the dtb that QEMU passes you at runtime, and at<br>
runtime combine that with whatever extra information you want&quot;.</block=
quote><div dir=3D"auto">That looks just reasonable this way. Runtime mergin=
g may need to be done before control is actually transferred. We have that =
problem on real board where we need to inject a TPM device for measured boo=
t and it is not =C3=A9numerable and pluggable. With TFA we have the option =
to add the TPM description in the NT_FW_CONFIG and merge it at run time.</d=
iv><div dir=3D"auto">So we need a =C2=AB -mergedtb =C2=BB option for Qemu t=
o have the same capability. This would merge the QEMU generated one with th=
e command line provided.</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><=
br>
The dumpdtb option is primarily intended as a debug feature,</blockquote><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex" dir=3D"auto"><br>
so you can have a look at the dtb QEMU created to see why your<br>
OS isn&#39;t booting; although you can script stuff up that does<br>
a dumpdtb-modify-pass-to-QEMU that is pretty clunky given the<br>
need to invoke QEMU twice with matching arguments both times.<br>
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

--000000000000637c1d05cff4bed8--

