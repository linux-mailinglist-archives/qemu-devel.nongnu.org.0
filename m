Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9382D43D1C8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:39:24 +0200 (CEST)
Received: from localhost ([::1]:50752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfolf-0001vM-EU
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfoGJ-00025r-RN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:06:59 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:41581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfoGF-0000Gq-Bk
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:06:59 -0400
Received: by mail-qv1-xf32.google.com with SMTP id gh1so2456649qvb.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 12:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bcjhYMXtm3653gk6HCLR6enHUWXJhg5ZCtKW4FV2yi8=;
 b=ZP70Jwj93RrebJDl81j1iFWXS9K6/JJqjXdgYIBD92T3bAzy30i627EgIExp1DKbl2
 8Togy1ehU6t3p/jPd4FizKKI313bfBO6WJe5ng1znLd3b1CN1C/kk6PjRWgznoAldh2v
 U9SKsD+Hfbq/oyLQCDeWNrTM8I4xyYow35Ixo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bcjhYMXtm3653gk6HCLR6enHUWXJhg5ZCtKW4FV2yi8=;
 b=R/trhRgg0OTX+IyYSdTUAHR/H1U1TO7bFF8LkqFE6DvjIvhRpaJ1rdibHqlCiYIial
 4kFeTBipC8aooarYvWQvRM0PoUXF0GyGyBBhjWkXEpToNM9G/Pp6nD4wIl9kV88VsC8X
 TbWLZkVBs+JkDx6v899MelJaZRnClDW9PFQQ9Y2KwRIwLTMyiDEe3Z9R5RiGI9/x1LmY
 n52uhuULDcb/WKG484E75S3UbikCSkaehEfMuvhLH6FD7/e0NgqaOhJSxIwA/o8bXjEv
 /UhgW1g8/oJUlvLOGXIHeF15dPohqmJMy0KeFfwAs78Xa4DzLprs3wHxfsnsF1E+X/Ps
 HUtg==
X-Gm-Message-State: AOAM5326BRWxJ4aw5kgmm3Tp3Itdg3YM+NhwKMjC5aT7+CMeNw/Pga+k
 Njwa7rN0C+ZT0b9FguNEBNnXgg==
X-Google-Smtp-Source: ABdhPJwl8HKXMxE8U/Bh1j0pP4wRje1J3yfs30qvwqKy0zvr4zwDyWd+0xf848NYN5ARHQVibH9vpg==
X-Received: by 2002:a05:6214:cce:: with SMTP id
 14mr31886306qvx.49.1635361614176; 
 Wed, 27 Oct 2021 12:06:54 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id c8sm520025qtb.29.2021.10.27.12.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 12:06:53 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:06:49 -0400
From: Tom Rini <trini@konsulko.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027190649.GI8284@bill-the-cat>
References: <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <20211027124840.GR8284@bill-the-cat>
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 <d3ca937f451a8cf3@bloch.sibelius.xs4all.nl>
 <CAHFG_=VYC9qaRHy=cogeXEpa8EXUqvfiXt50nfsVP3f7hzqXXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QuX0r7ZseMwydPce"
Content-Disposition: inline
In-Reply-To: <CAHFG_=VYC9qaRHy=cogeXEpa8EXUqvfiXt50nfsVP3f7hzqXXA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf32.google.com
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
 linus.walleij@linaro.org, bin.meng@windriver.com, kever.yang@rock-chips.com,
 seanga2@gmail.com, atish.patra@wdc.com, zong.li@sifive.com, sr@denx.de,
 festevam@gmail.com, rainer.boschung@hitachi-powergrids.com,
 Mark Kettenis <mark.kettenis@xs4all.nl>, swarren@nvidia.com,
 oleksandr_andrushchenko@epam.com, xypron.glpk@gmx.de, lusus@denx.de,
 michal.simek@xilinx.com, marek.behun@nic.cz, vanbaren@cideas.com,
 rfried.dev@gmail.com, jagan@amarulasolutions.com,
 valentin.longchamp@hitachi-powergrids.com, hs@denx.de, pbrobinson@gmail.com,
 sinan@writeme.com, fitzsim@fitzsim.org, wd@denx.de, swarren@wwwdotorg.org,
 qemu-devel@nongnu.org, andre.przywara@arm.com, tharvey@gateworks.com,
 ashok.reddy.soma@xilinx.com, rick@andestech.com, agraf@csgraf.de,
 green.wan@sifive.com, t.karthik.reddy@xilinx.com,
 anastasiia_lukianenko@epam.com, albert.u.boot@aribaud.net, monstr@monstr.eu,
 mbrugger@suse.com, ycliang@andestech.com, kristo@kernel.org,
 u-boot@lists.denx.de, david.abdurachmanov@sifive.com, priyanka.jain@nxp.com,
 sjg@chromium.org, ilias.apalodimas@linaro.org, christianshewitt@gmail.com,
 awilliams@marvell.com, tuomas.tynkkynen@iki.fi,
 heinrich.schuchardt@canonical.com, tianrui-wei@outlook.com, bmeng.cn@gmail.com,
 pali@kernel.org, dimitri.ledkov@canonical.com, padmarao.begari@microchip.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QuX0r7ZseMwydPce
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 06:02:19PM +0200, Fran=C3=A7ois Ozog wrote:
> Hi Mark,
>=20
> On Wed, 27 Oct 2021 at 17:10, Mark Kettenis <mark.kettenis@xs4all.nl> wro=
te:
>=20
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
> > > > > > > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com>
> > wrote:
> > > > > > > >
> > > > > > > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > > > > > > > > Hi Fran=C3=A7ois,
> > > > > > > > >
> > > > > > > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <
> > > > francois.ozog@linaro.org> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi Simon
> > > > > > > > > >
> > > > > > > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <
> > sjg@chromium.org>
> > > > a =C3=A9crit :
> > > > > > > > > >>
> > > > > > > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > > > > > > >>
> > > > > > > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <
> > trini@konsulko.com>
> > > > wrote:
> > > > > > > > > >> >
> > > > > > > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng
> > wrote:
> > > > > > > > > >> > > Hi Simon,
> > > > > > > > > >> > >
> > > > > > > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <
> > > > sjg@chromium.org> wrote:
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STA=
GE
> > and
> > > > OF_HOSTFILE so
> > > > > > > > > >> > > > there are only three ways to obtain a devicetree:
> > > > > > > > > >> > > >
> > > > > > > > > >> > > >    - OF_SEPARATE - the normal way, where the
> > devicetree
> > > > is built and
> > > > > > > > > >> > > >       appended to U-Boot
> > > > > > > > > >> > > >    - OF_EMBED - for development purposes, the
> > > > devicetree is embedded in
> > > > > > > > > >> > > >       the ELF file (also used for EFI)
> > > > > > > > > >> > > >    - OF_BOARD - the board figures it out on its =
own
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > The last one is currently set up so that no
> > devicetree
> > > > is needed at all
> > > > > > > > > >> > > > in the U-Boot tree. Most boards do provide one, =
but
> > > > some don't. Some
> > > > > > > > > >> > > > don't even provide instructions on how to boot on
> > the
> > > > board.
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > The problems with this approach are documented at
> > [1].
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > In practice, OF_BOARD is not really distinct from
> > > > OF_SEPARATE. Any board
> > > > > > > > > >> > > > can obtain its devicetree at runtime, even it is
> > has a
> > > > devicetree built
> > > > > > > > > >> > > > in U-Boot. This is because U-Boot may be a
> > second-stage
> > > > bootloader and its
> > > > > > > > > >> > > > caller may have a better idea about the hardware
> > > > available in the machine.
> > > > > > > > > >> > > > This is the case with a few QEMU boards, for
> > example.
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > So it makes no sense to have OF_BOARD as a
> > 'choice'. It
> > > > should be an
> > > > > > > > > >> > > > option, available with either OF_SEPARATE or
> > OF_EMBED.
> > > > > > > > > >> > > >
> > > > > > > > > >> > > > This series makes this change, adding various
> > missing
> > > > devicetree files
> > > > > > > > > >> > > > (and placeholders) to make the build work.
> > > > > > > > > >> > >
> > > > > > > > > >> > > Adding device trees that are never used sounds lik=
e a
> > > > hack to me.
> > > > > > > > > >> > >
> > > > > > > > > >> > > For QEMU, device tree is dynamically generated on =
the
> > fly
> > > > based on
> > > > > > > > > >> > > command line parameters, and the device tree you p=
ut
> > in
> > > > this series
> > > > > > > > > >> > > has various hardcoded <phandle> values which norma=
lly
> > do
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
> > > > > > > > > >> I have been thinking about this and discussing it with
> > people
> > > > for a
> > > > > > > > > >> few months now. I've been signalling a change like this
> > for
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
> > > > > > > > > >> Ilias' series and this one we can get ourselves on a
> > stronger
> > > > footing.
> > > > > > > > > >> There is just OF_SEPARATE, with OF_EMBED for debugging=
/ELF
> > > > use.
> > > > > > > > > >> For more context:
> > > > > > > > > >>
> > > > > > > > > >>
> > > >
> > http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-=
3-sjg@chromium.org/
> > > > > > > > > >>
> > > > > > > > > >> BTW I did suggest to QEMU ARM that they support a way =
of
> > > > adding the
> > > > > > > > > >> u-boot.dtsi but there was not much interest there (in
> > fact the
> > > > > > > > > >> maintainer would prefer there was no special support e=
ven
> > for
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
> > > > > > > > > >> any board. At some point in the future it may become a
> > common
> > > > way
> > > > > > > > > >> things are done, e.g. TF-A calling U-Boot and providin=
g a
> > > > devicetree
> > > > > > > > > >> to it. It doesn't make any sense to have people decide
> > > > whether or not
> > > > > > > > > >> to set OF_BOARD at build time, thus affecting how the
> > image
> > > > is put
> > > > > > > > > >> together. We'll end up with different U-Boot build tar=
gets
> > > > like
> > > > > > > > > >> capricorn, capricorn_of_board and the like. It should =
be
> > > > obvious where
> > > > > > > > > >> that will lead. Instead, OF_BOARD needs to become a
> > commonly
> > > > used
> > > > > > > > > >> option, perhaps enabled by most/all boards, so that th=
is
> > sort
> > > > of build
> > > > > > > > > >> explosion is not needed.
> > > > > > > > > >
> > > > > > > > > > If you mean that when boards are by construction provid=
ing
> > a
> > > > DTB to U-Boot then I agree very much. But I don=E2=80=99t understan=
d how the
> > patch
> > > > set  supports it as it puts dts files for those boards to be built.
> > > > > > > > > >>
> > > > > > > > > >> U-Boot needs to be flexible enough to
> > > > > > > > > >> function correctly in whatever runtime environment in
> > which
> > > > it finds
> > > > > > > > > >> itself.
> > > > > > > > > >>
> > > > > > > > > >> Also as binman is pressed into service more and more to
> > build
> > > > the
> > > > > > > > > >> complex firmware images that are becoming fashionable,=
 it
> > > > needs a
> > > > > > > > > >> definition (in the devicetree) that describes how to
> > create
> > > > the image.
> > > > > > > > > >> We can't support that unless we are building a devicet=
ree,
> > > > nor can the
> > > > > > > > > >> running program access the image layout without that
> > > > information.
> > > > > > > > > >>
> > > > > > > > > >> Fran=C3=A7ois's point about 'don't use this with any k=
ernel' is
> > > > > > > > > >> germane...but of course I am not suggesting doing that,
> > since
> > > > OF_BOARD
> > > > > > > > > >> is, still, enabled. We already use OF_BOARD for various
> > > > boards that
> > > > > > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and =
3,
> > for
> > > > example
> > > > > > > > > >> (as I said in the cover letter "Most boards do provide
> > one,
> > > > but some
> > > > > > > > > >> don't."). So this series is just completing the pictur=
e by
> > > > enforcing
> > > > > > > > > >> that *some sort* of devicetree is always present.
> > > > > > > > > >
> > > > > > > > > > That seems inconsistent with the OF_BOARD becomes the
> > default.
> > > > > > > > >
> > > > > > > > > I think the key point that will get you closer to where I=
 am
> > on
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
> > > > > > > > > Another big issue is that I believe we need ONE devicetree
> > for
> > > > U-Boot,
> > > > > > > > > not two that get merged by U-Boot. Again I have gone thro=
ugh
> > > > that in a
> > > > > > > > > lot of detail.
> > > > > > > >
> > > > > > > > I have a long long reply to your first reply here saved, bu=
t,
> > maybe
> > > > > > > > here's the biggest sticking point.  To be clear, you agree =
that
> > > > U-Boot
> > > > > > > > needs to support being passed a device tree to use, at run
> > time,
> > > > yes?
> > > > > > >
> > > > > > > Yes. The OF_BOARD feature provides this.
> > > > > > >
> > > > > > > >
> > > > > > > > And in that case, would not be using the "fake" tree we bui=
lt
> > in?
> > > > > > >
> > > > > > > Not at runtime.
> > > > > >
> > > > > > OK.
> > > > > >
> > > > > > > > So is the sticking point here that we really have two class=
es
> > of
> > > > > > > > devices, one class where we will never ever be given the de=
vice
> > > > tree at
> > > > > > > > run time (think BeagleBone Black) and one where we will alw=
ays
> > be
> > > > given
> > > > > > > > one at run time (think Raspberry Pi) ?
> > > > > > >
> > > > > > > I'm not sure it will be that black and white. I suspect there
> > will be
> > > > > > > (many) boards which can boot happily with the U-Boot devicetr=
ee
> > but
> > > > > > > can also accept one at runtime, if provided. For example, you=
 may
> > > > want
> > > > > > > to boot with or without TF-A or some other, earlier stage.
> > > > > >
> > > > > > I'm not sure I see the value in making this a gray area.  There=
's
> > very
> > > > > > much a class of "never" boards.  There's also the class of "can"
> > today.
> > > > > > Maybe as part of a developer iterative flow it would be nice to=
 not
> > > > have
> > > > > > to re-flash the prior stage to change a DT, and just do it in
> > U-Boot
> > > > > > until things are happy, but I'm not sure what the use case is f=
or
> > > > > > overriding the previous stage.
> > > > > >
> > > > > > Especially since the pushback on this series I think has all be=
en
> > "why
> > > > > > are we copying in a tree to build with?  We don't want to use it
> > at run
> > > > > > time!".  And then softer push back like "Well, U-Boot says we h=
ave
> > to
> > > > > > include the device tree file here, but we won't use it...".
> > > > >
> > > > > See below.
> > > > >
> > > > > >
> > > > > > > I believe we have got unstuck because OF_BOARD (perhaps
> > > > inadvertently)
> > > > > > > provided a way to entirely omit a devicetree from U-Boot, thus
> > making
> > > > > > > things like binman and U-Boot /config impossible, for example.
> > So I
> > > > > > > want to claw that back, so there is always some sort of
> > devicetree in
> > > > > > > U-Boot, as we have for rpi_3, etc.
> > > > > >
> > > > > > I really want to see what the binary case looks like since we c=
ould
> > > > then
> > > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we
> > could
> > > > > > then also do a rpi_arm32_defconfig too.
> > > > > >
> > > > > > I want to see less device trees in U-Boot sources, if they can =
come
> > > > > > functionally correct from the hardware/our caller.
> > > > > >
> > > > > > And I'm not seeing how we make use of "U-Boot /config" if we al=
so
> > don't
> > > > > > use the device tree from build time at run time, ignoring the
> > device
> > > > > > tree provided to us at run time by the caller.
> > > > >
> > > > > Firstly I should say that I find building firmware very messy and
> > > > > confusing these days. Lots of things to build and it's hard to fi=
nd
> > > > > the instructions. It doesn't have to be that way, but if we carry=
 on
> > > > > as we are, it will continue to be messy and in five years you will
> > > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > > objective here is to simplify things, bringing some consistency to
> > the
> > > > > different components. Binman was one effort there. I feel that
> > putting
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
> > > > > Anyway, here are the mental steps that I've gone through over the
> > past
> > > > > two months:
> > > > >
> > > > > Step 1: At present, some people think U-Boot is not even allowed =
to
> > > > > have its own nodes/properties in the DT.
> > >
> > > In my view U-Boot shall be able to leverage device tree format (source
> > and
> > > binary) to store its own data.
> > > When you say "the" DT, I always think this is "the" DT that is passed=
 to
> > OS
> > > and in "that" DT, there should be no U-Boot entries.
> >
> > Why not?  As long as the device tree validates, it is perfectly fine
> > to have additional nodes and properties present.  The propertiesand
> > nodes will be simply ignored by the OS.
>
> Because of the way we want to organize the firmware supply chain: when the
> board is built, it is "attached" a device tree.
> At that moment, we don't know what "non trusted firmware" will be used. It
> could be U-Boot or LinuxBoot (https://www.linuxboot.org) or even EDK2 (yes
> it works with DT).
> And we aim at keeping device tree as close to the original intent: hardwa=
re
> description only. It's not because we can stuff anything in the DT and th=
at
> it is simple to do that we should.
> Driver parameters shall be in the OS facility built for that purpose. Usi=
ng
> device tree has been an ugly habit.

So we're going to continue to re-litigate what does and doesn't live in
the device tree for forever, aren't we?  To continue to be clear, I'm
not saying that non-upstream bindings should be present.  But for
example, Simon is working on the "U-Boot config node" binding, which is
going to get re-spun next as /options/ as I read the thread right.
Populate it and anyone can read it, and probably be getting information
that's useful to U-Boot or LinuxBoot or EDK2 or anyone else.  That's why
I keep repeating that projects need to push bindings upstream.  I'll
repeat my comment about
https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index.h=
tml
and the binman node both noting a common problem to solve.

In so far as there's objections to "U-Boot" nodes, it seems to me like
it comes down to "shouldn't need U-Boot internals expressed in DT nor
added to the DTB by someone else".  And I've not objected to that
either.  But I think we do have a subset of "how do we express ..."
issues that have come down to "well, we buried the bodies over at ...
before".  And it's time to dig them up and give them a proper burial
perhaps now :)

--=20
Tom

--QuX0r7ZseMwydPce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5oz8ACgkQFHw5/5Y0
tyybzAv+MvmjsFbIULOlJw35B6xmdP6/Jrp3QZOIYUqflkq3iDq/u1G4UpsnlEnT
liZxNSo8MMMjIGmxdOaFn2COtepC4WhFYwSghZUK0aVyrig4UHxTeUHZm1bd4/wo
l4dVk5eVHp419v1nQBkJKqoRZ6cL9USz5dqN3hGmzXHRiyy/G14hl5XesdSaT2f7
8VWkLyNwU82547mZo8VERc0z54r6d2tjQBZ+2IAIyESaGVegBFiPDSgSVk9p7qnl
+8tHepNyloqchC6GGluxNFPLejO6mNNmh5zMG9HdbusylNcjzZ16ey5ekTXTCznu
Jk4ktn321vISzDcUjgI+VUJJXrCBkfe+Pw1SnF/XZbfNe20z+a0CnGeDCsUJ2HQA
qWX2y+CsBlRySfF97JJyIImL2FtH0BSHhOuoDqnhBilrUto1aNO3/h4OhBONuyiv
vCw1pqqUagWBuHemXaJ465MkNlFJ3iXKY/lVZK+e5nPPwyMThKFtdwFZlfJ4aHrR
pwvQRYd6
=IgGo
-----END PGP SIGNATURE-----

--QuX0r7ZseMwydPce--

