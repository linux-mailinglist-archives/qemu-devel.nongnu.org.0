Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8C95D6C2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 21:18:16 +0200 (CEST)
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiOIA-00060t-GO
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 15:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52890)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hiLxf-0008P2-6X
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:48:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hiLxc-0005s5-Np
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:48:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38445)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hiLxW-0005as-Im; Tue, 02 Jul 2019 12:48:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E704E307D84D;
 Tue,  2 Jul 2019 16:48:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 641D71001B20;
 Tue,  2 Jul 2019 16:48:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0227C11AB8; Tue,  2 Jul 2019 18:48:35 +0200 (CEST)
Date: Tue, 2 Jul 2019 18:48:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190702164835.3lnefzrbimltb2h6@sirius.home.kraxel.org>
References: <20190628103957.9504-1-kraxel@redhat.com>
 <CAFEAcA9Dh2EaPkcDmErEdJN+BknuRHvZKe5veOcY_7hMVEXiVQ@mail.gmail.com>
 <CAFEAcA8W6OkDa8cY-YWq7dFeFoZENFiEPNfB3Hy3XQPe6GN2rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8W6OkDa8cY-YWq7dFeFoZENFiEPNfB3Hy3XQPe6GN2rw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 02 Jul 2019 16:48:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 0/6] Vga 20190628 patches
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 02, 2019 at 02:47:12PM +0100, Peter Maydell wrote:
> On Tue, 2 Jul 2019 at 10:17, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 28 Jun 2019 at 11:40, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:
> > >
> > >   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kraxel.org/qemu tags/vga-20190628-pull-request
> > >
> > > for you to fetch changes up to 263807f4e85e94f2d4e988d61d2fc0319b1dd36b:
> > >
> > >   ati-vga: switch to vgabios-ati.bin (2019-06-28 10:49:36 +0200)
> > >
> > > ----------------------------------------------------------------
> > > vga: ati fixes, add ati vgabios.
> > >
> > > ----------------------------------------------------------------
> > >
> > > BALATON Zoltan (3):
> > >   i2c: Move bitbang_i2c.h to include/hw/i2c/
> > >   ati-vga: Implement DDC and EDID info from monitor
> > >   ati-vga: Fixes to offset and pitch registers
> > >
> > > Gerd Hoffmann (3):
> > >   seabios: add config for ati vgabios
> > >   seabios: add ati vgabios binary
> > >   ati-vga: switch to vgabios-ati.bin
> > >
> >
> > Applied, thanks.
> >
> > Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
> > for any user-visible changes.
> 
> Hmm, the bitbang-i2c changes in this pull seem to have broken
> patchew's asan build:
> https://patchew.org/logs/20190628103957.9504-1-kraxel@redhat.com/testing.asan/?type=message
> 
> (probably because now we're using and testing the buggy
> code in a way we weren't before)

Hmm.  Yes, gpio_i2c_init() allocates memory (in inlined
bitbang_i2c_init).  There is no exit() function so the
memory is never freed indeed.  On the other hand i2c
devices are not really hotpluggable, so maybe we only
need to tag it that way?

cheers,
  Gerd


