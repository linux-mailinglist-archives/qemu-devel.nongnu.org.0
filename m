Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEF98D746
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 17:36:54 +0200 (CEST)
Received: from localhost ([::1]:33462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxvKX-0001CQ-8P
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 11:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hxvJZ-0000jW-5h
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 11:35:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hxvJX-0006V3-GA
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 11:35:53 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:39643)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hxvJX-0006Uj-7P; Wed, 14 Aug 2019 11:35:51 -0400
Received: by mail-ed1-x543.google.com with SMTP id g8so1235170edm.6;
 Wed, 14 Aug 2019 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pS8sAqo4CXEt+MPxi+ManSNHUD69rQ7BWAECXMGINd8=;
 b=nT5agxux3zn3SlZPEzj4NbkDd9tG2emvd1ch+tsWgW55qB2L6hG2tFAF2Kk5lfZ1Mr
 LDjIzFAWrJnpcfnq/OLwU/iF2aNazfoCeDmZGMtq8HUb1cG9sxnx5aoJ+pMTzMq9NNsf
 YbXBm8YD3Tm/1kQZG9E9ruxm12rcgSs0L68er5Pl9Xo3z7IITunLS4+p6HlTI5UixKL7
 P0EVHMAYVklqP74mh9+f6V4wmPXgx3YNF77VXctjv88Xd+b/gxaJb5w0ObKE9bZUQV66
 w9fv8qchU9SBcYPSJGSP6X01HBNR0CUNzRUirVJuNEfd5Hqsitm1OM1FyTTS6PUdZ+yU
 nhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pS8sAqo4CXEt+MPxi+ManSNHUD69rQ7BWAECXMGINd8=;
 b=mGbtnGsBUQ2P5YwcJio/f/O6894krIZ24hHmRqb/RfUEmfUKMaI4XfrpGtHTOpc+EP
 +lgEk/X23a89RuoANte1UjItxs+YRGzgYr/eYFCiHNJ7twv3efnHlLtAE+WXiJptsOT+
 P4m5C9Y0QE+x8/AF6VK1DZuG/ltAJUSgZmPYjC95EA29QZGzHbUPmidxCrtYAfzbMM7k
 WputvHf94zpxHbhSfkV2QwdN6zKPgD4+kUlSFVMo9dHn4ri5SNd3gO0ejSRsIwW37/rz
 dlXxytVx3d8+4RCsHFSDVp2yrE4fLLv6kBUv7IDCU7wkCq7cWXMKlYRairzYrAFFJw6Y
 2dkg==
X-Gm-Message-State: APjAAAV6tBaOhdV048n1lMEjfashPTJ4LRAgob4kQ0MJBqB1rEq4KbiG
 G7Ek+YaMSO9m9r7F84MqnnceDDgWd0aUMBMDNbySw+fv
X-Google-Smtp-Source: APXvYqyl2EmcgvULCbkOFcxUpfL5py3UNJDIkW28Rat4p+d1dSDeqzMiwjFRW9fHsbHbfC18rpZhg2GsVsl785Nd1o8=
X-Received: by 2002:a50:fb82:: with SMTP id e2mr192665edq.15.1565796950022;
 Wed, 14 Aug 2019 08:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <1564577355-29273-1-git-send-email-bmeng.cn@gmail.com>
 <mhng-b5a2e14d-7a56-46ab-aaa2-96123b44c56b@palmer-si-x1e>
 <CAEUhbmXX1CzF7dWiSye7Qh+H=Zbp4uk3UKEx0iyjHEyDEoYfQQ@mail.gmail.com>
In-Reply-To: <CAEUhbmXX1CzF7dWiSye7Qh+H=Zbp4uk3UKEx0iyjHEyDEoYfQQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Aug 2019 23:35:38 +0800
Message-ID: <CAEUhbmXWm9+yRk_2rLJDL1G93dLwVr-DnE8o27GQn9VPknYOCw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-devel] [PATCH] riscv: hmp: Add a command to show virtual
 memory mappings
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Palmer,

On Wed, Aug 14, 2019 at 9:35 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Palmer,
>
> On Tue, Aug 13, 2019 at 11:18 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > On Wed, 31 Jul 2019 05:49:15 PDT (-0700), bmeng.cn@gmail.com wrote:
> > > This adds 'info mem' command for RISC-V, to show virtual memory
> > > mappings that aids debugging.
> > >
> > > Rather than showing every valid PTE, the command compacts the
> > > output by merging all contiguous physical address mappings into
> > > one block and only shows the merged block mapping details.
> > >
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > > ---
> > >
> > >  hmp-commands-info.hx       |   2 +-
> > >  target/riscv/Makefile.objs |   4 +
> > >  target/riscv/monitor.c     | 227 +++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 232 insertions(+), 1 deletion(-)
> > >  create mode 100644 target/riscv/monitor.c
> > >
> > > diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> > > index c59444c..257ee7d 100644
> > > --- a/hmp-commands-info.hx
> > > +++ b/hmp-commands-info.hx
> > > @@ -249,7 +249,7 @@ STEXI
> > >  Show virtual to physical memory mappings.
> > >  ETEXI
> > >
> > > -#if defined(TARGET_I386)
> > > +#if defined(TARGET_I386) || defined(TARGET_RISCV)
> > >      {
> > >          .name       = "mem",
> > >          .args_type  = "",
> > > diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
> > > index b1c79bc..a8ceccd 100644
> > > --- a/target/riscv/Makefile.objs
> > > +++ b/target/riscv/Makefile.objs
> > > @@ -1,5 +1,9 @@
> > >  obj-y += translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o gdbstub.o pmp.o
> > >
> > > +ifeq ($(CONFIG_SOFTMMU),y)
> > > +obj-y += monitor.o
> > > +endif
> > > +
> > >  DECODETREE = $(SRC_PATH)/scripts/decodetree.py
> > >
> > >  decode32-y = $(SRC_PATH)/target/riscv/insn32.decode
> > > diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> > > new file mode 100644
> > > index 0000000..30560ff
> > > --- /dev/null
> > > +++ b/target/riscv/monitor.c
> > > @@ -0,0 +1,227 @@
> > > +/*
> > > + * QEMU monitor for RISC-V
> > > + *
> > > + * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
> > > + *
> > > + * RISC-V specific monitor commands implementation
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify it
> > > + * under the terms and conditions of the GNU General Public License,
> > > + * version 2 or later, as published by the Free Software Foundation.
> > > + *
> > > + * This program is distributed in the hope it will be useful, but WITHOUT
> > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > > + * more details.
> > > + *
> > > + * You should have received a copy of the GNU General Public License along with
> > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "cpu.h"
> > > +#include "cpu_bits.h"
> > > +#include "monitor/monitor.h"
> > > +#include "monitor/hmp-target.h"
> > > +
> > > +#ifdef TARGET_RISCV64
> > > +#define PTE_HEADER_FIELDS       "vaddr            paddr            "\
> > > +                                "size             attr\n"
> > > +#define PTE_HEADER_DELIMITER    "---------------- ---------------- "\
> > > +                                "---------------- -------\n"
> > > +#else
> > > +#define PTE_HEADER_FIELDS       "vaddr    paddr            size     attr\n"
> > > +#define PTE_HEADER_DELIMITER    "-------- ---------------- -------- -------\n"
> > > +#endif
> > > +
> > > +/* Perform linear address sign extension */
> > > +static target_ulong addr_canonical(int va_bits, target_ulong addr)
> > > +{
> > > +#ifdef TARGET_RISCV64
> > > +    if (addr & (1UL << (va_bits - 1))) {
> > > +        addr |= (hwaddr)-(1L << va_bits);
> > > +    }
> > > +#endif
> > > +
> > > +    return addr;
> > > +}
> > > +
> > > +static void print_pte_header(Monitor *mon)
> > > +{
> > > +    monitor_printf(mon, PTE_HEADER_FIELDS);
> > > +    monitor_printf(mon, PTE_HEADER_DELIMITER);
> > > +}
> > > +
> > > +static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
> > > +                      hwaddr paddr, target_ulong size, int attr)
> > > +{
> > > +    /* santity check on vaddr */
> > > +    if (vaddr >= (1UL << va_bits)) {
> > > +        return;
> > > +    }
> > > +
> > > +    if (!size) {
> > > +        return;
> > > +    }
> > > +
> > > +    monitor_printf(mon, TARGET_FMT_lx " " TARGET_FMT_plx " " TARGET_FMT_lx
> > > +                   " %c%c%c%c%c%c%c\n",
> > > +                   addr_canonical(va_bits, vaddr),
> > > +                   paddr, size,
> > > +                   attr & PTE_R ? 'r' : '-',
> > > +                   attr & PTE_W ? 'w' : '-',
> > > +                   attr & PTE_X ? 'x' : '-',
> > > +                   attr & PTE_U ? 'u' : '-',
> > > +                   attr & PTE_G ? 'g' : '-',
> > > +                   attr & PTE_A ? 'a' : '-',
> > > +                   attr & PTE_D ? 'd' : '-');
> > > +}
> > > +
> > > +static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
> > > +                     int level, int ptidxbits, int ptesize, int va_bits,
> > > +                     hwaddr *vbase, hwaddr *pbase, hwaddr *last_paddr,
> > > +                     target_ulong *last_size, int *last_attr)
> > > +{
> > > +    hwaddr pte_addr;
> > > +    hwaddr paddr;
> > > +    target_ulong pgsize;
> > > +    target_ulong pte;
> > > +    int ptshift;
> > > +    int attr;
> > > +    int idx;
> > > +
> > > +    if (level < 0) {
> > > +        return;
> > > +    }
> > > +
> > > +    ptshift = level * ptidxbits;
> > > +    pgsize = 1UL << (PGSHIFT + ptshift);
> > > +
> > > +    for (idx = 0; idx < (1UL << ptidxbits); idx++) {
> > > +        pte_addr = base + idx * ptesize;
> > > +        cpu_physical_memory_read(pte_addr, &pte, ptesize);
> > > +
> > > +        paddr = (pte >> PTE_PPN_SHIFT) << PGSHIFT;
> > > +        attr = pte & 0xff;
> > > +
> > > +        /* PTE has to be valid */
> > > +        if (attr & PTE_V) {
> > > +            if (attr & (PTE_R | PTE_W | PTE_X)) {
> > > +                /*
> > > +                 * A leaf PTE has been found
> > > +                 *
> > > +                 * If current PTE's permission bits differ from the last one,
> > > +                 * or current PTE's ppn does not make a contiguous physical
> > > +                 * address block together with the last one, print out the last
> > > +                 * contiguous mapped block details.
> > > +                 */
> > > +                if ((*last_attr != attr) ||
> > > +                    (*last_paddr + *last_size != paddr)) {
> > > +                    print_pte(mon, va_bits, *vbase, *pbase,
> > > +                              *last_paddr + *last_size - *pbase, *last_attr);
> > > +
> > > +                    *vbase = start;
> > > +                    *pbase = paddr;
> > > +                    *last_attr = attr;
> > > +                }
> > > +
> > > +                *last_paddr = paddr;
> > > +                *last_size = pgsize;
> > > +            } else {
> > > +                /* pointer to the next level of the page table */
> > > +                walk_pte(mon, paddr, start, level - 1, ptidxbits, ptesize,
> > > +                         va_bits, vbase, pbase, last_paddr,
> > > +                         last_size, last_attr);
> > > +            }
> > > +        }
> > > +
> > > +        start += pgsize;
> > > +    }
> > > +
> > > +}
> > > +
> > > +static void mem_info_svxx(Monitor *mon, CPUArchState *env)
> > > +{
> > > +    hwaddr base;
> > > +    int levels, ptidxbits, ptesize, vm, va_bits;
> > > +    hwaddr vbase, pbase, last_paddr;
> > > +    target_ulong last_size;
> > > +    int last_attr;
> > > +
> > > +    base = get_field(env->satp, SATP_PPN) << PGSHIFT;
> > > +
> > > +    vm = get_field(env->satp, SATP_MODE);
> > > +    switch (vm) {
> > > +    case VM_1_10_SV32:
> > > +        levels = 2;
> > > +        ptidxbits = 10;
> > > +        ptesize = 4;
> > > +        break;
> > > +    case VM_1_10_SV39:
> > > +        levels = 3;
> > > +        ptidxbits = 9;
> > > +        ptesize = 8;
> > > +        break;
> > > +    case VM_1_10_SV48:
> > > +        levels = 4;
> > > +        ptidxbits = 9;
> > > +        ptesize = 8;
> > > +        break;
> > > +    case VM_1_10_SV57:
> > > +        levels = 5;
> > > +        ptidxbits = 9;
> > > +        ptesize = 8;
> > > +        break;
> > > +    default:
> > > +        g_assert_not_reached();
> > > +        break;
> > > +    }
> > > +
> > > +    /* calculate virtual address bits */
> > > +    va_bits = PGSHIFT + levels * ptidxbits;
> > > +
> > > +    /* print header */
> > > +    print_pte_header(mon);
> > > +
> > > +    vbase = -1;
> > > +    pbase = -1;
> > > +    last_paddr = -1;
> > > +    last_size = 0;
> > > +    last_attr = 0;
> > > +
> > > +    /* walk page tables, starting from address 0 */
> > > +    walk_pte(mon, base, 0, levels - 1, ptidxbits, ptesize, va_bits,
> > > +             &vbase, &pbase, &last_paddr, &last_size, &last_attr);
> > > +
> > > +    /* don't forget the last one */
> > > +    print_pte(mon, va_bits, vbase, pbase,
> > > +              last_paddr + last_size - pbase, last_attr);
> > > +}
> > > +
> > > +void hmp_info_mem(Monitor *mon, const QDict *qdict)
> > > +{
> > > +    CPUArchState *env;
> > > +
> > > +    env = mon_get_cpu_env();
> > > +    if (!env) {
> > > +        monitor_printf(mon, "No CPU available\n");
> > > +        return;
> > > +    }
> > > +
> > > +    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
> > > +        monitor_printf(mon, "S-mode MMU unavailable\n");
> > > +        return;
> > > +    }
> > > +
> > > +    if (env->priv_ver < PRIV_VERSION_1_10_0) {
> > > +        monitor_printf(mon, "Privileged mode < 1.10 unsupported\n");
> > > +        return;
> > > +    }
> > > +
> > > +    if (!(env->satp & SATP_MODE)) {
> > > +        monitor_printf(mon, "No translation or protection\n");
> > > +        return;
> > > +    }
> > > +
> > > +    mem_info_svxx(mon, env);
> > > +}
> >
> > Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> >
> > I'm putting this in the RISC-V tree with David's Acked-by, LMK if you want me
> > to do something else.
>
> Thanks, but please apply the v3 patch:
> http://patchwork.ozlabs.org/patch/1145744/

Sorry, please apply the v4 patch below which is essentially v2, as I
figured out that v3 is not necessary.
http://patchwork.ozlabs.org/patch/1147104/

Regards,
Bin

