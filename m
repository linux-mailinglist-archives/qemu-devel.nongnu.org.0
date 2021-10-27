Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E7043CE03
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:54:56 +0200 (CEST)
Received: from localhost ([::1]:46948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflGR-0000rf-7c
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kettenis@xs4all.nl>)
 id 1mfkZW-0004zN-1X
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:10:34 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:51219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kettenis@xs4all.nl>)
 id 1mfkZQ-00079j-Ta
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:10:33 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 25477604;
 Wed, 27 Oct 2021 17:10:12 +0200 (CEST)
Date: Wed, 27 Oct 2021 17:10:12 +0200 (CEST)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: =?utf-8?Q?Fran=C3=A7ois?= Ozog <francois.ozog@linaro.org>
In-Reply-To: <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 (message from =?utf-8?Q?Fran=C3=A7ois?= Ozog on Wed, 27 Oct 2021 15:15:01
 +0200)
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <d3ca937f451a8cf3@bloch.sibelius.xs4all.nl>
Received-SPF: softfail client-ip=83.163.83.176;
 envelope-from=mark.kettenis@xs4all.nl; helo=sibelius.xs4all.nl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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

> From: François Ozog <francois.ozog@linaro.org>
> Date: Wed, 27 Oct 2021 15:15:01 +0200
> 
> Hi,
> 
> On Wed, 27 Oct 2021 at 14:48, Tom Rini <trini@konsulko.com> wrote:
> 
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
> > > > > > > Hi François,
> > > > > > >
> > > > > > > On Wed, 13 Oct 2021 at 11:35, François Ozog <
> > francois.ozog@linaro.org> wrote:
> > > > > > > >
> > > > > > > > Hi Simon
> > > > > > > >
> > > > > > > > Le mer. 13 oct. 2021 à 16:49, Simon Glass <sjg@chromium.org>
> > a écrit :
> > > > > > > >>
> > > > > > > >> Hi Tom, Bin,François,
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
> > > > > > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and
> > OF_HOSTFILE so
> > > > > > > >> > > > there are only three ways to obtain a devicetree:
> > > > > > > >> > > >
> > > > > > > >> > > >    - OF_SEPARATE - the normal way, where the devicetree
> > is built and
> > > > > > > >> > > >       appended to U-Boot
> > > > > > > >> > > >    - OF_EMBED - for development purposes, the
> > devicetree is embedded in
> > > > > > > >> > > >       the ELF file (also used for EFI)
> > > > > > > >> > > >    - OF_BOARD - the board figures it out on its own
> > > > > > > >> > > >
> > > > > > > >> > > > The last one is currently set up so that no devicetree
> > is needed at all
> > > > > > > >> > > > in the U-Boot tree. Most boards do provide one, but
> > some don't. Some
> > > > > > > >> > > > don't even provide instructions on how to boot on the
> > board.
> > > > > > > >> > > >
> > > > > > > >> > > > The problems with this approach are documented at [1].
> > > > > > > >> > > >
> > > > > > > >> > > > In practice, OF_BOARD is not really distinct from
> > OF_SEPARATE. Any board
> > > > > > > >> > > > can obtain its devicetree at runtime, even it is has a
> > devicetree built
> > > > > > > >> > > > in U-Boot. This is because U-Boot may be a second-stage
> > bootloader and its
> > > > > > > >> > > > caller may have a better idea about the hardware
> > available in the machine.
> > > > > > > >> > > > This is the case with a few QEMU boards, for example.
> > > > > > > >> > > >
> > > > > > > >> > > > So it makes no sense to have OF_BOARD as a 'choice'. It
> > should be an
> > > > > > > >> > > > option, available with either OF_SEPARATE or OF_EMBED.
> > > > > > > >> > > >
> > > > > > > >> > > > This series makes this change, adding various missing
> > devicetree files
> > > > > > > >> > > > (and placeholders) to make the build work.
> > > > > > > >> > >
> > > > > > > >> > > Adding device trees that are never used sounds like a
> > hack to me.
> > > > > > > >> > >
> > > > > > > >> > > For QEMU, device tree is dynamically generated on the fly
> > based on
> > > > > > > >> > > command line parameters, and the device tree you put in
> > this series
> > > > > > > >> > > has various hardcoded <phandle> values which normally do
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
> > > > > > > >> I have been thinking about this and discussing it with people
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
> > > > > > > >> Ilias' series and this one we can get ourselves on a stronger
> > footing.
> > > > > > > >> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF
> > use.
> > > > > > > >> For more context:
> > > > > > > >>
> > > > > > > >>
> > http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/
> > > > > > > >>
> > > > > > > >> BTW I did suggest to QEMU ARM that they support a way of
> > adding the
> > > > > > > >> u-boot.dtsi but there was not much interest there (in fact the
> > > > > > > >> maintainer would prefer there was no special support even for
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
> > > > > > > >> any board. At some point in the future it may become a common
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
> > > > > > > >> that will lead. Instead, OF_BOARD needs to become a commonly
> > used
> > > > > > > >> option, perhaps enabled by most/all boards, so that this sort
> > of build
> > > > > > > >> explosion is not needed.
> > > > > > > >
> > > > > > > > If you mean that when boards are by construction providing a
> > DTB to U-Boot then I agree very much. But I don’t understand how the patch
> > set  supports it as it puts dts files for those boards to be built.
> > > > > > > >>
> > > > > > > >> U-Boot needs to be flexible enough to
> > > > > > > >> function correctly in whatever runtime environment in which
> > it finds
> > > > > > > >> itself.
> > > > > > > >>
> > > > > > > >> Also as binman is pressed into service more and more to build
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
> > > > > > > >> François's point about 'don't use this with any kernel' is
> > > > > > > >> germane...but of course I am not suggesting doing that, since
> > OF_BOARD
> > > > > > > >> is, still, enabled. We already use OF_BOARD for various
> > boards that
> > > > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for
> > example
> > > > > > > >> (as I said in the cover letter "Most boards do provide one,
> > but some
> > > > > > > >> don't."). So this series is just completing the picture by
> > enforcing
> > > > > > > >> that *some sort* of devicetree is always present.
> > > > > > > >
> > > > > > > > That seems inconsistent with the OF_BOARD becomes the default.
> > > > > > >
> > > > > > > I think the key point that will get you closer to where I am on
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
> > > > > > I have a long long reply to your first reply here saved, but, maybe
> > > > > > here's the biggest sticking point.  To be clear, you agree that
> > U-Boot
> > > > > > needs to support being passed a device tree to use, at run time,
> > yes?
> > > > >
> > > > > Yes. The OF_BOARD feature provides this.
> > > > >
> > > > > >
> > > > > > And in that case, would not be using the "fake" tree we built in?
> > > > >
> > > > > Not at runtime.
> > > >
> > > > OK.
> > > >
> > > > > > So is the sticking point here that we really have two classes of
> > > > > > devices, one class where we will never ever be given the device
> > tree at
> > > > > > run time (think BeagleBone Black) and one where we will always be
> > given
> > > > > > one at run time (think Raspberry Pi) ?
> > > > >
> > > > > I'm not sure it will be that black and white. I suspect there will be
> > > > > (many) boards which can boot happily with the U-Boot devicetree but
> > > > > can also accept one at runtime, if provided. For example, you may
> > want
> > > > > to boot with or without TF-A or some other, earlier stage.
> > > >
> > > > I'm not sure I see the value in making this a gray area.  There's very
> > > > much a class of "never" boards.  There's also the class of "can" today.
> > > > Maybe as part of a developer iterative flow it would be nice to not
> > have
> > > > to re-flash the prior stage to change a DT, and just do it in U-Boot
> > > > until things are happy, but I'm not sure what the use case is for
> > > > overriding the previous stage.
> > > >
> > > > Especially since the pushback on this series I think has all been "why
> > > > are we copying in a tree to build with?  We don't want to use it at run
> > > > time!".  And then softer push back like "Well, U-Boot says we have to
> > > > include the device tree file here, but we won't use it...".
> > >
> > > See below.
> > >
> > > >
> > > > > I believe we have got unstuck because OF_BOARD (perhaps
> > inadvertently)
> > > > > provided a way to entirely omit a devicetree from U-Boot, thus making
> > > > > things like binman and U-Boot /config impossible, for example. So I
> > > > > want to claw that back, so there is always some sort of devicetree in
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
> > > > And I'm not seeing how we make use of "U-Boot /config" if we also don't
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
> 
> In my view U-Boot shall be able to leverage device tree format (source and
> binary) to store its own data.
> When you say "the" DT, I always think this is "the" DT that is passed to OS
> and in "that" DT, there should be no U-Boot entries.

Why not?  As long as the device tree validates, it is perfectly fine
to have additional nodes and properties present.  The propertiesand
nodes will be simply ignored by the OS.

OpenBSD will print:

  "binman" not configured

for the binman node that some of the U-Boot board targets now have,
but it doesn't really make a difference.  If there is a proper binding
for that node, I could simply filter it out.  Or we have U-Boot filter
it out before the DT gets passed along like Tom suggests.

