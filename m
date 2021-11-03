Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9444464B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:52:15 +0100 (CET)
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJUj-000858-Ui
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1miJOh-0001fc-0U
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:45:59 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1miJOd-0006DC-70
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:45:58 -0400
Received: by mail-ua1-x929.google.com with SMTP id e10so5604194uab.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1aOm3zr6jacqOf3xOtDX/pA2UPHof4LzcxkZkHNHG10=;
 b=DppI5qZzlPq8QhHbyE9klowLuaT8Px0i9XOANWTeo00ciPs8bLSKBstCrH6hV5MFmJ
 XALwCT5qYGmy61jgJys7bujesgTlo1q9P+ju0KE1vcRXLCu5STO7np6R0alPUd14vILD
 NNwnAwC7kAAs+CNf5S5O9oz8cZuScIFQBLr4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1aOm3zr6jacqOf3xOtDX/pA2UPHof4LzcxkZkHNHG10=;
 b=1VtQvzCwa/K5PGrU6ANunG+7GOlHUmY/KnAjhoih0iKuegTFyAS9KhUoSy8BeltvYr
 V9iv0rPTMv2d7vBg3JscdjT/cCxaE12IvL1NyFnOHkM9ynCJ1jDrNDJ063lUKQ3oBAeC
 pYePy37fHxGbfJlvekOv6ob4PVJhp1V/7MbpkEgxMAYL5hxBw/olIgMxbe116ek3Nwub
 GaMICR22KcU8TT2imm7zMyAfRC2C4pO4xkx9o3w0Ad/n9HBq7dN/ORRuqQm6rXPhq2Xr
 m0HQt8vyGzD7WgbWDTIAXPgTTppK14GvBqnvwIxSa98fJtZGiFI/85nOvvOucF6JF79v
 O2tQ==
X-Gm-Message-State: AOAM533fJgHmbc+omO9uX7FsfrVwij2LtJ5kLBinoi9NxRrMq0ogSfuq
 fVNdr0dJHn/KS0wteink8QwOu6KkTxqIZ9AEmdwlTg==
X-Google-Smtp-Source: ABdhPJzVwhpPOSPrhqHplPLzSBI16QsAoE4EiOAEyIw4V3/3pWBkQWJ3QpN5TCCHo2goyke/yDWTJNwMTBb5xhvneRY=
X-Received: by 2002:a05:6102:dcb:: with SMTP id
 e11mr38334220vst.59.1635957953762; 
 Wed, 03 Nov 2021 09:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
 <d3ca9672e7f97f07@bloch.sibelius.xs4all.nl>
 <CAPnjgZ0r04-_K+8JkXhzxDeW5pg3FSrnJbwA6Ghd_a_=jVKKeg@mail.gmail.com>
 <d3caad562467ca29@bloch.sibelius.xs4all.nl>
 <20211103160209.GE24579@bill-the-cat>
In-Reply-To: <20211103160209.GE24579@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 3 Nov 2021 10:45:42 -0600
Message-ID: <CAPnjgZ3-eJrE5tzxmh=NCKgmfUDZv_VbMi1WUezGGya6O_JYaQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=sjg@google.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
 seanga2@gmail.com, u-boot@lists.denx.de,
 Mark Kettenis <mark.kettenis@xs4all.nl>, francois.ozog@linaro.org,
 swarren@nvidia.com, Oleksandr_Andrushchenko@epam.com, xypron.glpk@gmx.de,
 michal.simek@xilinx.com, vanbaren@cideas.com, swarren@wwwdotorg.org,
 andre.przywara@arm.com, agraf@csgraf.de, Anastasiia_Lukianenko@epam.com,
 albert.u.boot@aribaud.net, mbrugger@suse.com, ilias.apalodimas@linaro.org,
 awilliams@marvell.com, tuomas.tynkkynen@iki.fi, bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Tom,

On Wed, 3 Nov 2021 at 10:02, Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Nov 03, 2021 at 09:22:58AM +0100, Mark Kettenis wrote:
> > > From: Simon Glass <sjg@chromium.org>
> > > Date: Tue, 2 Nov 2021 19:20:51 -0600
> > >
> > > Hi Mark,
> > >
> > > On Wed, 27 Oct 2021 at 16:30, Mark Kettenis <mark.kettenis@xs4all.nl>=
 wrote:
> > > >
> > > > > From: Simon Glass <sjg@chromium.org>
> > > > > Date: Wed, 27 Oct 2021 12:23:21 -0600
> > > > >
> > > > > Hi Fran=C3=A7ois,
> > > > >
> > > > > On Wed, 27 Oct 2021 at 09:14, Fran=C3=A7ois Ozog <francois.ozog@l=
inaro.org> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wr=
ote:
> > > > > >>
> > > > > >> Hi Fran=C3=A7ois,
> > > > > >>
> > > > > >> On Tue, 26 Oct 2021 at 00:07, Fran=C3=A7ois Ozog <francois.ozo=
g@linaro.org> wrote:
> > > > > >> >
> > > > > >> > Hi Simon
> > > > > >> >
> > > > > >> > Position unchanged on this series: adding fake dts for board=
s that generate their device tree in the dts directory is not good. If you =
have them in documentation the it is acceptable.
> > > > > >>
> > > > > >> I think we are going to have to disagree on this one. I actual=
ly used
> > > > > >> the qemu one in testing/development recently. We have to have =
a way to
> > > > > >> develop in-tree with U-Boot. It does not impinge on any of you=
r use
> > > > > >> cases, so far as I know.
> > > > > >
> > > > > > I am not the only one in disagreement... You just saw Alex B=C3=
=A9n=C3=A9e from Qemu saying the same thing.
> > > > > > I understand the advanced debug/development scenario you mentio=
n.
> > > > > > But locating the DT files in the dts directory is mis-leading t=
he contributors to think that they need to compile the DT for the targeted =
platforms.
> > > > > > For your advanced scenario, you can still have the dts in the d=
ocumentation area, or whatever directory (except dts). compile it and suppl=
y to U-Boot.
> > > > >
> > > > > We have this situation with rpi 1, 2 and 3 and I don't believe an=
yone
> > > > > has noticed. U-Boot handles the build automatically. If you turn =
off
> > > > > OF_BOARD, it will use the U-Boot devicetree always so you know wh=
at is
> > > > > going on.
> > > >
> > > > Until.  The Raspberry Pi foundation releases a new firmware that
> > > > configures the hardware differently such that the addresses in the
> > > > U-Boot devicetree are wrong and nothing works anymore.  Can't speak
> > > > for the rpi 1, but this has happened in the past for the rpi 2 and =
3
> > > > as well as more recently on the rpi 4.
> > >
> > > So I update my SD card with a new private-binary bootloader and thing=
s
> > > stop working? I think I can narrow that one down :-)
> > >
> > > > > We can add a message to U-Boot indicating where the devicetree ca=
me
> > > > > from, perhaps? That might be useful given everything that is goin=
g on.
> > > > >
> > > > > As in this case, quite often in these discussions I struggle to
> > > > > understand what is behind the objection. Is it that your customer=
s are
> > > > > demanding that devicetrees become private, secret data, not inclu=
ded
> > > > > in open-source projects? Or is it just the strange case of QEMU t=
hat
> > > > > is informing your thinking? I know of at least one project where =
the
> > > > > first-stage bootloader produces a devicetree and no one has the s=
ource
> > > > > for it. I believe TF-A was created for licensing reasons...so can=
 you
> > > > > be a bit clearer about what the problem actually is? If a board i=
s
> > > > > in-tree in U-Boot I would like it to have a devicetree there, at =
least
> > > > > until we have a better option. At the very least, it MUST be
> > > > > discoverable and it must be possible to undertake U-Boot developm=
ent
> > > > > easily without a lot of messing around.
> > > >
> > > > How many people are there out there that work on U-Boot that don't
> > > > have a Linux source tree checked out?  Even I have several of those
> > > > lying around on my development systems and I am an OpenBSD develope=
r ;).
> > >
> > > So it is OK to have the DT in Linux but not in U-Boot? I don't even
> > > know what to say that. How does that square with your point above?
> >
> > Ideally the DT's and DT binding would move out of the Linux tree and
> > into a repository of their own.  But until that is the case, the Linux
> > tree is the source of truth.
>
> Yes, and this is a long known and slowly in progress kinda-sorta thing.
> A few more people helping to review things, etc, are always appreciated
> by upstream.
>
> > > I am not talking about disabling OF_BOARD, just making it *possible*
> > > to do so.
> >
> > And I don't think it makes sense to do so on most boards that have
> > OF_BOARD in their config.
>
> It should probably close to never be done, unless it's some case where
> it's crazy-hard to update the device tree correctly for the platform.
> So it's not a problem on Pi as it's just on the FAT32 partition right
> there, it's not a problem on Apple M1 as ..however you do it.., and so
> on.
>
> I can almost hear the argument from here about "but I'm doing some work
> for U-Boot and need to add..." and that's where we need to figure out
> what to do next.  Yes, we likely need to have some bindings of our own,
> and developing those AND pushing them upstream will require iterating
> here.  So the developer point of view of how do I whack things to supply
> my own is valid.  But it's not the default use case.  The default use
> case is building the firmware that users rarely see, because their
> system boots to the OS and they get down to using their system.

I believe that OF_BOARD needs to become a runtime option. If not,
there is no way to use the U-Boot deivcetree. I cannot build it
in-tree. I cannot make U-Boot use it. It's just a mess. So we are
supposed to run dtc manually to ge tthe DT, then copy it manually,
then deal with the include files it needs and the C preprocessing it
needs for the bindings? Why make this so hard? It just makes no sense
to me.

We are making this 'odd' case into the main case. It isn't. If it
becomes it one day, I hope we are in a better place with devicetree.
Upstreaming bindings is one thing, but we need to develop and test,
first.

I really don't understand why this is generating so much discussion.
How can we get this moving?

What is so wrong with having a devicetree in U-Boot for building? Why
are these boards so special? And what problem does it cause? The only
one I have heard is confusion, which I think I have addressed.

Regards,
SImon

