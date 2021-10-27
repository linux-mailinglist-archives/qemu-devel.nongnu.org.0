Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A04043CDD8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:41:27 +0200 (CEST)
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfl3N-0004LC-6C
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfkJq-0006AV-0m
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:54:22 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfkJl-0004Ye-OX
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:54:21 -0400
Received: by mail-qk1-x72e.google.com with SMTP id bi29so2661124qkb.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=89tTnw/Y2hYK0hGJpxOGFqS2Gf5oR9o8knnxSiiKCx0=;
 b=SYrJv2mJ4j2wy0OhSEstvKcrlkCZaCi1G646MzMzlmYYDsncfq1tSLtC8fp/TqhZ2x
 JNJGaUcLfzOmDhZl3+3mjMNkEuwUQoLytyUzxqhMXAWE6vWyoD8IMED+cmeiLK1Ew3M9
 WxsILf9bgnaqrzfubKCv7xPluUHlHqO2w+Xro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=89tTnw/Y2hYK0hGJpxOGFqS2Gf5oR9o8knnxSiiKCx0=;
 b=HBSFKhgnROtBhHX8vm12QCZajJ6keEhZJqDcWeNA7zipiBB3AdX9kKXjEapjcRkfa6
 E3jV6EjQEGmccM1WFegIt9ek39HQrXdfZz3+i4ul8k1OuGS4PRumNQQgbGmLukTjVenx
 6z6h+KBNR7LFTdG+E07KJC5N6pERixcNRBb6GGPyzmzCx8K61y/I266dZmVR1/0X7mfS
 hyJlqs0u9eADJqEXXLCihUPoyxKRtRnDeHGHOK/KqkYdoMqd1S8r3mSBz+UiKO/rycjV
 yC+mLPxaSduN895HTiLpnCF7Q2TVFGM2Bu93urDs3n6xIcnqd6nxwPjNeP7+uiR6fh40
 Fj3Q==
X-Gm-Message-State: AOAM531VJAUGAkhiysgcpdi2kQA7KA5KQKPTdJUvmx5diFyc/G/rycrs
 L/rbl2uUgFqqkabr6wA+xi3GzQ==
X-Google-Smtp-Source: ABdhPJwROTnINNkKFAZjMbf94vOBw12Fo+xJcpJGSOoska/DDkHizyb3aif3MeTbBv/e9S4uTOSXAQ==
X-Received: by 2002:a37:44cc:: with SMTP id r195mr25660965qka.77.1635346456423; 
 Wed, 27 Oct 2021 07:54:16 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id v12sm66514qtq.62.2021.10.27.07.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:54:15 -0700 (PDT)
Date: Wed, 27 Oct 2021 10:54:11 -0400
From: Tom Rini <trini@konsulko.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027145411.GZ8284@bill-the-cat>
References: <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <20211027124840.GR8284@bill-the-cat>
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lPJ5i9rX1WvdYcWF"
Content-Disposition: inline
In-Reply-To: <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=trini@konsulko.com; helo=mail-qk1-x72e.google.com
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
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
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


--lPJ5i9rX1WvdYcWF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 03:15:01PM +0200, Fran=C3=A7ois Ozog wrote:
> Hi,
>=20
> On Wed, 27 Oct 2021 at 14:48, Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass wrote:
> > > Hi all,
> > >
> > > On Thu, 14 Oct 2021 at 09:28, Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> > > > > Hi Tom,
> > > > >
> > > > > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
> > > > > >
> > > > > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > > > > > > Hi Fran=C3=A7ois,
> > > > > > >
> > > > > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <
> > francois.ozog@linaro.org> wrote:
> > > > > > > >
> > > > > > > > Hi Simon
> > > > > > > >
> > > > > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromiu=
m.org>
> > a =C3=A9crit :
> > > > > > > >>
> > > > > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > > > > >>
> > > > > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com>
> > wrote:
> > > > > > > >> >
> > > > > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> > > > > > > >> > > Hi Simon,
> > > > > > > >> > >
> > > > > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <
> > sjg@chromium.org> wrote:
> > > > > > > >> > > >
> > > > > > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE a=
nd
> > OF_HOSTFILE so
> > > > > > > >> > > > there are only three ways to obtain a devicetree:
> > > > > > > >> > > >
> > > > > > > >> > > >    - OF_SEPARATE - the normal way, where the devicet=
ree
> > is built and
> > > > > > > >> > > >       appended to U-Boot
> > > > > > > >> > > >    - OF_EMBED - for development purposes, the
> > devicetree is embedded in
> > > > > > > >> > > >       the ELF file (also used for EFI)
> > > > > > > >> > > >    - OF_BOARD - the board figures it out on its own
> > > > > > > >> > > >
> > > > > > > >> > > > The last one is currently set up so that no devicetr=
ee
> > is needed at all
> > > > > > > >> > > > in the U-Boot tree. Most boards do provide one, but
> > some don't. Some
> > > > > > > >> > > > don't even provide instructions on how to boot on the
> > board.
> > > > > > > >> > > >
> > > > > > > >> > > > The problems with this approach are documented at [1=
].
> > > > > > > >> > > >
> > > > > > > >> > > > In practice, OF_BOARD is not really distinct from
> > OF_SEPARATE. Any board
> > > > > > > >> > > > can obtain its devicetree at runtime, even it is has=
 a
> > devicetree built
> > > > > > > >> > > > in U-Boot. This is because U-Boot may be a second-st=
age
> > bootloader and its
> > > > > > > >> > > > caller may have a better idea about the hardware
> > available in the machine.
> > > > > > > >> > > > This is the case with a few QEMU boards, for example.
> > > > > > > >> > > >
> > > > > > > >> > > > So it makes no sense to have OF_BOARD as a 'choice'.=
 It
> > should be an
> > > > > > > >> > > > option, available with either OF_SEPARATE or OF_EMBE=
D.
> > > > > > > >> > > >
> > > > > > > >> > > > This series makes this change, adding various missing
> > devicetree files
> > > > > > > >> > > > (and placeholders) to make the build work.
> > > > > > > >> > >
> > > > > > > >> > > Adding device trees that are never used sounds like a
> > hack to me.
> > > > > > > >> > >
> > > > > > > >> > > For QEMU, device tree is dynamically generated on the =
fly
> > based on
> > > > > > > >> > > command line parameters, and the device tree you put in
> > this series
> > > > > > > >> > > has various hardcoded <phandle> values which normally =
do
> > not show up
> > > > > > > >> > > in hand-written dts files.
> > > > > > > >> > >
> > > > > > > >> > > I am not sure I understand the whole point of this.
> > > > > > > >> >
> > > > > > > >> > I am also confused and do not like the idea of adding
> > device trees for
> > > > > > > >> > platforms that are capable of and can / do have a device
> > tree to give us
> > > > > > > >> > at run time.
> > > > > > > >>
> > > > > > > >> (I'll just reply to this one email, since the same points
> > applies to
> > > > > > > >> all replies I think)
> > > > > > > >>
> > > > > > > >> I have been thinking about this and discussing it with peo=
ple
> > for a
> > > > > > > >> few months now. I've been signalling a change like this for
> > over a
> > > > > > > >> month now, on U-Boot contributor calls and in discussions
> > with Linaro
> > > > > > > >> people. I sent a patch (below) to try to explain things. I
> > hope it is
> > > > > > > >> not a surprise!
> > > > > > > >>
> > > > > > > >> The issue here is that we need a devicetree in-tree in
> > U-Boot, to
> > > > > > > >> avoid the mess that has been created by OF_PRIOR_STAGE,
> > OF_BOARD,
> > > > > > > >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE.
> > Between
> > > > > > > >> Ilias' series and this one we can get ourselves on a stron=
ger
> > footing.
> > > > > > > >> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF
> > use.
> > > > > > > >> For more context:
> > > > > > > >>
> > > > > > > >>
> > http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-=
3-sjg@chromium.org/
> > > > > > > >>
> > > > > > > >> BTW I did suggest to QEMU ARM that they support a way of
> > adding the
> > > > > > > >> u-boot.dtsi but there was not much interest there (in fact=
 the
> > > > > > > >> maintainer would prefer there was no special support even =
for
> > booting
> > > > > > > >> Linux directly!)
> > > > > > > >
> > > > > > > > i understand their point of view and agree with it.
> > > > > > > >>
> > > > > > > >> But in any case it doesn't really help U-Boot. I
> > > > > > > >> think the path forward might be to run QEMU twice, once to
> > get its
> > > > > > > >> generated tree and once to give the 'merged' tree with the
> > U-Boot
> > > > > > > >> properties in it, if people want to use U-Boot features.
> > > > > > > >>
> > > > > > > >> I do strongly believe that OF_BOARD must be a run-time
> > option, not a
> > > > > > > >> build-time one. It creates all sorts of problems and
> > obscurity which
> > > > > > > >> have taken months to unpick. See the above patch for the
> > rationale.
> > > > > > > >>
> > > > > > > >> To add to that rationale, OF_BOARD needs to be an option
> > available to
> > > > > > > >> any board. At some point in the future it may become a com=
mon
> > way
> > > > > > > >> things are done, e.g. TF-A calling U-Boot and providing a
> > devicetree
> > > > > > > >> to it. It doesn't make any sense to have people decide
> > whether or not
> > > > > > > >> to set OF_BOARD at build time, thus affecting how the image
> > is put
> > > > > > > >> together. We'll end up with different U-Boot build targets
> > like
> > > > > > > >> capricorn, capricorn_of_board and the like. It should be
> > obvious where
> > > > > > > >> that will lead. Instead, OF_BOARD needs to become a common=
ly
> > used
> > > > > > > >> option, perhaps enabled by most/all boards, so that this s=
ort
> > of build
> > > > > > > >> explosion is not needed.
> > > > > > > >
> > > > > > > > If you mean that when boards are by construction providing a
> > DTB to U-Boot then I agree very much. But I don=E2=80=99t understand ho=
w the patch
> > set  supports it as it puts dts files for those boards to be built.
> > > > > > > >>
> > > > > > > >> U-Boot needs to be flexible enough to
> > > > > > > >> function correctly in whatever runtime environment in which
> > it finds
> > > > > > > >> itself.
> > > > > > > >>
> > > > > > > >> Also as binman is pressed into service more and more to bu=
ild
> > the
> > > > > > > >> complex firmware images that are becoming fashionable, it
> > needs a
> > > > > > > >> definition (in the devicetree) that describes how to create
> > the image.
> > > > > > > >> We can't support that unless we are building a devicetree,
> > nor can the
> > > > > > > >> running program access the image layout without that
> > information.
> > > > > > > >>
> > > > > > > >> Fran=C3=A7ois's point about 'don't use this with any kerne=
l' is
> > > > > > > >> germane...but of course I am not suggesting doing that, si=
nce
> > OF_BOARD
> > > > > > > >> is, still, enabled. We already use OF_BOARD for various
> > boards that
> > > > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, f=
or
> > example
> > > > > > > >> (as I said in the cover letter "Most boards do provide one,
> > but some
> > > > > > > >> don't."). So this series is just completing the picture by
> > enforcing
> > > > > > > >> that *some sort* of devicetree is always present.
> > > > > > > >
> > > > > > > > That seems inconsistent with the OF_BOARD becomes the defau=
lt.
> > > > > > >
> > > > > > > I think the key point that will get you closer to where I am =
on
> > this
> > > > > > > issue, is that OF_BOARD needs to be a run-time option. At
> > present it
> > > > > > > has build-time effects and this is quite wrong. If you go
> > through all
> > > > > > > the material I have written on this I think I have motivated
> > that very
> > > > > > > clearly.
> > > > > > >
> > > > > > > Another big issue is that I believe we need ONE devicetree for
> > U-Boot,
> > > > > > > not two that get merged by U-Boot. Again I have gone through
> > that in a
> > > > > > > lot of detail.
> > > > > >
> > > > > > I have a long long reply to your first reply here saved, but, m=
aybe
> > > > > > here's the biggest sticking point.  To be clear, you agree that
> > U-Boot
> > > > > > needs to support being passed a device tree to use, at run time,
> > yes?
> > > > >
> > > > > Yes. The OF_BOARD feature provides this.
> > > > >
> > > > > >
> > > > > > And in that case, would not be using the "fake" tree we built i=
n?
> > > > >
> > > > > Not at runtime.
> > > >
> > > > OK.
> > > >
> > > > > > So is the sticking point here that we really have two classes of
> > > > > > devices, one class where we will never ever be given the device
> > tree at
> > > > > > run time (think BeagleBone Black) and one where we will always =
be
> > given
> > > > > > one at run time (think Raspberry Pi) ?
> > > > >
> > > > > I'm not sure it will be that black and white. I suspect there wil=
l be
> > > > > (many) boards which can boot happily with the U-Boot devicetree b=
ut
> > > > > can also accept one at runtime, if provided. For example, you may
> > want
> > > > > to boot with or without TF-A or some other, earlier stage.
> > > >
> > > > I'm not sure I see the value in making this a gray area.  There's v=
ery
> > > > much a class of "never" boards.  There's also the class of "can" to=
day.
> > > > Maybe as part of a developer iterative flow it would be nice to not
> > have
> > > > to re-flash the prior stage to change a DT, and just do it in U-Boot
> > > > until things are happy, but I'm not sure what the use case is for
> > > > overriding the previous stage.
> > > >
> > > > Especially since the pushback on this series I think has all been "=
why
> > > > are we copying in a tree to build with?  We don't want to use it at=
 run
> > > > time!".  And then softer push back like "Well, U-Boot says we have =
to
> > > > include the device tree file here, but we won't use it...".
> > >
> > > See below.
> > >
> > > >
> > > > > I believe we have got unstuck because OF_BOARD (perhaps
> > inadvertently)
> > > > > provided a way to entirely omit a devicetree from U-Boot, thus ma=
king
> > > > > things like binman and U-Boot /config impossible, for example. So=
 I
> > > > > want to claw that back, so there is always some sort of devicetre=
e in
> > > > > U-Boot, as we have for rpi_3, etc.
> > > >
> > > > I really want to see what the binary case looks like since we could
> > then
> > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we could
> > > > then also do a rpi_arm32_defconfig too.
> > > >
> > > > I want to see less device trees in U-Boot sources, if they can come
> > > > functionally correct from the hardware/our caller.
> > > >
> > > > And I'm not seeing how we make use of "U-Boot /config" if we also d=
on't
> > > > use the device tree from build time at run time, ignoring the device
> > > > tree provided to us at run time by the caller.
> > >
> > > Firstly I should say that I find building firmware very messy and
> > > confusing these days. Lots of things to build and it's hard to find
> > > the instructions. It doesn't have to be that way, but if we carry on
> > > as we are, it will continue to be messy and in five years you will
> > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > objective here is to simplify things, bringing some consistency to the
> > > different components. Binman was one effort there. I feel that putting
> > > at least the U-Boot house in order, in my role as devicetree
> > > maintainer (and as author of devicetree support in U-Boot back in
> > > 2011), is the next step.
> >
> > Yes, it's Not Great.  I don't like my handful of build-BOARD.sh scripts
> > that know where to grab other known-good binaries of varying licenses
> > that are needed to assemble something that boots.
> >
> > > If we set things up correctly and agree on the bindings, devicetree
> > > can be the unifying configuration mechanism through the whole of
> > > firmware (except for very early bits) and into the OS, this will set
> > > us up very well to deal with the complexity that is coming.
> > >
> > > Anyway, here are the mental steps that I've gone through over the past
> > > two months:
> > >
> > > Step 1: At present, some people think U-Boot is not even allowed to
> > > have its own nodes/properties in the DT.
>=20
> In my view U-Boot shall be able to leverage device tree format (source and
> binary) to store its own data.
> When you say "the" DT, I always think this is "the" DT that is passed to =
OS
> and in "that" DT, there should be no U-Boot entries. As stated in another

I would (and I know I'm repeating myself and emails have crossed, etc,
but for future clarity) say it's that no un-official nodes/properties
should be passed from one piece of software to another.  I mean hell,
"u-boot,bootcount" MUST get passed to the OS, so has some idea how many
times the system has booted.  It's just a long standing item to get that
bootcount driver / binding unblocked and merged finally.  But that's a
different tangent to get lost on.

> mail thread, I also refer to a place in a FIP where that dynamic config DT
> is meant to be stored: NT_FW_CONFIG.
> But there can be U-Boot defined bindings in "a" control/dynamic config DT;
> Trusted Firmware does that.

Maybe I just need to come out and say if "everyone" has decided how
U-Boot needs to work, but also myself (head custodian) and Simon (head
DM custodian, device tree in U-Boot custodian) aren't 100% on board with
everything, maybe some step back and re-evaluation needs to be taken?
And I'm not saying we're the final word only here either, there has been
and needs to continue to be good faith discussions.  It should also be
clear at this point that he and I aren't on the same page on everything,
for example :)

> > It is an abuse of the
> > > devicetree standard, like the /chosen node but with less history. We
> > > should sacrifice efficiency, expedience and expandability on the altar
> > > of 'devicetree is a hardware description'. How do we get over that
> > > one? Wel, I just think we need to accept that U-Boot uses devicetree
> > > for its own purposes, as well as for booting the OS. I am not saying
> >
> > Yes, we need to have properties present in the device tree, and just
> > like how "linux," is a valid vendor prefix for the linux kernel (but not
> > used I would expect by the BSD families) we have cases that need
> > "u-boot," properties.
> >
> > > it always has to have those properties, but with existing features
> > > like verified boot, SPL as well as complex firmware images where
> > > U-Boot needs to be able to find things in the image, it is essential.
> > > So let's just assume that we need this everywhere, since we certainly
> > > need it in at least some places.
> >
> > No, we can't / shouldn't assume we need this everywhere.  A lot of
> > places? Yes.  But some features are going to be optional.  A valid must
> > be supported use case is something like a Pi where the hardware gives us
> > a device tree, the tree is correct and some features in U-Boot aren't
> > needed (SPL) nor possibly supported immediately (verified boot).  We can
> > go off on a tangent about how useful it would be to have HW platforms
> > that are both common and can demonstrate a number of features, but
> > that's its own problem to solve.
> >
> > > (stop reading here if you disagree, because nothing below will make
> > > any sense...you can still use U-Boot v2011.06 which doesn't have
> > > OF_CONTROL :-)
> > >
> > > Step 2: Assume U-Boot has its own nodes/properties. How do they get
> > > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> > > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
> > > have binman definitions, etc. So we need a way to overlay those things
> > > into the DT. We already support this for in-tree DTs, so IMO this is
> > > easy. Just require every board to have an in-tree DT. It helps with
> > > discoverability and documentation, anyway. That is this series.
> > >
> > > (I think most of us are at the beginning of step 2, unsure about it
> > > and worried about step 3)
> > >
> > > Step 3: Ah, but there are flows (i.e. boards that use a particular
> > > flow only, or boards that sometimes use a flow) which need the DT to
> > > come from a prior stage. How to handle that? IMO that is only going to
> > > grow as every man and his dog get into the write-a-bootloader
> > > business. We need a way to provide the U-Boot nodes/properties in a
> > > form that the prior stage can consume and integrate with its build
> > > system. Is TF-A the only thing being discussed here? If so, let's just
> > > do it. We have the u-boot.dtsi and we can use binman to put the image
> > > together, for example. Or we can get clever and create some sort of
> > > overlay dtb.
> > >
> > > Step 3a. But I don't want to do that. a) If U-Boot needs this stuff
> > > then it will need to build it in and use two devicetrees, one internal
> > > and one from the prior stage....well that is not very efficient and it
> > > is going to be confusing for people to figure out what U-Boot is
> > > actually doing. But we actually already do that in a lot of cases
> > > where U-Boot passes a DT to the kernel which is different to the one
> > > it uses. So perhaps we have three devicetrees? OMG. b) Well then
> > > U-Boot can have its own small devicetree with its bits and then U-Boot
> > > can merge the two when it starts. Again that is not very efficient.
>=20
> Does not need to merge the two. hence it does not have any influence on
> efficiency.
> For properties access, trusted firmware has defined an abstract way to get
> them:
> https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index=
=2Ehtml

That's interesting, but I also think fconf_load_config(), etc are the
efficiency and additional overhead Simon is talking about being worried
about.

> The properties are currently implemented as DT but TF.ORG could decide to
> move to CBOR.
> The API will remain so that a change in backend will not influence existi=
ng
> code.
> I think you are too focused on "THE" device tree. "THE" device tree that =
is
> passed to the OS
> shall be hardware description and not a hacky place to fit any piece of
> metadata.

No, but it is the place to put well defined metadata.

> I would argue that /chosen shall not even be there as most if not all
> information can be passed as OS command line. And actually for the UEFI
> contract, /chosen should go empty.

Shoving a bunch of stuff to the kernel command line sounds pretty hacky
to me.  But I'll just assume it's already been given the official Not
Hacky stamp of approval since after all, there's not a long standing
cleaner path to do anything like that on x86, and we must all mirror the
x86 world.

> > It
> > > means that U-Boot cannot be controlled by the prior stage (e.g. to get
> > > its public key from there or to enable/disable the console), so
> > > unified firmware config is not possible. It will get very confusing,
> > > particularly for debugging U-Boot. c) Some other scheme to avoid
> > > accepting step 3...please stop!
> >
> > How the nodes should get there is how the rest of the nodes in a system
> > get there.  Bindings are submitted and reviewed.  The authoritative
> > source of the dtses in question then has them, like any other property.
> >
> > > Step 4: Yes, but there is QEMU, which makes the devicetree up out of
> > > whole cloth. What about that? Well, we are just going to have to deal
> > > with that. We can easily merge in the U-Boot nodes/properties and
> > > update the U-Boot CI scripts to do this, as needed, e.g. with
> > > qemu-riscv64_spl. It's only one use case, although Xen might do
> > > something similar.
> > >
> > > To my mind, that deals with both the build-time and run-time issues.
> > > We have a discoverable DT in U-Boot, which should be considered the
> > > source of truth for most boards. We can sync it with Linux
> > > automatically with the tooling that I hope Rob Herring will come up
> > > with. We can use an empty one where there really is no default,
> > > although I'd argue that is making perfect an enemy of the good.
> > >
> > > Step 5: If we get clever and want to remove them from the U-Boot tree
> > > and pick them up from somewhere else, we can do that with sufficient
> > > tooling. Perhaps we should set a timeline for that? A year? Two? Six?
> >
> > For SystemReady compliant boards, this has to come much faster.
> Do you think distros will keep providing DTs for ever? I bet not.

Since it seems like it'll be a long time before people stop producing
SBCs that lack on-board flash storage for the world firmware, yeah, I
don't know when distributions will stop shipping DTBs.  Maybe a year or
two after the last popular SBC comes out and distros are comfortable
shoving people that have that hardware off to some other community to
support?

--=20
Tom

--lPJ5i9rX1WvdYcWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5aBAACgkQFHw5/5Y0
tywvXwv/e3rEyAtSBclf3IKhlxf0k7HcPzpOIx9mxlI1rS6lnEus8goA5RRBitnG
cWtOapq7/EcNfUvRM+kb6jg8FaAlaNGWDVWFFXqMTvJjwFhKex0EQ4BUOT46Hppy
n4UAj9MipfCnDWcp6oG5MWBdaxgscgFnhmHeKIPvGF6OG53zV8FvSJtxR/snUME4
NawrXxBAGihlY0iZaFgKuJ64csyzSVznsCVjbWZy0V+iVieP8gAvCi/UDo4kzH3/
x7bU1AOvraR38SsdhN7HfLEDYfPEyvj0jxM50Tak146lIRh/NcWRDJc6YFP6ADuu
D1+SMKxQ4Ceyh2YtlX5eRdOLqNBdsNu0Oltmj150qOVlQnnprSzOqzBQsnPgF/N4
XFHetHPelREgK/QCgqNIyxrLn+lkJC6LE2lkYYXffAv5x9W0pR1ft5gvyMDscp/A
H7gOuEHlHvWaamTp+yFXXmU2XNBuvv55VxsLaxN9wAakhIL1XMvV8O3P5WkVg1uZ
j8wYXXOf
=NW3a
-----END PGP SIGNATURE-----

--lPJ5i9rX1WvdYcWF--

