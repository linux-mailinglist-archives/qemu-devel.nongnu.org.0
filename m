Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE142B9D7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 10:03:43 +0200 (CEST)
Received: from localhost ([::1]:43016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZEk-0007cG-3z
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 04:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1maZDj-0006oP-Un
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:02:41 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1maZDf-0005Qq-VU
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:02:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id r18so6441633edv.12
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2CqjcKKqkvO7gvJhwvjFkgmOBjBqGf6KQiNi55mdKk=;
 b=RgSDauyqCl68rh56rjfDfXA1zhAwerYOpoDdKwpJnFzhiAxmy00lBN5dHI/xQfEF5k
 7Pk5NLCkE8dT5+wxGInN4NH5JXxQxBjr/LXM9bS8mox3X+YPqate/hsoGhKPQrER52Bu
 c+TBQmqIMgk/8Ccv/AiGfM2Waf/RatMpNR3fYOWoAM1el1cROgJe155ctG1HprOwBZz+
 zkzh7eKptqkwawAhp2Zwr4FplNdtdGCJkx1KD5EnOIZl3xsFsAt6rxc6MN1urjOXOXh5
 8ikJQVPTQwubP1jMTh0x6fAcw3ExoHMn2bxUqcMLZoXndx88Na+gKBakJ+LvsA40PwLh
 fd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2CqjcKKqkvO7gvJhwvjFkgmOBjBqGf6KQiNi55mdKk=;
 b=TwKaVie3da4Tf0XeEUYjVGnSjAhnyga6zWbgHED7n8IyVDpe6AmHbJLqhn1GLoji7I
 EWXY48ts9fDcBcaArHPbjWPrVr05Xhc6wPrjcU3h67d0+e0qLA75uCiXhJDUZ++z6O1g
 hstY0cRj9295pEbf9WwSa+U29dfeXwb4SM3f5Nr3Pfw6D2aDCQ+0jg4C8apO4YCF4H8h
 hV0cbP0a38/GHmFmvBMDMFRQTHlQt/kccFuNvowEkZwb1yQ2xmaSgujJDyFtLFEqc1Fd
 YMNdBnYKbiw0DkYtbM+/YeNHOQZ/VgfIna341Mu4AxBRvDZDXonE7GrsUILyMBsiHnIo
 SAUg==
X-Gm-Message-State: AOAM531TIVO9v8LmpF9Z2plvvlSFsM1mD1x77K0tbGbHXjqa3ejfPFKa
 +7xtEzMxV7PT0QEvHMKs054Jr/iW+4mVBpBRFiV5EQ==
X-Google-Smtp-Source: ABdhPJy6auTJojXGIJ4QIm1rIgGpLsCd2/QGsz6f7cztQDPPAu/UoX8+MCBv5WmFXgXGLJYIipEusLr8J8ugt15pM0o=
X-Received: by 2002:a17:906:94da:: with SMTP id
 d26mr10277577ejy.213.1634112153053; 
 Wed, 13 Oct 2021 01:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
In-Reply-To: <20211013013450.GJ7964@bill-the-cat>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 13 Oct 2021 10:02:22 +0200
Message-ID: <CAHFG_=Vf9_BFGBXvz+tHnP-g65fM-bUHa9a2AEf3KbzRwnhR=w@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000006808c305ce376273"
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
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 Heiko Schocher <hs@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Sinan Akman <sinan@writeme.com>, Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Wolfgang Denk <wd@denx.de>, Stephen Warren <swarren@wwwdotorg.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 Tero Kristo <kristo@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006808c305ce376273
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon


Le mer. 13 oct. 2021 =C3=A0 03:35, Tom Rini <trini@konsulko.com> a =C3=A9cr=
it :

> On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> > Hi Simon,
> >
> > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org> wrote:
> > >
> > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
> > > there are only three ways to obtain a devicetree:
> > >
> > >    - OF_SEPARATE - the normal way, where the devicetree is built and
> > >       appended to U-Boot
> > >    - OF_EMBED - for development purposes, the devicetree is embedded =
in
> > >       the ELF file (also used for EFI)
> > >    - OF_BOARD - the board figures it out on its own
> > >
> > > The last one is currently set up so that no devicetree is needed at a=
ll
> > > in the U-Boot tree. Most boards do provide one, but some don't. Some
> > > don't even provide instructions on how to boot on the board.
> > >
> > > The problems with this approach are documented at [1].
> > >
> > > In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any
> board
> > > can obtain its devicetree at runtime, even it is has a devicetree bui=
lt
> > > in U-Boot. This is because U-Boot may be a second-stage bootloader an=
d
> its
> > > caller may have a better idea about the hardware available in the
> machine.
> > > This is the case with a few QEMU boards, for example.
> > >
> > > So it makes no sense to have OF_BOARD as a 'choice'. It should be an
> > > option, available with either OF_SEPARATE or OF_EMBED.
> > >
> > > This series makes this change, adding various missing devicetree file=
s
> > > (and placeholders) to make the build work.
> >
> > Adding device trees that are never used sounds like a hack to me.
> >
> > For QEMU, device tree is dynamically generated on the fly based on
> > command line parameters, and the device tree you put in this series
> > has various hardcoded <phandle> values which normally do not show up
> > in hand-written dts files.
> >
> > I am not sure I understand the whole point of this.
>
> I am also confused and do not like the idea of adding device trees for
> platforms that are capable of and can / do have a device tree to give us
> at run time.
>
> --
> Tom


+1

While the cleanup go get three options, including OF_BOARD is nice, the
build solution you propose does not sound the right approach: U-Boot should
be buildable without any DT.

Getting the DT you produced as sample information can be useful and kept
out of build path in documentation with ad-hoc warnings though as I
explained in other mails of the series.

OF_BOARD is a choice to say =E2=80=9CI don=E2=80=99t override the legitimat=
e DT with either
OF_SEPARATE or OF_EMBED=E2=80=9D (which I see in this case as debug facilit=
y for
U-Boot maintainer of the platform).

>
> --
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--0000000000006808c305ce376273
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Simon</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">Le=C2=A0mer. 13 oct. 2021 =C3=A0 03:35, Tom Rini &lt;<a href=3D"mai=
lto:trini@konsulko.com">trini@konsulko.com</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wr=
ote:<br>
&gt; Hi Simon,<br>
&gt; <br>
&gt; On Wed, Oct 13, 2021 at 9:01 AM Simon Glass &lt;<a href=3D"mailto:sjg@=
chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; With Ilias&#39; efforts we have dropped OF_PRIOR_STAGE and OF_HOS=
TFILE so<br>
&gt; &gt; there are only three ways to obtain a devicetree:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 - OF_SEPARATE - the normal way, where the devicetree=
 is built and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0appended to U-Boot<br>
&gt; &gt;=C2=A0 =C2=A0 - OF_EMBED - for development purposes, the devicetre=
e is embedded in<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the ELF file (also used for EFI)<br>
&gt; &gt;=C2=A0 =C2=A0 - OF_BOARD - the board figures it out on its own<br>
&gt; &gt;<br>
&gt; &gt; The last one is currently set up so that no devicetree is needed =
at all<br>
&gt; &gt; in the U-Boot tree. Most boards do provide one, but some don&#39;=
t. Some<br>
&gt; &gt; don&#39;t even provide instructions on how to boot on the board.<=
br>
&gt; &gt;<br>
&gt; &gt; The problems with this approach are documented at [1].<br>
&gt; &gt;<br>
&gt; &gt; In practice, OF_BOARD is not really distinct from OF_SEPARATE. An=
y board<br>
&gt; &gt; can obtain its devicetree at runtime, even it is has a devicetree=
 built<br>
&gt; &gt; in U-Boot. This is because U-Boot may be a second-stage bootloade=
r and its<br>
&gt; &gt; caller may have a better idea about the hardware available in the=
 machine.<br>
&gt; &gt; This is the case with a few QEMU boards, for example.<br>
&gt; &gt;<br>
&gt; &gt; So it makes no sense to have OF_BOARD as a &#39;choice&#39;. It s=
hould be an<br>
&gt; &gt; option, available with either OF_SEPARATE or OF_EMBED.<br>
&gt; &gt;<br>
&gt; &gt; This series makes this change, adding various missing devicetree =
files<br>
&gt; &gt; (and placeholders) to make the build work.<br>
&gt; <br>
&gt; Adding device trees that are never used sounds like a hack to me.<br>
&gt; <br>
&gt; For QEMU, device tree is dynamically generated on the fly based on<br>
&gt; command line parameters, and the device tree you put in this series<br=
>
&gt; has various hardcoded &lt;phandle&gt; values which normally do not sho=
w up<br>
&gt; in hand-written dts files.<br>
&gt; <br>
&gt; I am not sure I understand the whole point of this.<br>
<br>
I am also confused and do not like the idea of adding device trees for<br>
platforms that are capable of and can / do have a device tree to give us<br=
>
at run time.<br>
<br>
-- <br>
Tom</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">+1</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"auto" style=3D"border-=
color:rgb(0,0,0)">While the cleanup go get three options, including OF_BOAR=
D is nice, the build solution you propose does not sound the right approach=
: U-Boot should be buildable without any DT.</div><div dir=3D"auto" style=
=3D"border-color:rgb(0,0,0)"><br></div><div dir=3D"auto" style=3D"border-co=
lor:rgb(0,0,0)">Getting the DT you produced as sample information can be us=
eful and kept out of build path in documentation with ad-hoc warnings thoug=
h as I explained in other mails of the series.</div><div dir=3D"auto" style=
=3D"border-color:rgb(0,0,0)"><br></div><div dir=3D"auto" style=3D"border-co=
lor:rgb(0,0,0)">OF_BOARD is a choice to say =E2=80=9CI don=E2=80=99t overri=
de the legitimate DT with either OF_SEPARATE or OF_EMBED=E2=80=9D (which I =
see in this case as debug facility for U-Boot maintainer of the platform).<=
/div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)" dir=3D"auto"><br>
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

--0000000000006808c305ce376273--

