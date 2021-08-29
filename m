Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660883FAA32
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 10:43:26 +0200 (CEST)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKGPK-0007Ai-UI
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 04:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joseph.mayer@protonmail.com>)
 id 1mKC96-0003yN-NP
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 00:10:13 -0400
Received: from mail-40135.protonmail.ch ([185.70.40.135]:58997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joseph.mayer@protonmail.com>)
 id 1mKC93-0001Uz-S6
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 00:10:12 -0400
Date: Sun, 29 Aug 2021 04:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1630210198;
 bh=8trELXLCGD8Wj0sWcHcO/FdcN1eeH9KcLazbP+ggync=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dCg3BLSyGkLparxSx/ZNFLS4CzCjFRnYdj2UEPtjONqUMu4gGH6UcwgdW/Z6HJvql
 9193PVudPGZifbPolwuvnehvCXJcS+s0DuOXZZcgLTwDAnS4/K5fxMW8l1OfDJMdZd
 cjfmkxn3+GGVXntbnq2kF6cGqyNjK9CFeJGgVB94=
To: Mark Kettenis <mark.kettenis@xs4all.nl>,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz <groug@kaod.org>,
 "ppc@openbsd.org" <ppc@openbsd.org>
From: Joseph <joseph.mayer@protonmail.com>
Cc: pjp@centroid.eu, QEMU Developers <qemu-devel@nongnu.org>, gardask@gmail.com,
 rgcinjp@disroot.org, daniel@pocock.pro, kite@centroid.eu,
 siliconbadger@protonmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest support?
Message-ID: <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
In-Reply-To: <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
References: <7r8MLHEKQicVkfT4tQLsiRXQmt_800XbV1s0mM_QJTgOY7XadpiRcD4HizmXByPaZRsMQV2WbNKDfKU-PdVo3ZO9JC6fJ0MF5LM_j5a2fgA=@protonmail.com>
 <20210827170113.5f4ed260@bahia.lan>
 <HgtFZEnabNjIrsVI3x8MYs2QYSCG4IFStP0MR3qwPWBmXW9kDmQmIwQEWHMVdJbUCu-XvHdMpZGe3pr-B91s1D7y6cn9SVzhxEYms5c3p0o=@protonmail.com>
 <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
 <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.135;
 envelope-from=joseph.mayer@protonmail.com; helo=mail-40135.protonmail.ch
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 29 Aug 2021 04:41:02 -0400
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
Reply-To: Joseph <joseph.mayer@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark, C=C3=A9dric, Greg at the openbsd-ppc ML,

It is great to talk to you. Thank you for taking on the conversation.

Right, OpenBSD implements powernv meaning it runs on bare metal on
Power9, that is great.

What I wanted to ask about with this thread is:

To have the same utility of Power9 as of AMD64, it would be great to
have a high speed virtualizer, like what OpenBSD's VMM or Linux' KVM-
QEMU accomplish on AMD64.

Linux KVM-QEMU supports Power9 already so that's a great start: One
runs Linux powernv bare metal on Power9 hardware. Each VM is a
KVM-QEMU instance.

Is there any way today to make Linux-KVM-QEMU as VM host run
OpenBSD as a high speed (say >90% of bare metal performance, here
presume KVM uses PCIe passthrough) VM guest -

From the discussion I gather it's not possible without OpenBSD being
extended with pseries mode support, is it so?

(Great to see that Power hardware is on par with or faster than AMD64,
so the hardware part of this equation is clearly there: Power10 is
advertised to be released late this year, lithography will be down
from 14nm to 7, they say performance will 3x and electricity 1/3.)

Thanks!
Joseph

On Saturday, August 28th, 2021 at 7:06 PM, C=C3=A9dric Le Goater <clg@kaod.=
org> wrote:
> [ ... ]
>
> > OpenBSD probably uses XIVE in a different way than Linux though.
>
> If it is running under the skiboot firmware (Like on the Talos
>
> system), it is necessarily using an OPAL interface, either the
>
> P8 legacy interface (on top of XIVE HW) or the XIVE native
>
> interface.
>
> https://github.com/open-power/skiboot/blob/master/doc/opal-api/index.rst
>
> https://github.com/open-power/skiboot/blob/master/doc/xive.rst
>
> [ ... ]
>
> > qemu-system-ppc64 -M powernv9 -cpu power9 -m 2G -smp 1 \
> >
> > -serial mon:stdio \
> >
> > -device ich9-ahci,id=3Dahci0,bus=3Dpcie.0 \
> >
> > -device qemu-xhci,id=3Dusb0,bus=3Dpcie.2 \
> >
> > -bios /usr/local/share/qemu/skiboot.lid \
> >
> > -kernel ./pnor.BOOTKERNEL \
> >
> > -drive id=3Ddisk,file=3Dminiroot70.img,if=3Dnone \
> >
> > -device ide-hd,bus=3Dahci0.0,drive=3Ddisk \
> >
> > -drive id=3Ddisk1,file=3Dpower.img,if=3Dnone \
> >
> > -device ide-hd,bus=3Dahci0.1,drive=3Ddisk1 \
> >
> > -device e1000e,bus=3Dpcie.1
> >
> > miniroot70.img is the OpenBSD installer image that can be found at:
> >
> > http://cdn.openbsd.org/pub/OpenBSD/snapshots/powerpc64/miniroot70.img
> >
> > power.img is the disk image to install on; you can probably leave that =
out.
> >
> > Not sure where I got pnor.BOOTKERNEL from anymore.
>
> That's the file we would be interested in. I suppose this is the same
>
> image used to boot the Talos ?
>
> > This command boots into the installer, but hangs at the "Welcome to
> >
> > the OpenBSD installer" message. It is supposed to print a prompt
> >
> > after that, but that never happens.
>
> It shouldn't be too hard to debug with all the FW images.
>
> [ ... ]
>
> > > I thought the BSD folks were working on POWER9 baremetal support,
> > >
> > > PowerNV platform, on top of OPAL/skiboot. Is that completed ?
> >
> > Yup. OpenBSD boots fine on the Raptor Talos/Blackbird machines that we =
have.
>
> Great ! Where can we get the kernel/rootfs images loaded by skiboot ?
>
> That would make a good acceptance test for the QEMU PowerNV machines.
>
> Thanks,
>
> C.

