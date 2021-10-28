Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F19643E40E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:44:34 +0200 (CEST)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6dt-0000aS-DR
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mg6aw-00051t-Gw
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:41:30 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:36662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mg6ar-00083Q-EE
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:41:29 -0400
Received: by mail-qt1-x836.google.com with SMTP id h14so5118353qtb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LG1+5mxe451sVZxSolUMPy9urThG3SFdVN0EpdNCXok=;
 b=ig4V/JO+W85mmQ5XQQOANW8XN6CvTJ5IbgmjpiYEs1eN4T7mbsQETAgXiOS31Dlnqv
 xKvAxPaI2fhKtmrdWKe+QC01t8dT7gF+pYGWYoMprGxkuoPerpaqtgaayvGwo0NGEbKs
 yjVQtg5NkPMO9WG47m3JVsn8HNRqNnRG6aVmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LG1+5mxe451sVZxSolUMPy9urThG3SFdVN0EpdNCXok=;
 b=y/BFnMwPWZ0GCMphv+0E3Vo7uuO64aJwfC/wDmITxZlq+BnThkXuW/uYG/zmpWRQqr
 0wvka0tpwiYj2EA8+u4IBwHKmjefxB2y7IJxot1ktea2UYYzxcHmcTxQQDRGK+yOEfpJ
 yrLRREtsz3MUM4BjpuRpIAM5Ffr4WhWkc2uFiwtj8jqHrp/IZSV9uhrlO5HNLesN7RW0
 2+OmdhZei6z/oyLYI3X5q2tpqcncnd9Ek2Tps6teV5HoM5EfH/IjAq3lM4apAzVZpCPu
 VUkyP8X3OaiXo1X3eXxWDoaNUFTO0CwIqJ7SEArJF3FpVzm1y84E5Ahm99ebLqkpiTa8
 1wDA==
X-Gm-Message-State: AOAM531VsINGKPGMGtcSUYHxG6uCfu2i51ghNQzOYUUpLsx1yeDjb5I5
 +HwzV4xDMWxZpeZA4Do1CJUpTg==
X-Google-Smtp-Source: ABdhPJxDWCSqQ4ZSZQV5oob5R/RurSw29Fm1SKGqLxOcT+4pwPPlL+RxNJ7cTdN6A7asadnjTB4j/Q==
X-Received: by 2002:a05:622a:46:: with SMTP id
 y6mr5157247qtw.244.1635432083498; 
 Thu, 28 Oct 2021 07:41:23 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-015b-1704-43dd-8832.res6.spectrum.com.
 [2603:6081:7b01:cbda:15b:1704:43dd:8832])
 by smtp.gmail.com with ESMTPSA id i2sm2182445qti.92.2021.10.28.07.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:41:22 -0700 (PDT)
Date: Thu, 28 Oct 2021 10:41:18 -0400
From: Tom Rini <trini@konsulko.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211028144118.GV8284@bill-the-cat>
References: <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <20211027124840.GR8284@bill-the-cat>
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 <d3ca937f451a8cf3@bloch.sibelius.xs4all.nl>
 <CAHFG_=VYC9qaRHy=cogeXEpa8EXUqvfiXt50nfsVP3f7hzqXXA@mail.gmail.com>
 <20211027190649.GI8284@bill-the-cat>
 <CAHFG_=Xv2-_hqysarvjuN7QFCZHFH9L-pVbVnqzmJZZb2aHVnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="csoOxBvjhnnTVlaS"
Content-Disposition: inline
In-Reply-To: <CAHFG_=Xv2-_hqysarvjuN7QFCZHFH9L-pVbVnqzmJZZb2aHVnA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=trini@konsulko.com; helo=mail-qt1-x836.google.com
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
Cc: liviu.dudau@foss.arm.com, narmstrong@baylibre.com, rick@andestech.com,
 vladimir.oltean@nxp.com, linus.walleij@linaro.org, fitzsim@fitzsim.org,
 kever.yang@rock-chips.com, seanga2@gmail.com, atish.patra@wdc.com,
 zong.li@sifive.com, sr@denx.de, festevam@gmail.com,
 rainer.boschung@hitachi-powergrids.com,
 Mark Kettenis <mark.kettenis@xs4all.nl>, swarren@nvidia.com,
 oleksandr_andrushchenko@epam.com, xypron.glpk@gmx.de, lusus@denx.de,
 michal.simek@xilinx.com, marek.behun@nic.cz, vanbaren@cideas.com,
 rfried.dev@gmail.com, jagan@amarulasolutions.com,
 valentin.longchamp@hitachi-powergrids.com, hs@denx.de, pbrobinson@gmail.com,
 sinan@writeme.com, bin.meng@windriver.com, wd@denx.de, swarren@wwwdotorg.org,
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


--csoOxBvjhnnTVlaS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2021 at 12:00:44AM +0200, Fran=C3=A7ois Ozog wrote:
> Hi Tom
>=20
> Le mer. 27 oct. 2021 =C3=A0 21:06, Tom Rini <trini@konsulko.com> a =C3=A9=
crit :
>=20
> > On Wed, Oct 27, 2021 at 06:02:19PM +0200, Fran=C3=A7ois Ozog wrote:
> > > Hi Mark,
> > >
> > > On Wed, 27 Oct 2021 at 17:10, Mark Kettenis <mark.kettenis@xs4all.nl>
> > wrote:
> > >
> > > > > From: Fran=C3=A7ois Ozog <francois.ozog@linaro.org>
> > > > > Date: Wed, 27 Oct 2021 15:15:01 +0200
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Wed, 27 Oct 2021 at 14:48, Tom Rini <trini@konsulko.com> wrote:
> > > > >
> > > > > > On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > On Thu, 14 Oct 2021 at 09:28, Tom Rini <trini@konsulko.com>
> > wrote:
> > > > > > > >
> > > > > > > > On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> > > > > > > > > Hi Tom,
> > > > > > > > >
> > > > > > > > > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.co=
m>
> > > > wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass
> > wrote:
> > > > > > > > > > > Hi Fran=C3=A7ois,
> > > > > > > > > > >
> > > > > > > > > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <
> > > > > > francois.ozog@linaro.org> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Hi Simon
> > > > > > > > > > > >
> > > > > > > > > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <
> > > > sjg@chromium.org>
> > > > > > a =C3=A9crit :
> > > > > > > > > > > >>
> > > > > > > > > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > > > > > > > > >>
> > > > > > > > > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <
> > > > trini@konsulko.com>
> > > > > > wrote:
> > > > > > > > > > > >> >
> > > > > > > > > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Me=
ng
> > > > wrote:
> > > > > > > > > > > >> > > Hi Simon,
> > > > > > > > > > > >> > >
> > > > > > > > > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <
> > > > > > sjg@chromium.org> wrote:
> > > > > > > > > > > >> > > >
> > > > > > > > > > > >> > > > With Ilias' efforts we have dropped
> > OF_PRIOR_STAGE
> > > > and
> > > > > > OF_HOSTFILE so
> > > > > > > > > > > >> > > > there are only three ways to obtain a
> > devicetree:
> > > > > > > > > > > >> > > >
> > > > > > > > > > > >> > > >    - OF_SEPARATE - the normal way, where the
> > > > devicetree
> > > > > > is built and
> > > > > > > > > > > >> > > >       appended to U-Boot
> > > > > > > > > > > >> > > >    - OF_EMBED - for development purposes, the
> > > > > > devicetree is embedded in
> > > > > > > > > > > >> > > >       the ELF file (also used for EFI)
> > > > > > > > > > > >> > > >    - OF_BOARD - the board figures it out on =
its
> > own
> > > > > > > > > > > >> > > >
> > > > > > > > > > > >> > > > The last one is currently set up so that no
> > > > devicetree
> > > > > > is needed at all
> > > > > > > > > > > >> > > > in the U-Boot tree. Most boards do provide o=
ne,
> > but
> > > > > > some don't. Some
> > > > > > > > > > > >> > > > don't even provide instructions on how to bo=
ot
> > on
> > > > the
> > > > > > board.
> > > > > > > > > > > >> > > >
> > > > > > > > > > > >> > > > The problems with this approach are document=
ed
> > at
> > > > [1].
> > > > > > > > > > > >> > > >
> > > > > > > > > > > >> > > > In practice, OF_BOARD is not really distinct
> > from
> > > > > > OF_SEPARATE. Any board
> > > > > > > > > > > >> > > > can obtain its devicetree at runtime, even i=
t is
> > > > has a
> > > > > > devicetree built
> > > > > > > > > > > >> > > > in U-Boot. This is because U-Boot may be a
> > > > second-stage
> > > > > > bootloader and its
> > > > > > > > > > > >> > > > caller may have a better idea about the hard=
ware
> > > > > > available in the machine.
> > > > > > > > > > > >> > > > This is the case with a few QEMU boards, for
> > > > example.
> > > > > > > > > > > >> > > >
> > > > > > > > > > > >> > > > So it makes no sense to have OF_BOARD as a
> > > > 'choice'. It
> > > > > > should be an
> > > > > > > > > > > >> > > > option, available with either OF_SEPARATE or
> > > > OF_EMBED.
> > > > > > > > > > > >> > > >
> > > > > > > > > > > >> > > > This series makes this change, adding various
> > > > missing
> > > > > > devicetree files
> > > > > > > > > > > >> > > > (and placeholders) to make the build work.
> > > > > > > > > > > >> > >
> > > > > > > > > > > >> > > Adding device trees that are never used sounds
> > like a
> > > > > > hack to me.
> > > > > > > > > > > >> > >
> > > > > > > > > > > >> > > For QEMU, device tree is dynamically generated=
 on
> > the
> > > > fly
> > > > > > based on
> > > > > > > > > > > >> > > command line parameters, and the device tree y=
ou
> > put
> > > > in
> > > > > > this series
> > > > > > > > > > > >> > > has various hardcoded <phandle> values which
> > normally
> > > > do
> > > > > > not show up
> > > > > > > > > > > >> > > in hand-written dts files.
> > > > > > > > > > > >> > >
> > > > > > > > > > > >> > > I am not sure I understand the whole point of
> > this.
> > > > > > > > > > > >> >
> > > > > > > > > > > >> > I am also confused and do not like the idea of
> > adding
> > > > > > device trees for
> > > > > > > > > > > >> > platforms that are capable of and can / do have a
> > device
> > > > > > tree to give us
> > > > > > > > > > > >> > at run time.
> > > > > > > > > > > >>
> > > > > > > > > > > >> (I'll just reply to this one email, since the same
> > points
> > > > > > applies to
> > > > > > > > > > > >> all replies I think)
> > > > > > > > > > > >>
> > > > > > > > > > > >> I have been thinking about this and discussing it =
with
> > > > people
> > > > > > for a
> > > > > > > > > > > >> few months now. I've been signalling a change like
> > this
> > > > for
> > > > > > over a
> > > > > > > > > > > >> month now, on U-Boot contributor calls and in
> > discussions
> > > > > > with Linaro
> > > > > > > > > > > >> people. I sent a patch (below) to try to explain
> > things. I
> > > > > > hope it is
> > > > > > > > > > > >> not a surprise!
> > > > > > > > > > > >>
> > > > > > > > > > > >> The issue here is that we need a devicetree in-tre=
e in
> > > > > > U-Boot, to
> > > > > > > > > > > >> avoid the mess that has been created by
> > OF_PRIOR_STAGE,
> > > > > > OF_BOARD,
> > > > > > > > > > > >> BINMAN_STANDALONE_FDT and to a lesser extent,
> > OF_HOSTFILE.
> > > > > > Between
> > > > > > > > > > > >> Ilias' series and this one we can get ourselves on=
 a
> > > > stronger
> > > > > > footing.
> > > > > > > > > > > >> There is just OF_SEPARATE, with OF_EMBED for
> > debugging/ELF
> > > > > > use.
> > > > > > > > > > > >> For more context:
> > > > > > > > > > > >>
> > > > > > > > > > > >>
> > > > > >
> > > >
> > http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-=
3-sjg@chromium.org/
> > > > > > > > > > > >>
> > > > > > > > > > > >> BTW I did suggest to QEMU ARM that they support a =
way
> > of
> > > > > > adding the
> > > > > > > > > > > >> u-boot.dtsi but there was not much interest there =
(in
> > > > fact the
> > > > > > > > > > > >> maintainer would prefer there was no special suppo=
rt
> > even
> > > > for
> > > > > > booting
> > > > > > > > > > > >> Linux directly!)
> > > > > > > > > > > >
> > > > > > > > > > > > i understand their point of view and agree with it.
> > > > > > > > > > > >>
> > > > > > > > > > > >> But in any case it doesn't really help U-Boot. I
> > > > > > > > > > > >> think the path forward might be to run QEMU twice,
> > once to
> > > > > > get its
> > > > > > > > > > > >> generated tree and once to give the 'merged' tree
> > with the
> > > > > > U-Boot
> > > > > > > > > > > >> properties in it, if people want to use U-Boot
> > features.
> > > > > > > > > > > >>
> > > > > > > > > > > >> I do strongly believe that OF_BOARD must be a run-=
time
> > > > > > option, not a
> > > > > > > > > > > >> build-time one. It creates all sorts of problems a=
nd
> > > > > > obscurity which
> > > > > > > > > > > >> have taken months to unpick. See the above patch f=
or
> > the
> > > > > > rationale.
> > > > > > > > > > > >>
> > > > > > > > > > > >> To add to that rationale, OF_BOARD needs to be an
> > option
> > > > > > available to
> > > > > > > > > > > >> any board. At some point in the future it may beco=
me a
> > > > common
> > > > > > way
> > > > > > > > > > > >> things are done, e.g. TF-A calling U-Boot and
> > providing a
> > > > > > devicetree
> > > > > > > > > > > >> to it. It doesn't make any sense to have people de=
cide
> > > > > > whether or not
> > > > > > > > > > > >> to set OF_BOARD at build time, thus affecting how =
the
> > > > image
> > > > > > is put
> > > > > > > > > > > >> together. We'll end up with different U-Boot build
> > targets
> > > > > > like
> > > > > > > > > > > >> capricorn, capricorn_of_board and the like. It sho=
uld
> > be
> > > > > > obvious where
> > > > > > > > > > > >> that will lead. Instead, OF_BOARD needs to become a
> > > > commonly
> > > > > > used
> > > > > > > > > > > >> option, perhaps enabled by most/all boards, so that
> > this
> > > > sort
> > > > > > of build
> > > > > > > > > > > >> explosion is not needed.
> > > > > > > > > > > >
> > > > > > > > > > > > If you mean that when boards are by construction
> > providing
> > > > a
> > > > > > DTB to U-Boot then I agree very much. But I don=E2=80=99t under=
stand how
> > the
> > > > patch
> > > > > > set  supports it as it puts dts files for those boards to be bu=
ilt.
> > > > > > > > > > > >>
> > > > > > > > > > > >> U-Boot needs to be flexible enough to
> > > > > > > > > > > >> function correctly in whatever runtime environment=
 in
> > > > which
> > > > > > it finds
> > > > > > > > > > > >> itself.
> > > > > > > > > > > >>
> > > > > > > > > > > >> Also as binman is pressed into service more and mo=
re
> > to
> > > > build
> > > > > > the
> > > > > > > > > > > >> complex firmware images that are becoming
> > fashionable, it
> > > > > > needs a
> > > > > > > > > > > >> definition (in the devicetree) that describes how =
to
> > > > create
> > > > > > the image.
> > > > > > > > > > > >> We can't support that unless we are building a
> > devicetree,
> > > > > > nor can the
> > > > > > > > > > > >> running program access the image layout without th=
at
> > > > > > information.
> > > > > > > > > > > >>
> > > > > > > > > > > >> Fran=C3=A7ois's point about 'don't use this with a=
ny
> > kernel' is
> > > > > > > > > > > >> germane...but of course I am not suggesting doing
> > that,
> > > > since
> > > > > > OF_BOARD
> > > > > > > > > > > >> is, still, enabled. We already use OF_BOARD for
> > various
> > > > > > boards that
> > > > > > > > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 =
and
> > 3,
> > > > for
> > > > > > example
> > > > > > > > > > > >> (as I said in the cover letter "Most boards do pro=
vide
> > > > one,
> > > > > > but some
> > > > > > > > > > > >> don't."). So this series is just completing the
> > picture by
> > > > > > enforcing
> > > > > > > > > > > >> that *some sort* of devicetree is always present.
> > > > > > > > > > > >
> > > > > > > > > > > > That seems inconsistent with the OF_BOARD becomes t=
he
> > > > default.
> > > > > > > > > > >
> > > > > > > > > > > I think the key point that will get you closer to whe=
re
> > I am
> > > > on
> > > > > > this
> > > > > > > > > > > issue, is that OF_BOARD needs to be a run-time option=
=2E At
> > > > > > present it
> > > > > > > > > > > has build-time effects and this is quite wrong. If yo=
u go
> > > > > > through all
> > > > > > > > > > > the material I have written on this I think I have
> > motivated
> > > > > > that very
> > > > > > > > > > > clearly.
> > > > > > > > > > >
> > > > > > > > > > > Another big issue is that I believe we need ONE
> > devicetree
> > > > for
> > > > > > U-Boot,
> > > > > > > > > > > not two that get merged by U-Boot. Again I have gone
> > through
> > > > > > that in a
> > > > > > > > > > > lot of detail.
> > > > > > > > > >
> > > > > > > > > > I have a long long reply to your first reply here saved,
> > but,
> > > > maybe
> > > > > > > > > > here's the biggest sticking point.  To be clear, you ag=
ree
> > that
> > > > > > U-Boot
> > > > > > > > > > needs to support being passed a device tree to use, at =
run
> > > > time,
> > > > > > yes?
> > > > > > > > >
> > > > > > > > > Yes. The OF_BOARD feature provides this.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > And in that case, would not be using the "fake" tree we
> > built
> > > > in?
> > > > > > > > >
> > > > > > > > > Not at runtime.
> > > > > > > >
> > > > > > > > OK.
> > > > > > > >
> > > > > > > > > > So is the sticking point here that we really have two
> > classes
> > > > of
> > > > > > > > > > devices, one class where we will never ever be given the
> > device
> > > > > > tree at
> > > > > > > > > > run time (think BeagleBone Black) and one where we will
> > always
> > > > be
> > > > > > given
> > > > > > > > > > one at run time (think Raspberry Pi) ?
> > > > > > > > >
> > > > > > > > > I'm not sure it will be that black and white. I suspect t=
here
> > > > will be
> > > > > > > > > (many) boards which can boot happily with the U-Boot
> > devicetree
> > > > but
> > > > > > > > > can also accept one at runtime, if provided. For example,
> > you may
> > > > > > want
> > > > > > > > > to boot with or without TF-A or some other, earlier stage.
> > > > > > > >
> > > > > > > > I'm not sure I see the value in making this a gray area.
> > There's
> > > > very
> > > > > > > > much a class of "never" boards.  There's also the class of
> > "can"
> > > > today.
> > > > > > > > Maybe as part of a developer iterative flow it would be nice
> > to not
> > > > > > have
> > > > > > > > to re-flash the prior stage to change a DT, and just do it =
in
> > > > U-Boot
> > > > > > > > until things are happy, but I'm not sure what the use case =
is
> > for
> > > > > > > > overriding the previous stage.
> > > > > > > >
> > > > > > > > Especially since the pushback on this series I think has all
> > been
> > > > "why
> > > > > > > > are we copying in a tree to build with?  We don't want to u=
se
> > it
> > > > at run
> > > > > > > > time!".  And then softer push back like "Well, U-Boot says =
we
> > have
> > > > to
> > > > > > > > include the device tree file here, but we won't use it...".
> > > > > > >
> > > > > > > See below.
> > > > > > >
> > > > > > > >
> > > > > > > > > I believe we have got unstuck because OF_BOARD (perhaps
> > > > > > inadvertently)
> > > > > > > > > provided a way to entirely omit a devicetree from U-Boot,
> > thus
> > > > making
> > > > > > > > > things like binman and U-Boot /config impossible, for
> > example.
> > > > So I
> > > > > > > > > want to claw that back, so there is always some sort of
> > > > devicetree in
> > > > > > > > > U-Boot, as we have for rpi_3, etc.
> > > > > > > >
> > > > > > > > I really want to see what the binary case looks like since =
we
> > could
> > > > > > then
> > > > > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if=
 we
> > > > could
> > > > > > > > then also do a rpi_arm32_defconfig too.
> > > > > > > >
> > > > > > > > I want to see less device trees in U-Boot sources, if they =
can
> > come
> > > > > > > > functionally correct from the hardware/our caller.
> > > > > > > >
> > > > > > > > And I'm not seeing how we make use of "U-Boot /config" if we
> > also
> > > > don't
> > > > > > > > use the device tree from build time at run time, ignoring t=
he
> > > > device
> > > > > > > > tree provided to us at run time by the caller.
> > > > > > >
> > > > > > > Firstly I should say that I find building firmware very messy=
 and
> > > > > > > confusing these days. Lots of things to build and it's hard to
> > find
> > > > > > > the instructions. It doesn't have to be that way, but if we
> > carry on
> > > > > > > as we are, it will continue to be messy and in five years you
> > will
> > > > > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > > > > objective here is to simplify things, bringing some consisten=
cy
> > to
> > > > the
> > > > > > > different components. Binman was one effort there. I feel that
> > > > putting
> > > > > > > at least the U-Boot house in order, in my role as devicetree
> > > > > > > maintainer (and as author of devicetree support in U-Boot bac=
k in
> > > > > > > 2011), is the next step.
> > > > > >
> > > > > > Yes, it's Not Great.  I don't like my handful of build-BOARD.sh
> > scripts
> > > > > > that know where to grab other known-good binaries of varying
> > licenses
> > > > > > that are needed to assemble something that boots.
> > > > > >
> > > > > > > If we set things up correctly and agree on the bindings,
> > devicetree
> > > > > > > can be the unifying configuration mechanism through the whole=
 of
> > > > > > > firmware (except for very early bits) and into the OS, this w=
ill
> > set
> > > > > > > us up very well to deal with the complexity that is coming.
> > > > > > >
> > > > > > > Anyway, here are the mental steps that I've gone through over=
 the
> > > > past
> > > > > > > two months:
> > > > > > >
> > > > > > > Step 1: At present, some people think U-Boot is not even allo=
wed
> > to
> > > > > > > have its own nodes/properties in the DT.
> > > > >
> > > > > In my view U-Boot shall be able to leverage device tree format
> > (source
> > > > and
> > > > > binary) to store its own data.
> > > > > When you say "the" DT, I always think this is "the" DT that is
> > passed to
> > > > OS
> > > > > and in "that" DT, there should be no U-Boot entries.
> > > >
> > > > Why not?  As long as the device tree validates, it is perfectly fine
> > > > to have additional nodes and properties present.  The propertiesand
> > > > nodes will be simply ignored by the OS.
> > >
> > > Because of the way we want to organize the firmware supply chain: when
> > the
> > > board is built, it is "attached" a device tree.
> > > At that moment, we don't know what "non trusted firmware" will be use=
d.
> > It
> > > could be U-Boot or LinuxBoot (https://www.linuxboot.org) or even EDK2
> > (yes
> > > it works with DT).
> > > And we aim at keeping device tree as close to the original intent:
> > hardware
> > > description only. It's not because we can stuff anything in the DT and
> > that
> > > it is simple to do that we should.
> > > Driver parameters shall be in the OS facility built for that purpose.
> > Using
> > > device tree has been an ugly habit.
> >
> > So we're going to continue to re-litigate what does and doesn't live in
> > the device tree for forever, aren't we?  To continue to be clear, I'm
> > not saying that non-upstream bindings should be present.  But for
> > example, Simon is working on the "U-Boot config node" binding, which is
> > going to get re-spun next as /options/ as I read the thread right.
> > Populate it and anyone can read it, and probably be getting information
> > that's useful to U-Boot or LinuxBoot or EDK2 or anyone else.  That's why
> > I keep repeating that projects need to push bindings upstream.  I'll
> > repeat my comment about
> >
> > https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/ind=
ex.html
> > and the binman node both noting a common problem to solve.
>=20
> i think you are right. Now tfa is comfortable being its own upstream for
> the binding specifications. Could U-Boot community be comfortable doing s=
o?

Well, since we need to and are trying to solve the same problem, why
should we duplicate efforts?  This is something that should be common
and upstream is my point.

--=20
Tom

--csoOxBvjhnnTVlaS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF6tosACgkQFHw5/5Y0
tyxDlAv/YIf9h5+7BnDKOCZ+/o1+CleURtwrvH+7UKQB+QgY8QOz6MC9kJjmm1Cl
PJ05o350Wjawl4BwLYaPmZfvToOxoT+hRm3JIvBMYa1aJz3gKi9AYS8LFQy78OfO
sV+bWOv5O3LQ+F8rYFsSAvy6tKgddDKlP+qDYOYRBQ0pzmFiqTB4f/1QuH79Xv/W
a4jkLacw9CYMqZ/Z36DUOE7oaNRrWVTJCLOsE23+3Uh1xc9h98prg74pe76b0ext
uJnoxjgUjovsFvIrmi6do9CiXc3infCv213Pcax0/1P3t9cgg2XecTBxf1K6EH53
jQk2K8ISL1KxOVzQaO2h3wgDQwhrIhXOme5vCQXSPaDlGsneCHRMVnPZ6Zt2ixkK
BRiG2Qx/2uqT+wWCOODK2XJsb9MPmOzB5QgKQiIFGNTInVLa5LYCLsdCHS8gU8jR
WoYRtN5KAiarU1s53+Chm1spKk9Ftx7s55DEaypxy485ZVyitbtfZfkUeRwIbz4g
2vCyl+o0
=wRLU
-----END PGP SIGNATURE-----

--csoOxBvjhnnTVlaS--

