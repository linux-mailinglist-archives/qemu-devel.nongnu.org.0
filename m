Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E631143CED0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:36:31 +0200 (CEST)
Received: from localhost ([::1]:50056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfluh-0002ag-1E
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mflO5-0006gf-Jx
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:02:49 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mflO0-0007c0-76
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:02:49 -0400
Received: by mail-ed1-x52f.google.com with SMTP id w12so12406264edd.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOzYY+P8cV2iGMJOkymuqZlBuQAnjPANeWvWwYRUqxU=;
 b=E4mbGQmxkgfDVfpVgWCV3d5DRqNqM4ZuDqpxnJVJw4LyJkpg+QbbPV9Hfp14sWgu5q
 w0iIf85HwR+vh0QVbHhvLXfYIE3kpgu3JKVlbohaYpXAPAo1tnoukYN6RL08yCnpyO2g
 ZF28pmhab224LoikjXny3qvjKs0W3Eba4w47QHv3anZ9AbaKhwRTMHhi2vAhwj0c3xNg
 1YN2fNeQT+RZT2hI5soGA22oqu1kAhAa9vtzwLT3quenMUdQp7ylCnOjUrR/X1Y06ZPU
 cO16MFyvX3d/p+/qZ3PEooyPPcVO9iowaE/6i47cW7VG1WzPETamjfIxlOI2J38ozJ53
 lb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOzYY+P8cV2iGMJOkymuqZlBuQAnjPANeWvWwYRUqxU=;
 b=O1nBS8nyw8n2GaZufaEQAKxs0XbYQ0ZOQOM+Y8OtwYUZOiFpRoCAqsR9Sk/Yh/q/4S
 t6sLUvnhtqli7HMeLE659RKSO2o4NreT06jzO1g5+32o3UEawh3pt8jKP8ybMq8UibFU
 reuuhW0JHF42XRBwRAjjhJHU2jHILvWf73J/+W/H5SJKbdrhnPdVzJS2J0uFU5SvWL45
 USUjDUYOcmpxVwLKpqlYo17xsoEcZK9XgD8XK2jAI9B7X6/A18dbTl6JVmc9Vqm7l28h
 un86rm3VtoRMgQb6VrNe/nc9KRp0GLH+Ce2j9c/lSI+/hT7R7M9YA/lkrTiMjvvfDsI6
 K2Jg==
X-Gm-Message-State: AOAM5322ESIVyrdD4c1xiA5FkwomjGNEVWMTQKa7vhMDQPG0OLcJdBC6
 Qc5CAgggE5VohoktuJQx5XqjARdULWwjBjDqCavEzQ==
X-Google-Smtp-Source: ABdhPJykZy0+Kk6SuYDignWLe1Bx4vDh3mqZCgGXXRbVHWXuf/wg8tNqGLy7s/zfX2rhdfsttY4uGAUUgzRvCpLKkIM=
X-Received: by 2002:a05:6402:b28:: with SMTP id
 bo8mr88979edb.180.1635350550364; 
 Wed, 27 Oct 2021 09:02:30 -0700 (PDT)
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
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 <d3ca937f451a8cf3@bloch.sibelius.xs4all.nl>
In-Reply-To: <d3ca937f451a8cf3@bloch.sibelius.xs4all.nl>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 27 Oct 2021 18:02:19 +0200
Message-ID: <CAHFG_=VYC9qaRHy=cogeXEpa8EXUqvfiXt50nfsVP3f7hzqXXA@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Content-Type: multipart/alternative; boundary="000000000000a35efb05cf57b880"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: liviu.dudau@foss.arm.com, narmstrong@baylibre.com, vladimir.oltean@nxp.com,
 linus.walleij@linaro.org, bin.meng@windriver.com, kever.yang@rock-chips.com,
 seanga2@gmail.com, atish.patra@wdc.com, zong.li@sifive.com, sr@denx.de,
 festevam@gmail.com, rainer.boschung@hitachi-powergrids.com, trini@konsulko.com,
 swarren@nvidia.com, oleksandr_andrushchenko@epam.com, xypron.glpk@gmx.de,
 lusus@denx.de, michal.simek@xilinx.com, marek.behun@nic.cz,
 vanbaren@cideas.com, rfried.dev@gmail.com, jagan@amarulasolutions.com,
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

--000000000000a35efb05cf57b880
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, 27 Oct 2021 at 17:10, Mark Kettenis <mark.kettenis@xs4all.nl> wrote=
:

> > From: Fran=C3=A7ois Ozog <francois.ozog@linaro.org>
> > Date: Wed, 27 Oct 2021 15:15:01 +0200
> >
> > Hi,
> >
> > On Wed, 27 Oct 2021 at 14:48, Tom Rini <trini@konsulko.com> wrote:
> >
> > > On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass wrote:
> > > > Hi all,
> > > >
> > > > On Thu, 14 Oct 2021 at 09:28, Tom Rini <trini@konsulko.com> wrote:
> > > > >
> > > > > On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> > > > > > Hi Tom,
> > > > > >
> > > > > > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com>
> wrote:
> > > > > > >
> > > > > > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > > > > > > > Hi Fran=C3=A7ois,
> > > > > > > >
> > > > > > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <
> > > francois.ozog@linaro.org> wrote:
> > > > > > > > >
> > > > > > > > > Hi Simon
> > > > > > > > >
> > > > > > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <
> sjg@chromium.org>
> > > a =C3=A9crit :
> > > > > > > > >>
> > > > > > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > > > > > >>
> > > > > > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <
> trini@konsulko.com>
> > > wrote:
> > > > > > > > >> >
> > > > > > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng
> wrote:
> > > > > > > > >> > > Hi Simon,
> > > > > > > > >> > >
> > > > > > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <
> > > sjg@chromium.org> wrote:
> > > > > > > > >> > > >
> > > > > > > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE
> and
> > > OF_HOSTFILE so
> > > > > > > > >> > > > there are only three ways to obtain a devicetree:
> > > > > > > > >> > > >
> > > > > > > > >> > > >    - OF_SEPARATE - the normal way, where the
> devicetree
> > > is built and
> > > > > > > > >> > > >       appended to U-Boot
> > > > > > > > >> > > >    - OF_EMBED - for development purposes, the
> > > devicetree is embedded in
> > > > > > > > >> > > >       the ELF file (also used for EFI)
> > > > > > > > >> > > >    - OF_BOARD - the board figures it out on its ow=
n
> > > > > > > > >> > > >
> > > > > > > > >> > > > The last one is currently set up so that no
> devicetree
> > > is needed at all
> > > > > > > > >> > > > in the U-Boot tree. Most boards do provide one, bu=
t
> > > some don't. Some
> > > > > > > > >> > > > don't even provide instructions on how to boot on
> the
> > > board.
> > > > > > > > >> > > >
> > > > > > > > >> > > > The problems with this approach are documented at
> [1].
> > > > > > > > >> > > >
> > > > > > > > >> > > > In practice, OF_BOARD is not really distinct from
> > > OF_SEPARATE. Any board
> > > > > > > > >> > > > can obtain its devicetree at runtime, even it is
> has a
> > > devicetree built
> > > > > > > > >> > > > in U-Boot. This is because U-Boot may be a
> second-stage
> > > bootloader and its
> > > > > > > > >> > > > caller may have a better idea about the hardware
> > > available in the machine.
> > > > > > > > >> > > > This is the case with a few QEMU boards, for
> example.
> > > > > > > > >> > > >
> > > > > > > > >> > > > So it makes no sense to have OF_BOARD as a
> 'choice'. It
> > > should be an
> > > > > > > > >> > > > option, available with either OF_SEPARATE or
> OF_EMBED.
> > > > > > > > >> > > >
> > > > > > > > >> > > > This series makes this change, adding various
> missing
> > > devicetree files
> > > > > > > > >> > > > (and placeholders) to make the build work.
> > > > > > > > >> > >
> > > > > > > > >> > > Adding device trees that are never used sounds like =
a
> > > hack to me.
> > > > > > > > >> > >
> > > > > > > > >> > > For QEMU, device tree is dynamically generated on th=
e
> fly
> > > based on
> > > > > > > > >> > > command line parameters, and the device tree you put
> in
> > > this series
> > > > > > > > >> > > has various hardcoded <phandle> values which normall=
y
> do
> > > not show up
> > > > > > > > >> > > in hand-written dts files.
> > > > > > > > >> > >
> > > > > > > > >> > > I am not sure I understand the whole point of this.
> > > > > > > > >> >
> > > > > > > > >> > I am also confused and do not like the idea of adding
> > > device trees for
> > > > > > > > >> > platforms that are capable of and can / do have a devi=
ce
> > > tree to give us
> > > > > > > > >> > at run time.
> > > > > > > > >>
> > > > > > > > >> (I'll just reply to this one email, since the same point=
s
> > > applies to
> > > > > > > > >> all replies I think)
> > > > > > > > >>
> > > > > > > > >> I have been thinking about this and discussing it with
> people
> > > for a
> > > > > > > > >> few months now. I've been signalling a change like this
> for
> > > over a
> > > > > > > > >> month now, on U-Boot contributor calls and in discussion=
s
> > > with Linaro
> > > > > > > > >> people. I sent a patch (below) to try to explain things.=
 I
> > > hope it is
> > > > > > > > >> not a surprise!
> > > > > > > > >>
> > > > > > > > >> The issue here is that we need a devicetree in-tree in
> > > U-Boot, to
> > > > > > > > >> avoid the mess that has been created by OF_PRIOR_STAGE,
> > > OF_BOARD,
> > > > > > > > >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFIL=
E.
> > > Between
> > > > > > > > >> Ilias' series and this one we can get ourselves on a
> stronger
> > > footing.
> > > > > > > > >> There is just OF_SEPARATE, with OF_EMBED for debugging/E=
LF
> > > use.
> > > > > > > > >> For more context:
> > > > > > > > >>
> > > > > > > > >>
> > >
> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-=
sjg@chromium.org/
> > > > > > > > >>
> > > > > > > > >> BTW I did suggest to QEMU ARM that they support a way of
> > > adding the
> > > > > > > > >> u-boot.dtsi but there was not much interest there (in
> fact the
> > > > > > > > >> maintainer would prefer there was no special support eve=
n
> for
> > > booting
> > > > > > > > >> Linux directly!)
> > > > > > > > >
> > > > > > > > > i understand their point of view and agree with it.
> > > > > > > > >>
> > > > > > > > >> But in any case it doesn't really help U-Boot. I
> > > > > > > > >> think the path forward might be to run QEMU twice, once =
to
> > > get its
> > > > > > > > >> generated tree and once to give the 'merged' tree with t=
he
> > > U-Boot
> > > > > > > > >> properties in it, if people want to use U-Boot features.
> > > > > > > > >>
> > > > > > > > >> I do strongly believe that OF_BOARD must be a run-time
> > > option, not a
> > > > > > > > >> build-time one. It creates all sorts of problems and
> > > obscurity which
> > > > > > > > >> have taken months to unpick. See the above patch for the
> > > rationale.
> > > > > > > > >>
> > > > > > > > >> To add to that rationale, OF_BOARD needs to be an option
> > > available to
> > > > > > > > >> any board. At some point in the future it may become a
> common
> > > way
> > > > > > > > >> things are done, e.g. TF-A calling U-Boot and providing =
a
> > > devicetree
> > > > > > > > >> to it. It doesn't make any sense to have people decide
> > > whether or not
> > > > > > > > >> to set OF_BOARD at build time, thus affecting how the
> image
> > > is put
> > > > > > > > >> together. We'll end up with different U-Boot build targe=
ts
> > > like
> > > > > > > > >> capricorn, capricorn_of_board and the like. It should be
> > > obvious where
> > > > > > > > >> that will lead. Instead, OF_BOARD needs to become a
> commonly
> > > used
> > > > > > > > >> option, perhaps enabled by most/all boards, so that this
> sort
> > > of build
> > > > > > > > >> explosion is not needed.
> > > > > > > > >
> > > > > > > > > If you mean that when boards are by construction providin=
g
> a
> > > DTB to U-Boot then I agree very much. But I don=E2=80=99t understand =
how the
> patch
> > > set  supports it as it puts dts files for those boards to be built.
> > > > > > > > >>
> > > > > > > > >> U-Boot needs to be flexible enough to
> > > > > > > > >> function correctly in whatever runtime environment in
> which
> > > it finds
> > > > > > > > >> itself.
> > > > > > > > >>
> > > > > > > > >> Also as binman is pressed into service more and more to
> build
> > > the
> > > > > > > > >> complex firmware images that are becoming fashionable, i=
t
> > > needs a
> > > > > > > > >> definition (in the devicetree) that describes how to
> create
> > > the image.
> > > > > > > > >> We can't support that unless we are building a devicetre=
e,
> > > nor can the
> > > > > > > > >> running program access the image layout without that
> > > information.
> > > > > > > > >>
> > > > > > > > >> Fran=C3=A7ois's point about 'don't use this with any ker=
nel' is
> > > > > > > > >> germane...but of course I am not suggesting doing that,
> since
> > > OF_BOARD
> > > > > > > > >> is, still, enabled. We already use OF_BOARD for various
> > > boards that
> > > > > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3,
> for
> > > example
> > > > > > > > >> (as I said in the cover letter "Most boards do provide
> one,
> > > but some
> > > > > > > > >> don't."). So this series is just completing the picture =
by
> > > enforcing
> > > > > > > > >> that *some sort* of devicetree is always present.
> > > > > > > > >
> > > > > > > > > That seems inconsistent with the OF_BOARD becomes the
> default.
> > > > > > > >
> > > > > > > > I think the key point that will get you closer to where I a=
m
> on
> > > this
> > > > > > > > issue, is that OF_BOARD needs to be a run-time option. At
> > > present it
> > > > > > > > has build-time effects and this is quite wrong. If you go
> > > through all
> > > > > > > > the material I have written on this I think I have motivate=
d
> > > that very
> > > > > > > > clearly.
> > > > > > > >
> > > > > > > > Another big issue is that I believe we need ONE devicetree
> for
> > > U-Boot,
> > > > > > > > not two that get merged by U-Boot. Again I have gone throug=
h
> > > that in a
> > > > > > > > lot of detail.
> > > > > > >
> > > > > > > I have a long long reply to your first reply here saved, but,
> maybe
> > > > > > > here's the biggest sticking point.  To be clear, you agree th=
at
> > > U-Boot
> > > > > > > needs to support being passed a device tree to use, at run
> time,
> > > yes?
> > > > > >
> > > > > > Yes. The OF_BOARD feature provides this.
> > > > > >
> > > > > > >
> > > > > > > And in that case, would not be using the "fake" tree we built
> in?
> > > > > >
> > > > > > Not at runtime.
> > > > >
> > > > > OK.
> > > > >
> > > > > > > So is the sticking point here that we really have two classes
> of
> > > > > > > devices, one class where we will never ever be given the devi=
ce
> > > tree at
> > > > > > > run time (think BeagleBone Black) and one where we will alway=
s
> be
> > > given
> > > > > > > one at run time (think Raspberry Pi) ?
> > > > > >
> > > > > > I'm not sure it will be that black and white. I suspect there
> will be
> > > > > > (many) boards which can boot happily with the U-Boot devicetree
> but
> > > > > > can also accept one at runtime, if provided. For example, you m=
ay
> > > want
> > > > > > to boot with or without TF-A or some other, earlier stage.
> > > > >
> > > > > I'm not sure I see the value in making this a gray area.  There's
> very
> > > > > much a class of "never" boards.  There's also the class of "can"
> today.
> > > > > Maybe as part of a developer iterative flow it would be nice to n=
ot
> > > have
> > > > > to re-flash the prior stage to change a DT, and just do it in
> U-Boot
> > > > > until things are happy, but I'm not sure what the use case is for
> > > > > overriding the previous stage.
> > > > >
> > > > > Especially since the pushback on this series I think has all been
> "why
> > > > > are we copying in a tree to build with?  We don't want to use it
> at run
> > > > > time!".  And then softer push back like "Well, U-Boot says we hav=
e
> to
> > > > > include the device tree file here, but we won't use it...".
> > > >
> > > > See below.
> > > >
> > > > >
> > > > > > I believe we have got unstuck because OF_BOARD (perhaps
> > > inadvertently)
> > > > > > provided a way to entirely omit a devicetree from U-Boot, thus
> making
> > > > > > things like binman and U-Boot /config impossible, for example.
> So I
> > > > > > want to claw that back, so there is always some sort of
> devicetree in
> > > > > > U-Boot, as we have for rpi_3, etc.
> > > > >
> > > > > I really want to see what the binary case looks like since we cou=
ld
> > > then
> > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we
> could
> > > > > then also do a rpi_arm32_defconfig too.
> > > > >
> > > > > I want to see less device trees in U-Boot sources, if they can co=
me
> > > > > functionally correct from the hardware/our caller.
> > > > >
> > > > > And I'm not seeing how we make use of "U-Boot /config" if we also
> don't
> > > > > use the device tree from build time at run time, ignoring the
> device
> > > > > tree provided to us at run time by the caller.
> > > >
> > > > Firstly I should say that I find building firmware very messy and
> > > > confusing these days. Lots of things to build and it's hard to find
> > > > the instructions. It doesn't have to be that way, but if we carry o=
n
> > > > as we are, it will continue to be messy and in five years you will
> > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > objective here is to simplify things, bringing some consistency to
> the
> > > > different components. Binman was one effort there. I feel that
> putting
> > > > at least the U-Boot house in order, in my role as devicetree
> > > > maintainer (and as author of devicetree support in U-Boot back in
> > > > 2011), is the next step.
> > >
> > > Yes, it's Not Great.  I don't like my handful of build-BOARD.sh scrip=
ts
> > > that know where to grab other known-good binaries of varying licenses
> > > that are needed to assemble something that boots.
> > >
> > > > If we set things up correctly and agree on the bindings, devicetree
> > > > can be the unifying configuration mechanism through the whole of
> > > > firmware (except for very early bits) and into the OS, this will se=
t
> > > > us up very well to deal with the complexity that is coming.
> > > >
> > > > Anyway, here are the mental steps that I've gone through over the
> past
> > > > two months:
> > > >
> > > > Step 1: At present, some people think U-Boot is not even allowed to
> > > > have its own nodes/properties in the DT.
> >
> > In my view U-Boot shall be able to leverage device tree format (source
> and
> > binary) to store its own data.
> > When you say "the" DT, I always think this is "the" DT that is passed t=
o
> OS
> > and in "that" DT, there should be no U-Boot entries.
>
> Why not?  As long as the device tree validates, it is perfectly fine
> to have additional nodes and properties present.  The propertiesand
> nodes will be simply ignored by the OS.
>
> Because of the way we want to organize the firmware supply chain: when th=
e
board is built, it is "attached" a device tree.
At that moment, we don't know what "non trusted firmware" will be used. It
could be U-Boot or LinuxBoot (https://www.linuxboot.org) or even EDK2 (yes
it works with DT).
And we aim at keeping device tree as close to the original intent: hardware
description only. It's not because we can stuff anything in the DT and that
it is simple to do that we should.
Driver parameters shall be in the OS facility built for that purpose. Using
device tree has been an ugly habit.

> OpenBSD will print:
>
>   "binman" not configured
>
> for the binman node that some of the U-Boot board targets now have,
> but it doesn't really make a difference.  If there is a proper binding
> for that node, I could simply filter it out.  Or we have U-Boot filter
> it out before the DT gets passed along like Tom suggests.
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000a35efb05cf57b880
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Mark,</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 27 Oct 2021 at 17:10, Mar=
k Kettenis &lt;<a href=3D"mailto:mark.kettenis@xs4all.nl">mark.kettenis@xs4=
all.nl</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;borde=
r-left-color:rgb(204,204,204);padding-left:1ex">&gt; From: Fran=C3=A7ois Oz=
og &lt;<a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">franco=
is.ozog@linaro.org</a>&gt;<br>
&gt; Date: Wed, 27 Oct 2021 15:15:01 +0200<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; On Wed, 27 Oct 2021 at 14:48, Tom Rini &lt;<a href=3D"mailto:trini@kon=
sulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass wrote:<br>
&gt; &gt; &gt; Hi all,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 14 Oct 2021 at 09:28, Tom Rini &lt;<a href=3D"mailto=
:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br=
>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass w=
rote:<br>
&gt; &gt; &gt; &gt; &gt; Hi Tom,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Thu, 14 Oct 2021 at 08:56, Tom Rini &lt;<a href=
=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt;=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Wed, Oct 13, 2021 at 12:06:02PM -0600, Sim=
on Glass wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Fran=C3=A7ois,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7=
ois Ozog &lt;<br>
&gt; &gt; <a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">fra=
ncois.ozog@linaro.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Simon<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Le mer. 13 oct. 2021 =C3=A0 16:49, =
Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@c=
hromium.org</a>&gt;<br>
&gt; &gt; a =C3=A9crit :<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Hi Tom, Bin,Fran=C3=A7ois,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; On Tue, 12 Oct 2021 at 19:34, T=
om Rini &lt;<a href=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@k=
onsulko.com</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; On Wed, Oct 13, 2021 at 09=
:29:14AM +0800, Bin Meng wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; Hi Simon,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; On Wed, Oct 13, 2021 =
at 9:01 AM Simon Glass &lt;<br>
&gt; &gt; <a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromiu=
m.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; With Ilias&#39; =
efforts we have dropped OF_PRIOR_STAGE and<br>
&gt; &gt; OF_HOSTFILE so<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; there are only t=
hree ways to obtain a devicetree:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - O=
F_SEPARATE - the normal way, where the devicetree<br>
&gt; &gt; is built and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0appended to U-Boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - O=
F_EMBED - for development purposes, the<br>
&gt; &gt; devicetree is embedded in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0the ELF file (also used for EFI)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - O=
F_BOARD - the board figures it out on its own<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; The last one is =
currently set up so that no devicetree<br>
&gt; &gt; is needed at all<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; in the U-Boot tr=
ee. Most boards do provide one, but<br>
&gt; &gt; some don&#39;t. Some<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; don&#39;t even p=
rovide instructions on how to boot on the<br>
&gt; &gt; board.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; The problems wit=
h this approach are documented at [1].<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; In practice, OF_=
BOARD is not really distinct from<br>
&gt; &gt; OF_SEPARATE. Any board<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; can obtain its d=
evicetree at runtime, even it is has a<br>
&gt; &gt; devicetree built<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; in U-Boot. This =
is because U-Boot may be a second-stage<br>
&gt; &gt; bootloader and its<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; caller may have =
a better idea about the hardware<br>
&gt; &gt; available in the machine.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; This is the case=
 with a few QEMU boards, for example.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; So it makes no s=
ense to have OF_BOARD as a &#39;choice&#39;. It<br>
&gt; &gt; should be an<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; option, availabl=
e with either OF_SEPARATE or OF_EMBED.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; This series make=
s this change, adding various missing<br>
&gt; &gt; devicetree files<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; (and placeholder=
s) to make the build work.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; Adding device trees t=
hat are never used sounds like a<br>
&gt; &gt; hack to me.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; For QEMU, device tree=
 is dynamically generated on the fly<br>
&gt; &gt; based on<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; command line paramete=
rs, and the device tree you put in<br>
&gt; &gt; this series<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; has various hardcoded=
 &lt;phandle&gt; values which normally do<br>
&gt; &gt; not show up<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; in hand-written dts f=
iles.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; I am not sure I under=
stand the whole point of this.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; I am also confused and do =
not like the idea of adding<br>
&gt; &gt; device trees for<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; platforms that are capable=
 of and can / do have a device<br>
&gt; &gt; tree to give us<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; at run time.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; (I&#39;ll just reply to this on=
e email, since the same points<br>
&gt; &gt; applies to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; all replies I think)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; I have been thinking about this=
 and discussing it with people<br>
&gt; &gt; for a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; few months now. I&#39;ve been s=
ignalling a change like this for<br>
&gt; &gt; over a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; month now, on U-Boot contributo=
r calls and in discussions<br>
&gt; &gt; with Linaro<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; people. I sent a patch (below) =
to try to explain things. I<br>
&gt; &gt; hope it is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; not a surprise!<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; The issue here is that we need =
a devicetree in-tree in<br>
&gt; &gt; U-Boot, to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; avoid the mess that has been cr=
eated by OF_PRIOR_STAGE,<br>
&gt; &gt; OF_BOARD,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BINMAN_STANDALONE_FDT and to a =
lesser extent, OF_HOSTFILE.<br>
&gt; &gt; Between<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Ilias&#39; series and this one =
we can get ourselves on a stronger<br>
&gt; &gt; footing.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; There is just OF_SEPARATE, with=
 OF_EMBED for debugging/ELF<br>
&gt; &gt; use.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; For more context:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; <a href=3D"http://patchwork.ozlabs.org/project/uboot/patch/202109=
19215111.3830278-3-sjg@chromium.org/" rel=3D"noreferrer" target=3D"_blank">=
http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sj=
g@chromium.org/</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BTW I did suggest to QEMU ARM t=
hat they support a way of<br>
&gt; &gt; adding the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; u-boot.dtsi but there was not m=
uch interest there (in fact the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; maintainer would prefer there w=
as no special support even for<br>
&gt; &gt; booting<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Linux directly!)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; i understand their point of view an=
d agree with it.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; But in any case it doesn&#39;t =
really help U-Boot. I<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; think the path forward might be=
 to run QEMU twice, once to<br>
&gt; &gt; get its<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; generated tree and once to give=
 the &#39;merged&#39; tree with the<br>
&gt; &gt; U-Boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; properties in it, if people wan=
t to use U-Boot features.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; I do strongly believe that OF_B=
OARD must be a run-time<br>
&gt; &gt; option, not a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; build-time one. It creates all =
sorts of problems and<br>
&gt; &gt; obscurity which<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; have taken months to unpick. Se=
e the above patch for the<br>
&gt; &gt; rationale.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; To add to that rationale, OF_BO=
ARD needs to be an option<br>
&gt; &gt; available to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; any board. At some point in the=
 future it may become a common<br>
&gt; &gt; way<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; things are done, e.g. TF-A call=
ing U-Boot and providing a<br>
&gt; &gt; devicetree<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; to it. It doesn&#39;t make any =
sense to have people decide<br>
&gt; &gt; whether or not<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; to set OF_BOARD at build time, =
thus affecting how the image<br>
&gt; &gt; is put<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; together. We&#39;ll end up with=
 different U-Boot build targets<br>
&gt; &gt; like<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; capricorn, capricorn_of_board a=
nd the like. It should be<br>
&gt; &gt; obvious where<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; that will lead. Instead, OF_BOA=
RD needs to become a commonly<br>
&gt; &gt; used<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; option, perhaps enabled by most=
/all boards, so that this sort<br>
&gt; &gt; of build<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; explosion is not needed.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; If you mean that when boards are by=
 construction providing a<br>
&gt; &gt; DTB to U-Boot then I agree very much. But I don=E2=80=99t underst=
and how the patch<br>
&gt; &gt; set=C2=A0 supports it as it puts dts files for those boards to be=
 built.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; U-Boot needs to be flexible eno=
ugh to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; function correctly in whatever =
runtime environment in which<br>
&gt; &gt; it finds<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; itself.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Also as binman is pressed into =
service more and more to build<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; complex firmware images that ar=
e becoming fashionable, it<br>
&gt; &gt; needs a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; definition (in the devicetree) =
that describes how to create<br>
&gt; &gt; the image.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; We can&#39;t support that unles=
s we are building a devicetree,<br>
&gt; &gt; nor can the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; running program access the imag=
e layout without that<br>
&gt; &gt; information.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Fran=C3=A7ois&#39;s point about=
 &#39;don&#39;t use this with any kernel&#39; is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; germane...but of course I am no=
t suggesting doing that, since<br>
&gt; &gt; OF_BOARD<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; is, still, enabled. We already =
use OF_BOARD for various<br>
&gt; &gt; boards that<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; include an in-tree devicetree -=
 Raspberry Pi 1, 2 and 3, for<br>
&gt; &gt; example<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; (as I said in the cover letter =
&quot;Most boards do provide one,<br>
&gt; &gt; but some<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; don&#39;t.&quot;). So this seri=
es is just completing the picture by<br>
&gt; &gt; enforcing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; that *some sort* of devicetree =
is always present.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; That seems inconsistent with the OF=
_BOARD becomes the default.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I think the key point that will get you =
closer to where I am on<br>
&gt; &gt; this<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; issue, is that OF_BOARD needs to be a ru=
n-time option. At<br>
&gt; &gt; present it<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; has build-time effects and this is quite=
 wrong. If you go<br>
&gt; &gt; through all<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the material I have written on this I th=
ink I have motivated<br>
&gt; &gt; that very<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; clearly.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Another big issue is that I believe we n=
eed ONE devicetree for<br>
&gt; &gt; U-Boot,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; not two that get merged by U-Boot. Again=
 I have gone through<br>
&gt; &gt; that in a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; lot of detail.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I have a long long reply to your first reply =
here saved, but, maybe<br>
&gt; &gt; &gt; &gt; &gt; &gt; here&#39;s the biggest sticking point.=C2=A0 =
To be clear, you agree that<br>
&gt; &gt; U-Boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; needs to support being passed a device tree t=
o use, at run time,<br>
&gt; &gt; yes?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Yes. The OF_BOARD feature provides this.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; And in that case, would not be using the &quo=
t;fake&quot; tree we built in?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Not at runtime.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; OK.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; So is the sticking point here that we really =
have two classes of<br>
&gt; &gt; &gt; &gt; &gt; &gt; devices, one class where we will never ever b=
e given the device<br>
&gt; &gt; tree at<br>
&gt; &gt; &gt; &gt; &gt; &gt; run time (think BeagleBone Black) and one whe=
re we will always be<br>
&gt; &gt; given<br>
&gt; &gt; &gt; &gt; &gt; &gt; one at run time (think Raspberry Pi) ?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I&#39;m not sure it will be that black and white. =
I suspect there will be<br>
&gt; &gt; &gt; &gt; &gt; (many) boards which can boot happily with the U-Bo=
ot devicetree but<br>
&gt; &gt; &gt; &gt; &gt; can also accept one at runtime, if provided. For e=
xample, you may<br>
&gt; &gt; want<br>
&gt; &gt; &gt; &gt; &gt; to boot with or without TF-A or some other, earlie=
r stage.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I&#39;m not sure I see the value in making this a gray =
area.=C2=A0 There&#39;s very<br>
&gt; &gt; &gt; &gt; much a class of &quot;never&quot; boards.=C2=A0 There&#=
39;s also the class of &quot;can&quot; today.<br>
&gt; &gt; &gt; &gt; Maybe as part of a developer iterative flow it would be=
 nice to not<br>
&gt; &gt; have<br>
&gt; &gt; &gt; &gt; to re-flash the prior stage to change a DT, and just do=
 it in U-Boot<br>
&gt; &gt; &gt; &gt; until things are happy, but I&#39;m not sure what the u=
se case is for<br>
&gt; &gt; &gt; &gt; overriding the previous stage.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Especially since the pushback on this series I think ha=
s all been &quot;why<br>
&gt; &gt; &gt; &gt; are we copying in a tree to build with?=C2=A0 We don&#3=
9;t want to use it at run<br>
&gt; &gt; &gt; &gt; time!&quot;.=C2=A0 And then softer push back like &quot=
;Well, U-Boot says we have to<br>
&gt; &gt; &gt; &gt; include the device tree file here, but we won&#39;t use=
 it...&quot;.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; See below.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I believe we have got unstuck because OF_BOARD (pe=
rhaps<br>
&gt; &gt; inadvertently)<br>
&gt; &gt; &gt; &gt; &gt; provided a way to entirely omit a devicetree from =
U-Boot, thus making<br>
&gt; &gt; &gt; &gt; &gt; things like binman and U-Boot /config impossible, =
for example. So I<br>
&gt; &gt; &gt; &gt; &gt; want to claw that back, so there is always some so=
rt of devicetree in<br>
&gt; &gt; &gt; &gt; &gt; U-Boot, as we have for rpi_3, etc.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I really want to see what the binary case looks like si=
nce we could<br>
&gt; &gt; then<br>
&gt; &gt; &gt; &gt; kill off rpi_{3,3_b,4}_defconfig and I would need to se=
e if we could<br>
&gt; &gt; &gt; &gt; then also do a rpi_arm32_defconfig too.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I want to see less device trees in U-Boot sources, if t=
hey can come<br>
&gt; &gt; &gt; &gt; functionally correct from the hardware/our caller.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; And I&#39;m not seeing how we make use of &quot;U-Boot =
/config&quot; if we also don&#39;t<br>
&gt; &gt; &gt; &gt; use the device tree from build time at run time, ignori=
ng the device<br>
&gt; &gt; &gt; &gt; tree provided to us at run time by the caller.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Firstly I should say that I find building firmware very mess=
y and<br>
&gt; &gt; &gt; confusing these days. Lots of things to build and it&#39;s h=
ard to find<br>
&gt; &gt; &gt; the instructions. It doesn&#39;t have to be that way, but if=
 we carry on<br>
&gt; &gt; &gt; as we are, it will continue to be messy and in five years yo=
u will<br>
&gt; &gt; &gt; need a Ph.D and a lucky charm to boot on any modern board. M=
y<br>
&gt; &gt; &gt; objective here is to simplify things, bringing some consiste=
ncy to the<br>
&gt; &gt; &gt; different components. Binman was one effort there. I feel th=
at putting<br>
&gt; &gt; &gt; at least the U-Boot house in order, in my role as devicetree=
<br>
&gt; &gt; &gt; maintainer (and as author of devicetree support in U-Boot ba=
ck in<br>
&gt; &gt; &gt; 2011), is the next step.<br>
&gt; &gt;<br>
&gt; &gt; Yes, it&#39;s Not Great.=C2=A0 I don&#39;t like my handful of bui=
ld-BOARD.sh scripts<br>
&gt; &gt; that know where to grab other known-good binaries of varying lice=
nses<br>
&gt; &gt; that are needed to assemble something that boots.<br>
&gt; &gt;<br>
&gt; &gt; &gt; If we set things up correctly and agree on the bindings, dev=
icetree<br>
&gt; &gt; &gt; can be the unifying configuration mechanism through the whol=
e of<br>
&gt; &gt; &gt; firmware (except for very early bits) and into the OS, this =
will set<br>
&gt; &gt; &gt; us up very well to deal with the complexity that is coming.<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Anyway, here are the mental steps that I&#39;ve gone through=
 over the past<br>
&gt; &gt; &gt; two months:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Step 1: At present, some people think U-Boot is not even all=
owed to<br>
&gt; &gt; &gt; have its own nodes/properties in the DT.<br>
&gt; <br>
&gt; In my view U-Boot shall be able to leverage device tree format (source=
 and<br>
&gt; binary) to store its own data.<br>
&gt; When you say &quot;the&quot; DT, I always think this is &quot;the&quot=
; DT that is passed to OS<br>
&gt; and in &quot;that&quot; DT, there should be no U-Boot entries.<br>
<br>
Why not?=C2=A0 As long as the device tree validates, it is perfectly fine<b=
r>
to have additional nodes and properties present.=C2=A0 The propertiesand<br=
>
nodes will be simply ignored by the OS.<br>
<br></blockquote><div>Because of the way we want to organize the firmware s=
upply chain: when the board is built, it is &quot;attached&quot; a device t=
ree.</div><div>At that moment, we don&#39;t know what &quot;non trusted fir=
mware&quot; will be used. It could be U-Boot or LinuxBoot (<a href=3D"https=
://www.linuxboot.org">https://www.linuxboot.org</a>) or even EDK2 (yes it w=
orks with DT).=C2=A0</div><div>And we aim at keeping device tree as close t=
o the original intent: hardware description only. It&#39;s not because we c=
an stuff anything in the DT and that it is simple to do that we should.</di=
v><div>Driver parameters shall be in the OS facility built for that purpose=
. Using device tree has been an ugly habit.</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
OpenBSD will print:<br>
<br>
=C2=A0 &quot;binman&quot; not configured<br>
<br>
for the binman node that some of the U-Boot board targets now have,<br>
but it doesn&#39;t really make a difference.=C2=A0 If there is a proper bin=
ding<br>
for that node, I could simply filter it out.=C2=A0 Or we have U-Boot filter=
<br>
it out before the DT gets passed along like Tom suggests.<br>
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

--000000000000a35efb05cf57b880--

