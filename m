Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF80E162D69
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 18:50:47 +0100 (CET)
Received: from localhost ([::1]:39482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j471C-0004s4-Oz
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 12:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j470B-0004GW-CB
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 12:49:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j4709-0005Qr-V8
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 12:49:43 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40534)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>) id 1j4709-0005QI-OQ
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 12:49:41 -0500
Received: by mail-pg1-x544.google.com with SMTP id z7so11297815pgk.7
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 09:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zUciNqnSOaXu2c5dSMykJbRk9+keVgtePhn1PpWtITU=;
 b=kwAOSTUHQCziXjD+chbgcs1Kei1L5OST/0QvgzUm3bZuRi9yBqBwkVuFO3iCx4Kr3c
 mkN3vJor32mt7IvR4WHrpXoZiLY9C1jvw/kEtKm5yb1exQraER0rGclIuNXk/QkE2APk
 DwAQxKxUUclviHzhrxev/paY83mljZ0PO5+zBpcVkzgTwyCQ4aP3666Y+tASC5sEBnHW
 9YA86Ohvq+mn944qTOYISG6NsIWgvLJqkZwO38IaKodeu4TeE44wNOCuaM4w8lnx4Uwd
 Pnkni0b54xA8HFTyPcfSROEFz8eSmoQaMHcoLeDlCwsCJEV8oRF2dzyDaMzIpACLb+Wr
 mAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=zUciNqnSOaXu2c5dSMykJbRk9+keVgtePhn1PpWtITU=;
 b=TxajxY3MyUWe9kqIJVfz5pOiFKHs4UzviR5RPEfX5LBUbTX/ZsdXQLzPR4zWqfpueH
 BW94mHTrqrXQsEOe1arMlmSxBZM8wXwUMux6wSjqVMqQAIEKZe9kzNa8bkiPlH1u/M36
 izQLtnuac5AXxGRZnLAg0PFPIUKfmPP7c7WIFGDLBimAf/IknY3BVnlxfm59HL1hPUzN
 TMDEVexDfTw4ayS54vAWLyh9obOYuYdv9cAo4WhdGb66IHqFs4YS1x3eROdYR1z0Pw75
 vIva+iJl8fOOfuKnZNJS8KYM9n/269NGxxJYULeEfpLx7ttXnFiZb8Ksfp76532m1qVB
 lDXA==
X-Gm-Message-State: APjAAAVi4OizdY9kOIyJmzgpPLlZdIOaL1BCh8L6jUZtEnBU+BEN78S3
 bcboh9RuPMyu5qRKyuI7xL0=
X-Google-Smtp-Source: APXvYqyOedgs49QSfYgV1Y8WGmhSrY4VyKn+2cEv138d0XhNOftsBpS72n0XdvaZUnRw1O44mWXM6A==
X-Received: by 2002:a63:2cc9:: with SMTP id
 s192mr23256425pgs.441.1582048180447; 
 Tue, 18 Feb 2020 09:49:40 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id g2sm5593837pgn.59.2020.02.18.09.49.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Feb 2020 09:49:39 -0800 (PST)
Date: Tue, 18 Feb 2020 09:49:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] sh4: Remove bad memory alias 'sh_pci.isa'
Message-ID: <20200218174938.GA30564@roeck-us.net>
References: <20200217203734.18703-1-linux@roeck-us.net>
 <CAFEAcA9v+9ohanZFGTgT1SLgNCnqZccnhcbsxm0MuNYQ_WSgjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9v+9ohanZFGTgT1SLgNCnqZccnhcbsxm0MuNYQ_WSgjQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 18, 2020 at 04:33:49PM +0000, Peter Maydell wrote:
> On Mon, 17 Feb 2020 at 20:38, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > The memory alias sh_pci.isa is located at address 0x0000 with
> > a length of 0x40000. This results in the following memory tree.
> >
> > FlatView #1
> >  AS "memory", root: system
> >  AS "cpu-memory-0", root: system
> >  AS "sh_pci_host", root: bus master container
> >  Root memory region: system
> >   0000000000000000-000000000000ffff (prio 0, i/o): io
> >   0000000000010000-0000000000ffffff (prio 0, i/o): r2d.flash @0000000000010000
> >
> > The alias overlaps with flash memory. As result, flash memory can
> > not be accessed. Removing the alias fixes the problem. With this patch,
> > the memory tree is as follows, and flash is detected as expected.
> >
> > FlatView #1
> >  AS "memory", root: system
> >  AS "cpu-memory-0", root: system
> >  AS "sh_pci_host", root: bus master container
> >  Root memory region: system
> >   0000000000000000-0000000000ffffff (prio 0, i/o): r2d.flash
> >
> > After this patch has been applied, access to PCI, ATA, and USB is still
> > working, and no negative impact has ben observed.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  hw/sh4/sh_pci.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
> > index 71afd23b67..4ced54f1a5 100644
> > --- a/hw/sh4/sh_pci.c
> > +++ b/hw/sh4/sh_pci.c
> > @@ -143,8 +143,6 @@ static void sh_pci_device_realize(DeviceState *dev, Error **errp)
> >                            "sh_pci", 0x224);
> >      memory_region_init_alias(&s->memconfig_a7, OBJECT(s), "sh_pci.2",
> >                               &s->memconfig_p4, 0, 0x224);
> > -    memory_region_init_alias(&s->isa, OBJECT(s), "sh_pci.isa",
> > -                             get_system_io(), 0, 0x40000);
> >      sysbus_init_mmio(sbd, &s->memconfig_p4);
> >      sysbus_init_mmio(sbd, &s->memconfig_a7);
> >      s->iobr = 0xfe240000;
> > --
> 
> This change doesn't look correct. This removes the init of the alias MR,
> but we continue to use it in other parts of the code -- we will
> add it to the system memory at 0xfe240000 and we will remap it
> at different addresses when the guest writes to the 0x1c8 "IO space
> base" register.
> 
> This alias is for the ISA I/O region bridge; the code initially
> maps it at a non-zero address:
>     s->iobr = 0xfe240000;
>     memory_region_add_subregion(get_system_memory(), s->iobr, &s->isa);
> so it's not entirely clear how it ends up at 0. You could try
> sticking a printf into sh_pci_reg_write() to see if we end
> up taking that code path to modify the address for it, which
> is the most plausible reason for it to be at 0, I think.
> 

Yes, that is what happens.

###### sh_pci_reg_write(addr=0x1c8, val=0x0, size=4)

> I think the problem here is that our implementation of the
> IO space base register is simply completely wrong.
> 
> Conveniently, the SSH7751R "user's manual: hardware" seems to
> still be downloadable from Renesas at
> https://www.renesas.com/br/en/document/hw-manual?hwLayerShowFlg=true&prdLayerId=1057&layerName=SH7751R&coronrService=document-prd-search&hwDocUrl=%2Fpt-br%2Fdoc%2Fproducts%2Fmpumcu%2F001%2Fr01uh0457ej0401_sh7751.pdf&hashKey=a503c1946f0bcc913aaf89f48dd15b53
> -- hopefully that URL
> works for others and not just me.
> 
> Section 22.3.7 and in particular figure 22.3 are clear
> about how this is supposed to work: there is a window
> at 0xfe240000 in the system register space for PCI I/O
> space. When the CPU makes an access into that area,
> the PCI controller calculates the PCI address to use
> by combining bits 0..17 of the system address with the
> bits 31..18 value that the guest has put into the PCIIOBR.
> That is, writing to the PCIIOBR changes which section of
> the IO address space is visible in the 0xfe240000 window.
> Instead what QEMU's implementation does is move the
> window to whatever value the guest writes to the PCIIOBR
> register -- so if the guest writes 0 we put the window at
> 0 in system address space.
> 
> I think the correct fix would be to have the handling of
> PCIIOBR call memory_region_set_alias_offset() (thus updating
> where this alias window points within the system IO space),
> rather than doing the del/add subregion calls.
> 
Like this ?

--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -67,12 +67,7 @@ static void sh_pci_reg_write (void *p, hwaddr addr, uint64_t val,
         pcic->mbr = val & 0xff000001;
         break;
     case 0x1c8:
-        if ((val & 0xfffc0000) != (pcic->iobr & 0xfffc0000)) {
-            memory_region_del_subregion(get_system_memory(), &pcic->isa);
-            pcic->iobr = val & 0xfffc0001;
-            memory_region_add_subregion(get_system_memory(),
-                                        pcic->iobr & 0xfffc0000, &pcic->isa);
-        }
+        memory_region_set_alias_offset(&pcic->isa, val & 0xfffc0000);
         break;

This works for me as well. Please let me know if it is correct (especially
the mask), and I'll resubmit.

Thanks,
Guenter

