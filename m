Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424ED42DEAC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:53:37 +0200 (CEST)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb330-0000Vg-92
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mb2Um-0007b3-2D
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:18:13 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:33367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mb2Uj-0000U3-QU
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:18:11 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id t200so3689993vkt.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CGeSQiu6FPVvLmaY9V1M8p7B7F0tvhlgmIrp36EUnKQ=;
 b=Yva+mkDSGkdaj/8BAaXKzxyaAukcCiB0i+P4MkW3rtFVAwu/pd4d9NqHJB0zg/PrRr
 hK9aWp0aoV5Y13dT1injAW3+azllS8jimxlg0nxjeTL1+Dj2415E+uvWtEjslK5BZMXp
 HfEjxq1ZfXEugh3eVApvcAQS5JLS4phEG6BdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CGeSQiu6FPVvLmaY9V1M8p7B7F0tvhlgmIrp36EUnKQ=;
 b=C6iUe2YAAUnYNlCgJt/Zo8gpwq1MKswhAMl0/r+n76HKH/BISZS4HndueKxjcK/1Ak
 BHFdCFMUaLeVS62Arp3jxLdS3dlhc2r4fswxa6Riyw0BlnWmAJ5bgfZHWQxf6ufaCXJO
 M2K7XUCmuYDXpq27vmVcjdWre25+V62ETTI1g98ccsO/UKU76Y9TKSZkF+j5xcOu3zw1
 usPsvtJ2XnKMBYW+iD+yOvOptrW/2IjBX9SGoRZsdnphJiW0ve7WTVRBDDjYIOVu8f0g
 yf2N+CfcOS2pLoHt0JFFAZq6BrV7yVaHM4bTxaUmd3BH+dU6819RcSHFIplh+TjvQ0+0
 ad4w==
X-Gm-Message-State: AOAM5318dFh63MWq5x31SrUzFovygi0mGwbiYfeNLcqdFpqo84JP8zTz
 byPAdbNtXZo6DkPDZ5lq28nTo18GeiZDH2CiOF8SrQ==
X-Google-Smtp-Source: ABdhPJxgum04oAcVFKAJc6z52QZ/tCxiSDzM7KY4i4uXIMVb4sfokjihDKAkcp5R0+W4ketYiysliGHYGGkzs8fNyXk=
X-Received: by 2002:a1f:c6:: with SMTP id 189mr6820020vka.16.1634224685695;
 Thu, 14 Oct 2021 08:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
In-Reply-To: <20211014145626.GC7964@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 14 Oct 2021 09:17:52 -0600
Message-ID: <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=sjg@google.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
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

Hi Tom,

On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > Hi Fran=C3=A7ois,
> >
> > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <francois.ozog@linaro.=
org> wrote:
> > >
> > > Hi Simon
> > >
> > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.org> a =
=C3=A9crit :
> > >>
> > >> Hi Tom, Bin,Fran=C3=A7ois,
> > >>
> > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com> wrote:
> > >> >
> > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> > >> > > Hi Simon,
> > >> > >
> > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org> w=
rote:
> > >> > > >
> > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOST=
FILE so
> > >> > > > there are only three ways to obtain a devicetree:
> > >> > > >
> > >> > > >    - OF_SEPARATE - the normal way, where the devicetree is bui=
lt and
> > >> > > >       appended to U-Boot
> > >> > > >    - OF_EMBED - for development purposes, the devicetree is em=
bedded in
> > >> > > >       the ELF file (also used for EFI)
> > >> > > >    - OF_BOARD - the board figures it out on its own
> > >> > > >
> > >> > > > The last one is currently set up so that no devicetree is need=
ed at all
> > >> > > > in the U-Boot tree. Most boards do provide one, but some don't=
. Some
> > >> > > > don't even provide instructions on how to boot on the board.
> > >> > > >
> > >> > > > The problems with this approach are documented at [1].
> > >> > > >
> > >> > > > In practice, OF_BOARD is not really distinct from OF_SEPARATE.=
 Any board
> > >> > > > can obtain its devicetree at runtime, even it is has a devicet=
ree built
> > >> > > > in U-Boot. This is because U-Boot may be a second-stage bootlo=
ader and its
> > >> > > > caller may have a better idea about the hardware available in =
the machine.
> > >> > > > This is the case with a few QEMU boards, for example.
> > >> > > >
> > >> > > > So it makes no sense to have OF_BOARD as a 'choice'. It should=
 be an
> > >> > > > option, available with either OF_SEPARATE or OF_EMBED.
> > >> > > >
> > >> > > > This series makes this change, adding various missing devicetr=
ee files
> > >> > > > (and placeholders) to make the build work.
> > >> > >
> > >> > > Adding device trees that are never used sounds like a hack to me=
.
> > >> > >
> > >> > > For QEMU, device tree is dynamically generated on the fly based =
on
> > >> > > command line parameters, and the device tree you put in this ser=
ies
> > >> > > has various hardcoded <phandle> values which normally do not sho=
w up
> > >> > > in hand-written dts files.
> > >> > >
> > >> > > I am not sure I understand the whole point of this.
> > >> >
> > >> > I am also confused and do not like the idea of adding device trees=
 for
> > >> > platforms that are capable of and can / do have a device tree to g=
ive us
> > >> > at run time.
> > >>
> > >> (I'll just reply to this one email, since the same points applies to
> > >> all replies I think)
> > >>
> > >> I have been thinking about this and discussing it with people for a
> > >> few months now. I've been signalling a change like this for over a
> > >> month now, on U-Boot contributor calls and in discussions with Linar=
o
> > >> people. I sent a patch (below) to try to explain things. I hope it i=
s
> > >> not a surprise!
> > >>
> > >> The issue here is that we need a devicetree in-tree in U-Boot, to
> > >> avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD,
> > >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Between
> > >> Ilias' series and this one we can get ourselves on a stronger footin=
g.
> > >> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.
> > >> For more context:
> > >>
> > >> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.38302=
78-3-sjg@chromium.org/
> > >>
> > >> BTW I did suggest to QEMU ARM that they support a way of adding the
> > >> u-boot.dtsi but there was not much interest there (in fact the
> > >> maintainer would prefer there was no special support even for bootin=
g
> > >> Linux directly!)
> > >
> > > i understand their point of view and agree with it.
> > >>
> > >> But in any case it doesn't really help U-Boot. I
> > >> think the path forward might be to run QEMU twice, once to get its
> > >> generated tree and once to give the 'merged' tree with the U-Boot
> > >> properties in it, if people want to use U-Boot features.
> > >>
> > >> I do strongly believe that OF_BOARD must be a run-time option, not a
> > >> build-time one. It creates all sorts of problems and obscurity which
> > >> have taken months to unpick. See the above patch for the rationale.
> > >>
> > >> To add to that rationale, OF_BOARD needs to be an option available t=
o
> > >> any board. At some point in the future it may become a common way
> > >> things are done, e.g. TF-A calling U-Boot and providing a devicetree
> > >> to it. It doesn't make any sense to have people decide whether or no=
t
> > >> to set OF_BOARD at build time, thus affecting how the image is put
> > >> together. We'll end up with different U-Boot build targets like
> > >> capricorn, capricorn_of_board and the like. It should be obvious whe=
re
> > >> that will lead. Instead, OF_BOARD needs to become a commonly used
> > >> option, perhaps enabled by most/all boards, so that this sort of bui=
ld
> > >> explosion is not needed.
> > >
> > > If you mean that when boards are by construction providing a DTB to U=
-Boot then I agree very much. But I don=E2=80=99t understand how the patch =
set  supports it as it puts dts files for those boards to be built.
> > >>
> > >> U-Boot needs to be flexible enough to
> > >> function correctly in whatever runtime environment in which it finds
> > >> itself.
> > >>
> > >> Also as binman is pressed into service more and more to build the
> > >> complex firmware images that are becoming fashionable, it needs a
> > >> definition (in the devicetree) that describes how to create the imag=
e.
> > >> We can't support that unless we are building a devicetree, nor can t=
he
> > >> running program access the image layout without that information.
> > >>
> > >> Fran=C3=A7ois's point about 'don't use this with any kernel' is
> > >> germane...but of course I am not suggesting doing that, since OF_BOA=
RD
> > >> is, still, enabled. We already use OF_BOARD for various boards that
> > >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for example
> > >> (as I said in the cover letter "Most boards do provide one, but some
> > >> don't."). So this series is just completing the picture by enforcing
> > >> that *some sort* of devicetree is always present.
> > >
> > > That seems inconsistent with the OF_BOARD becomes the default.
> >
> > I think the key point that will get you closer to where I am on this
> > issue, is that OF_BOARD needs to be a run-time option. At present it
> > has build-time effects and this is quite wrong. If you go through all
> > the material I have written on this I think I have motivated that very
> > clearly.
> >
> > Another big issue is that I believe we need ONE devicetree for U-Boot,
> > not two that get merged by U-Boot. Again I have gone through that in a
> > lot of detail.
>
> I have a long long reply to your first reply here saved, but, maybe
> here's the biggest sticking point.  To be clear, you agree that U-Boot
> needs to support being passed a device tree to use, at run time, yes?

Yes. The OF_BOARD feature provides this.

>
> And in that case, would not be using the "fake" tree we built in?

Not at runtime.

>
> So is the sticking point here that we really have two classes of
> devices, one class where we will never ever be given the device tree at
> run time (think BeagleBone Black) and one where we will always be given
> one at run time (think Raspberry Pi) ?

I'm not sure it will be that black and white. I suspect there will be
(many) boards which can boot happily with the U-Boot devicetree but
can also accept one at runtime, if provided. For example, you may want
to boot with or without TF-A or some other, earlier stage.

I believe we have got unstuck because OF_BOARD (perhaps inadvertently)
provided a way to entirely omit a devicetree from U-Boot, thus making
things like binman and U-Boot /config impossible, for example. So I
want to claw that back, so there is always some sort of devicetree in
U-Boot, as we have for rpi_3, etc.

Regards,
Simon

