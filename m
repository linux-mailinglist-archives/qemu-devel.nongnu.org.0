Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778E943D06A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:15:19 +0200 (CEST)
Received: from localhost ([::1]:43172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnSI-00006y-Ip
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfnK9-0002Rq-QX
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:06:53 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:45868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfnK6-0003nD-Hd
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:06:53 -0400
Received: by mail-qt1-x829.google.com with SMTP id r2so2031077qtw.12
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1EA6iR9hIWQvNzm42zfv6JeCIRK0YIC1gRCpcjm1NXs=;
 b=b8xm+1vHNKJpxntTFvcLnVbA0lyXfUiBT8aFv+CSsh/N4r34/V1FfWZ9A3GrGojCHq
 4eKWj1a080QRV5Grkth87tnzAIswi8ShRPmJqqpqyT3vs/w3PCYl0JI9t95lXB/l7G0c
 teZxQoKQYtBvDlnoH37uSThiS1D2SgRdEOvFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1EA6iR9hIWQvNzm42zfv6JeCIRK0YIC1gRCpcjm1NXs=;
 b=g/d9AOSYqdjGhXoMLBjt3xcuvr+hlALF+CE25jscMJLIFKSb0SezEDFeUQwc/0Uzqi
 oe7HwT8bYDh1yDej2tF6HgAaL+UsyzIza3KuV+MQrpGrplvqUN8pntrRDE2P0JfMksmi
 XSG494g7Bjik6SvUl+445pMTtEk9BULTUHZzHDUQ1MzIyDCwuFgYobNX4OlCxnBCISx9
 Vnmgf8t7PDeZutD/9fInJjwAbu9MAzWu+uBgCadOQfh1tT7I6Q6Dn0ua2WDZuUDeydfn
 IuN5cBulRHAav5pE99Qonp8m3C0vbXUeVG/9YgZHrHTBWS1vLDQAclUSZVYNfXJHr2De
 SUiA==
X-Gm-Message-State: AOAM532fJ6lqXq7u/1AGv9xKmwK2z9VYXhReE+VPaoEFZEmXQ40EoDLW
 jWKtHX8QF0szcY8NwGH8MCGY3g==
X-Google-Smtp-Source: ABdhPJxTviFCvMe9ZqExgYS8dYOIdyb4dwi0wOMrOj7QAPSTpg7jy+IDp0EpvxvqDuLKrdAAuMn3AQ==
X-Received: by 2002:ac8:5916:: with SMTP id 22mr33446893qty.158.1635358009238; 
 Wed, 27 Oct 2021 11:06:49 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id f16sm458911qko.34.2021.10.27.11.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:06:48 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:06:44 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027180644.GE8284@bill-the-cat>
References: <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <20211027124840.GR8284@bill-the-cat>
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 <d3ca937f451a8cf3@bloch.sibelius.xs4all.nl>
 <CAPnjgZ1qJ-s7CrP-azLHhKKnGzeF5zWPfaanhToiUNx1VEacMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+Xnt6BZa+I2KmHWw"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1qJ-s7CrP-azLHhKKnGzeF5zWPfaanhToiUNx1VEacMA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=trini@konsulko.com; helo=mail-qt1-x829.google.com
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
Cc: liviu.dudau@foss.arm.com, narmstrong@baylibre.com, vladimir.oltean@nxp.com,
 linus.walleij@linaro.org, Bin Meng <bin.meng@windriver.com>,
 kever.yang@rock-chips.com, seanga2@gmail.com,
 Atish Patra <atish.patra@wdc.com>, zong.li@sifive.com, sr@denx.de,
 Fabio Estevam <festevam@gmail.com>, rainer.boschung@hitachi-powergrids.com,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 swarren@nvidia.com, oleksandr_andrushchenko@epam.com,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, lusus@denx.de,
 michal.simek@xilinx.com, marek.behun@nic.cz, vanbaren@cideas.com,
 rfried.dev@gmail.com, Jagan Teki <jagan@amarulasolutions.com>,
 valentin.longchamp@hitachi-powergrids.com, Heiko Schocher <hs@denx.de>,
 pbrobinson@gmail.com, sinan@writeme.com, fitzsim@fitzsim.org, wd@denx.de,
 swarren@wwwdotorg.org, qemu-devel@nongnu.org,
 Andre Przywara <andre.przywara@arm.com>, tharvey@gateworks.com,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, rick@andestech.com,
 Alex Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 t.karthik.reddy@xilinx.com,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert ARIBAUD <albert.u.boot@aribaud.net>, monstr@monstr.eu,
 mbrugger@suse.com, ycliang@andestech.com, kristo@kernel.org,
 u-boot@lists.denx.de, David Abdurachmanov <david.abdurachmanov@sifive.com>,
 priyanka.jain@nxp.com, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>, tuomas.tynkkynen@iki.fi,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 tianrui-wei@outlook.com, Bin Meng <bmeng.cn@gmail.com>, pali@kernel.org,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 padmarao.begari@microchip.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+Xnt6BZa+I2KmHWw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 09:24:25AM -0600, Simon Glass wrote:
> Hi Mark,
>=20
> On Wed, 27 Oct 2021 at 09:11, Mark Kettenis <mark.kettenis@xs4all.nl> wro=
te:
> >
> > > From: Fran=C3=A7ois Ozog <francois.ozog@linaro.org>
> > > Date: Wed, 27 Oct 2021 15:15:01 +0200
> > >
> > > Hi,
> > >
> > > On Wed, 27 Oct 2021 at 14:48, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > > On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass wrote:
> > > > > Hi all,
> > > > >
> > > > > On Thu, 14 Oct 2021 at 09:28, Tom Rini <trini@konsulko.com> wrote:
> > > > > >
> > > > > > On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> > > > > > > Hi Tom,
> > > > > > >
> > > > > > > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> w=
rote:
> > > > > > > >
> > > > > > > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > > > > > > > > Hi Fran=C3=A7ois,
> > > > > > > > >
> > > > > > > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <
> > > > francois.ozog@linaro.org> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi Simon
> > > > > > > > > >
> > > > > > > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chr=
omium.org>
> > > > a =C3=A9crit :
> > > > > > > > > >>
> > > > > > > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > > > > > > >>
> > > > > > > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko=
=2Ecom>
> > > > wrote:
> > > > > > > > > >> >
> > > > > > > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng w=
rote:
> > > > > > > > > >> > > Hi Simon,
> > > > > > > > > >> > >
> > > > > > > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <
> > > > sjg@chromium.org> wrote:
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STA=
GE and
> > > > OF_HOSTFILE so
> > > > > > > > > >> > > > there are only three ways to obtain a devicetree:
> > > > > > > > > >> > > >
> > > > > > > > > >> > > >    - OF_SEPARATE - the normal way, where the dev=
icetree
> > > > is built and
> > > > > > > > > >> > > >       appended to U-Boot
> > > > > > > > > >> > > >    - OF_EMBED - for development purposes, the
> > > > devicetree is embedded in
> > > > > > > > > >> > > >       the ELF file (also used for EFI)
> > > > > > > > > >> > > >    - OF_BOARD - the board figures it out on its =
own
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > The last one is currently set up so that no devi=
cetree
> > > > is needed at all
> > > > > > > > > >> > > > in the U-Boot tree. Most boards do provide one, =
but
> > > > some don't. Some
> > > > > > > > > >> > > > don't even provide instructions on how to boot o=
n the
> > > > board.
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > The problems with this approach are documented a=
t [1].
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > In practice, OF_BOARD is not really distinct from
> > > > OF_SEPARATE. Any board
> > > > > > > > > >> > > > can obtain its devicetree at runtime, even it is=
 has a
> > > > devicetree built
> > > > > > > > > >> > > > in U-Boot. This is because U-Boot may be a secon=
d-stage
> > > > bootloader and its
> > > > > > > > > >> > > > caller may have a better idea about the hardware
> > > > available in the machine.
> > > > > > > > > >> > > > This is the case with a few QEMU boards, for exa=
mple.
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > So it makes no sense to have OF_BOARD as a 'choi=
ce'. It
> > > > should be an
> > > > > > > > > >> > > > option, available with either OF_SEPARATE or OF_=
EMBED.
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > This series makes this change, adding various mi=
ssing
> > > > devicetree files
> > > > > > > > > >> > > > (and placeholders) to make the build work.
> > > > > > > > > >> > >
> > > > > > > > > >> > > Adding device trees that are never used sounds lik=
e a
> > > > hack to me.
> > > > > > > > > >> > >
> > > > > > > > > >> > > For QEMU, device tree is dynamically generated on =
the fly
> > > > based on
> > > > > > > > > >> > > command line parameters, and the device tree you p=
ut in
> > > > this series
> > > > > > > > > >> > > has various hardcoded <phandle> values which norma=
lly do
> > > > not show up
> > > > > > > > > >> > > in hand-written dts files.
> > > > > > > > > >> > >
> > > > > > > > > >> > > I am not sure I understand the whole point of this.
> > > > > > > > > >> >
> > > > > > > > > >> > I am also confused and do not like the idea of adding
> > > > device trees for
> > > > > > > > > >> > platforms that are capable of and can / do have a de=
vice
> > > > tree to give us
> > > > > > > > > >> > at run time.
> > > > > > > > > >>
> > > > > > > > > >> (I'll just reply to this one email, since the same poi=
nts
> > > > applies to
> > > > > > > > > >> all replies I think)
> > > > > > > > > >>
> > > > > > > > > >> I have been thinking about this and discussing it with=
 people
> > > > for a
> > > > > > > > > >> few months now. I've been signalling a change like thi=
s for
> > > > over a
> > > > > > > > > >> month now, on U-Boot contributor calls and in discussi=
ons
> > > > with Linaro
> > > > > > > > > >> people. I sent a patch (below) to try to explain thing=
s. I
> > > > hope it is
> > > > > > > > > >> not a surprise!
> > > > > > > > > >>
> > > > > > > > > >> The issue here is that we need a devicetree in-tree in
> > > > U-Boot, to
> > > > > > > > > >> avoid the mess that has been created by OF_PRIOR_STAGE,
> > > > OF_BOARD,
> > > > > > > > > >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTF=
ILE.
> > > > Between
> > > > > > > > > >> Ilias' series and this one we can get ourselves on a s=
tronger
> > > > footing.
> > > > > > > > > >> There is just OF_SEPARATE, with OF_EMBED for debugging=
/ELF
> > > > use.
> > > > > > > > > >> For more context:
> > > > > > > > > >>
> > > > > > > > > >>
> > > > http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830=
278-3-sjg@chromium.org/
> > > > > > > > > >>
> > > > > > > > > >> BTW I did suggest to QEMU ARM that they support a way =
of
> > > > adding the
> > > > > > > > > >> u-boot.dtsi but there was not much interest there (in =
fact the
> > > > > > > > > >> maintainer would prefer there was no special support e=
ven for
> > > > booting
> > > > > > > > > >> Linux directly!)
> > > > > > > > > >
> > > > > > > > > > i understand their point of view and agree with it.
> > > > > > > > > >>
> > > > > > > > > >> But in any case it doesn't really help U-Boot. I
> > > > > > > > > >> think the path forward might be to run QEMU twice, onc=
e to
> > > > get its
> > > > > > > > > >> generated tree and once to give the 'merged' tree with=
 the
> > > > U-Boot
> > > > > > > > > >> properties in it, if people want to use U-Boot feature=
s.
> > > > > > > > > >>
> > > > > > > > > >> I do strongly believe that OF_BOARD must be a run-time
> > > > option, not a
> > > > > > > > > >> build-time one. It creates all sorts of problems and
> > > > obscurity which
> > > > > > > > > >> have taken months to unpick. See the above patch for t=
he
> > > > rationale.
> > > > > > > > > >>
> > > > > > > > > >> To add to that rationale, OF_BOARD needs to be an opti=
on
> > > > available to
> > > > > > > > > >> any board. At some point in the future it may become a=
 common
> > > > way
> > > > > > > > > >> things are done, e.g. TF-A calling U-Boot and providin=
g a
> > > > devicetree
> > > > > > > > > >> to it. It doesn't make any sense to have people decide
> > > > whether or not
> > > > > > > > > >> to set OF_BOARD at build time, thus affecting how the =
image
> > > > is put
> > > > > > > > > >> together. We'll end up with different U-Boot build tar=
gets
> > > > like
> > > > > > > > > >> capricorn, capricorn_of_board and the like. It should =
be
> > > > obvious where
> > > > > > > > > >> that will lead. Instead, OF_BOARD needs to become a co=
mmonly
> > > > used
> > > > > > > > > >> option, perhaps enabled by most/all boards, so that th=
is sort
> > > > of build
> > > > > > > > > >> explosion is not needed.
> > > > > > > > > >
> > > > > > > > > > If you mean that when boards are by construction provid=
ing a
> > > > DTB to U-Boot then I agree very much. But I don=E2=80=99t understan=
d how the patch
> > > > set  supports it as it puts dts files for those boards to be built.
> > > > > > > > > >>
> > > > > > > > > >> U-Boot needs to be flexible enough to
> > > > > > > > > >> function correctly in whatever runtime environment in =
which
> > > > it finds
> > > > > > > > > >> itself.
> > > > > > > > > >>
> > > > > > > > > >> Also as binman is pressed into service more and more t=
o build
> > > > the
> > > > > > > > > >> complex firmware images that are becoming fashionable,=
 it
> > > > needs a
> > > > > > > > > >> definition (in the devicetree) that describes how to c=
reate
> > > > the image.
> > > > > > > > > >> We can't support that unless we are building a devicet=
ree,
> > > > nor can the
> > > > > > > > > >> running program access the image layout without that
> > > > information.
> > > > > > > > > >>
> > > > > > > > > >> Fran=C3=A7ois's point about 'don't use this with any k=
ernel' is
> > > > > > > > > >> germane...but of course I am not suggesting doing that=
, since
> > > > OF_BOARD
> > > > > > > > > >> is, still, enabled. We already use OF_BOARD for various
> > > > boards that
> > > > > > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and =
3, for
> > > > example
> > > > > > > > > >> (as I said in the cover letter "Most boards do provide=
 one,
> > > > but some
> > > > > > > > > >> don't."). So this series is just completing the pictur=
e by
> > > > enforcing
> > > > > > > > > >> that *some sort* of devicetree is always present.
> > > > > > > > > >
> > > > > > > > > > That seems inconsistent with the OF_BOARD becomes the d=
efault.
> > > > > > > > >
> > > > > > > > > I think the key point that will get you closer to where I=
 am on
> > > > this
> > > > > > > > > issue, is that OF_BOARD needs to be a run-time option. At
> > > > present it
> > > > > > > > > has build-time effects and this is quite wrong. If you go
> > > > through all
> > > > > > > > > the material I have written on this I think I have motiva=
ted
> > > > that very
> > > > > > > > > clearly.
> > > > > > > > >
> > > > > > > > > Another big issue is that I believe we need ONE devicetre=
e for
> > > > U-Boot,
> > > > > > > > > not two that get merged by U-Boot. Again I have gone thro=
ugh
> > > > that in a
> > > > > > > > > lot of detail.
> > > > > > > >
> > > > > > > > I have a long long reply to your first reply here saved, bu=
t, maybe
> > > > > > > > here's the biggest sticking point.  To be clear, you agree =
that
> > > > U-Boot
> > > > > > > > needs to support being passed a device tree to use, at run =
time,
> > > > yes?
> > > > > > >
> > > > > > > Yes. The OF_BOARD feature provides this.
> > > > > > >
> > > > > > > >
> > > > > > > > And in that case, would not be using the "fake" tree we bui=
lt in?
> > > > > > >
> > > > > > > Not at runtime.
> > > > > >
> > > > > > OK.
> > > > > >
> > > > > > > > So is the sticking point here that we really have two class=
es of
> > > > > > > > devices, one class where we will never ever be given the de=
vice
> > > > tree at
> > > > > > > > run time (think BeagleBone Black) and one where we will alw=
ays be
> > > > given
> > > > > > > > one at run time (think Raspberry Pi) ?
> > > > > > >
> > > > > > > I'm not sure it will be that black and white. I suspect there=
 will be
> > > > > > > (many) boards which can boot happily with the U-Boot devicetr=
ee but
> > > > > > > can also accept one at runtime, if provided. For example, you=
 may
> > > > want
> > > > > > > to boot with or without TF-A or some other, earlier stage.
> > > > > >
> > > > > > I'm not sure I see the value in making this a gray area.  There=
's very
> > > > > > much a class of "never" boards.  There's also the class of "can=
" today.
> > > > > > Maybe as part of a developer iterative flow it would be nice to=
 not
> > > > have
> > > > > > to re-flash the prior stage to change a DT, and just do it in U=
-Boot
> > > > > > until things are happy, but I'm not sure what the use case is f=
or
> > > > > > overriding the previous stage.
> > > > > >
> > > > > > Especially since the pushback on this series I think has all be=
en "why
> > > > > > are we copying in a tree to build with?  We don't want to use i=
t at run
> > > > > > time!".  And then softer push back like "Well, U-Boot says we h=
ave to
> > > > > > include the device tree file here, but we won't use it...".
> > > > >
> > > > > See below.
> > > > >
> > > > > >
> > > > > > > I believe we have got unstuck because OF_BOARD (perhaps
> > > > inadvertently)
> > > > > > > provided a way to entirely omit a devicetree from U-Boot, thu=
s making
> > > > > > > things like binman and U-Boot /config impossible, for example=
=2E So I
> > > > > > > want to claw that back, so there is always some sort of devic=
etree in
> > > > > > > U-Boot, as we have for rpi_3, etc.
> > > > > >
> > > > > > I really want to see what the binary case looks like since we c=
ould
> > > > then
> > > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we =
could
> > > > > > then also do a rpi_arm32_defconfig too.
> > > > > >
> > > > > > I want to see less device trees in U-Boot sources, if they can =
come
> > > > > > functionally correct from the hardware/our caller.
> > > > > >
> > > > > > And I'm not seeing how we make use of "U-Boot /config" if we al=
so don't
> > > > > > use the device tree from build time at run time, ignoring the d=
evice
> > > > > > tree provided to us at run time by the caller.
> > > > >
> > > > > Firstly I should say that I find building firmware very messy and
> > > > > confusing these days. Lots of things to build and it's hard to fi=
nd
> > > > > the instructions. It doesn't have to be that way, but if we carry=
 on
> > > > > as we are, it will continue to be messy and in five years you will
> > > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > > objective here is to simplify things, bringing some consistency t=
o the
> > > > > different components. Binman was one effort there. I feel that pu=
tting
> > > > > at least the U-Boot house in order, in my role as devicetree
> > > > > maintainer (and as author of devicetree support in U-Boot back in
> > > > > 2011), is the next step.
> > > >
> > > > Yes, it's Not Great.  I don't like my handful of build-BOARD.sh scr=
ipts
> > > > that know where to grab other known-good binaries of varying licens=
es
> > > > that are needed to assemble something that boots.
> > > >
> > > > > If we set things up correctly and agree on the bindings, devicetr=
ee
> > > > > can be the unifying configuration mechanism through the whole of
> > > > > firmware (except for very early bits) and into the OS, this will =
set
> > > > > us up very well to deal with the complexity that is coming.
> > > > >
> > > > > Anyway, here are the mental steps that I've gone through over the=
 past
> > > > > two months:
> > > > >
> > > > > Step 1: At present, some people think U-Boot is not even allowed =
to
> > > > > have its own nodes/properties in the DT.
> > >
> > > In my view U-Boot shall be able to leverage device tree format (sourc=
e and
> > > binary) to store its own data.
> > > When you say "the" DT, I always think this is "the" DT that is passed=
 to OS
> > > and in "that" DT, there should be no U-Boot entries.
> >
> > Why not?  As long as the device tree validates, it is perfectly fine
> > to have additional nodes and properties present.  The propertiesand
> > nodes will be simply ignored by the OS.
> >
> > OpenBSD will print:
> >
> >   "binman" not configured
> >
> > for the binman node that some of the U-Boot board targets now have,
> > but it doesn't really make a difference.  If there is a proper binding
> > for that node, I could simply filter it out.  Or we have U-Boot filter
> > it out before the DT gets passed along like Tom suggests.
>=20
> Just on that point, I believe the binman falls into the same bucket
> that Tom is talking about here, in that it should be a standard
> binding. Ideally I would like this to become a standard format so that
> anything in firmware can use it to find stuff. I believe it is a good
> and extensible way to describe the structure of firmware across all
> projects.

And at the risk of getting lost on specific details, if we look at:
https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index.h=
tml
it says "In the future, it may be provided as part of a device blob,
along with the rest of the information about images to load." which is
one of the things the binman node solves, so we should probably solve
this problem once, for everyone rather than per-project.

--=20
Tom

--+Xnt6BZa+I2KmHWw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5lTQACgkQFHw5/5Y0
tyxjcQwAinSUiJpIdZHYeV2ZCYaoBBAENf4k5pElHVS6G3EmEYHFgq9EWTS9YwCL
DwjKuWhcTkNkzOOVCJXFMcMu1zZeDreQkGgvCVr5tnPKCRFva6QwL2JwaQ27JXmF
6UiP5XW3MuS6ETTuv3eaQ60sD4f9kPZXdPsKClDNWR9ix5ajql0vADOHgubDxWZ2
iNrFwVLrGUnMYerSslwYhWfy/7DKNK+gYPBCeEH121rmm2zhWRLxH+Ava+BoKPay
SQmnHbqhicTyKy25mEtq6opmMN/EzDrAAZgjxKo/EreR8ujfPBw2Cmif6B9Wxg9F
Vmqq+gfMQs5uEWkga1Fq+hMkWB5UcIM3CbNLh3mVF0TM1tlmUvSt0N7sTr3P9yKv
ziCuEgG3B7gUmx2SlsdRkCefzJeUsc0UO5iN2ZjQqdGuw2A1sr+GmATn/BNnqlyz
sQbJ+Lccz5rso8gwU/FcBK9fgHx2QzsU3phYcOz65C73qmTiTlJO3v+UwM8m3pe+
Rb5+YivK
=foAK
-----END PGP SIGNATURE-----

--+Xnt6BZa+I2KmHWw--

