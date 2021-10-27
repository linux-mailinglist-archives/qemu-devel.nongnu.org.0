Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC8743CA5E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:13:26 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfik8-0008KT-Ir
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfiMO-00040H-Mc
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:48:53 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:40770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfiMK-0003km-06
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:48:52 -0400
Received: by mail-qv1-xf35.google.com with SMTP id c3so1642715qvh.7
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 05:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ocYCAJ1hWuwGvMC9a7b9Telaw8sd4r7kIGq1niB9cFw=;
 b=byVS2uCVVaYPWNcn0XLMGxVkxqwodbdOriPIhOCpE7Pqomq44Ig4mzPwDxNWGXVHE1
 XYlpVsui2xBhwcLhq0VNDH1K69pvtUHZPvio7bwhnqGyOAgOvEKxH3eXrPqfU1woSuh6
 KhYf07oYWnwggB5khgyswHUsM0EVgcOeZ9nCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ocYCAJ1hWuwGvMC9a7b9Telaw8sd4r7kIGq1niB9cFw=;
 b=gJdd/bP1/VXdpiJXVGzujhLyEN6XJI2kqWqpRDfzVGm19hNSAta+b8b5upnq43VYEu
 1HkRvScf1nD+DOwuYaHLU3U3HGZxuog7WNlvlvPd3x9lXIpjuQ72GKFEmuJpa12sPzA7
 WttB8yROwCoreZrDoLdYx6/94UUbQM5JJ9ICyD78Nx0iyS1DBGkry9cFAgLuBOZLCFl3
 TxuxoALa5bCdXnkiPW7qV5FdTyVom8dbCU8BkXvtLpzULOCmptAvVz+4cA0YzPiav5XR
 dBEpDMAtoIEJEl8+4Ryzf++GJ88ay5BN3c2QbpC4zolm14Sdurf1ceOOrTJ86KR3iy+Z
 6SWg==
X-Gm-Message-State: AOAM530jxymgJIWhezyaFaHe6k/pJFNiP5bVogpXueCdVL/ArBggdWkr
 g6OW8do1EyxEInqTRE1qbYvkGw==
X-Google-Smtp-Source: ABdhPJxOMOH4O1jRjmZL/pJsSRcVlStU/lqoBZFrUUPMDWjYioSaCwAHOTiWK4CfMMZvtQSEDgep2Q==
X-Received: by 2002:a05:6214:1bc7:: with SMTP id
 m7mr29443821qvc.20.1635338924814; 
 Wed, 27 Oct 2021 05:48:44 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id a4sm12116332qtm.12.2021.10.27.05.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 05:48:44 -0700 (PDT)
Date: Wed, 27 Oct 2021 08:48:40 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027124840.GR8284@bill-the-cat>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0pkK7MCEo5hACTvx"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
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
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0pkK7MCEo5hACTvx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass wrote:
> Hi all,
>=20
> On Thu, 14 Oct 2021 at 09:28, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> > > Hi Tom,
> > >
> > > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > > > > Hi Fran=C3=A7ois,
> > > > >
> > > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <francois.ozog@l=
inaro.org> wrote:
> > > > > >
> > > > > > Hi Simon
> > > > > >
> > > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.or=
g> a =C3=A9crit :
> > > > > >>
> > > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > > >>
> > > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com> wr=
ote:
> > > > > >> >
> > > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> > > > > >> > > Hi Simon,
> > > > > >> > >
> > > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.=
org> wrote:
> > > > > >> > > >
> > > > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and O=
F_HOSTFILE so
> > > > > >> > > > there are only three ways to obtain a devicetree:
> > > > > >> > > >
> > > > > >> > > >    - OF_SEPARATE - the normal way, where the devicetree =
is built and
> > > > > >> > > >       appended to U-Boot
> > > > > >> > > >    - OF_EMBED - for development purposes, the devicetree=
 is embedded in
> > > > > >> > > >       the ELF file (also used for EFI)
> > > > > >> > > >    - OF_BOARD - the board figures it out on its own
> > > > > >> > > >
> > > > > >> > > > The last one is currently set up so that no devicetree i=
s needed at all
> > > > > >> > > > in the U-Boot tree. Most boards do provide one, but some=
 don't. Some
> > > > > >> > > > don't even provide instructions on how to boot on the bo=
ard.
> > > > > >> > > >
> > > > > >> > > > The problems with this approach are documented at [1].
> > > > > >> > > >
> > > > > >> > > > In practice, OF_BOARD is not really distinct from OF_SEP=
ARATE. Any board
> > > > > >> > > > can obtain its devicetree at runtime, even it is has a d=
evicetree built
> > > > > >> > > > in U-Boot. This is because U-Boot may be a second-stage =
bootloader and its
> > > > > >> > > > caller may have a better idea about the hardware availab=
le in the machine.
> > > > > >> > > > This is the case with a few QEMU boards, for example.
> > > > > >> > > >
> > > > > >> > > > So it makes no sense to have OF_BOARD as a 'choice'. It =
should be an
> > > > > >> > > > option, available with either OF_SEPARATE or OF_EMBED.
> > > > > >> > > >
> > > > > >> > > > This series makes this change, adding various missing de=
vicetree files
> > > > > >> > > > (and placeholders) to make the build work.
> > > > > >> > >
> > > > > >> > > Adding device trees that are never used sounds like a hack=
 to me.
> > > > > >> > >
> > > > > >> > > For QEMU, device tree is dynamically generated on the fly =
based on
> > > > > >> > > command line parameters, and the device tree you put in th=
is series
> > > > > >> > > has various hardcoded <phandle> values which normally do n=
ot show up
> > > > > >> > > in hand-written dts files.
> > > > > >> > >
> > > > > >> > > I am not sure I understand the whole point of this.
> > > > > >> >
> > > > > >> > I am also confused and do not like the idea of adding device=
 trees for
> > > > > >> > platforms that are capable of and can / do have a device tre=
e to give us
> > > > > >> > at run time.
> > > > > >>
> > > > > >> (I'll just reply to this one email, since the same points appl=
ies to
> > > > > >> all replies I think)
> > > > > >>
> > > > > >> I have been thinking about this and discussing it with people =
for a
> > > > > >> few months now. I've been signalling a change like this for ov=
er a
> > > > > >> month now, on U-Boot contributor calls and in discussions with=
 Linaro
> > > > > >> people. I sent a patch (below) to try to explain things. I hop=
e it is
> > > > > >> not a surprise!
> > > > > >>
> > > > > >> The issue here is that we need a devicetree in-tree in U-Boot,=
 to
> > > > > >> avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOA=
RD,
> > > > > >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Bet=
ween
> > > > > >> Ilias' series and this one we can get ourselves on a stronger =
footing.
> > > > > >> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.
> > > > > >> For more context:
> > > > > >>
> > > > > >> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111=
=2E3830278-3-sjg@chromium.org/
> > > > > >>
> > > > > >> BTW I did suggest to QEMU ARM that they support a way of addin=
g the
> > > > > >> u-boot.dtsi but there was not much interest there (in fact the
> > > > > >> maintainer would prefer there was no special support even for =
booting
> > > > > >> Linux directly!)
> > > > > >
> > > > > > i understand their point of view and agree with it.
> > > > > >>
> > > > > >> But in any case it doesn't really help U-Boot. I
> > > > > >> think the path forward might be to run QEMU twice, once to get=
 its
> > > > > >> generated tree and once to give the 'merged' tree with the U-B=
oot
> > > > > >> properties in it, if people want to use U-Boot features.
> > > > > >>
> > > > > >> I do strongly believe that OF_BOARD must be a run-time option,=
 not a
> > > > > >> build-time one. It creates all sorts of problems and obscurity=
 which
> > > > > >> have taken months to unpick. See the above patch for the ratio=
nale.
> > > > > >>
> > > > > >> To add to that rationale, OF_BOARD needs to be an option avail=
able to
> > > > > >> any board. At some point in the future it may become a common =
way
> > > > > >> things are done, e.g. TF-A calling U-Boot and providing a devi=
cetree
> > > > > >> to it. It doesn't make any sense to have people decide whether=
 or not
> > > > > >> to set OF_BOARD at build time, thus affecting how the image is=
 put
> > > > > >> together. We'll end up with different U-Boot build targets like
> > > > > >> capricorn, capricorn_of_board and the like. It should be obvio=
us where
> > > > > >> that will lead. Instead, OF_BOARD needs to become a commonly u=
sed
> > > > > >> option, perhaps enabled by most/all boards, so that this sort =
of build
> > > > > >> explosion is not needed.
> > > > > >
> > > > > > If you mean that when boards are by construction providing a DT=
B to U-Boot then I agree very much. But I don=E2=80=99t understand how the =
patch set  supports it as it puts dts files for those boards to be built.
> > > > > >>
> > > > > >> U-Boot needs to be flexible enough to
> > > > > >> function correctly in whatever runtime environment in which it=
 finds
> > > > > >> itself.
> > > > > >>
> > > > > >> Also as binman is pressed into service more and more to build =
the
> > > > > >> complex firmware images that are becoming fashionable, it need=
s a
> > > > > >> definition (in the devicetree) that describes how to create th=
e image.
> > > > > >> We can't support that unless we are building a devicetree, nor=
 can the
> > > > > >> running program access the image layout without that informati=
on.
> > > > > >>
> > > > > >> Fran=C3=A7ois's point about 'don't use this with any kernel' is
> > > > > >> germane...but of course I am not suggesting doing that, since =
OF_BOARD
> > > > > >> is, still, enabled. We already use OF_BOARD for various boards=
 that
> > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for e=
xample
> > > > > >> (as I said in the cover letter "Most boards do provide one, bu=
t some
> > > > > >> don't."). So this series is just completing the picture by enf=
orcing
> > > > > >> that *some sort* of devicetree is always present.
> > > > > >
> > > > > > That seems inconsistent with the OF_BOARD becomes the default.
> > > > >
> > > > > I think the key point that will get you closer to where I am on t=
his
> > > > > issue, is that OF_BOARD needs to be a run-time option. At present=
 it
> > > > > has build-time effects and this is quite wrong. If you go through=
 all
> > > > > the material I have written on this I think I have motivated that=
 very
> > > > > clearly.
> > > > >
> > > > > Another big issue is that I believe we need ONE devicetree for U-=
Boot,
> > > > > not two that get merged by U-Boot. Again I have gone through that=
 in a
> > > > > lot of detail.
> > > >
> > > > I have a long long reply to your first reply here saved, but, maybe
> > > > here's the biggest sticking point.  To be clear, you agree that U-B=
oot
> > > > needs to support being passed a device tree to use, at run time, ye=
s?
> > >
> > > Yes. The OF_BOARD feature provides this.
> > >
> > > >
> > > > And in that case, would not be using the "fake" tree we built in?
> > >
> > > Not at runtime.
> >
> > OK.
> >
> > > > So is the sticking point here that we really have two classes of
> > > > devices, one class where we will never ever be given the device tre=
e at
> > > > run time (think BeagleBone Black) and one where we will always be g=
iven
> > > > one at run time (think Raspberry Pi) ?
> > >
> > > I'm not sure it will be that black and white. I suspect there will be
> > > (many) boards which can boot happily with the U-Boot devicetree but
> > > can also accept one at runtime, if provided. For example, you may want
> > > to boot with or without TF-A or some other, earlier stage.
> >
> > I'm not sure I see the value in making this a gray area.  There's very
> > much a class of "never" boards.  There's also the class of "can" today.
> > Maybe as part of a developer iterative flow it would be nice to not have
> > to re-flash the prior stage to change a DT, and just do it in U-Boot
> > until things are happy, but I'm not sure what the use case is for
> > overriding the previous stage.
> >
> > Especially since the pushback on this series I think has all been "why
> > are we copying in a tree to build with?  We don't want to use it at run
> > time!".  And then softer push back like "Well, U-Boot says we have to
> > include the device tree file here, but we won't use it...".
>=20
> See below.
>=20
> >
> > > I believe we have got unstuck because OF_BOARD (perhaps inadvertently)
> > > provided a way to entirely omit a devicetree from U-Boot, thus making
> > > things like binman and U-Boot /config impossible, for example. So I
> > > want to claw that back, so there is always some sort of devicetree in
> > > U-Boot, as we have for rpi_3, etc.
> >
> > I really want to see what the binary case looks like since we could then
> > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we could
> > then also do a rpi_arm32_defconfig too.
> >
> > I want to see less device trees in U-Boot sources, if they can come
> > functionally correct from the hardware/our caller.
> >
> > And I'm not seeing how we make use of "U-Boot /config" if we also don't
> > use the device tree from build time at run time, ignoring the device
> > tree provided to us at run time by the caller.
>=20
> Firstly I should say that I find building firmware very messy and
> confusing these days. Lots of things to build and it's hard to find
> the instructions. It doesn't have to be that way, but if we carry on
> as we are, it will continue to be messy and in five years you will
> need a Ph.D and a lucky charm to boot on any modern board. My
> objective here is to simplify things, bringing some consistency to the
> different components. Binman was one effort there. I feel that putting
> at least the U-Boot house in order, in my role as devicetree
> maintainer (and as author of devicetree support in U-Boot back in
> 2011), is the next step.

Yes, it's Not Great.  I don't like my handful of build-BOARD.sh scripts
that know where to grab other known-good binaries of varying licenses
that are needed to assemble something that boots.

> If we set things up correctly and agree on the bindings, devicetree
> can be the unifying configuration mechanism through the whole of
> firmware (except for very early bits) and into the OS, this will set
> us up very well to deal with the complexity that is coming.
>=20
> Anyway, here are the mental steps that I've gone through over the past
> two months:
>=20
> Step 1: At present, some people think U-Boot is not even allowed to
> have its own nodes/properties in the DT. It is an abuse of the
> devicetree standard, like the /chosen node but with less history. We
> should sacrifice efficiency, expedience and expandability on the altar
> of 'devicetree is a hardware description'. How do we get over that
> one? Wel, I just think we need to accept that U-Boot uses devicetree
> for its own purposes, as well as for booting the OS. I am not saying

Yes, we need to have properties present in the device tree, and just
like how "linux," is a valid vendor prefix for the linux kernel (but not
used I would expect by the BSD families) we have cases that need
"u-boot," properties.

> it always has to have those properties, but with existing features
> like verified boot, SPL as well as complex firmware images where
> U-Boot needs to be able to find things in the image, it is essential.
> So let's just assume that we need this everywhere, since we certainly
> need it in at least some places.

No, we can't / shouldn't assume we need this everywhere.  A lot of
places? Yes.  But some features are going to be optional.  A valid must
be supported use case is something like a Pi where the hardware gives us
a device tree, the tree is correct and some features in U-Boot aren't
needed (SPL) nor possibly supported immediately (verified boot).  We can
go off on a tangent about how useful it would be to have HW platforms
that are both common and can demonstrate a number of features, but
that's its own problem to solve.

> (stop reading here if you disagree, because nothing below will make
> any sense...you can still use U-Boot v2011.06 which doesn't have
> OF_CONTROL :-)
>=20
> Step 2: Assume U-Boot has its own nodes/properties. How do they get
> there? Well, we have u-boot.dtsi files for that (the 2016 patch
> "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
> have binman definitions, etc. So we need a way to overlay those things
> into the DT. We already support this for in-tree DTs, so IMO this is
> easy. Just require every board to have an in-tree DT. It helps with
> discoverability and documentation, anyway. That is this series.
>
> (I think most of us are at the beginning of step 2, unsure about it
> and worried about step 3)
>=20
> Step 3: Ah, but there are flows (i.e. boards that use a particular
> flow only, or boards that sometimes use a flow) which need the DT to
> come from a prior stage. How to handle that? IMO that is only going to
> grow as every man and his dog get into the write-a-bootloader
> business. We need a way to provide the U-Boot nodes/properties in a
> form that the prior stage can consume and integrate with its build
> system. Is TF-A the only thing being discussed here? If so, let's just
> do it. We have the u-boot.dtsi and we can use binman to put the image
> together, for example. Or we can get clever and create some sort of
> overlay dtb.
>=20
> Step 3a. But I don't want to do that. a) If U-Boot needs this stuff
> then it will need to build it in and use two devicetrees, one internal
> and one from the prior stage....well that is not very efficient and it
> is going to be confusing for people to figure out what U-Boot is
> actually doing. But we actually already do that in a lot of cases
> where U-Boot passes a DT to the kernel which is different to the one
> it uses. So perhaps we have three devicetrees? OMG. b) Well then
> U-Boot can have its own small devicetree with its bits and then U-Boot
> can merge the two when it starts. Again that is not very efficient. It
> means that U-Boot cannot be controlled by the prior stage (e.g. to get
> its public key from there or to enable/disable the console), so
> unified firmware config is not possible. It will get very confusing,
> particularly for debugging U-Boot. c) Some other scheme to avoid
> accepting step 3...please stop!

How the nodes should get there is how the rest of the nodes in a system
get there.  Bindings are submitted and reviewed.  The authoritative
source of the dtses in question then has them, like any other property.

> Step 4: Yes, but there is QEMU, which makes the devicetree up out of
> whole cloth. What about that? Well, we are just going to have to deal
> with that. We can easily merge in the U-Boot nodes/properties and
> update the U-Boot CI scripts to do this, as needed, e.g. with
> qemu-riscv64_spl. It's only one use case, although Xen might do
> something similar.
>=20
> To my mind, that deals with both the build-time and run-time issues.
> We have a discoverable DT in U-Boot, which should be considered the
> source of truth for most boards. We can sync it with Linux
> automatically with the tooling that I hope Rob Herring will come up
> with. We can use an empty one where there really is no default,
> although I'd argue that is making perfect an enemy of the good.
>=20
> Step 5: If we get clever and want to remove them from the U-Boot tree
> and pick them up from somewhere else, we can do that with sufficient
> tooling. Perhaps we should set a timeline for that? A year? Two? Six?

These last two paragraphs condense what I think is honestly close to a
decade of debate / discussion down to a fiat "U-Boot will have the DTS
files".  I don't want that.  I don't think any of the other projects
that want to leverage DTS files want that.

> To repeat, if we set things up correctly and agree on the bindings,
> devicetree can be the unifying configuration mechanism through the
> whole of firmware (except for very early bits) and into the OS. I feel
> this will set us up very well to deal with the complexity that is
> coming.

Sure, it could.  But that doesn't mean that U-Boot is where the dts
files live.

--=20
Tom

--0pkK7MCEo5hACTvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5SqQACgkQFHw5/5Y0
tyySCQv+MAcIgmH/SOQrYxxsyzmamfZ5CdxFz8dX207XGecPcOcBlXWDyTilUNo3
QEHoewljsznTrELSW5XQ6mDKrRNvYpVzoybHVlrqQoNbW0uMOsFsyY7I4vqywYq+
rIvN9dDr534B3gjFE4O1rdAQ/wiEuf+A9teYBHv/O5JMmGAg/JKeA60a6Mw0uBKT
E2TNedeBYLB/e7NihQ43n3VL5tpkOWexkp6XFaXfROaS1UGlLGKIHeP6OXR/Liki
hey6ZXu6pJs64StpC3YeaxRaG2hgUVDHXTHy2CpUJFXC1l8FcuKyIc0Jk3/E865/
UJeahrjxbzcBzsljubUO0iFB+o/12Iz/vCjMGfPin9HcZhZMb8QtClwDOGZ3rFGj
YESMsWkE0rm7s16noD04tU56l/VuljMVYVXjw5mPlC7t8gpO854+rpaH2MuUadzn
ujBgjMgxYjam6+KU0SYNljL4MbCa4AQoLG1VpE7E/dNW8k2hHd8+1RwVTHD3BrTz
NwNLMPls
=Dct8
-----END PGP SIGNATURE-----

--0pkK7MCEo5hACTvx--

