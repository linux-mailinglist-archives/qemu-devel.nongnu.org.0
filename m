Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D6EF5127
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 17:32:29 +0100 (CET)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT7BS-0006Mp-Gp
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 11:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iT78I-0004Yi-SY
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 11:29:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iT78H-0007zw-S5
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 11:29:10 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:44534)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iT78H-0007z4-KU; Fri, 08 Nov 2019 11:29:09 -0500
Received: by mail-lj1-x241.google.com with SMTP id g3so6830211ljl.11;
 Fri, 08 Nov 2019 08:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2EP7wzCUQn8ClW49ZkYJ2vk+A42uQE97hL6HqnEcnSU=;
 b=f7N9mmgBicl5x3TJs/MmnSx+Wywdwo1JQzNPqAXL+536+N36ppmGi5ayeRu8laoJ2k
 edCU6gjxaCyjApx1UfdB8GUhUMqN/BFARs9oXYhtER2WqyEcveaO2qfmMNrIrDYEWvpq
 snyab6RgPtHSw6mOfAAXAJtGTGpwSzheD+QRDIf8Om6/J4AUMQhwYkSyZ/HkY96YJeiX
 vBNdQF6YDSetGgG4x1WGJ7wn3lfBAQHIXwpVY+PC2u1BR4NMuCWtcfMMC4vEfrDrNko1
 +mgHRZKHwuTWHXtw+kqMVBSK7IaySh28/ZmZNEgvG9r02hhSPel4AmitaAZVtRqIwRA4
 LHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2EP7wzCUQn8ClW49ZkYJ2vk+A42uQE97hL6HqnEcnSU=;
 b=GVrTr6q4NdCGQzHUvN0A0XMOkt4xBRB1BwpLvir2k2IWLZqB4x5/yjltJaFxTgSiGK
 nbLGhrPQvzjYdKPbTb8GFGHIc0wJjE81QB6eu/IOk6M1GUCFbFTYY8RyuzuqmvHJuKrN
 ZjsWh+Cof3J31EOHNq3bNvIt+HFbVtnqWyXlOszOfXHaY2MwIexW1inHb9FoJ+DowHbu
 qCGGlyqF+2EbPVD50FCDRI6R0TPD2COCxISsoqTMq5cWK7ZFJIHjDDn8CzwDtSBQWVQf
 iNIVwPWltD9PBq9xCslTgCFSYakxV6Yr2cmVUW6dHQln754Yg8oAG0JRcyl+QdQpW6ds
 iz3Q==
X-Gm-Message-State: APjAAAVoPl+O8Y1xOrXROkfU2w/qT2GsCd6D46kuQ1l9SkaGb/xSDrNI
 iblebrafTfBBAXbYOwb8Ulgm5xFU3wshDWoZwW4=
X-Google-Smtp-Source: APXvYqywLW1OiKc2JJ2yN9wo96vKNLbdDVwIgqTmTv134nojaggP0HbNalMUhTG1T/9/uklajtT8bK7KxYajERKFOhs=
X-Received: by 2002:a2e:420a:: with SMTP id p10mr7700622lja.16.1573230547906; 
 Fri, 08 Nov 2019 08:29:07 -0800 (PST)
MIME-Version: 1.0
References: <03c2f42b32fb4e304319c241122ae83584f085e0.1573087610.git.alistair.francis@wdc.com>
 <mhng-35530489-a164-4825-90da-e550083fef9d@palmer-si-x1c4>
In-Reply-To: <mhng-35530489-a164-4825-90da-e550083fef9d@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Nov 2019 08:28:41 -0800
Message-ID: <CAKmqyKNfhsmHK2tnsyEHddTaSJLY5hRL+E7K8ZL7UN8KgWz4wQ@mail.gmail.com>
Subject: Re: [PATCH for 4.2 v1 1/1] riscv/virt: Increase flash size
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 7, 2019 at 8:58 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 06 Nov 2019 16:47:20 PST (-0800), Alistair Francis wrote:
> > Coreboot developers have requested that they have at least 32MB of flash
> > to load binaries. We currently have 32MB of flash, but it is split in
> > two to allow loading two flash binaries. Let's increase the flash size
> > from 32MB to 64MB to ensure we have a single region that is 32MB.
> >
> > No QEMU release has include flash in the RISC-V virt machine, so this
> > isn't a breaking change.
>
> Even if we had, I wouldn't consider it a breaking change because it adds to
> the memory map so existing programs will continue to run fine.
>
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/virt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index cc8f311e6b..23f340df19 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -62,7 +62,7 @@ static const struct MemmapEntry {
> >      [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
> >      [VIRT_UART0] =       { 0x10000000,         0x100 },
> >      [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
> > -    [VIRT_FLASH] =       { 0x20000000,     0x2000000 },
> > +    [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
> >      [VIRT_DRAM] =        { 0x80000000,           0x0 },
> >      [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
> >      [VIRT_PCIE_PIO] =    { 0x03000000,    0x00010000 },
>
> Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
>
> I'll include this in my next PR, which should be soon -- I was about to send
> it, but figure I should look at my email first :)

Ping! I want to make sure the current patches you have make it into 4.2.

Alistair

