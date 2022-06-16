Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2BE54D861
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 04:34:46 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1fLJ-00038T-Fo
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 22:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1fJh-0002SQ-SD
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 22:33:05 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1fJg-0003VT-Aj
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 22:33:05 -0400
Received: by mail-pl1-x62c.google.com with SMTP id o17so166971pla.6
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 19:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lknBF9R+/D/VTPtV7kvv3szVZSItPpmPOTNpVhME0I0=;
 b=gKRojesdpb36PaHE8nw+eZYf5G+WyIGyTIgUm8rzzOV/wnRI0XWZjN/p0bkX/r7heV
 q5vyYpt0fgPwVz3q9Heqq4U/ooc57ef0Nd5kgVCXm3hytNaqt3MthZaUhncyT5MXqQY2
 2bgaFvce0eVkyIVa5wEAbl3wNeeaea0iPPl8HalJMU97vAyUAqEgdSCz51U1pceryymU
 m6crc80vS4NadtZWM4f0zDrmj/ylbAWnPeUe8BRoIm+Zig2sT/JGZMD/tlzZh1LNGSIt
 8dJidJhfxNttbZ6zbG2C3i8deC1V261J5wlutV7iJ+vJigDjkrGsz/bsqVDJPbysTWGg
 P0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lknBF9R+/D/VTPtV7kvv3szVZSItPpmPOTNpVhME0I0=;
 b=IcxcNIdZcGrPgh28F3EBcrZ6aGr1/mMmwvPl8N66uQgbQGLwiiTNv/TL40Xa0p3/Ko
 d9kDPJzpkq1TBk7vHU4DcFnATDgkAY8K9bdsIVnUMjvF+vW3ghOhUXoKynhWRNM/mXhG
 jdDhUHwU3GaOb2IxNxlV9BmYyBbmlXa3B9wQsicHAJiBjFjRBh7KmLPLh1j8UQ60ivMd
 u3PXhdgpOhJoyfXjqYNLUxjJAO43ei3ZSGmIHTX0hDrYB5Ni6H0GKDH1QxUsliplurmu
 IkxZug1Hmv+B+2NOOQNQRUm/e0nsfnWenMY2CkAcMUaXyJJA35Sd+ZMTb6DaHxWwPexh
 xVBw==
X-Gm-Message-State: AJIora8oala/8S7QafDiR/HUkg/Fu6Pic37TxHdIpJJBhLVWRyDizkd5
 QY89RMFcjrT8izonCxhg55+bQGehR+EnfFZtoN4UyDdIMOrRKw==
X-Google-Smtp-Source: AGRyM1trhf9wxA0aPdzuBqyaueq1Fi0EkERs/SaxhwFV8o9wW0DTLqw+bScf87Xfy5bp97tTzz4HbbukSnl4p179rFI=
X-Received: by 2002:a17:90b:3e85:b0:1e8:8f2f:bd2f with SMTP id
 rj5-20020a17090b3e8500b001e88f2fbd2fmr2645399pjb.120.1655346782827; Wed, 15
 Jun 2022 19:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAEUhbmX8hOuhHrT1xx3HrgUt5jZvO_jUN+64RPWfZADKCbGvKg@mail.gmail.com>
In-Reply-To: <CAEUhbmX8hOuhHrT1xx3HrgUt5jZvO_jUN+64RPWfZADKCbGvKg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jun 2022 12:32:36 +1000
Message-ID: <CAKmqyKOO1o9BX66pNd3fevkK5URnHqefkbnuJqBrqYt4=4VXdA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 15, 2022 at 2:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jun 13, 2022 at 8:08 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> > initialize early. Set this using the usual guest random number
> > generation function. This is confirmed to successfully initialize the
> > RNG on Linux 5.19-rc2.
> >
> > Cc: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks!

Applied to riscv-to-apply.next with the full stop removed

Alistair

> > ---
> >  hw/riscv/virt.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index bc424dd2f5..368a723bf6 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -21,6 +21,7 @@
> >  #include "qemu/osdep.h"
> >  #include "qemu/units.h"
> >  #include "qemu/error-report.h"
> > +#include "qemu/guest-random.h"
> >  #include "qapi/error.h"
> >  #include "hw/boards.h"
> >  #include "hw/loader.h"
> > @@ -998,6 +999,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
> >      MachineState *mc = MACHINE(s);
> >      uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
> >      uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
> > +    uint8_t rng_seed[32];
> >
> >      if (mc->dtb) {
> >          mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
> > @@ -1046,6 +1048,10 @@ update_bootargs:
> >      if (cmdline && *cmdline) {
> >          qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
> >      }
> > +
> > +    /* Pass seed to RNG. */
>
> nits: please remove the ending period
>
> > +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> > +    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
> >  }
> >
> >  static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> > --
>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>

