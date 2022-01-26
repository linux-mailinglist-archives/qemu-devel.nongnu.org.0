Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C40549D4E1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 23:07:13 +0100 (CET)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCqRc-0003be-EB
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 17:07:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1nCqMc-0005ib-JU
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 17:02:02 -0500
Received: from [2a00:1450:4864:20::12d] (port=34482
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1nCqMY-0004Yz-G6
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 17:02:01 -0500
Received: by mail-lf1-x12d.google.com with SMTP id p27so1606599lfa.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 14:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iG4B9BYN2vzb00pYirv/XQLSJy5meKxS3lgq4BE0IRk=;
 b=UBH5t8YmcM8VNHLC0L95W1hfoPeWON8S1C/tJLKVRXzAizk9KY/3SDzqky3Edp5Gnc
 BZTQ+MVbo3KgtG5N6EW3TEDZToVqWMHH0sS/3veSt2/327K3BUAUiE1xPz5UWLmwNAiL
 42tQAKIKN4fpe1RoOep1jOD6iPZFrweTBjjD3kR9VEpGDJEjONJ5wmGlPcv/GTCdCpv3
 tyOZyEzFGeUAidlLHdEosU/oc1rai904eOkhFO2m2+C7DcxK3mRaDgv77KcMPvoAH903
 6FciECGy/mLzKCpbGJ9jO9sj75l00X4TWLOLr3zEZ22DANaitXe740ucPm5AOHJ4Xmul
 5BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iG4B9BYN2vzb00pYirv/XQLSJy5meKxS3lgq4BE0IRk=;
 b=GI0gLMZ6jp0C0UfTEOmf8rvjL5j69Qup4Cg+v7NfPQtMK5yiAeK3AlVOL7Q8+/qq1y
 9svuuUF1AYQhZcJNkWEvYcHI+5wzos0t1SFiFoBdVov3UP/DZX6MnJ8p0T2LsW1l8lJU
 c53QfDbx4wlE2thF1BBT4De3pqUlMv+8TcGx29zXoKLnlpqhcFFcJhKM1eelW+0ZHq0D
 S2W0i4Fs+jvFG3LKXIDERW5RdvEDezYTkAA6jk0AL+eb7vJ+3bZtCxzKhO8mao1KgqAu
 4HOtnBjFGFj3++V4vXl0U48QfTRaH+9NeWwF0AWkAxXsh2TatOFkKytjcapyKJBjWNEy
 zWfw==
X-Gm-Message-State: AOAM530dS0QmyS4xDXHQWHb+58tD4z4aIoSFbsgbXaU5ZqMGO9ti5YJI
 x/wLx5adXZuNdv/aJ5ySX6sfSOo6QheeGQWXwCA7aQ==
X-Google-Smtp-Source: ABdhPJz6fyYGIaK67vpKzRlDZ8dMKiMEr4yMEebMyPO3XcdecdeheEqN+uCnhLeD0tXJRzhKN3X1n2gsFANDc4bQGPs=
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr796184lfo.164.1643234516203; 
 Wed, 26 Jan 2022 14:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20220110214755.810343-1-venture@google.com>
 <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
 <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
 <CAFtMCFUbBhXMxtc7RN+3OhDtckB+x-HXWbWcmh8AyncnriNFxQ@mail.gmail.com>
 <CAFEAcA9HckDH_7s5fpnHOBFQBi-fDfnhcrJ0Y9-=uDtj0bwuoQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9HckDH_7s5fpnHOBFQBi-fDfnhcrJ0Y9-=uDtj0bwuoQ@mail.gmail.com>
From: Chris Rauer <crauer@google.com>
Date: Wed, 26 Jan 2022 14:01:44 -0800
Message-ID: <CAFtMCFXyFY-=J+mAmtUCvYCyk1sy4Ps9p7shg6nvxHmjvpwKAA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Patrick Venture <venture@google.com>, mst@redhat.com, imammedo@redhat.com, 
 ani@anisinha.ca, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009f5d0a05d68359f8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=crauer@google.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--0000000000009f5d0a05d68359f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>>> I need to see a pretty strong justification for why we should be

>>> adding new kinds of devices to the virt machine,

>>

>> The designware i2c controller is a very common controller on many

>>  ARM SoCs.  It has device tree bindings and ACPI bindings which

>> makes it ideal for this platform.

>

>No, I mean, why do we need an i2c controller on the virt

>board at all ?

The use case we are interested in is to enable IPMI SSIF on the arm virt
machine which is why I was interested in something with ACPI support.  That
particular IPMI SSIF enablement patch is not in this series but I think it
could be pulled into the series if necessary.

> > >Forgot to mention, but my prefered approach for providing

> > >an i2c controller on the virt board would be to have a

> > >PCI i2c controller: that way users who do need it can plug it

> > >in with a -device command line option, and users who don't

> > >need it never have to worry about it.

>

> > > (We seem to have an ICH9-SMB PCI device already; I have no idea if
it's suitable.)

> > I didn't find that device suitable because it is part of the Intel

> > Southbridge, which may have some Intel platform quirks, and

> > we don't need all the things in that IO hub.

>

> That's a pity. Is there a different PCI I2C controller we could model ?

I=E2=80=99m not aware of any standalone PCI I2C controllers.  I=E2=80=99ve =
seen I2C
controllers on PCI devices with other things but I don=E2=80=99t think thos=
e could
be used for IPMI SSIF or other general I2C use cases.   Do you know of a
particular device I should take a look at?


-Chris


On Wed, Jan 26, 2022 at 10:03 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 26 Jan 2022 at 17:12, Chris Rauer <crauer@google.com> wrote:
> >
> >> I need to see a pretty strong justification for why we should be
> >> adding new kinds of devices to the virt machine,
> >
> > The designware i2c controller is a very common controller on many
> >  ARM SoCs.  It has device tree bindings and ACPI bindings which
> > makes it ideal for this platform.
>
> No, I mean, why do we need an i2c controller on the virt
> board at all ?
>
> > >Forgot to mention, but my prefered approach for providing
> > >an i2c controller on the virt board would be to have a
> > >PCI i2c controller: that way users who do need it can plug it
> > >in with a -device command line option, and users who don't
> > >need it never have to worry about it.
>
> > > (We seem to have an ICH9-SMB PCI device already; I have no idea if
> it's suitable.)
> > I didn't find that device suitable because it is part of the Intel
> > Southbridge, which may have some Intel platform quirks, and
> > we don't need all the things in that IO hub.
>
> That's a pity. Is there a different PCI I2C controller we could model ?
>
> thanks
> -- PMM
>

--0000000000009f5d0a05d68359f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-434984a3-7fff-9741-5b=
b2-31bb2055b78c"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">&gt;&gt;&gt; I need to see a pretty strong justificatio=
n for why we should be</span></p><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">&gt;&gt;&gt; adding new kinds of device=
s to the virt machine,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">&gt;&gt;</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">&gt;&gt; The desi=
gnware i2c controller is a very common controller on many</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt=
;&gt;=C2=A0 ARM SoCs.=C2=A0 It has device tree bindings and ACPI bindings w=
hich</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">&gt;&gt; makes it ideal for this platform.</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&=
gt;</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">&gt;No, I mean, why do we need an i2c controller on the vi=
rt</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">&gt;board at all ?</span></p><br><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap">The use case we are int=
erested in is to enable IPMI SSIF on the arm virt machine which is why I wa=
s interested in something with ACPI support.=C2=A0 That particular IPMI SSI=
F enablement patch is not in this series but I think it could be pulled int=
o the series if necessary.</span></p><br><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre-wrap">&gt; &gt; &gt;Forgot to mention=
, but my prefered approach for providing</span></p><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">&gt; &gt; &gt;an i2c =
controller on the virt board would be to have a</span></p><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;font-family:Arial;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt; &gt; &gt;=
PCI i2c controller: that way users who do need it can plug it</span></p><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
&gt; &gt; &gt;in with a -device command line option, and users who don&#39;=
t</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">&gt; &gt; &gt;need it never have to worry about it.</span></=
p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;font-family:Arial;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-w=
rap">&gt;</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">&gt; &gt; &gt; (We seem to have an ICH9-SMB PCI devi=
ce already; I have no idea if it&#39;s suitable.)</span></p><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt; &gt; I =
didn&#39;t find that device suitable because it is part of the Intel</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:Arial;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
-wrap">&gt; &gt; Southbridge, which may have some Intel platform quirks, an=
d</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">&gt; &gt; we don&#39;t need all the things in that IO hub.</=
span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">&gt;</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap">&gt; That&#39;s a pity. Is there a different =
PCI I2C controller we could model ?</span></p><br><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">I=E2=80=99m not aware =
of any standalone PCI I2C controllers.=C2=A0 I=E2=80=99ve seen I2C controll=
ers on PCI devices with other things but I don=E2=80=99t think those could =
be used for IPMI SSIF or other general I2C use cases. =C2=A0 Do you know of=
 a particular device I should take a look at?</span></p><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap"><br></span></p><=
p style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">-Chris</=
span></p><br></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Wed, Jan 26, 2022 at 10:03 AM Peter Maydell &lt;<a h=
ref=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 26 =
Jan 2022 at 17:12, Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" tar=
get=3D"_blank">crauer@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; I need to see a pretty strong justification for why we should be<b=
r>
&gt;&gt; adding new kinds of devices to the virt machine,<br>
&gt;<br>
&gt; The designware i2c controller is a very common controller on many<br>
&gt;=C2=A0 ARM SoCs.=C2=A0 It has device tree bindings and ACPI bindings wh=
ich<br>
&gt; makes it ideal for this platform.<br>
<br>
No, I mean, why do we need an i2c controller on the virt<br>
board at all ?<br>
<br>
&gt; &gt;Forgot to mention, but my prefered approach for providing<br>
&gt; &gt;an i2c controller on the virt board would be to have a<br>
&gt; &gt;PCI i2c controller: that way users who do need it can plug it<br>
&gt; &gt;in with a -device command line option, and users who don&#39;t<br>
&gt; &gt;need it never have to worry about it.<br>
<br>
&gt; &gt; (We seem to have an ICH9-SMB PCI device already; I have no idea i=
f it&#39;s suitable.)<br>
&gt; I didn&#39;t find that device suitable because it is part of the Intel=
<br>
&gt; Southbridge, which may have some Intel platform quirks, and<br>
&gt; we don&#39;t need all the things in that IO hub.<br>
<br>
That&#39;s a pity. Is there a different PCI I2C controller we could model ?=
<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000009f5d0a05d68359f8--

