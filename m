Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF604447C0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:51:00 +0100 (CET)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miKPb-0007nx-5P
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kettenis@xs4all.nl>)
 id 1miKBH-0004gD-Mf
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:36:12 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:61221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kettenis@xs4all.nl>)
 id 1miKBE-00057f-Rb
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:36:11 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 2649540b;
 Wed, 3 Nov 2021 18:36:02 +0100 (CET)
Date: Wed, 3 Nov 2021 18:36:02 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ3-eJrE5tzxmh=NCKgmfUDZv_VbMi1WUezGGya6O_JYaQ@mail.gmail.com>
 (message from Simon Glass on Wed, 3 Nov 2021 10:45:42 -0600)
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
 <d3ca9672e7f97f07@bloch.sibelius.xs4all.nl>
 <CAPnjgZ0r04-_K+8JkXhzxDeW5pg3FSrnJbwA6Ghd_a_=jVKKeg@mail.gmail.com>
 <d3caad562467ca29@bloch.sibelius.xs4all.nl>
 <20211103160209.GE24579@bill-the-cat>
 <CAPnjgZ3-eJrE5tzxmh=NCKgmfUDZv_VbMi1WUezGGya6O_JYaQ@mail.gmail.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <d3caaf9711051748@bloch.sibelius.xs4all.nl>
Received-SPF: softfail client-ip=83.163.83.176;
 envelope-from=mark.kettenis@xs4all.nl; helo=sibelius.xs4all.nl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: linus.walleij@linaro.org, fitzsim@fitzsim.org, qemu-devel@nongnu.org,
 seanga2@gmail.com, francois.ozog@linaro.org, trini@konsulko.com,
 swarren@nvidia.com, Oleksandr_Andrushchenko@epam.com, xypron.glpk@gmx.de,
 michal.simek@xilinx.com, vanbaren@cideas.com, swarren@wwwdotorg.org,
 andre.przywara@arm.com, agraf@csgraf.de, Anastasiia_Lukianenko@epam.com,
 albert.u.boot@aribaud.net, mbrugger@suse.com, u-boot@lists.denx.de,
 ilias.apalodimas@linaro.org, awilliams@marvell.com, tuomas.tynkkynen@iki.fi,
 bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Simon Glass <sjg@chromium.org>
> Date: Wed, 3 Nov 2021 10:45:42 -0600
> 
> Hi Tom,
> 
> On Wed, 3 Nov 2021 at 10:02, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Wed, Nov 03, 2021 at 09:22:58AM +0100, Mark Kettenis wrote:
> > > > From: Simon Glass <sjg@chromium.org>
> > > > Date: Tue, 2 Nov 2021 19:20:51 -0600
> > > >
> > > > Hi Mark,
> > > >
> > > > On Wed, 27 Oct 2021 at 16:30, Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> > > > >
> > > > > > From: Simon Glass <sjg@chromium.org>
> > > > > > Date: Wed, 27 Oct 2021 12:23:21 -0600
> > > > > >
> > > > > > Hi François,
> > > > > >
> > > > > > On Wed, 27 Oct 2021 at 09:14, François Ozog <francois.ozog@linaro.org> wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrote:
> > > > > > >>
> > > > > > >> Hi François,
> > > > > > >>
> > > > > > >> On Tue, 26 Oct 2021 at 00:07, François Ozog <francois.ozog@linaro.org> wrote:
> > > > > > >> >
> > > > > > >> > Hi Simon
> > > > > > >> >
> > > > > > >> > Position unchanged on this series: adding fake dts for boards that generate their device tree in the dts directory is not good. If you have them in documentation the it is acceptable.
> > > > > > >>
> > > > > > >> I think we are going to have to disagree on this one. I actually used
> > > > > > >> the qemu one in testing/development recently. We have to have a way to
> > > > > > >> develop in-tree with U-Boot. It does not impinge on any of your use
> > > > > > >> cases, so far as I know.
> > > > > > >
> > > > > > > I am not the only one in disagreement... You just saw Alex Bénée from Qemu saying the same thing.
> > > > > > > I understand the advanced debug/development scenario you mention.
> > > > > > > But locating the DT files in the dts directory is mis-leading the contributors to think that they need to compile the DT for the targeted platforms.
> > > > > > > For your advanced scenario, you can still have the dts in the documentation area, or whatever directory (except dts). compile it and supply to U-Boot.
> > > > > >
> > > > > > We have this situation with rpi 1, 2 and 3 and I don't believe anyone
> > > > > > has noticed. U-Boot handles the build automatically. If you turn off
> > > > > > OF_BOARD, it will use the U-Boot devicetree always so you know what is
> > > > > > going on.
> > > > >
> > > > > Until.  The Raspberry Pi foundation releases a new firmware that
> > > > > configures the hardware differently such that the addresses in the
> > > > > U-Boot devicetree are wrong and nothing works anymore.  Can't speak
> > > > > for the rpi 1, but this has happened in the past for the rpi 2 and 3
> > > > > as well as more recently on the rpi 4.
> > > >
> > > > So I update my SD card with a new private-binary bootloader and things
> > > > stop working? I think I can narrow that one down :-)
> > > >
> > > > > > We can add a message to U-Boot indicating where the devicetree came
> > > > > > from, perhaps? That might be useful given everything that is going on.
> > > > > >
> > > > > > As in this case, quite often in these discussions I struggle to
> > > > > > understand what is behind the objection. Is it that your customers are
> > > > > > demanding that devicetrees become private, secret data, not included
> > > > > > in open-source projects? Or is it just the strange case of QEMU that
> > > > > > is informing your thinking? I know of at least one project where the
> > > > > > first-stage bootloader produces a devicetree and no one has the source
> > > > > > for it. I believe TF-A was created for licensing reasons...so can you
> > > > > > be a bit clearer about what the problem actually is? If a board is
> > > > > > in-tree in U-Boot I would like it to have a devicetree there, at least
> > > > > > until we have a better option. At the very least, it MUST be
> > > > > > discoverable and it must be possible to undertake U-Boot development
> > > > > > easily without a lot of messing around.
> > > > >
> > > > > How many people are there out there that work on U-Boot that don't
> > > > > have a Linux source tree checked out?  Even I have several of those
> > > > > lying around on my development systems and I am an OpenBSD developer ;).
> > > >
> > > > So it is OK to have the DT in Linux but not in U-Boot? I don't even
> > > > know what to say that. How does that square with your point above?
> > >
> > > Ideally the DT's and DT binding would move out of the Linux tree and
> > > into a repository of their own.  But until that is the case, the Linux
> > > tree is the source of truth.
> >
> > Yes, and this is a long known and slowly in progress kinda-sorta thing.
> > A few more people helping to review things, etc, are always appreciated
> > by upstream.
> >
> > > > I am not talking about disabling OF_BOARD, just making it *possible*
> > > > to do so.
> > >
> > > And I don't think it makes sense to do so on most boards that have
> > > OF_BOARD in their config.
> >
> > It should probably close to never be done, unless it's some case where
> > it's crazy-hard to update the device tree correctly for the platform.
> > So it's not a problem on Pi as it's just on the FAT32 partition right
> > there, it's not a problem on Apple M1 as ..however you do it.., and so
> > on.
> >
> > I can almost hear the argument from here about "but I'm doing some work
> > for U-Boot and need to add..." and that's where we need to figure out
> > what to do next.  Yes, we likely need to have some bindings of our own,
> > and developing those AND pushing them upstream will require iterating
> > here.  So the developer point of view of how do I whack things to supply
> > my own is valid.  But it's not the default use case.  The default use
> > case is building the firmware that users rarely see, because their
> > system boots to the OS and they get down to using their system.
> 
> I believe that OF_BOARD needs to become a runtime option.

I'm looking at this from the perspective of the Apple M1.  But please
no.  That would only tempt users to flip the switch resulting in a
non-bootable system.

> If not, there is no way to use the U-Boot deivcetree.

There is no way to use the U-Boot devicetree on these boards, because
it is incomplete.  And the code to fill in the missing bits lives
somewhere else.

> I cannot build it in-tree. I cannot make U-Boot use it. It's just a mess.

Correct.  So putting the device tree in the U-Boot repository makes no sense.

> So we are supposed to run dtc manually to ge tthe DT, then copy it
> manually, then deal with the include files it needs and the C
> preprocessing it needs for the bindings?

Of course not.  The repository that contains the DT sources will have
the infrastructure to do that for you.

> We are making this 'odd' case into the main case. It isn't. If it
> becomes it one day, I hope we are in a better place with devicetree.
> Upstreaming bindings is one thing, but we need to develop and test,
> first.

And the way I test things is that I build the device tree, load it
together with the U-Boot binary into m1n1 over serial or USB and run it.

> I really don't understand why this is generating so much discussion.
> How can we get this moving?

Maybe because you're continuously telling is we're doing it wrong and
must do it your way?

> What is so wrong with having a devicetree in U-Boot for building?

This sounds like you want to make having a devicetree in the actual
U-Boot a hard requirement.  And that makes no sense to me for the
Apple M1 systems.

> Why are these boards so special? And what problem does it cause? The
> only one I have heard is confusion, which I think I have addressed.

They're not special; just different.

