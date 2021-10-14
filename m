Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC4042E0ED
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 20:14:19 +0200 (CEST)
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb5FC-0005Xi-Bq
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 14:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mb5E1-0004rn-FG
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 14:13:05 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mb5Dx-0007fn-5H
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 14:13:05 -0400
Received: by mail-ed1-x532.google.com with SMTP id i20so26870700edj.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 11:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZCGfARdQjJ3Aei/B+D0KtNL0Tc+Xo4OBa2oVAHfQCjE=;
 b=XDLrpC+rhVwKJg3FE7YhmQU0ChulQYfF8k2Ds66a/kpiDkN1E5orGfajiwS1X+rVXy
 Y3DKYTmrPJZwctKjuQwjmf+ccyf4RrL6AEgHE0A6Xv8CEq3pqy3Ew1rPtMeswxqVKrxR
 r9HfZY92mR9zCvdzHq6+o1sIIdDWlcstohowBxQFkquGWY3EnL5ahKxgA0XqelP6wkx0
 37xDxUoL+LmIJ/Jx5pMHCzpjsN+gcWQ4rn/8ApRRa1prAiOe3uqkJQbGpqVlK7U3sYIN
 ywltUrDdf/HTIuRUeseD9rJSzciRFGtvbnbS9SuogouWr99/Gdlg/KzWsIYec1ZQIIEG
 7efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZCGfARdQjJ3Aei/B+D0KtNL0Tc+Xo4OBa2oVAHfQCjE=;
 b=KIiN51nplq2pCSu7JwCfKfD42l9u88bPWJEFiGDBvZl3mtZ78W1DteUsqRand7Dgwh
 FzJAantRVz4oVaz0zi2P6EOdFdfSptFNm0QU29HLEtHt4dT7zaVVEVpx/cLj2rjo+Vbs
 b4pEmajff/+MGnOA3d/lLqkpzqGbUsv/Xyn1emdjCT4rDa2uqsp4pGNX4MATI1fkcRfH
 waqlJpCVS4K1JLqWT9hIWfyBI7o61mKqsKNLhSrBtLYQkgyZVrj9t/GBdI0b3HgMCGDX
 aqhIyaEhHxN09Tg0dreyDwocC3YPocr9rTN8EVUI9zh0JTTTiFQJlr2y7tydr0dKAkI2
 HZ4w==
X-Gm-Message-State: AOAM530gPt269jI0kPnMARwQpHDBgC24LNYY7URAypnkifwV5x1k81Xv
 YLDfJiyeEy3WbzlVaNqT+2tnzgkb0OWiWRWUxBQb5g==
X-Google-Smtp-Source: ABdhPJwUOArxXzeXTv0XNoKzUtJA5pCiE95gTvQMXejKq+u9vWhYPsea16bAUaMMw5H6MKFHQqEuv8U5dMI06tFRo/k=
X-Received: by 2002:a17:906:94da:: with SMTP id
 d26mr593521ejy.213.1634235177342; 
 Thu, 14 Oct 2021 11:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
In-Reply-To: <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Thu, 14 Oct 2021 20:12:46 +0200
Message-ID: <CAHFG_=VwUU-Uc2qEoBeh8yNKwaUfF1wJKipNUm6fWfkasKBHUg@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="00000000000039ac7d05ce5407ff"
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
 Priyanka Jain <priyanka.jain@nxp.com>,
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

--00000000000039ac7d05ce5407ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 13 oct. 2021 =C3=A0 20:06, Simon Glass <sjg@chromium.org> a =C3=A9c=
rit :

> Hi Fran=C3=A7ois,
>
> On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <francois.ozog@linaro.or=
g>
> wrote:
> >
> > Hi Simon
> >
> > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
> >>
> >> Hi Tom, Bin,Fran=C3=A7ois,
> >>
> >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com> wrote:
> >> >
> >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> >> > > Hi Simon,
> >> > >
> >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org>
> wrote:
> >> > > >
> >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and
> OF_HOSTFILE so
> >> > > > there are only three ways to obtain a devicetree:
> >> > > >
> >> > > >    - OF_SEPARATE - the normal way, where the devicetree is built
> and
> >> > > >       appended to U-Boot
> >> > > >    - OF_EMBED - for development purposes, the devicetree is
> embedded in
> >> > > >       the ELF file (also used for EFI)
> >> > > >    - OF_BOARD - the board figures it out on its own
> >> > > >
> >> > > > The last one is currently set up so that no devicetree is needed
> at all
> >> > > > in the U-Boot tree. Most boards do provide one, but some don't.
> Some
> >> > > > don't even provide instructions on how to boot on the board.
> >> > > >
> >> > > > The problems with this approach are documented at [1].
> >> > > >
> >> > > > In practice, OF_BOARD is not really distinct from OF_SEPARATE.
> Any board
> >> > > > can obtain its devicetree at runtime, even it is has a devicetre=
e
> built
> >> > > > in U-Boot. This is because U-Boot may be a second-stage
> bootloader and its
> >> > > > caller may have a better idea about the hardware available in th=
e
> machine.
> >> > > > This is the case with a few QEMU boards, for example.
> >> > > >
> >> > > > So it makes no sense to have OF_BOARD as a 'choice'. It should b=
e
> an
> >> > > > option, available with either OF_SEPARATE or OF_EMBED.
> >> > > >
> >> > > > This series makes this change, adding various missing devicetree
> files
> >> > > > (and placeholders) to make the build work.
> >> > >
> >> > > Adding device trees that are never used sounds like a hack to me.
> >> > >
> >> > > For QEMU, device tree is dynamically generated on the fly based on
> >> > > command line parameters, and the device tree you put in this serie=
s
> >> > > has various hardcoded <phandle> values which normally do not show =
up
> >> > > in hand-written dts files.
> >> > >
> >> > > I am not sure I understand the whole point of this.
> >> >
> >> > I am also confused and do not like the idea of adding device trees f=
or
> >> > platforms that are capable of and can / do have a device tree to giv=
e
> us
> >> > at run time.
> >>
> >> (I'll just reply to this one email, since the same points applies to
> >> all replies I think)
> >>
> >> I have been thinking about this and discussing it with people for a
> >> few months now. I've been signalling a change like this for over a
> >> month now, on U-Boot contributor calls and in discussions with Linaro
> >> people. I sent a patch (below) to try to explain things. I hope it is
> >> not a surprise!
> >>
> >> The issue here is that we need a devicetree in-tree in U-Boot, to
> >> avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD,
> >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Between
> >> Ilias' series and this one we can get ourselves on a stronger footing.
> >> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.
> >> For more context:
> >>
> >>
> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-=
sjg@chromium.org/
> >>
> >> BTW I did suggest to QEMU ARM that they support a way of adding the
> >> u-boot.dtsi but there was not much interest there (in fact the
> >> maintainer would prefer there was no special support even for booting
> >> Linux directly!)
> >
> > i understand their point of view and agree with it.
> >>
> >> But in any case it doesn't really help U-Boot. I
> >> think the path forward might be to run QEMU twice, once to get its
> >> generated tree and once to give the 'merged' tree with the U-Boot
> >> properties in it, if people want to use U-Boot features.
> >>
> >> I do strongly believe that OF_BOARD must be a run-time option, not a
> >> build-time one. It creates all sorts of problems and obscurity which
> >> have taken months to unpick. See the above patch for the rationale.
> >>
> >> To add to that rationale, OF_BOARD needs to be an option available to
> >> any board. At some point in the future it may become a common way
> >> things are done, e.g. TF-A calling U-Boot and providing a devicetree
> >> to it. It doesn't make any sense to have people decide whether or not
> >> to set OF_BOARD at build time, thus affecting how the image is put
> >> together. We'll end up with different U-Boot build targets like
> >> capricorn, capricorn_of_board and the like. It should be obvious where
> >> that will lead. Instead, OF_BOARD needs to become a commonly used
> >> option, perhaps enabled by most/all boards, so that this sort of build
> >> explosion is not needed.
> >
> > If you mean that when boards are by construction providing a DTB to
> U-Boot then I agree very much. But I don=E2=80=99t understand how the pat=
ch set
> supports it as it puts dts files for those boards to be built.
> >>
> >> U-Boot needs to be flexible enough to
> >> function correctly in whatever runtime environment in which it finds
> >> itself.
> >>
> >> Also as binman is pressed into service more and more to build the
> >> complex firmware images that are becoming fashionable, it needs a
> >> definition (in the devicetree) that describes how to create the image.
> >> We can't support that unless we are building a devicetree, nor can the
> >> running program access the image layout without that information.
> >>
> >> Fran=C3=A7ois's point about 'don't use this with any kernel' is
> >> germane...but of course I am not suggesting doing that, since OF_BOARD
> >> is, still, enabled. We already use OF_BOARD for various boards that
> >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for example
> >> (as I said in the cover letter "Most boards do provide one, but some
> >> don't."). So this series is just completing the picture by enforcing
> >> that *some sort* of devicetree is always present.
> >
> > That seems inconsistent with the OF_BOARD becomes the default.
>
> I think the key point that will get you closer to where I am on this
> issue, is that OF_BOARD needs to be a run-time option. At present it
> has build-time effects and this is quite wrong.

Doesn=E2=80=99t that mean that the current build system is not fully suppor=
ting
boards that do provide the DT and you try to hack your way in ? As I
replied to Tom, I could accept temporarily a void.dts containing nothing to
actually uallly pass any build problem until we properly fix the build
system.
(But no =E2=80=9Cclose to real=E2=80=9D fake dts in the dts section)

> If you go through all
> the material I have written on this I think I have motivated that very
> clearly.
>
> Another big issue is that I believe we need ONE devicetree for U-Boot,
> not two that get merged by U-Boot. Again I have gone through that in a
> lot of detail.
>
i know but a number of people do not agree with your position. U-Boot can
leverage many DTs coming from hats and capes to finalize the DT it passes
to OS. It can also leverage a file, a FIP section (NT_FW_CONFIG in TFA) a
FIT section formatted as FDT for its own configuration.

>
> >>
> >>
> >> I can't quite pinpoint the patch where U-Boot started allowing the
> >> devicetree to be omitted, but if people are interested I could try a
> >> little harder. It was certainly not my intention (putting on my
> >> device-tree-maintainer hat) to go down that path and it slipped in
> >> somehow in all the confusion. I'm not sure anyone could tell you that
> >> rpi_3 has an in-tree devicetree but rpi_4 does not...
> >>
> >> Anyway this series is very modest. It just adds the requirement that
> >> all in-tree boards have some sort of sample devicetree and preferably
> >> some documentation as to where it might come from at runtime.
> >
> > That=E2=80=99s a very good goal. But adding files in dts make them not =
samples
> but templates to be used and replace board provided DTB.
> > If you push all your DTS files in documentation, you do what you say:
> adding sample files.
> >>
> >> That
> >> should not be a tough call IMO. Assuming we can get the validation in
> >> place (mentioned by Rob Herring recently) it will be quite natural to
> >> sync them between (presumably) Linux and U-Boot.
> >>
> >> I am also quite happy to discuss what should actually be in these
> >> devicetree files and whether some of them should be essentially empty.
> >> As you probably noticed, some of them are empty since I literally
> >> could not figure out where they come from! But there needs to be at
> >> least some skeleton for U-Boot to progress, since devicetree is
> >> critical to its feature set.
> >
> > absolutely. And thank you for your efforts to make that center stage.
> This is also Linaro Edge group mist challenging  task on the next 6 moths=
.
> Knowing that we have lived in a floating situation for over 10 years, I
> just hope we get consensus across projects and distro providers about the
> right end goal and migration strategy.
> >>
>
> Thank you.
>
> >>
> >>
> >> It is high time we tidied all this up. I predict it will be much
> >> harder, and much more confusing, in 6 months.
>
> Just to set a road map here in case you can help unblock anything,
> here are the things I am aware of, excluding the things I have
> forgotten:
>
> - Ilias OF_PRIOR_STAGE, OF_HOSTFILE series
> - this series
> - the devicetree docs patch
> - devicetree bindings upstream for U-Boot (first patch under discussion)
> - bloblist as a means of passing devicetree, ACPI, tiny config info as

the =E2=80=9CABI=E2=80=9D of U-Boot entry need more specification. Having s=
omething close
to Linux helped to get U-Boot in the RPI4 and other boards I believe. So we
could start from here. The blob list may be an extra arg (x0=3DDTB,
x1=3Dbloblist in Arm).

>
> C structs to U-Boot (needs to be written)
> - VPL so we can handle verification (patches pending)
> - bootflow / VBE v2 series (coming next week)
>
> Regards,
> Simon
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--00000000000039ac7d05ce5407ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mer. 13 oct. 2021 =C3=A0 20:06, Simon Glass &lt;<a =
href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Hi Fran=C3=A7ois,<br>
<br>
On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:fran=
cois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Hi Simon<br>
&gt;<br>
&gt; Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass &lt;<a href=3D"mailto:s=
jg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; a =C3=A9crit :<=
br>
&gt;&gt;<br>
&gt;&gt; Hi Tom, Bin,Fran=C3=A7ois,<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 12 Oct 2021 at 19:34, Tom Rini &lt;<a href=3D"mailto:trini=
@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:<br>
&gt;&gt; &gt; &gt; Hi Simon,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; On Wed, Oct 13, 2021 at 9:01 AM Simon Glass &lt;<a href=
=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wro=
te:<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; With Ilias&#39; efforts we have dropped OF_PRIOR_ST=
AGE and OF_HOSTFILE so<br>
&gt;&gt; &gt; &gt; &gt; there are only three ways to obtain a devicetree:<b=
r>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - OF_SEPARATE - the normal way, where =
the devicetree is built and<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0appended to U-Boot<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - OF_EMBED - for development purposes,=
 the devicetree is embedded in<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the ELF file (also used f=
or EFI)<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - OF_BOARD - the board figures it out =
on its own<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; The last one is currently set up so that no devicet=
ree is needed at all<br>
&gt;&gt; &gt; &gt; &gt; in the U-Boot tree. Most boards do provide one, but=
 some don&#39;t. Some<br>
&gt;&gt; &gt; &gt; &gt; don&#39;t even provide instructions on how to boot =
on the board.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; The problems with this approach are documented at [=
1].<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; In practice, OF_BOARD is not really distinct from O=
F_SEPARATE. Any board<br>
&gt;&gt; &gt; &gt; &gt; can obtain its devicetree at runtime, even it is ha=
s a devicetree built<br>
&gt;&gt; &gt; &gt; &gt; in U-Boot. This is because U-Boot may be a second-s=
tage bootloader and its<br>
&gt;&gt; &gt; &gt; &gt; caller may have a better idea about the hardware av=
ailable in the machine.<br>
&gt;&gt; &gt; &gt; &gt; This is the case with a few QEMU boards, for exampl=
e.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; So it makes no sense to have OF_BOARD as a &#39;cho=
ice&#39;. It should be an<br>
&gt;&gt; &gt; &gt; &gt; option, available with either OF_SEPARATE or OF_EMB=
ED.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; This series makes this change, adding various missi=
ng devicetree files<br>
&gt;&gt; &gt; &gt; &gt; (and placeholders) to make the build work.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Adding device trees that are never used sounds like a ha=
ck to me.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; For QEMU, device tree is dynamically generated on the fl=
y based on<br>
&gt;&gt; &gt; &gt; command line parameters, and the device tree you put in =
this series<br>
&gt;&gt; &gt; &gt; has various hardcoded &lt;phandle&gt; values which norma=
lly do not show up<br>
&gt;&gt; &gt; &gt; in hand-written dts files.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I am not sure I understand the whole point of this.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I am also confused and do not like the idea of adding device =
trees for<br>
&gt;&gt; &gt; platforms that are capable of and can / do have a device tree=
 to give us<br>
&gt;&gt; &gt; at run time.<br>
&gt;&gt;<br>
&gt;&gt; (I&#39;ll just reply to this one email, since the same points appl=
ies to<br>
&gt;&gt; all replies I think)<br>
&gt;&gt;<br>
&gt;&gt; I have been thinking about this and discussing it with people for =
a<br>
&gt;&gt; few months now. I&#39;ve been signalling a change like this for ov=
er a<br>
&gt;&gt; month now, on U-Boot contributor calls and in discussions with Lin=
aro<br>
&gt;&gt; people. I sent a patch (below) to try to explain things. I hope it=
 is<br>
&gt;&gt; not a surprise!<br>
&gt;&gt;<br>
&gt;&gt; The issue here is that we need a devicetree in-tree in U-Boot, to<=
br>
&gt;&gt; avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD,<=
br>
&gt;&gt; BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Between=
<br>
&gt;&gt; Ilias&#39; series and this one we can get ourselves on a stronger =
footing.<br>
&gt;&gt; There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.<br=
>
&gt;&gt; For more context:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://patchwork.ozlabs.org/project/uboot/patch/2021091=
9215111.3830278-3-sjg@chromium.org/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg=
@chromium.org/</a><br>
&gt;&gt;<br>
&gt;&gt; BTW I did suggest to QEMU ARM that they support a way of adding th=
e<br>
&gt;&gt; u-boot.dtsi but there was not much interest there (in fact the<br>
&gt;&gt; maintainer would prefer there was no special support even for boot=
ing<br>
&gt;&gt; Linux directly!)<br>
&gt;<br>
&gt; i understand their point of view and agree with it.<br>
&gt;&gt;<br>
&gt;&gt; But in any case it doesn&#39;t really help U-Boot. I<br>
&gt;&gt; think the path forward might be to run QEMU twice, once to get its=
<br>
&gt;&gt; generated tree and once to give the &#39;merged&#39; tree with the=
 U-Boot<br>
&gt;&gt; properties in it, if people want to use U-Boot features.<br>
&gt;&gt;<br>
&gt;&gt; I do strongly believe that OF_BOARD must be a run-time option, not=
 a<br>
&gt;&gt; build-time one. It creates all sorts of problems and obscurity whi=
ch<br>
&gt;&gt; have taken months to unpick. See the above patch for the rationale=
.<br>
&gt;&gt;<br>
&gt;&gt; To add to that rationale, OF_BOARD needs to be an option available=
 to<br>
&gt;&gt; any board. At some point in the future it may become a common way<=
br>
&gt;&gt; things are done, e.g. TF-A calling U-Boot and providing a devicetr=
ee<br>
&gt;&gt; to it. It doesn&#39;t make any sense to have people decide whether=
 or not<br>
&gt;&gt; to set OF_BOARD at build time, thus affecting how the image is put=
<br>
&gt;&gt; together. We&#39;ll end up with different U-Boot build targets lik=
e<br>
&gt;&gt; capricorn, capricorn_of_board and the like. It should be obvious w=
here<br>
&gt;&gt; that will lead. Instead, OF_BOARD needs to become a commonly used<=
br>
&gt;&gt; option, perhaps enabled by most/all boards, so that this sort of b=
uild<br>
&gt;&gt; explosion is not needed.<br>
&gt;<br>
&gt; If you mean that when boards are by construction providing a DTB to U-=
Boot then I agree very much. But I don=E2=80=99t understand how the patch s=
et=C2=A0 supports it as it puts dts files for those boards to be built.<br>
&gt;&gt;<br>
&gt;&gt; U-Boot needs to be flexible enough to<br>
&gt;&gt; function correctly in whatever runtime environment in which it fin=
ds<br>
&gt;&gt; itself.<br>
&gt;&gt;<br>
&gt;&gt; Also as binman is pressed into service more and more to build the<=
br>
&gt;&gt; complex firmware images that are becoming fashionable, it needs a<=
br>
&gt;&gt; definition (in the devicetree) that describes how to create the im=
age.<br>
&gt;&gt; We can&#39;t support that unless we are building a devicetree, nor=
 can the<br>
&gt;&gt; running program access the image layout without that information.<=
br>
&gt;&gt;<br>
&gt;&gt; Fran=C3=A7ois&#39;s point about &#39;don&#39;t use this with any k=
ernel&#39; is<br>
&gt;&gt; germane...but of course I am not suggesting doing that, since OF_B=
OARD<br>
&gt;&gt; is, still, enabled. We already use OF_BOARD for various boards tha=
t<br>
&gt;&gt; include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for examp=
le<br>
&gt;&gt; (as I said in the cover letter &quot;Most boards do provide one, b=
ut some<br>
&gt;&gt; don&#39;t.&quot;). So this series is just completing the picture b=
y enforcing<br>
&gt;&gt; that *some sort* of devicetree is always present.<br>
&gt;<br>
&gt; That seems inconsistent with the OF_BOARD becomes the default.<br>
<br>
I think the key point that will get you closer to where I am on this<br>
issue, is that OF_BOARD needs to be a run-time option. At present it<br>
has build-time effects and this is quite wrong.</blockquote><div dir=3D"aut=
o">Doesn=E2=80=99t that mean that the current build system is not fully sup=
porting boards that do provide the DT and you try to hack your way in ? As =
I replied to Tom, I could accept temporarily a void.dts containing nothing =
to actually uallly pass any build problem until we properly fix the build s=
ystem.</div><div dir=3D"auto">(But no =E2=80=9Cclose to real=E2=80=9D fake =
dts in the dts section)</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"> I=
f you go through all<br>
the material I have written on this I think I have motivated that very<br>
clearly.<br>
<br>
Another big issue is that I believe we need ONE devicetree for U-Boot,<br>
not two that get merged by U-Boot. Again I have gone through that in a<br>
lot of detail.<br>
</blockquote><div dir=3D"auto">i know but a number of people do not agree w=
ith your position. U-Boot can leverage many DTs coming from hats and capes =
to finalize the DT it passes to OS. It can also leverage a file, a FIP sect=
ion (NT_FW_CONFIG in TFA) a FIT section formatted as FDT for its own config=
uration.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I can&#39;t quite pinpoint the patch where U-Boot started allowing=
 the<br>
&gt;&gt; devicetree to be omitted, but if people are interested I could try=
 a<br>
&gt;&gt; little harder. It was certainly not my intention (putting on my<br=
>
&gt;&gt; device-tree-maintainer hat) to go down that path and it slipped in=
<br>
&gt;&gt; somehow in all the confusion. I&#39;m not sure anyone could tell y=
ou that<br>
&gt;&gt; rpi_3 has an in-tree devicetree but rpi_4 does not...<br>
&gt;&gt;<br>
&gt;&gt; Anyway this series is very modest. It just adds the requirement th=
at<br>
&gt;&gt; all in-tree boards have some sort of sample devicetree and prefera=
bly<br>
&gt;&gt; some documentation as to where it might come from at runtime.<br>
&gt;<br>
&gt; That=E2=80=99s a very good goal. But adding files in dts make them not=
 samples but templates to be used and replace board provided DTB.<br>
&gt; If you push all your DTS files in documentation, you do what you say: =
adding sample files.<br>
&gt;&gt;<br>
&gt;&gt; That<br>
&gt;&gt; should not be a tough call IMO. Assuming we can get the validation=
 in<br>
&gt;&gt; place (mentioned by Rob Herring recently) it will be quite natural=
 to<br>
&gt;&gt; sync them between (presumably) Linux and U-Boot.<br>
&gt;&gt;<br>
&gt;&gt; I am also quite happy to discuss what should actually be in these<=
br>
&gt;&gt; devicetree files and whether some of them should be essentially em=
pty.<br>
&gt;&gt; As you probably noticed, some of them are empty since I literally<=
br>
&gt;&gt; could not figure out where they come from! But there needs to be a=
t<br>
&gt;&gt; least some skeleton for U-Boot to progress, since devicetree is<br=
>
&gt;&gt; critical to its feature set.<br>
&gt;<br>
&gt; absolutely. And thank you for your efforts to make that center stage. =
This is also Linaro Edge group mist challenging=C2=A0 task on the next 6 mo=
ths. Knowing that we have lived in a floating situation for over 10 years, =
I just hope we get consensus across projects and distro providers about the=
 right end goal and migration strategy.<br>
&gt;&gt;<br>
<br>
Thank you.<br>
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; It is high time we tidied all this up. I predict it will be much<b=
r>
&gt;&gt; harder, and much more confusing, in 6 months.<br>
<br>
Just to set a road map here in case you can help unblock anything,<br>
here are the things I am aware of, excluding the things I have<br>
forgotten:<br>
<br>
- Ilias OF_PRIOR_STAGE, OF_HOSTFILE series<br>
- this series<br>
- the devicetree docs patch<br>
- devicetree bindings upstream for U-Boot (first patch under discussion)<br=
>
- bloblist as a means of passing devicetree, ACPI, tiny config info as</blo=
ckquote><div dir=3D"auto">the =E2=80=9CABI=E2=80=9D of U-Boot entry need mo=
re specification. Having something close to Linux helped to get U-Boot in t=
he RPI4 and other boards I believe. So we could start from here. The blob l=
ist may be an extra arg (x0=3DDTB, x1=3Dbloblist in Arm).</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex" dir=3D"auto"><br>
C structs to U-Boot (needs to be written)<br>
- VPL so we can handle verification (patches pending)<br>
- bootflow / VBE v2 series (coming next week)<br>
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

--00000000000039ac7d05ce5407ff--

