Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8579D42E0AD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 20:00:42 +0200 (CEST)
Received: from localhost ([::1]:50988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb521-0000ep-JY
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 14:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mb50T-0008QA-Tf
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:59:05 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mb50Q-0004Dx-BT
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:59:05 -0400
Received: by mail-ed1-x52f.google.com with SMTP id z20so27714648edc.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 10:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=95/a0RC7F1bdsZXF2H4mPA51a9DbYtwD6fXCeCgva04=;
 b=x1tXa7Nb3erdErrNirIJhY1ZEvcrPa2MRZbrGg2YvOd/1obJ9BLiGbIB5BEYFq9cZW
 1M9HVn0IqSEHt1JXdZJ91vbAxZQ2XYUtTYcOQ4lzU6VdaLzorQzK4aozPbIz3CEC0X/U
 HmnCX0QaDQsNMhDBu4QSZdinZfaXEWufNeKMUkyDpocbjvEy6DVvR4IZIIDpwxjMpbl3
 zXgGA3LGcRVPzlwY4MJsFlT17F4t+qmWeSph3KIF4ZM15rBvCbq2e57cGfOIbLmhH9G/
 tRP0U+FProR7XSRy7g2Pcvr7pJDDLjri4Pk4PkRfFXHmCl5/7UKMkeiac4gR2APK1cFA
 kw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=95/a0RC7F1bdsZXF2H4mPA51a9DbYtwD6fXCeCgva04=;
 b=e/1MF02RjRKUoHtibi8j5napHf57o47yTO0Q/+ruIHpTNgwqXe61kH4netpLXoU2Lb
 SeiQ51/18fn3yX3F/FLMTL/icDnZPg6FZBZ6r49jS24epr4KbFyTyp8+rKL67bXSxWVR
 SeRt0U8jNCGJf+tnVLc/tTGDIw2nnYtPc61UFqveBes+nnkfQv85COPgIbdO6HsSYD9i
 D9jYUIyXgM0Wcb5O7uQbdyyMFkV/EBpni+/izsLr9OyFjTWbT7fO8U8OtucuWrO7CH4/
 eTuoCMh/879Gib5jGj702Gpyr7YkTeGJHwzFsPabE+PX9/UXh+yZt8X224b5ETvutmLl
 X1nw==
X-Gm-Message-State: AOAM533ucu9xFz8FdfiIcWSIzC3Y1F58PdAVM1SR0A1ERmVXijBlXCq6
 /caWFLfcK7xMDUvSEgxG+aDQhSzCSkfYjwDl/k4EYQ==
X-Google-Smtp-Source: ABdhPJyU2ptchJ95Y+axeSQdXlBWYB/yUwX7Eqryd3GPzuaB+soixikTn1uYK6e9HAwVVThReas9uobQfXe0kTin5Ic=
X-Received: by 2002:a17:906:94da:: with SMTP id
 d26mr493743ejy.213.1634234340073; 
 Thu, 14 Oct 2021 10:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
In-Reply-To: <20211014152801.GF7964@bill-the-cat>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Thu, 14 Oct 2021 19:58:49 +0200
Message-ID: <CAHFG_=XDCXhtgsQuaz4F_sngUuAeVMaJ=v0dpZvz4kkCbHe=Ng@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000051fd6e05ce53d57a"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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

--00000000000051fd6e05ce53d57a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 14 oct. 2021 =C3=A0 17:28, Tom Rini <trini@konsulko.com> a =C3=A9cr=
it :

> On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> > Hi Tom,
> >
> > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > > > Hi Fran=C3=A7ois,
> > > >
> > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <
> francois.ozog@linaro.org> wrote:
> > > > >
> > > > > Hi Simon
> > > > >
> > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.org>=
 a
> =C3=A9crit :
> > > > >>
> > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > >>
> > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com>
> wrote:
> > > > >> >
> > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> > > > >> > > Hi Simon,
> > > > >> > >
> > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.or=
g>
> wrote:
> > > > >> > > >
> > > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and
> OF_HOSTFILE so
> > > > >> > > > there are only three ways to obtain a devicetree:
> > > > >> > > >
> > > > >> > > >    - OF_SEPARATE - the normal way, where the devicetree is
> built and
> > > > >> > > >       appended to U-Boot
> > > > >> > > >    - OF_EMBED - for development purposes, the devicetree i=
s
> embedded in
> > > > >> > > >       the ELF file (also used for EFI)
> > > > >> > > >    - OF_BOARD - the board figures it out on its own
> > > > >> > > >
> > > > >> > > > The last one is currently set up so that no devicetree is
> needed at all
> > > > >> > > > in the U-Boot tree. Most boards do provide one, but some
> don't. Some
> > > > >> > > > don't even provide instructions on how to boot on the boar=
d.
> > > > >> > > >
> > > > >> > > > The problems with this approach are documented at [1].
> > > > >> > > >
> > > > >> > > > In practice, OF_BOARD is not really distinct from
> OF_SEPARATE. Any board
> > > > >> > > > can obtain its devicetree at runtime, even it is has a
> devicetree built
> > > > >> > > > in U-Boot. This is because U-Boot may be a second-stage
> bootloader and its
> > > > >> > > > caller may have a better idea about the hardware available
> in the machine.
> > > > >> > > > This is the case with a few QEMU boards, for example.
> > > > >> > > >
> > > > >> > > > So it makes no sense to have OF_BOARD as a 'choice'. It
> should be an
> > > > >> > > > option, available with either OF_SEPARATE or OF_EMBED.
> > > > >> > > >
> > > > >> > > > This series makes this change, adding various missing
> devicetree files
> > > > >> > > > (and placeholders) to make the build work.
> > > > >> > >
> > > > >> > > Adding device trees that are never used sounds like a hack t=
o
> me.
> > > > >> > >
> > > > >> > > For QEMU, device tree is dynamically generated on the fly
> based on
> > > > >> > > command line parameters, and the device tree you put in this
> series
> > > > >> > > has various hardcoded <phandle> values which normally do not
> show up
> > > > >> > > in hand-written dts files.
> > > > >> > >
> > > > >> > > I am not sure I understand the whole point of this.
> > > > >> >
> > > > >> > I am also confused and do not like the idea of adding device
> trees for
> > > > >> > platforms that are capable of and can / do have a device tree
> to give us
> > > > >> > at run time.
> > > > >>
> > > > >> (I'll just reply to this one email, since the same points applie=
s
> to
> > > > >> all replies I think)
> > > > >>
> > > > >> I have been thinking about this and discussing it with people fo=
r
> a
> > > > >> few months now. I've been signalling a change like this for over=
 a
> > > > >> month now, on U-Boot contributor calls and in discussions with
> Linaro
> > > > >> people. I sent a patch (below) to try to explain things. I hope
> it is
> > > > >> not a surprise!
> > > > >>
> > > > >> The issue here is that we need a devicetree in-tree in U-Boot, t=
o
> > > > >> avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD=
,
> > > > >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Betwe=
en
> > > > >> Ilias' series and this one we can get ourselves on a stronger
> footing.
> > > > >> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.
> > > > >> For more context:
> > > > >>
> > > > >>
> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-=
sjg@chromium.org/
> > > > >>
> > > > >> BTW I did suggest to QEMU ARM that they support a way of adding
> the
> > > > >> u-boot.dtsi but there was not much interest there (in fact the
> > > > >> maintainer would prefer there was no special support even for
> booting
> > > > >> Linux directly!)
> > > > >
> > > > > i understand their point of view and agree with it.
> > > > >>
> > > > >> But in any case it doesn't really help U-Boot. I
> > > > >> think the path forward might be to run QEMU twice, once to get i=
ts
> > > > >> generated tree and once to give the 'merged' tree with the U-Boo=
t
> > > > >> properties in it, if people want to use U-Boot features.
> > > > >>
> > > > >> I do strongly believe that OF_BOARD must be a run-time option,
> not a
> > > > >> build-time one. It creates all sorts of problems and obscurity
> which
> > > > >> have taken months to unpick. See the above patch for the
> rationale.
> > > > >>
> > > > >> To add to that rationale, OF_BOARD needs to be an option
> available to
> > > > >> any board. At some point in the future it may become a common wa=
y
> > > > >> things are done, e.g. TF-A calling U-Boot and providing a
> devicetree
> > > > >> to it. It doesn't make any sense to have people decide whether o=
r
> not
> > > > >> to set OF_BOARD at build time, thus affecting how the image is p=
ut
> > > > >> together. We'll end up with different U-Boot build targets like
> > > > >> capricorn, capricorn_of_board and the like. It should be obvious
> where
> > > > >> that will lead. Instead, OF_BOARD needs to become a commonly use=
d
> > > > >> option, perhaps enabled by most/all boards, so that this sort of
> build
> > > > >> explosion is not needed.
> > > > >
> > > > > If you mean that when boards are by construction providing a DTB
> to U-Boot then I agree very much. But I don=E2=80=99t understand how the =
patch set
> supports it as it puts dts files for those boards to be built.
> > > > >>
> > > > >> U-Boot needs to be flexible enough to
> > > > >> function correctly in whatever runtime environment in which it
> finds
> > > > >> itself.
> > > > >>
> > > > >> Also as binman is pressed into service more and more to build th=
e
> > > > >> complex firmware images that are becoming fashionable, it needs =
a
> > > > >> definition (in the devicetree) that describes how to create the
> image.
> > > > >> We can't support that unless we are building a devicetree, nor
> can the
> > > > >> running program access the image layout without that information=
.
> > > > >>
> > > > >> Fran=C3=A7ois's point about 'don't use this with any kernel' is
> > > > >> germane...but of course I am not suggesting doing that, since
> OF_BOARD
> > > > >> is, still, enabled. We already use OF_BOARD for various boards
> that
> > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for
> example
> > > > >> (as I said in the cover letter "Most boards do provide one, but
> some
> > > > >> don't."). So this series is just completing the picture by
> enforcing
> > > > >> that *some sort* of devicetree is always present.
> > > > >
> > > > > That seems inconsistent with the OF_BOARD becomes the default.
> > > >
> > > > I think the key point that will get you closer to where I am on thi=
s
> > > > issue, is that OF_BOARD needs to be a run-time option. At present i=
t
> > > > has build-time effects and this is quite wrong. If you go through a=
ll
> > > > the material I have written on this I think I have motivated that
> very
> > > > clearly.
> > > >
> > > > Another big issue is that I believe we need ONE devicetree for
> U-Boot,
> > > > not two that get merged by U-Boot. Again I have gone through that i=
n
> a
> > > > lot of detail.
> > >
> > > I have a long long reply to your first reply here saved, but, maybe
> > > here's the biggest sticking point.  To be clear, you agree that U-Boo=
t
> > > needs to support being passed a device tree to use, at run time, yes?
> >
> > Yes. The OF_BOARD feature provides this.
> >
> > >
> > > And in that case, would not be using the "fake" tree we built in?
> >
> > Not at runtime.
>
> OK.
>
> > > So is the sticking point here that we really have two classes of
> > > devices, one class where we will never ever be given the device tree =
at
> > > run time (think BeagleBone Black) and one where we will always be giv=
en
> > > one at run time (think Raspberry Pi) ?
> >
> > I'm not sure it will be that black and white. I suspect there will be
> > (many) boards which can boot happily with the U-Boot devicetree but
> > can also accept one at runtime, if provided. For example, you may want
> > to boot with or without TF-A or some other, earlier stage.
>
> I'm not sure I see the value in making this a gray area.  There's very
> much a class of "never" boards.  There's also the class of "can" today.
> Maybe as part of a developer iterative flow it would be nice to not have
> to re-flash the prior stage to change a DT, and just do it in U-Boot
> until things are happy, but I'm not sure what the use case is for
> overriding the previous stage.
>
> Especially since the pushback on this series I think has all been "why
> are we copying in a tree to build with?  We don't want to use it at run
> time!".  And then softer push back like "Well, U-Boot says we have to
> include the device tree file here, but we won't use it...".
>
> > I believe we have got unstuck because OF_BOARD (perhaps inadvertently)
> > provided a way to entirely omit a devicetree from U-Boot, thus making
> > things like binman and U-Boot /config impossible, for example. So I
> > want to claw that back, so there is always some sort of devicetree in
> > U-Boot, as we have for rpi_3, etc.
>
> I really want to see what the binary case looks like since we could then
> kill off rpi_{3,3_b,4}_defconfig and I would need to see if we could
> then also do a rpi_arm32_defconfig too.
>
> I want to see less device trees in U-Boot sources, if they can come
> functionally correct from the hardware/our caller.
>
> And I'm not seeing how we make use of "U-Boot /config" if we also don't
> use the device tree from build time at run time, ignoring the device
> tree provided to us at run time by the caller.

+1
if there is a complex build problem to solve when no DT is needed when
OF_BOARD is needed i could agree to temporarily have a void.dts like

/dts-v1/;
/ {
/* required to pass build until proper makefike for OF_BOARD */
};

But not pseudo dts for boards that provide a DT to U-Boot. The pseudo dts
are good for reference in the documentation part of the tree.


>
> --
> Tom
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--00000000000051fd6e05ce53d57a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0jeu. 14 oct. 2021 =C3=A0 17:28, Tom Rini &lt;<a hre=
f=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)">On Thu, Oct 14, 2021 at 09:17:52AM -0600, Si=
mon Glass wrote:<br>
&gt; Hi Tom,<br>
&gt; <br>
&gt; On Thu, 14 Oct 2021 at 08:56, Tom Rini &lt;<a href=3D"mailto:trini@kon=
sulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:<br>
&gt; &gt; &gt; Hi Fran=C3=A7ois,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog &lt;<a href=
=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro=
.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Simon<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass &lt;<a h=
ref=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; =
a =C3=A9crit :<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Hi Tom, Bin,Fran=C3=A7ois,<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; On Tue, 12 Oct 2021 at 19:34, Tom Rini &lt;<a href=
=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt;=
 wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin =
Meng wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; Hi Simon,<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; On Wed, Oct 13, 2021 at 9:01 AM Simon Gla=
ss &lt;<a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.o=
rg</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; With Ilias&#39; efforts we have drop=
ped OF_PRIOR_STAGE and OF_HOSTFILE so<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; there are only three ways to obtain =
a devicetree:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - OF_SEPARATE - the nor=
mal way, where the devicetree is built and<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0appended t=
o U-Boot<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - OF_EMBED - for develo=
pment purposes, the devicetree is embedded in<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the ELF fi=
le (also used for EFI)<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - OF_BOARD - the board =
figures it out on its own<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; The last one is currently set up so =
that no devicetree is needed at all<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; in the U-Boot tree. Most boards do p=
rovide one, but some don&#39;t. Some<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; don&#39;t even provide instructions =
on how to boot on the board.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; The problems with this approach are =
documented at [1].<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; In practice, OF_BOARD is not really =
distinct from OF_SEPARATE. Any board<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; can obtain its devicetree at runtime=
, even it is has a devicetree built<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; in U-Boot. This is because U-Boot ma=
y be a second-stage bootloader and its<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; caller may have a better idea about =
the hardware available in the machine.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; This is the case with a few QEMU boa=
rds, for example.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; So it makes no sense to have OF_BOAR=
D as a &#39;choice&#39;. It should be an<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; option, available with either OF_SEP=
ARATE or OF_EMBED.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; This series makes this change, addin=
g various missing devicetree files<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; (and placeholders) to make the build=
 work.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; Adding device trees that are never used s=
ounds like a hack to me.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; For QEMU, device tree is dynamically gene=
rated on the fly based on<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; command line parameters, and the device t=
ree you put in this series<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; has various hardcoded &lt;phandle&gt; val=
ues which normally do not show up<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; in hand-written dts files.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; I am not sure I understand the whole poin=
t of this.<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; I am also confused and do not like the idea of=
 adding device trees for<br>
&gt; &gt; &gt; &gt;&gt; &gt; platforms that are capable of and can / do hav=
e a device tree to give us<br>
&gt; &gt; &gt; &gt;&gt; &gt; at run time.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; (I&#39;ll just reply to this one email, since the s=
ame points applies to<br>
&gt; &gt; &gt; &gt;&gt; all replies I think)<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; I have been thinking about this and discussing it w=
ith people for a<br>
&gt; &gt; &gt; &gt;&gt; few months now. I&#39;ve been signalling a change l=
ike this for over a<br>
&gt; &gt; &gt; &gt;&gt; month now, on U-Boot contributor calls and in discu=
ssions with Linaro<br>
&gt; &gt; &gt; &gt;&gt; people. I sent a patch (below) to try to explain th=
ings. I hope it is<br>
&gt; &gt; &gt; &gt;&gt; not a surprise!<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; The issue here is that we need a devicetree in-tree=
 in U-Boot, to<br>
&gt; &gt; &gt; &gt;&gt; avoid the mess that has been created by OF_PRIOR_ST=
AGE, OF_BOARD,<br>
&gt; &gt; &gt; &gt;&gt; BINMAN_STANDALONE_FDT and to a lesser extent, OF_HO=
STFILE. Between<br>
&gt; &gt; &gt; &gt;&gt; Ilias&#39; series and this one we can get ourselves=
 on a stronger footing.<br>
&gt; &gt; &gt; &gt;&gt; There is just OF_SEPARATE, with OF_EMBED for debugg=
ing/ELF use.<br>
&gt; &gt; &gt; &gt;&gt; For more context:<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; <a href=3D"http://patchwork.ozlabs.org/project/uboo=
t/patch/20210919215111.3830278-3-sjg@chromium.org/" rel=3D"noreferrer" targ=
et=3D"_blank">http://patchwork.ozlabs.org/project/uboot/patch/2021091921511=
1.3830278-3-sjg@chromium.org/</a><br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; BTW I did suggest to QEMU ARM that they support a w=
ay of adding the<br>
&gt; &gt; &gt; &gt;&gt; u-boot.dtsi but there was not much interest there (=
in fact the<br>
&gt; &gt; &gt; &gt;&gt; maintainer would prefer there was no special suppor=
t even for booting<br>
&gt; &gt; &gt; &gt;&gt; Linux directly!)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; i understand their point of view and agree with it.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; But in any case it doesn&#39;t really help U-Boot. =
I<br>
&gt; &gt; &gt; &gt;&gt; think the path forward might be to run QEMU twice, =
once to get its<br>
&gt; &gt; &gt; &gt;&gt; generated tree and once to give the &#39;merged&#39=
; tree with the U-Boot<br>
&gt; &gt; &gt; &gt;&gt; properties in it, if people want to use U-Boot feat=
ures.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; I do strongly believe that OF_BOARD must be a run-t=
ime option, not a<br>
&gt; &gt; &gt; &gt;&gt; build-time one. It creates all sorts of problems an=
d obscurity which<br>
&gt; &gt; &gt; &gt;&gt; have taken months to unpick. See the above patch fo=
r the rationale.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; To add to that rationale, OF_BOARD needs to be an o=
ption available to<br>
&gt; &gt; &gt; &gt;&gt; any board. At some point in the future it may becom=
e a common way<br>
&gt; &gt; &gt; &gt;&gt; things are done, e.g. TF-A calling U-Boot and provi=
ding a devicetree<br>
&gt; &gt; &gt; &gt;&gt; to it. It doesn&#39;t make any sense to have people=
 decide whether or not<br>
&gt; &gt; &gt; &gt;&gt; to set OF_BOARD at build time, thus affecting how t=
he image is put<br>
&gt; &gt; &gt; &gt;&gt; together. We&#39;ll end up with different U-Boot bu=
ild targets like<br>
&gt; &gt; &gt; &gt;&gt; capricorn, capricorn_of_board and the like. It shou=
ld be obvious where<br>
&gt; &gt; &gt; &gt;&gt; that will lead. Instead, OF_BOARD needs to become a=
 commonly used<br>
&gt; &gt; &gt; &gt;&gt; option, perhaps enabled by most/all boards, so that=
 this sort of build<br>
&gt; &gt; &gt; &gt;&gt; explosion is not needed.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; If you mean that when boards are by construction provid=
ing a DTB to U-Boot then I agree very much. But I don=E2=80=99t understand =
how the patch set=C2=A0 supports it as it puts dts files for those boards t=
o be built.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; U-Boot needs to be flexible enough to<br>
&gt; &gt; &gt; &gt;&gt; function correctly in whatever runtime environment =
in which it finds<br>
&gt; &gt; &gt; &gt;&gt; itself.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Also as binman is pressed into service more and mor=
e to build the<br>
&gt; &gt; &gt; &gt;&gt; complex firmware images that are becoming fashionab=
le, it needs a<br>
&gt; &gt; &gt; &gt;&gt; definition (in the devicetree) that describes how t=
o create the image.<br>
&gt; &gt; &gt; &gt;&gt; We can&#39;t support that unless we are building a =
devicetree, nor can the<br>
&gt; &gt; &gt; &gt;&gt; running program access the image layout without tha=
t information.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Fran=C3=A7ois&#39;s point about &#39;don&#39;t use =
this with any kernel&#39; is<br>
&gt; &gt; &gt; &gt;&gt; germane...but of course I am not suggesting doing t=
hat, since OF_BOARD<br>
&gt; &gt; &gt; &gt;&gt; is, still, enabled. We already use OF_BOARD for var=
ious boards that<br>
&gt; &gt; &gt; &gt;&gt; include an in-tree devicetree - Raspberry Pi 1, 2 a=
nd 3, for example<br>
&gt; &gt; &gt; &gt;&gt; (as I said in the cover letter &quot;Most boards do=
 provide one, but some<br>
&gt; &gt; &gt; &gt;&gt; don&#39;t.&quot;). So this series is just completin=
g the picture by enforcing<br>
&gt; &gt; &gt; &gt;&gt; that *some sort* of devicetree is always present.<b=
r>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; That seems inconsistent with the OF_BOARD becomes the d=
efault.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I think the key point that will get you closer to where I am=
 on this<br>
&gt; &gt; &gt; issue, is that OF_BOARD needs to be a run-time option. At pr=
esent it<br>
&gt; &gt; &gt; has build-time effects and this is quite wrong. If you go th=
rough all<br>
&gt; &gt; &gt; the material I have written on this I think I have motivated=
 that very<br>
&gt; &gt; &gt; clearly.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Another big issue is that I believe we need ONE devicetree f=
or U-Boot,<br>
&gt; &gt; &gt; not two that get merged by U-Boot. Again I have gone through=
 that in a<br>
&gt; &gt; &gt; lot of detail.<br>
&gt; &gt;<br>
&gt; &gt; I have a long long reply to your first reply here saved, but, may=
be<br>
&gt; &gt; here&#39;s the biggest sticking point.=C2=A0 To be clear, you agr=
ee that U-Boot<br>
&gt; &gt; needs to support being passed a device tree to use, at run time, =
yes?<br>
&gt; <br>
&gt; Yes. The OF_BOARD feature provides this.<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; And in that case, would not be using the &quot;fake&quot; tree we=
 built in?<br>
&gt; <br>
&gt; Not at runtime.<br>
<br>
OK.<br>
<br>
&gt; &gt; So is the sticking point here that we really have two classes of<=
br>
&gt; &gt; devices, one class where we will never ever be given the device t=
ree at<br>
&gt; &gt; run time (think BeagleBone Black) and one where we will always be=
 given<br>
&gt; &gt; one at run time (think Raspberry Pi) ?<br>
&gt; <br>
&gt; I&#39;m not sure it will be that black and white. I suspect there will=
 be<br>
&gt; (many) boards which can boot happily with the U-Boot devicetree but<br=
>
&gt; can also accept one at runtime, if provided. For example, you may want=
<br>
&gt; to boot with or without TF-A or some other, earlier stage.<br>
<br>
I&#39;m not sure I see the value in making this a gray area.=C2=A0 There&#3=
9;s very<br>
much a class of &quot;never&quot; boards.=C2=A0 There&#39;s also the class =
of &quot;can&quot; today.<br>
Maybe as part of a developer iterative flow it would be nice to not have<br=
>
to re-flash the prior stage to change a DT, and just do it in U-Boot<br>
until things are happy, but I&#39;m not sure what the use case is for<br>
overriding the previous stage.<br>
<br>
Especially since the pushback on this series I think has all been &quot;why=
<br>
are we copying in a tree to build with?=C2=A0 We don&#39;t want to use it a=
t run<br>
time!&quot;.=C2=A0 And then softer push back like &quot;Well, U-Boot says w=
e have to<br>
include the device tree file here, but we won&#39;t use it...&quot;.<br>
<br>
&gt; I believe we have got unstuck because OF_BOARD (perhaps inadvertently)=
<br>
&gt; provided a way to entirely omit a devicetree from U-Boot, thus making<=
br>
&gt; things like binman and U-Boot /config impossible, for example. So I<br=
>
&gt; want to claw that back, so there is always some sort of devicetree in<=
br>
&gt; U-Boot, as we have for rpi_3, etc.<br>
<br>
I really want to see what the binary case looks like since we could then<br=
>
kill off rpi_{3,3_b,4}_defconfig and I would need to see if we could<br>
then also do a rpi_arm32_defconfig too.<br>
<br>
I want to see less device trees in U-Boot sources, if they can come<br>
functionally correct from the hardware/our caller.<br>
<br>
And I&#39;m not seeing how we make use of &quot;U-Boot /config&quot; if we =
also don&#39;t<br>
use the device tree from build time at run time, ignoring the device<br>
tree provided to us at run time by the caller.</blockquote><div dir=3D"auto=
">+1</div><div dir=3D"auto">if there is a complex build problem to solve wh=
en no DT is needed when OF_BOARD is needed i could agree to temporarily hav=
e a void.dts like</div><div dir=3D"auto"><br></div><div dir=3D"auto"><span =
class=3D"cp" style=3D"font-size:14px;box-sizing:border-box;font-family:SFMo=
no-Regular,Menlo,Monaco,Consolas,&quot;Liberation Mono&quot;,&quot;Courier =
New&quot;,Courier,monospace;color:var(--highlight-keyword2-color)">/dts-v1/=
</span><span class=3D"p" style=3D"font-size:14px;box-sizing:border-box;font=
-family:SFMono-Regular,Menlo,Monaco,Consolas,&quot;Liberation Mono&quot;,&q=
uot;Courier New&quot;,Courier,monospace">;</span></div><div dir=3D"auto"><s=
pan class=3D"nf" style=3D"font-size:14px;box-sizing:border-box;font-family:=
SFMono-Regular,Menlo,Monaco,Consolas,&quot;Liberation Mono&quot;,&quot;Cour=
ier New&quot;,Courier,monospace;color:var(--highlight-function-color)">/</s=
pan><span class=3D"cm" style=3D"font-size:14px;box-sizing:border-box;font-s=
tyle:italic;font-family:SFMono-Regular,Menlo,Monaco,Consolas,&quot;Liberati=
on Mono&quot;,&quot;Courier New&quot;,Courier,monospace;color:var(--highlig=
ht-comment-color)"> </span><span class=3D"p" style=3D"font-size:14px;box-si=
zing:border-box;font-family:SFMono-Regular,Menlo,Monaco,Consolas,&quot;Libe=
ration Mono&quot;,&quot;Courier New&quot;,Courier,monospace">{</span></div>=
<div dir=3D"auto"><span class=3D"p" style=3D"font-size:14px;box-sizing:bord=
er-box;font-family:SFMono-Regular,Menlo,Monaco,Consolas,&quot;Liberation Mo=
no&quot;,&quot;Courier New&quot;,Courier,monospace">/* required to pass bui=
ld until proper makefike for OF_BOARD */</span></div><div dir=3D"auto"><spa=
n style=3D"font-family:SFMono-Regular,Menlo,Monaco,Consolas,&quot;Liberatio=
n Mono&quot;,&quot;Courier New&quot;,Courier,monospace;font-size:14px">};</=
span></div><div dir=3D"auto"><br></div><div dir=3D"auto">But not pseudo dts=
 for boards that provide a DT to U-Boot. The pseudo dts are good for refere=
nce in the documentation part of the tree.</div><div dir=3D"auto"><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)" dir=3D"auto"><br>
<br>
-- <br>
Tom<br>
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

--00000000000051fd6e05ce53d57a--

