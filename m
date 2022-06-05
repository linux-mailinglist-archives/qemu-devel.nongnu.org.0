Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D068A53D949
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 04:37:41 +0200 (CEST)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxg96-00022X-CW
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 22:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nxg84-0001LP-HC
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 22:36:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nxg7v-0006nE-10
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 22:36:36 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so9962188pjt.4
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 19:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uJ1zOTL1wOn/rNpj6eR5rWvOMwV79LKxVRcBqz8TgJQ=;
 b=O68A06G2OdVYZzKIL1Je/VSiBRIqlMZIS7HC8d4tZpODFiFAw3dZyjCz0uFZXFQTe7
 cnMJp3cjocFO//rQTIcWq2nY/mFt2sTKcSaDGO1pDcDfS2vm4jRHDWeDH5f8gBY2WNY3
 xfkd3s0qlnnlHLiyh0YxnFwlP4Jqb5z5LpUo1YZ3pBytrQJyb9yd/ZhYi0fnDfmC3aRt
 RvAnG+iSf+SG+lQOEU8dHP2yAWtPQOp19xQA6KHSRi2g9bWgHahtcjr9OA0wpM05iZCF
 sL3KONkVsctlAM6wNfH54Wku7DllrbSRUMUqzZRf77GK6IRCLRyEzaYrSndvYMQtFThO
 KRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uJ1zOTL1wOn/rNpj6eR5rWvOMwV79LKxVRcBqz8TgJQ=;
 b=qBpztGLs05MJwQHZXx+Vw4YbiCvxb4vKVkOT1OnbxDq2qpgSZNiT4xrxyxUrAamZ3L
 BMVr7JtmWua2yFav/lrULs6IrZbJ1t4MHSsaEMEiKfm0jz+sksAyBPfItGqzBeZkNsEr
 zpwYkfEIRSuPV1BYnNF7vzWdpYqP3N3++pImmlVouGFgmB006LzECogKAI199Ow4E9Wl
 WdX20g/HyL3xjNQ1O6a0O+JhZQC8yyvI4tb6fuY1en8j/7hCYKlnnCL6ki1rZfGUEnt8
 geMn9Q8UyJHS7dZcuLR2p5MFobhcdULrzWRdQd/F+ZoDP/x2LUEMHkT8IfcsTRAkyvTb
 PKoA==
X-Gm-Message-State: AOAM532xc2vJ22rJo+E1/2+AKsjh1tDMHSMR1l6EJxObhsWxKHMYa7xF
 lDt5Xb0V5d2ZltxGcrmlqxg=
X-Google-Smtp-Source: ABdhPJzFziDi2AN+BZtCxPXcEjoqKYFNl4nCNtSjKhBP/C2J/YquvfJiGHf0YCQ/fRaqff2n36W2oQ==
X-Received: by 2002:a17:902:b215:b0:165:7bdd:a9f1 with SMTP id
 t21-20020a170902b21500b001657bdda9f1mr17686654plr.41.1654396585199; 
 Sat, 04 Jun 2022 19:36:25 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa78f19000000b0051bfd13809fsm1393944pfr.119.2022.06.04.19.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jun 2022 19:36:24 -0700 (PDT)
Date: Sun, 5 Jun 2022 11:36:22 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
Message-ID: <YpwWpifmE4vvDJjn@antec>
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jun 02, 2022 at 11:42:30AM +0000, Joel Stanley wrote:
> Hi Stafford,
> 
> On Fri, 27 May 2022 at 17:27, Stafford Horne <shorne@gmail.com> wrote:
> >
> > This patch add the OpenRISC virtual machine 'virt' for OpenRISC.  This
> > platform allows for a convenient CI platform for toolchain, software
> > ports and the OpenRISC linux kernel port.
> >
> > Much of this has been sourced from the m68k and riscv virt platforms.
> 
> It's a good idea! I did some playing around with your patch today.
> 
> I'd suggest adding something to docs/system/target-openrsic.rst,
> including an example command lines.

Yeah, good idea, this is the command I am using:

qemu-system-or1k -cpu or1200 -M virt \
  -kernel /home/shorne/work/linux/vmlinux \
  -initrd /home/shorne/work/linux/initramfs.cpio.gz \
  -device virtio-net-device,netdev=user -netdev user,id=user,net=10.9.0.1/24,host=10.9.0.100 \
  -serial mon:stdio -nographic \
  -device virtio-blk-device,drive=d0 -drive file=/home/shorne/work/linux/virt.qcow2,id=d0,if=none,format=qcow2 \
  -gdb tcp::10001 -smp cpus=2 -m 64

I should have mentioned it but the config I am using is here:

  https://github.com/stffrdhrn/linux/commits/or1k-virt

> >
> > The platform provides:
> >  - OpenRISC SMP with up to 8 cpus
> 
> You have this:
> 
> #define VIRT_CPUS_MAX 4
> i
> I tried booting with -smp 4 and it locked up when starting userspace
> (or I stopped getting serial output?):
> 
> [    0.060000] smp: Brought up 1 node, 4 CPUs
> ...
> [    0.960000] Run /init as init process
> 
> Running with -smp 2 and 3 worked. It does make booting much much slower.

Right, it should be 4, I just write 8 from memory.  You are also, right I have
issues with running 4 CPU's.  I will try richard's suggestion.  I have some old
patches to configure MTTCG also, but it had some limitations.  I will dig those
up and get this fixed for this series.

> >  - Generated RTC to automatically configure the guest kernel
> 
> Did you mean device tree?

Yeah, thats what I meant.

> >
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >  configs/devices/or1k-softmmu/default.mak |   1 +
> >  hw/openrisc/Kconfig                      |   9 +
> >  hw/openrisc/meson.build                  |   1 +
> >  hw/openrisc/virt.c                       | 429 +++++++++++++++++++++++
> >  4 files changed, 440 insertions(+)
> >  create mode 100644 hw/openrisc/virt.c
> >
> > diff --git a/configs/devices/or1k-softmmu/default.mak b/configs/devices/or1k-softmmu/default.mak
> > index 5b3ac89491..f3bf816067 100644
> > --- a/configs/devices/or1k-softmmu/default.mak
> > +++ b/configs/devices/or1k-softmmu/default.mak
> > @@ -5,3 +5,4 @@ CONFIG_SEMIHOSTING=y
> >  # Boards:
> >  #
> >  CONFIG_OR1K_SIM=y
> > +CONFIG_OR1K_VIRT=y
> > diff --git a/hw/openrisc/Kconfig b/hw/openrisc/Kconfig
> > index 8f284f3ba0..202134668e 100644
> > --- a/hw/openrisc/Kconfig
> > +++ b/hw/openrisc/Kconfig
> > @@ -4,3 +4,12 @@ config OR1K_SIM
> >      select OPENCORES_ETH
> >      select OMPIC
> >      select SPLIT_IRQ
> > +
> > +config OR1K_VIRT
> > +    bool
> > +    imply VIRTIO_VGA
> > +    imply TEST_DEVICES
> > +    select GOLDFISH_RTC
> > +    select SERIAL
> > +    select SIFIVE_TEST
> > +    select VIRTIO_MMIO
> 
> You could include the liteeth device too if we merged that.

I think we could add that with a litex machine.  For that we would need at least
the litex UART and SoC for reset.

> > diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
> > new file mode 100644
> > index 0000000000..147196fda3
> > --- /dev/null
> > +++ b/hw/openrisc/virt.c
> > @@ -0,0 +1,429 @@
> > +/*
> > + * OpenRISC QEMU virtual machine.
> > + *
> > + * Copyright (c) 2022 Stafford Horne <shorne@gmail.com>
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License as published by the Free Software Foundation; either
> > + * version 2.1 of the License, or (at your option) any later version.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> 
> I think you can use the SPDX tag here instead of writing out the text.

Right.

> > +static void openrisc_virt_init(MachineState *machine)
> > +{
> > +    ram_addr_t ram_size = machine->ram_size;
> > +    const char *kernel_filename = machine->kernel_filename;
> > +    OpenRISCCPU *cpus[VIRT_CPUS_MAX] = {};
> > +    OR1KVirtState *state = VIRT_MACHINE(machine);
> > +    MemoryRegion *ram;
> > +    hwaddr load_addr;
> > +    int n;
> > +    unsigned int smp_cpus = machine->smp.cpus;
> > +
> 
> > +    openrisc_virt_rtc_init(state, virt_memmap[VIRT_RTC].base,
> > +                           virt_memmap[VIRT_RTC].size, smp_cpus, cpus,
> > +                           VIRT_RTC_IRQ);
> > +
> > +    for (n = 0; n < VIRTIO_COUNT; n++) {
> 
> This would make more sense to me if you constructed the IRQ and base
> here, and then passed the actual base and irq number to your
> _virtio_init:
> 
>         size_t size = virt_memmap[VIRT_VIRTIO].size;
>         openrisc_virt_virtio_init(state, virt_memmap[VIRT_VIRTIO].base
> + size * n,
>                                   size, smp_cpus, cpus, VIRT_VIRTIO_IRQ + n);
> 

OK, yes that is better.

> > +        openrisc_virt_virtio_init(state, virt_memmap[VIRT_VIRTIO].base,
> > +                                  virt_memmap[VIRT_VIRTIO].size,
> > +                                  smp_cpus, cpus, VIRT_VIRTIO_IRQ, n);
> > +    }
> > +

Thanks a lot for the review.

-Stafford

