Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E2043CAF8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:44:35 +0200 (CEST)
Received: from localhost ([::1]:33012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjEI-0002Gc-D3
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfimO-0003lg-4D
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:15:45 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfimG-00062E-M7
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:15:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id m17so9930855edc.12
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U1QtgtwNOoMDC9v7MayNIi0ZgWGlRy/jITT6EZV8XuA=;
 b=S92W+aESAgyU0jG64vf9SiZAZS1/xreY5QO3QMfewqLXs7uNeHlbX36sSiGzK4pkVk
 P6EI/vCk5wcaJ1p4matCPJ5giLdDGxRaO5gEv4Tg39PeGgfn5EkQNyGely3UqN3/vkC4
 CRHUgm0BmjsJEwJhivg+Tpl9+08pCjhOlAby6PH6QZJSCPaKXnATl00ssHSA1ehsmyDA
 nQpa8Gf/37tglaWSW31i2REyWDLcZiIpzKeridc7qvyoFqwMm7fP3D7YrralZH7HRG0S
 YcMlfv2bGHzcNBE8HjrhvETQqS4zQlE02+R+EDuzNU3rig+eh1WTKFaCfrMr18QsUnRj
 8HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U1QtgtwNOoMDC9v7MayNIi0ZgWGlRy/jITT6EZV8XuA=;
 b=24aTRbo6RQjxIwTixuFJqc5VGA9ra9FMZpc9JtHT7Ur+tUaMC0lN5mGSDXAUbT7dov
 6p0ZMSbPmAplwERmOtW3C63WcZ2m3GDowGLMEaA3MtziSYJlj8TO7khEoYYSOaa3xmoM
 2RKKJq54JHCdyvsBoHvpy+AYfbMYIBDJ8LXk+t2Rg+LnngiXjyJcswPrvPXubjG+0FDg
 /dTYjNZWhrYRT6/uI7AsugSxy+z3kyffY/xGwhdQjj/mCgL3VVa05YHYugu7mtaJUpwJ
 9ZTlJ5GYdwr8J3buYURb8pnekzk5xobU+A7OhfzI5rHzbqoKxPhffT+tDFTSAf1PSdWB
 c+7Q==
X-Gm-Message-State: AOAM5329Kc5Iz7HNObJIWUqlstQjDKWbWWoBTzJEE0SL2OZx59BESpEs
 HG90gjIsE9qt1O2nAzg50jU4By+/On9T2tsCoFv3gA==
X-Google-Smtp-Source: ABdhPJwNNBZCO2SnadVzHsirzbS+kBEuVQay3G37tRuTAhWGNUXUFg85PXRh75G1bmQqTs6MYYPeXIOfFJEx2fzNyiI=
X-Received: by 2002:a05:6402:10cd:: with SMTP id
 p13mr38700252edu.111.1635340513877; 
 Wed, 27 Oct 2021 06:15:13 -0700 (PDT)
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
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <20211027124840.GR8284@bill-the-cat>
In-Reply-To: <20211027124840.GR8284@bill-the-cat>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 27 Oct 2021 15:15:01 +0200
Message-ID: <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000006b9e2a05cf55628b"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x529.google.com
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

--0000000000006b9e2a05cf55628b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 27 Oct 2021 at 14:48, Tom Rini <trini@konsulko.com> wrote:

> On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass wrote:
> > Hi all,
> >
> > On Thu, 14 Oct 2021 at 09:28, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> > > > Hi Tom,
> > > >
> > > > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
> > > > >
> > > > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > > > > > Hi Fran=C3=A7ois,
> > > > > >
> > > > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <
> francois.ozog@linaro.org> wrote:
> > > > > > >
> > > > > > > Hi Simon
> > > > > > >
> > > > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.=
org>
> a =C3=A9crit :
> > > > > > >>
> > > > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > > > >>
> > > > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com>
> wrote:
> > > > > > >> >
> > > > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> > > > > > >> > > Hi Simon,
> > > > > > >> > >
> > > > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <
> sjg@chromium.org> wrote:
> > > > > > >> > > >
> > > > > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and
> OF_HOSTFILE so
> > > > > > >> > > > there are only three ways to obtain a devicetree:
> > > > > > >> > > >
> > > > > > >> > > >    - OF_SEPARATE - the normal way, where the devicetre=
e
> is built and
> > > > > > >> > > >       appended to U-Boot
> > > > > > >> > > >    - OF_EMBED - for development purposes, the
> devicetree is embedded in
> > > > > > >> > > >       the ELF file (also used for EFI)
> > > > > > >> > > >    - OF_BOARD - the board figures it out on its own
> > > > > > >> > > >
> > > > > > >> > > > The last one is currently set up so that no devicetree
> is needed at all
> > > > > > >> > > > in the U-Boot tree. Most boards do provide one, but
> some don't. Some
> > > > > > >> > > > don't even provide instructions on how to boot on the
> board.
> > > > > > >> > > >
> > > > > > >> > > > The problems with this approach are documented at [1].
> > > > > > >> > > >
> > > > > > >> > > > In practice, OF_BOARD is not really distinct from
> OF_SEPARATE. Any board
> > > > > > >> > > > can obtain its devicetree at runtime, even it is has a
> devicetree built
> > > > > > >> > > > in U-Boot. This is because U-Boot may be a second-stag=
e
> bootloader and its
> > > > > > >> > > > caller may have a better idea about the hardware
> available in the machine.
> > > > > > >> > > > This is the case with a few QEMU boards, for example.
> > > > > > >> > > >
> > > > > > >> > > > So it makes no sense to have OF_BOARD as a 'choice'. I=
t
> should be an
> > > > > > >> > > > option, available with either OF_SEPARATE or OF_EMBED.
> > > > > > >> > > >
> > > > > > >> > > > This series makes this change, adding various missing
> devicetree files
> > > > > > >> > > > (and placeholders) to make the build work.
> > > > > > >> > >
> > > > > > >> > > Adding device trees that are never used sounds like a
> hack to me.
> > > > > > >> > >
> > > > > > >> > > For QEMU, device tree is dynamically generated on the fl=
y
> based on
> > > > > > >> > > command line parameters, and the device tree you put in
> this series
> > > > > > >> > > has various hardcoded <phandle> values which normally do
> not show up
> > > > > > >> > > in hand-written dts files.
> > > > > > >> > >
> > > > > > >> > > I am not sure I understand the whole point of this.
> > > > > > >> >
> > > > > > >> > I am also confused and do not like the idea of adding
> device trees for
> > > > > > >> > platforms that are capable of and can / do have a device
> tree to give us
> > > > > > >> > at run time.
> > > > > > >>
> > > > > > >> (I'll just reply to this one email, since the same points
> applies to
> > > > > > >> all replies I think)
> > > > > > >>
> > > > > > >> I have been thinking about this and discussing it with peopl=
e
> for a
> > > > > > >> few months now. I've been signalling a change like this for
> over a
> > > > > > >> month now, on U-Boot contributor calls and in discussions
> with Linaro
> > > > > > >> people. I sent a patch (below) to try to explain things. I
> hope it is
> > > > > > >> not a surprise!
> > > > > > >>
> > > > > > >> The issue here is that we need a devicetree in-tree in
> U-Boot, to
> > > > > > >> avoid the mess that has been created by OF_PRIOR_STAGE,
> OF_BOARD,
> > > > > > >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE.
> Between
> > > > > > >> Ilias' series and this one we can get ourselves on a stronge=
r
> footing.
> > > > > > >> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF
> use.
> > > > > > >> For more context:
> > > > > > >>
> > > > > > >>
> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-=
sjg@chromium.org/
> > > > > > >>
> > > > > > >> BTW I did suggest to QEMU ARM that they support a way of
> adding the
> > > > > > >> u-boot.dtsi but there was not much interest there (in fact t=
he
> > > > > > >> maintainer would prefer there was no special support even fo=
r
> booting
> > > > > > >> Linux directly!)
> > > > > > >
> > > > > > > i understand their point of view and agree with it.
> > > > > > >>
> > > > > > >> But in any case it doesn't really help U-Boot. I
> > > > > > >> think the path forward might be to run QEMU twice, once to
> get its
> > > > > > >> generated tree and once to give the 'merged' tree with the
> U-Boot
> > > > > > >> properties in it, if people want to use U-Boot features.
> > > > > > >>
> > > > > > >> I do strongly believe that OF_BOARD must be a run-time
> option, not a
> > > > > > >> build-time one. It creates all sorts of problems and
> obscurity which
> > > > > > >> have taken months to unpick. See the above patch for the
> rationale.
> > > > > > >>
> > > > > > >> To add to that rationale, OF_BOARD needs to be an option
> available to
> > > > > > >> any board. At some point in the future it may become a commo=
n
> way
> > > > > > >> things are done, e.g. TF-A calling U-Boot and providing a
> devicetree
> > > > > > >> to it. It doesn't make any sense to have people decide
> whether or not
> > > > > > >> to set OF_BOARD at build time, thus affecting how the image
> is put
> > > > > > >> together. We'll end up with different U-Boot build targets
> like
> > > > > > >> capricorn, capricorn_of_board and the like. It should be
> obvious where
> > > > > > >> that will lead. Instead, OF_BOARD needs to become a commonly
> used
> > > > > > >> option, perhaps enabled by most/all boards, so that this sor=
t
> of build
> > > > > > >> explosion is not needed.
> > > > > > >
> > > > > > > If you mean that when boards are by construction providing a
> DTB to U-Boot then I agree very much. But I don=E2=80=99t understand how =
the patch
> set  supports it as it puts dts files for those boards to be built.
> > > > > > >>
> > > > > > >> U-Boot needs to be flexible enough to
> > > > > > >> function correctly in whatever runtime environment in which
> it finds
> > > > > > >> itself.
> > > > > > >>
> > > > > > >> Also as binman is pressed into service more and more to buil=
d
> the
> > > > > > >> complex firmware images that are becoming fashionable, it
> needs a
> > > > > > >> definition (in the devicetree) that describes how to create
> the image.
> > > > > > >> We can't support that unless we are building a devicetree,
> nor can the
> > > > > > >> running program access the image layout without that
> information.
> > > > > > >>
> > > > > > >> Fran=C3=A7ois's point about 'don't use this with any kernel'=
 is
> > > > > > >> germane...but of course I am not suggesting doing that, sinc=
e
> OF_BOARD
> > > > > > >> is, still, enabled. We already use OF_BOARD for various
> boards that
> > > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for
> example
> > > > > > >> (as I said in the cover letter "Most boards do provide one,
> but some
> > > > > > >> don't."). So this series is just completing the picture by
> enforcing
> > > > > > >> that *some sort* of devicetree is always present.
> > > > > > >
> > > > > > > That seems inconsistent with the OF_BOARD becomes the default=
.
> > > > > >
> > > > > > I think the key point that will get you closer to where I am on
> this
> > > > > > issue, is that OF_BOARD needs to be a run-time option. At
> present it
> > > > > > has build-time effects and this is quite wrong. If you go
> through all
> > > > > > the material I have written on this I think I have motivated
> that very
> > > > > > clearly.
> > > > > >
> > > > > > Another big issue is that I believe we need ONE devicetree for
> U-Boot,
> > > > > > not two that get merged by U-Boot. Again I have gone through
> that in a
> > > > > > lot of detail.
> > > > >
> > > > > I have a long long reply to your first reply here saved, but, may=
be
> > > > > here's the biggest sticking point.  To be clear, you agree that
> U-Boot
> > > > > needs to support being passed a device tree to use, at run time,
> yes?
> > > >
> > > > Yes. The OF_BOARD feature provides this.
> > > >
> > > > >
> > > > > And in that case, would not be using the "fake" tree we built in?
> > > >
> > > > Not at runtime.
> > >
> > > OK.
> > >
> > > > > So is the sticking point here that we really have two classes of
> > > > > devices, one class where we will never ever be given the device
> tree at
> > > > > run time (think BeagleBone Black) and one where we will always be
> given
> > > > > one at run time (think Raspberry Pi) ?
> > > >
> > > > I'm not sure it will be that black and white. I suspect there will =
be
> > > > (many) boards which can boot happily with the U-Boot devicetree but
> > > > can also accept one at runtime, if provided. For example, you may
> want
> > > > to boot with or without TF-A or some other, earlier stage.
> > >
> > > I'm not sure I see the value in making this a gray area.  There's ver=
y
> > > much a class of "never" boards.  There's also the class of "can" toda=
y.
> > > Maybe as part of a developer iterative flow it would be nice to not
> have
> > > to re-flash the prior stage to change a DT, and just do it in U-Boot
> > > until things are happy, but I'm not sure what the use case is for
> > > overriding the previous stage.
> > >
> > > Especially since the pushback on this series I think has all been "wh=
y
> > > are we copying in a tree to build with?  We don't want to use it at r=
un
> > > time!".  And then softer push back like "Well, U-Boot says we have to
> > > include the device tree file here, but we won't use it...".
> >
> > See below.
> >
> > >
> > > > I believe we have got unstuck because OF_BOARD (perhaps
> inadvertently)
> > > > provided a way to entirely omit a devicetree from U-Boot, thus maki=
ng
> > > > things like binman and U-Boot /config impossible, for example. So I
> > > > want to claw that back, so there is always some sort of devicetree =
in
> > > > U-Boot, as we have for rpi_3, etc.
> > >
> > > I really want to see what the binary case looks like since we could
> then
> > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we could
> > > then also do a rpi_arm32_defconfig too.
> > >
> > > I want to see less device trees in U-Boot sources, if they can come
> > > functionally correct from the hardware/our caller.
> > >
> > > And I'm not seeing how we make use of "U-Boot /config" if we also don=
't
> > > use the device tree from build time at run time, ignoring the device
> > > tree provided to us at run time by the caller.
> >
> > Firstly I should say that I find building firmware very messy and
> > confusing these days. Lots of things to build and it's hard to find
> > the instructions. It doesn't have to be that way, but if we carry on
> > as we are, it will continue to be messy and in five years you will
> > need a Ph.D and a lucky charm to boot on any modern board. My
> > objective here is to simplify things, bringing some consistency to the
> > different components. Binman was one effort there. I feel that putting
> > at least the U-Boot house in order, in my role as devicetree
> > maintainer (and as author of devicetree support in U-Boot back in
> > 2011), is the next step.
>
> Yes, it's Not Great.  I don't like my handful of build-BOARD.sh scripts
> that know where to grab other known-good binaries of varying licenses
> that are needed to assemble something that boots.
>
> > If we set things up correctly and agree on the bindings, devicetree
> > can be the unifying configuration mechanism through the whole of
> > firmware (except for very early bits) and into the OS, this will set
> > us up very well to deal with the complexity that is coming.
> >
> > Anyway, here are the mental steps that I've gone through over the past
> > two months:
> >
> > Step 1: At present, some people think U-Boot is not even allowed to
> > have its own nodes/properties in the DT.

In my view U-Boot shall be able to leverage device tree format (source and
binary) to store its own data.
When you say "the" DT, I always think this is "the" DT that is passed to OS
and in "that" DT, there should be no U-Boot entries. As stated in another
mail thread, I also refer to a place in a FIP where that dynamic config DT
is meant to be stored: NT_FW_CONFIG.
But there can be U-Boot defined bindings in "a" control/dynamic config DT;
Trusted Firmware does that.

> It is an abuse of the
> > devicetree standard, like the /chosen node but with less history. We
> > should sacrifice efficiency, expedience and expandability on the altar
> > of 'devicetree is a hardware description'. How do we get over that
> > one? Wel, I just think we need to accept that U-Boot uses devicetree
> > for its own purposes, as well as for booting the OS. I am not saying
>
> Yes, we need to have properties present in the device tree, and just
> like how "linux," is a valid vendor prefix for the linux kernel (but not
> used I would expect by the BSD families) we have cases that need
> "u-boot," properties.
>
> > it always has to have those properties, but with existing features
> > like verified boot, SPL as well as complex firmware images where
> > U-Boot needs to be able to find things in the image, it is essential.
> > So let's just assume that we need this everywhere, since we certainly
> > need it in at least some places.
>
> No, we can't / shouldn't assume we need this everywhere.  A lot of
> places? Yes.  But some features are going to be optional.  A valid must
> be supported use case is something like a Pi where the hardware gives us
> a device tree, the tree is correct and some features in U-Boot aren't
> needed (SPL) nor possibly supported immediately (verified boot).  We can
> go off on a tangent about how useful it would be to have HW platforms
> that are both common and can demonstrate a number of features, but
> that's its own problem to solve.
>
> > (stop reading here if you disagree, because nothing below will make
> > any sense...you can still use U-Boot v2011.06 which doesn't have
> > OF_CONTROL :-)
> >
> > Step 2: Assume U-Boot has its own nodes/properties. How do they get
> > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
> > have binman definitions, etc. So we need a way to overlay those things
> > into the DT. We already support this for in-tree DTs, so IMO this is
> > easy. Just require every board to have an in-tree DT. It helps with
> > discoverability and documentation, anyway. That is this series.
> >
> > (I think most of us are at the beginning of step 2, unsure about it
> > and worried about step 3)
> >
> > Step 3: Ah, but there are flows (i.e. boards that use a particular
> > flow only, or boards that sometimes use a flow) which need the DT to
> > come from a prior stage. How to handle that? IMO that is only going to
> > grow as every man and his dog get into the write-a-bootloader
> > business. We need a way to provide the U-Boot nodes/properties in a
> > form that the prior stage can consume and integrate with its build
> > system. Is TF-A the only thing being discussed here? If so, let's just
> > do it. We have the u-boot.dtsi and we can use binman to put the image
> > together, for example. Or we can get clever and create some sort of
> > overlay dtb.
> >
> > Step 3a. But I don't want to do that. a) If U-Boot needs this stuff
> > then it will need to build it in and use two devicetrees, one internal
> > and one from the prior stage....well that is not very efficient and it
> > is going to be confusing for people to figure out what U-Boot is
> > actually doing. But we actually already do that in a lot of cases
> > where U-Boot passes a DT to the kernel which is different to the one
> > it uses. So perhaps we have three devicetrees? OMG. b) Well then
> > U-Boot can have its own small devicetree with its bits and then U-Boot
> > can merge the two when it starts. Again that is not very efficient.

Does not need to merge the two. hence it does not have any influence on
efficiency.
For properties access, trusted firmware has defined an abstract way to get
them:
https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index.h=
tml
.
The properties are currently implemented as DT but TF.ORG could decide to
move to CBOR.
The API will remain so that a change in backend will not influence existing
code.
I think you are too focused on "THE" device tree. "THE" device tree that is
passed to the OS
shall be hardware description and not a hacky place to fit any piece of
metadata.
I would argue that /chosen shall not even be there as most if not all
information can be passed as OS command line. And actually for the UEFI
contract, /chosen should go empty.

> It
> > means that U-Boot cannot be controlled by the prior stage (e.g. to get
> > its public key from there or to enable/disable the console), so
> > unified firmware config is not possible. It will get very confusing,
> > particularly for debugging U-Boot. c) Some other scheme to avoid
> > accepting step 3...please stop!
>
> How the nodes should get there is how the rest of the nodes in a system
> get there.  Bindings are submitted and reviewed.  The authoritative
> source of the dtses in question then has them, like any other property.
>
> > Step 4: Yes, but there is QEMU, which makes the devicetree up out of
> > whole cloth. What about that? Well, we are just going to have to deal
> > with that. We can easily merge in the U-Boot nodes/properties and
> > update the U-Boot CI scripts to do this, as needed, e.g. with
> > qemu-riscv64_spl. It's only one use case, although Xen might do
> > something similar.
> >
> > To my mind, that deals with both the build-time and run-time issues.
> > We have a discoverable DT in U-Boot, which should be considered the
> > source of truth for most boards. We can sync it with Linux
> > automatically with the tooling that I hope Rob Herring will come up
> > with. We can use an empty one where there really is no default,
> > although I'd argue that is making perfect an enemy of the good.
> >
> > Step 5: If we get clever and want to remove them from the U-Boot tree
> > and pick them up from somewhere else, we can do that with sufficient
> > tooling. Perhaps we should set a timeline for that? A year? Two? Six?
>
> For SystemReady compliant boards, this has to come much faster.
Do you think distros will keep providing DTs for ever? I bet not.

> These last two paragraphs condense what I think is honestly close to a
> decade of debate / discussion down to a fiat "U-Boot will have the DTS
> files".  I don't want that.  I don't think any of the other projects
> that want to leverage DTS files want that.
>
> > To repeat, if we set things up correctly and agree on the bindings,
> > devicetree can be the unifying configuration mechanism through the
> > whole of firmware (except for very early bits) and into the OS. I feel
> > this will set us up very well to deal with the complexity that is
> > coming.
>
> Sure, it could.  But that doesn't mean that U-Boot is where the dts
> files live.
>
> --
> Tom
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--0000000000006b9e2a05cf55628b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, 27 Oct 2021 at 14:48, Tom Rini=
 &lt;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204=
,204,204);padding-left:1ex">On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon=
 Glass wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; On Thu, 14 Oct 2021 at 09:28, Tom Rini &lt;<a href=3D"mailto:trini@kon=
sulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:<br>
&gt; &gt; &gt; Hi Tom,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 14 Oct 2021 at 08:56, Tom Rini &lt;<a href=3D"mailto=
:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br=
>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass w=
rote:<br>
&gt; &gt; &gt; &gt; &gt; Hi Fran=C3=A7ois,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog &=
lt;<a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">francois.o=
zog@linaro.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Hi Simon<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glas=
s &lt;<a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.or=
g</a>&gt; a =C3=A9crit :<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; Hi Tom, Bin,Fran=C3=A7ois,<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; On Tue, 12 Oct 2021 at 19:34, Tom Rini &l=
t;<a href=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.co=
m</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; On Wed, Oct 13, 2021 at 09:29:14AM +=
0800, Bin Meng wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; Hi Simon,<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; On Wed, Oct 13, 2021 at 9:01 AM=
 Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@=
chromium.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; With Ilias&#39; efforts we=
 have dropped OF_PRIOR_STAGE and OF_HOSTFILE so<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; there are only three ways =
to obtain a devicetree:<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - OF_SEPARATE=
 - the normal way, where the devicetree is built and<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
appended to U-Boot<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - OF_EMBED - =
for development purposes, the devicetree is embedded in<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
the ELF file (also used for EFI)<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - OF_BOARD - =
the board figures it out on its own<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; The last one is currently =
set up so that no devicetree is needed at all<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; in the U-Boot tree. Most b=
oards do provide one, but some don&#39;t. Some<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; don&#39;t even provide ins=
tructions on how to boot on the board.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; The problems with this app=
roach are documented at [1].<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; In practice, OF_BOARD is n=
ot really distinct from OF_SEPARATE. Any board<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; can obtain its devicetree =
at runtime, even it is has a devicetree built<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; in U-Boot. This is because=
 U-Boot may be a second-stage bootloader and its<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; caller may have a better i=
dea about the hardware available in the machine.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; This is the case with a fe=
w QEMU boards, for example.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; So it makes no sense to ha=
ve OF_BOARD as a &#39;choice&#39;. It should be an<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; option, available with eit=
her OF_SEPARATE or OF_EMBED.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; This series makes this cha=
nge, adding various missing devicetree files<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; (and placeholders) to make=
 the build work.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; Adding device trees that are ne=
ver used sounds like a hack to me.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; For QEMU, device tree is dynami=
cally generated on the fly based on<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; command line parameters, and th=
e device tree you put in this series<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; has various hardcoded &lt;phand=
le&gt; values which normally do not show up<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; in hand-written dts files.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; I am not sure I understand the =
whole point of this.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; I am also confused and do not like t=
he idea of adding device trees for<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; platforms that are capable of and ca=
n / do have a device tree to give us<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; at run time.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; (I&#39;ll just reply to this one email, s=
ince the same points applies to<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; all replies I think)<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; I have been thinking about this and discu=
ssing it with people for a<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; few months now. I&#39;ve been signalling =
a change like this for over a<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; month now, on U-Boot contributor calls an=
d in discussions with Linaro<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; people. I sent a patch (below) to try to =
explain things. I hope it is<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; not a surprise!<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; The issue here is that we need a devicetr=
ee in-tree in U-Boot, to<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; avoid the mess that has been created by O=
F_PRIOR_STAGE, OF_BOARD,<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; BINMAN_STANDALONE_FDT and to a lesser ext=
ent, OF_HOSTFILE. Between<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; Ilias&#39; series and this one we can get=
 ourselves on a stronger footing.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; There is just OF_SEPARATE, with OF_EMBED =
for debugging/ELF use.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; For more context:<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; <a href=3D"http://patchwork.ozlabs.org/pr=
oject/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/" rel=3D"norefe=
rrer" target=3D"_blank">http://patchwork.ozlabs.org/project/uboot/patch/202=
10919215111.3830278-3-sjg@chromium.org/</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; BTW I did suggest to QEMU ARM that they s=
upport a way of adding the<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; u-boot.dtsi but there was not much intere=
st there (in fact the<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; maintainer would prefer there was no spec=
ial support even for booting<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; Linux directly!)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; i understand their point of view and agree wi=
th it.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; But in any case it doesn&#39;t really hel=
p U-Boot. I<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; think the path forward might be to run QE=
MU twice, once to get its<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; generated tree and once to give the &#39;=
merged&#39; tree with the U-Boot<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; properties in it, if people want to use U=
-Boot features.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; I do strongly believe that OF_BOARD must =
be a run-time option, not a<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; build-time one. It creates all sorts of p=
roblems and obscurity which<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; have taken months to unpick. See the abov=
e patch for the rationale.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; To add to that rationale, OF_BOARD needs =
to be an option available to<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; any board. At some point in the future it=
 may become a common way<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; things are done, e.g. TF-A calling U-Boot=
 and providing a devicetree<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; to it. It doesn&#39;t make any sense to h=
ave people decide whether or not<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; to set OF_BOARD at build time, thus affec=
ting how the image is put<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; together. We&#39;ll end up with different=
 U-Boot build targets like<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; capricorn, capricorn_of_board and the lik=
e. It should be obvious where<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; that will lead. Instead, OF_BOARD needs t=
o become a commonly used<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; option, perhaps enabled by most/all board=
s, so that this sort of build<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; explosion is not needed.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; If you mean that when boards are by construct=
ion providing a DTB to U-Boot then I agree very much. But I don=E2=80=99t u=
nderstand how the patch set=C2=A0 supports it as it puts dts files for thos=
e boards to be built.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; U-Boot needs to be flexible enough to<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; function correctly in whatever runtime en=
vironment in which it finds<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; itself.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; Also as binman is pressed into service mo=
re and more to build the<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; complex firmware images that are becoming=
 fashionable, it needs a<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; definition (in the devicetree) that descr=
ibes how to create the image.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; We can&#39;t support that unless we are b=
uilding a devicetree, nor can the<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; running program access the image layout w=
ithout that information.<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; Fran=C3=A7ois&#39;s point about &#39;don&=
#39;t use this with any kernel&#39; is<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; germane...but of course I am not suggesti=
ng doing that, since OF_BOARD<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; is, still, enabled. We already use OF_BOA=
RD for various boards that<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; include an in-tree devicetree - Raspberry=
 Pi 1, 2 and 3, for example<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; (as I said in the cover letter &quot;Most=
 boards do provide one, but some<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; don&#39;t.&quot;). So this series is just=
 completing the picture by enforcing<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; that *some sort* of devicetree is always =
present.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; That seems inconsistent with the OF_BOARD bec=
omes the default.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I think the key point that will get you closer to =
where I am on this<br>
&gt; &gt; &gt; &gt; &gt; issue, is that OF_BOARD needs to be a run-time opt=
ion. At present it<br>
&gt; &gt; &gt; &gt; &gt; has build-time effects and this is quite wrong. If=
 you go through all<br>
&gt; &gt; &gt; &gt; &gt; the material I have written on this I think I have=
 motivated that very<br>
&gt; &gt; &gt; &gt; &gt; clearly.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Another big issue is that I believe we need ONE de=
vicetree for U-Boot,<br>
&gt; &gt; &gt; &gt; &gt; not two that get merged by U-Boot. Again I have go=
ne through that in a<br>
&gt; &gt; &gt; &gt; &gt; lot of detail.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I have a long long reply to your first reply here saved=
, but, maybe<br>
&gt; &gt; &gt; &gt; here&#39;s the biggest sticking point.=C2=A0 To be clea=
r, you agree that U-Boot<br>
&gt; &gt; &gt; &gt; needs to support being passed a device tree to use, at =
run time, yes?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yes. The OF_BOARD feature provides this.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; And in that case, would not be using the &quot;fake&quo=
t; tree we built in?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Not at runtime.<br>
&gt; &gt;<br>
&gt; &gt; OK.<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; So is the sticking point here that we really have two c=
lasses of<br>
&gt; &gt; &gt; &gt; devices, one class where we will never ever be given th=
e device tree at<br>
&gt; &gt; &gt; &gt; run time (think BeagleBone Black) and one where we will=
 always be given<br>
&gt; &gt; &gt; &gt; one at run time (think Raspberry Pi) ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m not sure it will be that black and white. I suspect =
there will be<br>
&gt; &gt; &gt; (many) boards which can boot happily with the U-Boot devicet=
ree but<br>
&gt; &gt; &gt; can also accept one at runtime, if provided. For example, yo=
u may want<br>
&gt; &gt; &gt; to boot with or without TF-A or some other, earlier stage.<b=
r>
&gt; &gt;<br>
&gt; &gt; I&#39;m not sure I see the value in making this a gray area.=C2=
=A0 There&#39;s very<br>
&gt; &gt; much a class of &quot;never&quot; boards.=C2=A0 There&#39;s also =
the class of &quot;can&quot; today.<br>
&gt; &gt; Maybe as part of a developer iterative flow it would be nice to n=
ot have<br>
&gt; &gt; to re-flash the prior stage to change a DT, and just do it in U-B=
oot<br>
&gt; &gt; until things are happy, but I&#39;m not sure what the use case is=
 for<br>
&gt; &gt; overriding the previous stage.<br>
&gt; &gt;<br>
&gt; &gt; Especially since the pushback on this series I think has all been=
 &quot;why<br>
&gt; &gt; are we copying in a tree to build with?=C2=A0 We don&#39;t want t=
o use it at run<br>
&gt; &gt; time!&quot;.=C2=A0 And then softer push back like &quot;Well, U-B=
oot says we have to<br>
&gt; &gt; include the device tree file here, but we won&#39;t use it...&quo=
t;.<br>
&gt; <br>
&gt; See below.<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; &gt; I believe we have got unstuck because OF_BOARD (perhaps inad=
vertently)<br>
&gt; &gt; &gt; provided a way to entirely omit a devicetree from U-Boot, th=
us making<br>
&gt; &gt; &gt; things like binman and U-Boot /config impossible, for exampl=
e. So I<br>
&gt; &gt; &gt; want to claw that back, so there is always some sort of devi=
cetree in<br>
&gt; &gt; &gt; U-Boot, as we have for rpi_3, etc.<br>
&gt; &gt;<br>
&gt; &gt; I really want to see what the binary case looks like since we cou=
ld then<br>
&gt; &gt; kill off rpi_{3,3_b,4}_defconfig and I would need to see if we co=
uld<br>
&gt; &gt; then also do a rpi_arm32_defconfig too.<br>
&gt; &gt;<br>
&gt; &gt; I want to see less device trees in U-Boot sources, if they can co=
me<br>
&gt; &gt; functionally correct from the hardware/our caller.<br>
&gt; &gt;<br>
&gt; &gt; And I&#39;m not seeing how we make use of &quot;U-Boot /config&qu=
ot; if we also don&#39;t<br>
&gt; &gt; use the device tree from build time at run time, ignoring the dev=
ice<br>
&gt; &gt; tree provided to us at run time by the caller.<br>
&gt; <br>
&gt; Firstly I should say that I find building firmware very messy and<br>
&gt; confusing these days. Lots of things to build and it&#39;s hard to fin=
d<br>
&gt; the instructions. It doesn&#39;t have to be that way, but if we carry =
on<br>
&gt; as we are, it will continue to be messy and in five years you will<br>
&gt; need a Ph.D and a lucky charm to boot on any modern board. My<br>
&gt; objective here is to simplify things, bringing some consistency to the=
<br>
&gt; different components. Binman was one effort there. I feel that putting=
<br>
&gt; at least the U-Boot house in order, in my role as devicetree<br>
&gt; maintainer (and as author of devicetree support in U-Boot back in<br>
&gt; 2011), is the next step.<br>
<br>
Yes, it&#39;s Not Great.=C2=A0 I don&#39;t like my handful of build-BOARD.s=
h scripts<br>
that know where to grab other known-good binaries of varying licenses<br>
that are needed to assemble something that boots.<br>
<br>
&gt; If we set things up correctly and agree on the bindings, devicetree<br=
>
&gt; can be the unifying configuration mechanism through the whole of<br>
&gt; firmware (except for very early bits) and into the OS, this will set<b=
r>
&gt; us up very well to deal with the complexity that is coming.<br>
&gt; <br>
&gt; Anyway, here are the mental steps that I&#39;ve gone through over the =
past<br>
&gt; two months:<br>
&gt; <br>
&gt; Step 1: At present, some people think U-Boot is not even allowed to<br=
>
&gt; have its own nodes/properties in the DT.</blockquote><div>In my view U=
-Boot shall be able to leverage device tree format (source and binary) to s=
tore its own data.</div><div>When you say &quot;the&quot; DT, I always thin=
k this is &quot;the&quot; DT that is passed to OS and in &quot;that&quot; D=
T, there should be no U-Boot entries. As stated in another mail thread, I a=
lso refer to a place in a FIP where that dynamic config DT is meant to be s=
tored: NT_FW_CONFIG.</div><div>But there can be U-Boot defined bindings in =
&quot;a&quot; control/dynamic config DT; Trusted Firmware does that.</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);pa=
dding-left:1ex"> It is an abuse of the<br>
&gt; devicetree standard, like the /chosen node but with less history. We<b=
r>
&gt; should sacrifice efficiency, expedience and expandability on the altar=
<br>
&gt; of &#39;devicetree is a hardware description&#39;. How do we get over =
that<br>
&gt; one? Wel, I just think we need to accept that U-Boot uses devicetree<b=
r>
&gt; for its own purposes, as well as for booting the OS. I am not saying<b=
r>
<br>
Yes, we need to have properties present in the device tree, and just<br>
like how &quot;linux,&quot; is a valid vendor prefix for the linux kernel (=
but not<br>
used I would expect by the BSD families) we have cases that need<br>
&quot;u-boot,&quot; properties.<br>
<br>
&gt; it always has to have those properties, but with existing features<br>
&gt; like verified boot, SPL as well as complex firmware images where<br>
&gt; U-Boot needs to be able to find things in the image, it is essential.<=
br>
&gt; So let&#39;s just assume that we need this everywhere, since we certai=
nly<br>
&gt; need it in at least some places.<br>
<br>
No, we can&#39;t / shouldn&#39;t assume we need this everywhere.=C2=A0 A lo=
t of<br>
places? Yes.=C2=A0 But some features are going to be optional.=C2=A0 A vali=
d must<br>
be supported use case is something like a Pi where the hardware gives us<br=
>
a device tree, the tree is correct and some features in U-Boot aren&#39;t<b=
r>
needed (SPL) nor possibly supported immediately (verified boot).=C2=A0 We c=
an<br>
go off on a tangent about how useful it would be to have HW platforms<br>
that are both common and can demonstrate a number of features, but<br>
that&#39;s its own problem to solve.<br>
<br>
&gt; (stop reading here if you disagree, because nothing below will make<br=
>
&gt; any sense...you can still use U-Boot v2011.06 which doesn&#39;t have<b=
r>
&gt; OF_CONTROL :-)<br>
&gt; <br>
&gt; Step 2: Assume U-Boot has its own nodes/properties. How do they get<br=
>
&gt; there? Well, we have u-boot.dtsi files for that (the 2016 patch<br>
&gt; &quot;6d427c6b1fa binman: Automatically include a U-Boot .dtsi file&qu=
ot;), we<br>
&gt; have binman definitions, etc. So we need a way to overlay those things=
<br>
&gt; into the DT. We already support this for in-tree DTs, so IMO this is<b=
r>
&gt; easy. Just require every board to have an in-tree DT. It helps with<br=
>
&gt; discoverability and documentation, anyway. That is this series.<br>
&gt;<br>
&gt; (I think most of us are at the beginning of step 2, unsure about it<br=
>
&gt; and worried about step 3)<br>
&gt; <br>
&gt; Step 3: Ah, but there are flows (i.e. boards that use a particular<br>
&gt; flow only, or boards that sometimes use a flow) which need the DT to<b=
r>
&gt; come from a prior stage. How to handle that? IMO that is only going to=
<br>
&gt; grow as every man and his dog get into the write-a-bootloader<br>
&gt; business. We need a way to provide the U-Boot nodes/properties in a<br=
>
&gt; form that the prior stage can consume and integrate with its build<br>
&gt; system. Is TF-A the only thing being discussed here? If so, let&#39;s =
just<br>
&gt; do it. We have the u-boot.dtsi and we can use binman to put the image<=
br>
&gt; together, for example. Or we can get clever and create some sort of<br=
>
&gt; overlay dtb.<br>
&gt; <br>
&gt; Step 3a. But I don&#39;t want to do that. a) If U-Boot needs this stuf=
f<br>
&gt; then it will need to build it in and use two devicetrees, one internal=
<br>
&gt; and one from the prior stage....well that is not very efficient and it=
<br>
&gt; is going to be confusing for people to figure out what U-Boot is<br>
&gt; actually doing. But we actually already do that in a lot of cases<br>
&gt; where U-Boot passes a DT to the kernel which is different to the one<b=
r>
&gt; it uses. So perhaps we have three devicetrees? OMG. b) Well then<br>
&gt; U-Boot can have its own small devicetree with its bits and then U-Boot=
<br>
&gt; can merge the two when it starts. Again that is not very efficient.</b=
lockquote><div>Does not need to merge the two. hence it does not have any i=
nfluence on efficiency.=C2=A0</div><div>For properties access, trusted firm=
ware has defined an abstract way to get them:=C2=A0</div><div><a href=3D"ht=
tps://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index.htm=
l">https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/inde=
x.html</a>.=C2=A0</div><div>The properties are currently implemented as DT =
but <a href=3D"http://TF.ORG">TF.ORG</a> could decide to move to CBOR.</div=
><div>The API will remain so that a change in backend will not influence ex=
isting code.</div><div>I think you are too focused on &quot;THE&quot; devic=
e tree. &quot;THE&quot; device tree that is passed to the OS</div><div>shal=
l be hardware description and not a hacky place to fit any piece of metadat=
a.</div><div>I would argue that /chosen shall not even be there as most if =
not all information can be passed as OS command line. And actually for the =
UEFI contract, /chosen should go empty.</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;border-left-color:rgb(204,204,204);padding-left:1ex"> It<br>
&gt; means that U-Boot cannot be controlled by the prior stage (e.g. to get=
<br>
&gt; its public key from there or to enable/disable the console), so<br>
&gt; unified firmware config is not possible. It will get very confusing,<b=
r>
&gt; particularly for debugging U-Boot. c) Some other scheme to avoid<br>
&gt; accepting step 3...please stop!<br>
<br>
How the nodes should get there is how the rest of the nodes in a system<br>
get there.=C2=A0 Bindings are submitted and reviewed.=C2=A0 The authoritati=
ve<br>
source of the dtses in question then has them, like any other property.<br>
<br>
&gt; Step 4: Yes, but there is QEMU, which makes the devicetree up out of<b=
r>
&gt; whole cloth. What about that? Well, we are just going to have to deal<=
br>
&gt; with that. We can easily merge in the U-Boot nodes/properties and<br>
&gt; update the U-Boot CI scripts to do this, as needed, e.g. with<br>
&gt; qemu-riscv64_spl. It&#39;s only one use case, although Xen might do<br=
>
&gt; something similar.<br>
&gt; <br>
&gt; To my mind, that deals with both the build-time and run-time issues.<b=
r>
&gt; We have a discoverable DT in U-Boot, which should be considered the<br=
>
&gt; source of truth for most boards. We can sync it with Linux<br>
&gt; automatically with the tooling that I hope Rob Herring will come up<br=
>
&gt; with. We can use an empty one where there really is no default,<br>
&gt; although I&#39;d argue that is making perfect an enemy of the good.<br=
>
&gt; <br>
&gt; Step 5: If we get clever and want to remove them from the U-Boot tree<=
br>
&gt; and pick them up from somewhere else, we can do that with sufficient<b=
r>
&gt; tooling. Perhaps we should set a timeline for that? A year? Two? Six?<=
br>
<br></blockquote><div>For SystemReady compliant boards, this has to come mu=
ch faster.</div><div>Do you think distros will keep providing DTs for ever?=
 I bet not.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-c=
olor:rgb(204,204,204);padding-left:1ex">
These last two paragraphs condense what I think is honestly close to a<br>
decade of debate / discussion down to a fiat &quot;U-Boot will have the DTS=
<br>
files&quot;.=C2=A0 I don&#39;t want that.=C2=A0 I don&#39;t think any of th=
e other projects<br>
that want to leverage DTS files want that.<br>
<br>
&gt; To repeat, if we set things up correctly and agree on the bindings,<br=
>
&gt; devicetree can be the unifying configuration mechanism through the<br>
&gt; whole of firmware (except for very early bits) and into the OS. I feel=
<br>
&gt; this will set us up very well to deal with the complexity that is<br>
&gt; coming.<br>
<br>
Sure, it could.=C2=A0 But that doesn&#39;t mean that U-Boot is where the dt=
s<br>
files live.<br>
<br>
-- <br>
Tom<br>
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

--0000000000006b9e2a05cf55628b--

