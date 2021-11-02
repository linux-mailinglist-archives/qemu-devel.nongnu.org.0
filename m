Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AE3442E7D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:51:27 +0100 (CET)
Received: from localhost ([::1]:45502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtGA-0006UY-16
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mhszZ-0004Ig-2h
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:34:17 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mhszX-0001fA-2O
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:34:16 -0400
Received: by mail-ed1-x536.google.com with SMTP id w1so21532019edd.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FFmX/VRWo9Og6ZW3ehrBiREP+37O7KueUu7vIQvdXYg=;
 b=YhC1TDFbFuMzAtorJaCnXG2HGAjaG/tbG/U1787UnWDOxu1hSe+hZdJSA3niGs/VBC
 CthZHS82HFYwE80Enj/XAUW3Yoo4Q83SNJmDaWQrxEbaOEkvPytS6r94nRNj+CKnEd1c
 7eTySy1GvQDn/HSZodexiFmQIWGe9Ej31LbVbNsQBfmKsYN6pAnnYzqVi3MTPuFx//Hp
 MGFIDkcPt8gbr4Z5E4KBkeBxoQi+09jCzhq9ZWIFTqDDaPe/aJyBOTcYEy0Taz55rzwg
 TKSl86uCQe25HMLLX8N8rIVxF2ZMJI3d/d8VO4m9Cwno7GBzyEBqPIdEGi+AUFuULsKJ
 Zrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFmX/VRWo9Og6ZW3ehrBiREP+37O7KueUu7vIQvdXYg=;
 b=KHc/7hPEsmNCO/XgFH3wNaUtZTLRJrx2+amREB/u6dMauPmYsJfctg17wHZ7hwx3Go
 9ZVrCvkjctmNAnQzpfIgw9aVs3wWQdWGT9/oL1CB9T6VlbZvEwOhpZ/czVBIox1tp91V
 CZJCwfS0qt3XyGOphzW/My6RQmKejONCCtKTW/SO50STUDbSFapSZSMgLKAlp9ym0/GB
 bRmyhwq3fsRtgqX3s0aB7QhxnfJIFY2ufAUZ6R1kfgfOviQHBhbh0HEu6umb27ctGhUy
 Ss8mrEG2RNOKQbDZK7iez0PSW+JKe5H2QTwLsgIcvLlCOykmXHxXTrOQarZVZG/TmiT4
 76GA==
X-Gm-Message-State: AOAM530fHvBbFu6BBU7Wgnv5M2Knwq4oHAXMIXuBD8wEGfm57ZoFLspV
 HrnNZmtrvuUJs8fClRyykAXoIBZxs+WJiy7VutFmKg==
X-Google-Smtp-Source: ABdhPJymvzGSY+i5xyvO/EcUp8s3QM28aVGGBWsr1BCIa1vxc2wJISi7j0UNaruyXmu376Z1iZyY9DF5jGaOVylX9JE=
X-Received: by 2002:a05:6402:278a:: with SMTP id
 b10mr50130800ede.390.1635856452793; 
 Tue, 02 Nov 2021 05:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAC_iWjLDieo9d9uOVGpxEqEMYn+O=GEzdMwPEYmT2kswMVPi_g@mail.gmail.com>
 <20211102100659.2397019-1-michael@walle.cc>
In-Reply-To: <20211102100659.2397019-1-michael@walle.cc>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Tue, 2 Nov 2021 13:34:01 +0100
Message-ID: <CAHFG_=UMhReeT_=m6U-wag440bZf-Fxf_vWFf9Pd9FiSCv-OeA@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Michael Walle <michael@walle.cc>
Content-Type: multipart/alternative; boundary="000000000000c5d12105cfcd824a"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: liviu.dudau@foss.arm.com, narmstrong@baylibre.com, rick@andestech.com,
 vladimir.oltean@nxp.com, linus.walleij@linaro.org, bin.meng@windriver.com,
 kever.yang@rock-chips.com, seanga2@gmail.com, atish.patra@wdc.com,
 zong.li@sifive.com, sr@denx.de, festevam@gmail.com,
 rainer.boschung@hitachi-powergrids.com, trini@konsulko.com, swarren@nvidia.com,
 oleksandr_andrushchenko@epam.com, xypron.glpk@gmx.de, lusus@denx.de,
 michal.simek@xilinx.com, marek.behun@nic.cz, vanbaren@cideas.com,
 rfried.dev@gmail.com, jagan@amarulasolutions.com,
 valentin.longchamp@hitachi-powergrids.com, hs@denx.de, pbrobinson@gmail.com,
 sinan@writeme.com, fitzsim@fitzsim.org, wd@denx.de, swarren@wwwdotorg.org,
 andre.przywara@arm.com, tharvey@gateworks.com, ashok.reddy.soma@xilinx.com,
 qemu-devel@nongnu.org, agraf@csgraf.de, green.wan@sifive.com,
 t.karthik.reddy@xilinx.com, anastasiia_lukianenko@epam.com,
 albert.u.boot@aribaud.net, monstr@monstr.eu, mbrugger@suse.com,
 ycliang@andestech.com, kristo@kernel.org, u-boot@lists.denx.de,
 david.abdurachmanov@sifive.com, priyanka.jain@nxp.com, sjg@chromium.org,
 ilias.apalodimas@linaro.org, christianshewitt@gmail.com, awilliams@marvell.com,
 tuomas.tynkkynen@iki.fi, heinrich.schuchardt@canonical.com,
 tianrui-wei@outlook.com, bmeng.cn@gmail.com, pali@kernel.org,
 dimitri.ledkov@canonical.com, padmarao.begari@microchip.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c5d12105cfcd824a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Nov 2021 at 11:07, Michael Walle <michael@walle.cc> wrote:

> Hi,
>
> > On Thu, 28 Oct 2021 at 05:51, Simon Glass <sjg@chromium.org> wrote:
> > > On Tue, 26 Oct 2021 at 00:46, Ilias Apalodimas
> > > <ilias.apalodimas@linaro.org> wrote:
>
> ..
>
> > > Linux actually doesn't care if the U-Boot properties are in the tree,
> > > so long as we have proper bindings. My point here is we only need
> > > either:
> > >
> > > a. one devicetree, shared with Linux and U-Boot (and TF-A?)
> > > b. two devicetrees, one for use in firmware and one for passing to
> Linux
> > >
> > > We don't need to separate out the U-Boot properties into a second (or
> > > third) devicetree. There just isn't any point.
> >
> > Again if we are talking about bindings that are upstream in the spec,
> > then we agree.  Depending on the SRAM limitation we can even do (a).
> > If the vendor messes up the DT backwards compatibility then we can do
> > (b).  If you expect TF-A and FIP to go pick up the special bindings
> > U-Boot needs, then we disagree.
>
> *puts developer at board vendor hat on* Sometimes (personally I'd say
> usually) it isn't possible to have a backwards compatible tree. Also,
> like it or not, in the device tree there *are* configuration options
> which are not hardware dependent (eg. internal ethernet connection on
> the ls1028a).

Are you referring to DPAA2 configuration to create the ethernet port itself
?
This is indeed configuration. There are many ways to handle those ones.
As well as SerDes configuration to make PCI lanes or MDIO lanes.
Yet the two are different in nature: SerDes configuration must match board
layout,
so it is about "no user choice" configuration. This configuration could be
statically
defined and attached with the board. But it there is a SoM with a carrier
board,
we may need to compose that at runtime for development, or make it static
build
for product packaging.
DPAA2 configuration is user choice driven. Those choices can be merged in
the DT
to be passed to the OS at runtime. There are multiple ways to deal with
that, from DT overlays
to U-Boot DPAA2 command line extensions that would inject the DT necessary
nodes.

> So a vendor doesn't necessarily need to "mess things up"
> to need (b). And as you know, my point is, that this device tree has
> to come from the distribution, it must not be compiled in into the
> firmware.
>
 I wouldn't bet that all distro providers will always come with a DT...

>
> I feel like I've repeated this far too many times. Therefore, this
> will be my last comment about it and I would really like to see that
> this - very real - scenario is treated as a valid use case and will be
> supported in your systemready vision.
>
I have been building (shared it on the list) a deck to go into those
details. I am almost ready to talk to it.

>
> -michael
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000c5d12105cfcd824a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 2 Nov 2021 at 11:07, Michael =
Walle &lt;<a href=3D"mailto:michael@walle.cc">michael@walle.cc</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; On Thu, 28 Oct 2021 at 05:51, Simon Glass &lt;<a href=3D"mailto:sjg@ch=
romium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt; &gt; On Tue, 26 Oct 2021 at 00:46, Ilias Apalodimas<br>
&gt; &gt; &lt;<a href=3D"mailto:ilias.apalodimas@linaro.org" target=3D"_bla=
nk">ilias.apalodimas@linaro.org</a>&gt; wrote:<br>
<br>
..<br>
<br>
&gt; &gt; Linux actually doesn&#39;t care if the U-Boot properties are in t=
he tree,<br>
&gt; &gt; so long as we have proper bindings. My point here is we only need=
<br>
&gt; &gt; either:<br>
&gt; &gt;<br>
&gt; &gt; a. one devicetree, shared with Linux and U-Boot (and TF-A?)<br>
&gt; &gt; b. two devicetrees, one for use in firmware and one for passing t=
o Linux<br>
&gt; &gt;<br>
&gt; &gt; We don&#39;t need to separate out the U-Boot properties into a se=
cond (or<br>
&gt; &gt; third) devicetree. There just isn&#39;t any point.<br>
&gt; <br>
&gt; Again if we are talking about bindings that are upstream in the spec,<=
br>
&gt; then we agree.=C2=A0 Depending on the SRAM limitation we can even do (=
a).<br>
&gt; If the vendor messes up the DT backwards compatibility then we can do<=
br>
&gt; (b).=C2=A0 If you expect TF-A and FIP to go pick up the special bindin=
gs<br>
&gt; U-Boot needs, then we disagree.<br>
<br>
*puts developer at board vendor hat on* Sometimes (personally I&#39;d say<b=
r>
usually) it isn&#39;t possible to have a backwards compatible tree. Also,<b=
r>
like it or not, in the device tree there *are* configuration options<br>
which are not hardware dependent (eg. internal ethernet connection on<br>
the ls1028a).</blockquote><div>Are you referring to DPAA2 configuration to =
create the ethernet port itself ?</div><div>This is indeed configuration. T=
here are many ways to handle those ones.=C2=A0<br></div><div>As well as Ser=
Des configuration to make PCI lanes or MDIO lanes.<br></div><div>Yet the tw=
o are different in nature: SerDes configuration must match board layout,=C2=
=A0</div><div>so it is about &quot;no user choice&quot; configuration. This=
 configuration could be statically=C2=A0</div><div>defined and attached wit=
h the board. But it there is a SoM with a carrier board,</div><div>we may n=
eed to compose that at runtime for development, or make it static build</di=
v><div>for product packaging.</div><div>DPAA2 configuration is user choice =
driven. Those choices can be merged in the DT</div><div>to be passed to the=
 OS at runtime. There are multiple ways to deal with that, from DT overlays=
=C2=A0</div><div>to U-Boot DPAA2 command line extensions that would inject =
the DT necessary nodes.</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-=
left-color:rgb(204,204,204);padding-left:1ex"> So a vendor doesn&#39;t nece=
ssarily need to &quot;mess things up&quot;<br>
to need (b). And as you know, my point is, that this device tree has<br>
to come from the distribution, it must not be compiled in into the<br>
firmware.<br></blockquote><div>=C2=A0I wouldn&#39;t bet that all distro pro=
viders will always come with a DT...</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex">
<br>
I feel like I&#39;ve repeated this far too many times. Therefore, this<br>
will be my last comment about it and I would really like to see that<br>
this - very real - scenario is treated as a valid use case and will be<br>
supported in your systemready vision.<br></blockquote><div>I have been buil=
ding (shared it on the list) a deck to go into those details. I am almost r=
eady to talk to it. =C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;bord=
er-left-color:rgb(204,204,204);padding-left:1ex">
<br>
-michael<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px" valign=
=3D"top"><img src=3D"https://static.linaro.org/common/images/linaro-logo-we=
b.png"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans =
Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:rgb(87,8=
7,87)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=
=A9d=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)">|</sp=
an>=C2=A0<i>Director Business Development</i></td></tr><tr><td style=3D"fon=
t-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;font-siz=
e:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a value=
=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><br><a =
href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87);text-=
decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0<span =
style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td></tr>=
</tbody></table></td></tr></tbody></table></div></div></div></div></div><di=
v><div><br style=3D"font-size:small"></div></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

--000000000000c5d12105cfcd824a--

