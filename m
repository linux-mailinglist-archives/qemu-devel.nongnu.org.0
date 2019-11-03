Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E8ED509
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Nov 2019 22:09:38 +0100 (CET)
Received: from localhost ([::1]:56280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRN7x-0000Ms-Fn
	for lists+qemu-devel@lfdr.de; Sun, 03 Nov 2019 16:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1iRN2F-00056n-Cc
 for qemu-devel@nongnu.org; Sun, 03 Nov 2019 16:03:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1iRN2E-0004lo-0c
 for qemu-devel@nongnu.org; Sun, 03 Nov 2019 16:03:43 -0500
Received: from shroom.duncanthrax.net ([2a01:4f8:121:41fa::169]:53093
 helo=smtp.duncanthrax.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1iRN2D-0004l7-Q1
 for qemu-devel@nongnu.org; Sun, 03 Nov 2019 16:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4n4kODalh5xAZmesm+ptfcKHNEoTbfNUl5mXiZ9kXcI=; b=h+Wpuy+30KbXsK76SzRxylKxqN
 P0CgRobSWD/XD2ypv9e5y3DtIm9IrzU6czztCdvNzcMI8bsXMC3XP4DPW3boZMc23mTYe8CLP6yZJ
 VafIoVCVw3dnAM1CFNFS0OueDLsXoTXxplCOMacT1NgY9YZqZvLwuqXe47phy+vJ0vdE=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de
 ([46.5.233.221] helo=t470p.stackframe.org)
 by smtp.duncanthrax.net with esmtpa (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>)
 id 1iRN2A-0005DB-Dr; Sun, 03 Nov 2019 22:03:38 +0100
Date: Sun, 3 Nov 2019 22:03:37 +0100
From: Sven Schnelle <svens@stackframe.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v3 5/6] hppa: Add emulation of Artist graphics
Message-ID: <20191103210337.GA6640@t470p.stackframe.org>
References: <20191022205941.23152-1-svens@stackframe.org>
 <20191022205941.23152-6-svens@stackframe.org>
 <b91ee508-2ae4-0307-561a-f930a7709404@ilande.co.uk>
 <20191025093159.GA4261@stackframe.org>
 <1a414492-1623-5620-9e5b-097b45fc746a@ilande.co.uk>
 <20191026175439.GA10792@stackframe.org>
 <20191101215943.GB9053@t470p.stackframe.org>
 <02ba4a0c-97f8-766d-08dd-caff9f448e5f@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02ba4a0c-97f8-766d-08dd-caff9f448e5f@ilande.co.uk>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:121:41fa::169
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
Cc: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On Sun, Nov 03, 2019 at 08:56:43PM +0000, Mark Cave-Ayland wrote:
> On 01/11/2019 21:59, Sven Schnelle wrote:
> 
> > On Sat, Oct 26, 2019 at 07:54:40PM +0200, Sven Schnelle wrote:
> >> Hi Mark,
> >>
> >> On Sat, Oct 26, 2019 at 10:35:20AM +0100, Mark Cave-Ayland wrote:
> >>
> >>>> However, the VRAM in Artist is not really exposed to the Host. Instead,
> >>>> there's the Chipset inbetween that can do byte swapping (Colormap is LE,
> >>>> VRAM is BE) and Bit-to-Byte/Word/Dword conversion. For example you could
> >>>> write 0x55 into that VRAM region, and the chipset would expand that to
> >>>> VRAM Bytes: 00 01 00 01 00 01 00 01. And to make it even worse emulation
> >>>> wise it can also do different encodings for Read or Write accesses, and
> >>>> mask out certain bits of the data. So after trying to convert it to the
> >>>> "dirty bitmap" API i decided to just leave it as it is. The CPU load
> >>>> used by the display update code is usually < 1%, so it's ok for me.
> >>>
> >>> Wow that sounds that some interesting hardware(!). Does it make sense to model the
> >>> behaviour of the chipset separately using a proxy MemoryRegion similar to virtio i.e.
> >>> introduce an intermediate IO MemoryRegion that does the swapping and then forward it
> >>> onto the VRAM MemoryRegion?
> >>
> >> Thanks for the pointer, i'll check whether that would work. For now i
> >> think i'll remove the Artist patch from the series, so we can apply the
> >> other patches, and i'll re-submit Artist when it's done. I guess the
> >> rewrite to use a MemRegion is a bit bigger. But i would to get the other
> >> patches in especially the LASI Stuff as both Helge and i have a lot of
> >> stuff depending on that.
> > 
> > I've looked into it again and changed my mind. There are at least the following
> > functions that the Artist chip does before a Read/Write is passed to/from VRAM:
> > 
> > - endianess conversion (actually configurable via some register, but i don't
> >   know how and hardwired it depending on CMAP / FB access)
> > 
> > - The Address passed on the System bus are the X/Y coordinates added to the FB
> >   base address in the selected buffer instead of the VRAM offset for pixel data.
> >   I think that's configurable via the some registers, but i don't know how.
> >   Unfortunately there's absolutely no documentation about Artist available and
> >   everything was developed by reverse engineering.
> > 
> > - bitmap to Byte/Word conversion (not implemented yet for the VRAM window, only
> >   for the I/O register window)
> > 
> > So in my opinion it's way to much effort to squeeze all of that into the memory
> > space, and it is not really a Memory range that's just behind a bus bridge.
> 
> Hi Sven,
> 
> Certainly in some cases it isn't possible to model devices in QEMU exactly as real
> hardware, although I think that some of the ideas above could be used to improve the
> implementation without too much extra effort.
> 
> Then again from my work on QEMU I completely understand that sometimes this can be
> difficult with older, more esoteric devices. Ultimately after review that decision
> has to come from the maintainer(s) for the relevant devices/machines, so I guess that
> would be Richard and/or Gerd in this case?

I think that would be Richard. I rewrote the code to at least use the generic
framebuffer functions now, and added dirty memory tracking. I'm still not happy
with all the endianess conversion that are going on, but without any
Documentation about chip it's impossible to say how the chip really works.

Regards
Sven

