Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF442C10D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:11:09 +0200 (CEST)
Received: from localhost ([::1]:47456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mae2E-0000vI-DG
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1madyD-0004l1-ER
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:06:59 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mady9-0007IT-7l
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:06:55 -0400
Received: by mail-ed1-x532.google.com with SMTP id g10so10101443edj.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5zdIfNn4BepjBj13NWTxEvhuHUrmxtCi4XL6SIgw0Lc=;
 b=gK1u3AlfOI+LlwuspJVLhNsvyTwZ3Myll0RN/WRtDFPTmp0Aw1SkqDpcyaa+LvE31N
 qr1xYOp2HzZjTd3j1WfNCoExnWoVzMarHSTRdHkl2DxL4TBwV5V5brDBDMheTDgndiPe
 Ju00QsYKchdeY+WRwyxIfB9DoDOmUzfwKBo2DhfipPipUIDsBVQje1DsrRQTNIjdkfy+
 O6dGTViVQaU8Am4WGLoSOj3vNVERDwlQW0X/iM9Bb1UZ++0VaIH6t4Jp1ApvLo03rxx6
 2M63MGuakJVDO+BGi07LE7btP4Qtw6W25dcfk78LPhsYgw1qJf0e96LnZv0LsZpYlaHV
 hqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zdIfNn4BepjBj13NWTxEvhuHUrmxtCi4XL6SIgw0Lc=;
 b=oDRE1+itwqcsLreCKaS/xnRoqQiu5GlKnPt34jr17xjzditBEM38joCa3SWsprzkO2
 wMs3VNimqmdv/qavErqog6Doo/UwNNBQazMsgqpdNgd+15+Mo2KnVttFumnuDHXppmrL
 mxmPJeZfkGFBoCVtZ9rCq/ksPU12+3doOi/+YLtMpOdmCtM7Z33alda7WUhtz8Yce+m8
 P1ciXQcQB3dWg5dMFzvxpO/cqyskS3zZuCsGV715HHk+NprvnjcW7kCaAi9yaBa7Lvxp
 T8shUhNADOjfH4AIUa+5F+of3D7oKe1okjOTwJ92GcySLebi4SSUtAIJx19Vjnmd+wD5
 Syew==
X-Gm-Message-State: AOAM532F6G+99j87PkK/bJgWKFh5db0WsGv4YHKgvMWrEdNsK2JmGmH7
 CwMmPvTWm+3tK7ZCBcIvjhIrmX6JYD7yw7aOMUeMXg==
X-Google-Smtp-Source: ABdhPJxnHLgVrAvwsB0ZUAs6LTenWFm5wbbr2J63ynx1v0njYDwfUiY5NrFvhjs6FfPycWj6QLSKKU2w6wDLGg/vRpE=
X-Received: by 2002:a17:906:7d09:: with SMTP id
 u9mr20906219ejo.120.1634130408771; 
 Wed, 13 Oct 2021 06:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <1c51724b-7789-f402-818f-1044053ee0fa@redhat.com>
In-Reply-To: <1c51724b-7789-f402-818f-1044053ee0fa@redhat.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 13 Oct 2021 15:06:38 +0200
Message-ID: <CAHFG_=VY_OXRz-K8tQue0hT8dczo+Fv=vQC-VKhqYCuJWJX+Og@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008847e005ce3ba216"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x532.google.com
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
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
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
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008847e005ce3ba216
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 13 oct. 2021 =C3=A0 14:42, Philippe Mathieu-Daud=C3=A9 <philmd@redh=
at.com> a
=C3=A9crit :

> Hi Simon,
>
> On 10/13/21 03:29, Bin Meng wrote:
> > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org> wrote:
> >>
> >> With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
> >> there are only three ways to obtain a devicetree:
> >>
> >>    - OF_SEPARATE - the normal way, where the devicetree is built and
> >>       appended to U-Boot
> >>    - OF_EMBED - for development purposes, the devicetree is embedded i=
n
> >>       the ELF file (also used for EFI)
> >>    - OF_BOARD - the board figures it out on its own
> >>
> >> The last one is currently set up so that no devicetree is needed at al=
l
> >> in the U-Boot tree. Most boards do provide one, but some don't. Some
> >> don't even provide instructions on how to boot on the board.
> >>
> >> The problems with this approach are documented at [1].
> >>
> >> In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any boa=
rd
> >> can obtain its devicetree at runtime, even it is has a devicetree buil=
t
> >> in U-Boot. This is because U-Boot may be a second-stage bootloader and
> its
> >> caller may have a better idea about the hardware available in the
> machine.
> >> This is the case with a few QEMU boards, for example.
> >>
> >> So it makes no sense to have OF_BOARD as a 'choice'. It should be an
> >> option, available with either OF_SEPARATE or OF_EMBED.
> >>
> >> This series makes this change, adding various missing devicetree files
> >> (and placeholders) to make the build work.
> >
> > Adding device trees that are never used sounds like a hack to me.
> >
> > For QEMU, device tree is dynamically generated on the fly based on
> > command line parameters, and the device tree you put in this series
> > has various hardcoded <phandle> values which normally do not show up
> > in hand-written dts files.
>
> Besides, QEMU generates these dtb at runtime on purpose: it gives
> emulated machines the freedom to evolve by adding new devices,
> mapping/wiring peripherals differently.
>
> By adding static dtb this gives QEMU users false expectations the
> machine hardware is stable, or force QEMU to have this interface
> become a stable API.
>
> From QEMU perspective this seems counter-productive.
>
+1

>
> Digging a bit I see this has already been discussed on qemu-devel@
> mailing list recently:
>
>
> https://lore.kernel.org/qemu-devel/CAFEAcA_QNcAHtdxUPLpmyzMYgb9YzhcE0-zyh=
=3DN8rqm4vOcGZA@mail.gmail.com/
>
> > I am not sure I understand the whole point of this.
> >
> >>
> >> It also provides a few qemu clean-ups discovered along the way.
> >>
> >> This series is based on Ilias' two series for OF_HOSTFILE and
> >> OF_PRIOR_STAGE removal.
> >>
> >> It is available at u-boot-dm/ofb-working
> >>
> >> [1]
> https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3=
-sjg@chromium.org/
> >>
> >
> > Regards,
> > Bin
> >
>
> --
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--0000000000008847e005ce3ba216
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mer. 13 oct. 2021 =C3=A0 14:42, Philippe Mathieu-Da=
ud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Simon,<br>
<br>
On 10/13/21 03:29, Bin Meng wrote:<br>
&gt; On Wed, Oct 13, 2021 at 9:01 AM Simon Glass &lt;<a href=3D"mailto:sjg@=
chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; With Ilias&#39; efforts we have dropped OF_PRIOR_STAGE and OF_HOST=
FILE so<br>
&gt;&gt; there are only three ways to obtain a devicetree:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 - OF_SEPARATE - the normal way, where the devicetree =
is built and<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0appended to U-Boot<br>
&gt;&gt;=C2=A0 =C2=A0 - OF_EMBED - for development purposes, the devicetree=
 is embedded in<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the ELF file (also used for EFI)<br>
&gt;&gt;=C2=A0 =C2=A0 - OF_BOARD - the board figures it out on its own<br>
&gt;&gt;<br>
&gt;&gt; The last one is currently set up so that no devicetree is needed a=
t all<br>
&gt;&gt; in the U-Boot tree. Most boards do provide one, but some don&#39;t=
. Some<br>
&gt;&gt; don&#39;t even provide instructions on how to boot on the board.<b=
r>
&gt;&gt;<br>
&gt;&gt; The problems with this approach are documented at [1].<br>
&gt;&gt;<br>
&gt;&gt; In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any=
 board<br>
&gt;&gt; can obtain its devicetree at runtime, even it is has a devicetree =
built<br>
&gt;&gt; in U-Boot. This is because U-Boot may be a second-stage bootloader=
 and its<br>
&gt;&gt; caller may have a better idea about the hardware available in the =
machine.<br>
&gt;&gt; This is the case with a few QEMU boards, for example.<br>
&gt;&gt;<br>
&gt;&gt; So it makes no sense to have OF_BOARD as a &#39;choice&#39;. It sh=
ould be an<br>
&gt;&gt; option, available with either OF_SEPARATE or OF_EMBED.<br>
&gt;&gt;<br>
&gt;&gt; This series makes this change, adding various missing devicetree f=
iles<br>
&gt;&gt; (and placeholders) to make the build work.<br>
&gt; <br>
&gt; Adding device trees that are never used sounds like a hack to me.<br>
&gt; <br>
&gt; For QEMU, device tree is dynamically generated on the fly based on<br>
&gt; command line parameters, and the device tree you put in this series<br=
>
&gt; has various hardcoded &lt;phandle&gt; values which normally do not sho=
w up<br>
&gt; in hand-written dts files.<br>
<br>
Besides, QEMU generates these dtb at runtime on purpose: it gives<br>
emulated machines the freedom to evolve by adding new devices,<br>
mapping/wiring peripherals differently.<br>
<br>
By adding static dtb this gives QEMU users false expectations the<br>
machine hardware is stable, or force QEMU to have this interface<br>
become a stable API.<br>
<br>
From QEMU perspective this seems counter-productive.<br>
</blockquote><div dir=3D"auto">+1</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Digging a bit I see this has already been discussed on qemu-devel@<br>
mailing list recently:<br>
<br>
<a href=3D"https://lore.kernel.org/qemu-devel/CAFEAcA_QNcAHtdxUPLpmyzMYgb9Y=
zhcE0-zyh=3DN8rqm4vOcGZA@mail.gmail.com/" rel=3D"noreferrer" target=3D"_bla=
nk">https://lore.kernel.org/qemu-devel/CAFEAcA_QNcAHtdxUPLpmyzMYgb9YzhcE0-z=
yh=3DN8rqm4vOcGZA@mail.gmail.com/</a><br>
<br>
&gt; I am not sure I understand the whole point of this.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; It also provides a few qemu clean-ups discovered along the way.<br=
>
&gt;&gt;<br>
&gt;&gt; This series is based on Ilias&#39; two series for OF_HOSTFILE and<=
br>
&gt;&gt; OF_PRIOR_STAGE removal.<br>
&gt;&gt;<br>
&gt;&gt; It is available at u-boot-dm/ofb-working<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://patchwork.ozlabs.org/project/uboot/patch/20=
210919215111.3830278-3-sjg@chromium.org/" rel=3D"noreferrer" target=3D"_bla=
nk">https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278=
-3-sjg@chromium.org/</a><br>
&gt;&gt;<br>
&gt; <br>
&gt; Regards,<br>
&gt; Bin<br>
&gt; <br>
<br>
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

--0000000000008847e005ce3ba216--

