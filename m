Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7E12C7907
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 13:05:27 +0100 (CET)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjLSI-0002bL-49
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 07:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1kjLQ9-0001tw-HV
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 07:03:13 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1kjLQ6-0000wH-1P
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 07:03:13 -0500
Received: by mail-pf1-x441.google.com with SMTP id e8so8459845pfh.2
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 04:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=85onSEFMQVSsgfMHr4SJqMdK5xl61M1oNYbWh63DPVo=;
 b=HKebuoIb57uVqRWpZKtU6D9BdGONXDBt+Brtz0cHZ2JnEvniz1NDbFpHPgeBD81Gy1
 KN7uLxAxVAhB4+GXCaVIs4t+yMiCfDLvjKfyWLtdJS8uUF1dP8sHxx9UFRBR5hJ/E2At
 r/K8XuPNjDq73N5P5TmbhZES34BXZ6H43bujIZrdXEHSutnpIEAZ9meYdWtCFa1C8J3T
 ZOQUXT57xl04o6VeadNzQgdyS5l0pLtFDI2iIb7xI6bUOa8CxiHn1kXwZkAePR+NxCw5
 tLzKqpCe5/pSf1sw6Bad4xihNQ4igtMGV1I3t2imXs47QGB7sq1Ghhwcf9CFp3X1dS90
 daAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=85onSEFMQVSsgfMHr4SJqMdK5xl61M1oNYbWh63DPVo=;
 b=M9+VnDuOwH+y6x81jUZHa+9wIPFDYCGYRERT0BS2dsaCj63Ri9sAzMd6wb2ALgHXtZ
 KMYtesNvishWXrdR8OuHVqduJEcevfRWJgkmKEh7Q8q5ZrfCBMAbAOhOa8L7/ZaB3Xks
 52F3shyOivAzqCUdm9N8ZSZ9xYm8IzTqOk/u3BqztR+k7gvJ5fx3duKXjEWF/kdqkgnE
 A8tz/5Q56ODh77ASQPZttLeR3zfGq4yInN1p7RkMOxRSUHbtlz0nJtRASnOUwCaGmShF
 fsClqtV444JnXPpZmMB7Zeql551sJYW6KW9UQZ9JMrKZylnhSG86oz0g7uKSogolUGd+
 CHWA==
X-Gm-Message-State: AOAM531j/x4aGFy02UDpVlRX1mBbBs2wEVEwZGFWsT+kuy7R37v/Y2oB
 LdpVmAWAr2c4kXvevQbziKs=
X-Google-Smtp-Source: ABdhPJy+2aIFsa6PeIT3LLSilZLEJOX3ck0j9AiaAZCsMG6mA7jO/RXDgMMWTZsyDT1Kir4F8YmapQ==
X-Received: by 2002:a65:46c1:: with SMTP id n1mr13358797pgr.352.1606651388709; 
 Sun, 29 Nov 2020 04:03:08 -0800 (PST)
Received: from localhost (g115.222-224-149.ppp.wakwak.ne.jp. [222.224.149.115])
 by smtp.gmail.com with ESMTPSA id z67sm12928843pfb.89.2020.11.29.04.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 04:03:08 -0800 (PST)
Date: Sun, 29 Nov 2020 21:03:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] target/openrisc: Move pic_cpu code into CPU object
 proper
Message-ID: <20201129120305.GF3168563@lianli.shorne-pla.net>
References: <20201127225127.14770-1-peter.maydell@linaro.org>
 <20201127225127.14770-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127225127.14770-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 10:51:27PM +0000, Peter Maydell wrote:
> The openrisc code uses an old style of interrupt handling, where a
> separate standalone set of qemu_irqs invoke a function
> openrisc_pic_cpu_handler() which signals the interrupt to the CPU
> proper by directly calling cpu_interrupt() and cpu_reset_interrupt().
> Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
> can have GPIO input lines themselves, and the neater modern way to
> implement this is to simply have the CPU object itself provide the
> input IRQ lines.
> 
> Create GPIO inputs to the OpenRISC CPU object, and make the only user
> of cpu_openrisc_pic_init() wire up directly to those instead.
> 
> This allows us to delete the hw/openrisc/pic_cpu.c file entirely.
> 
> This fixes a trivial memory leak reported by Coverity of the IRQs
> allocated in cpu_openrisc_pic_init().
> 
> Fixes: Coverity CID 1421934
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/openrisc/cpu.h      |  1 -
>  hw/openrisc/openrisc_sim.c |  3 +-
>  hw/openrisc/pic_cpu.c      | 61 --------------------------------------
>  target/openrisc/cpu.c      | 32 ++++++++++++++++++++
>  hw/openrisc/meson.build    |  2 +-
>  5 files changed, 34 insertions(+), 65 deletions(-)
>  delete mode 100644 hw/openrisc/pic_cpu.c
> 
> diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
> index bd42faf144f..82cbaeb4f84 100644
> --- a/target/openrisc/cpu.h
> +++ b/target/openrisc/cpu.h
> @@ -293,7 +293,6 @@ typedef struct CPUOpenRISCState {
>      uint32_t picmr;         /* Interrupt mask register */
>      uint32_t picsr;         /* Interrupt contrl register*/
>  #endif
> -    void *irq[32];          /* Interrupt irq input */
>  } CPUOpenRISCState;
>  
>  /**
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index 75ba0f47444..39f1d344ae9 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -54,7 +54,7 @@ static void main_cpu_reset(void *opaque)
>  
>  static qemu_irq get_cpu_irq(OpenRISCCPU *cpus[], int cpunum, int irq_pin)
>  {
> -    return cpus[cpunum]->env.irq[irq_pin];
> +    return qdev_get_gpio_in_named(DEVICE(cpus[cpunum]), "IRQ", irq_pin);
>  }
>  
>  static void openrisc_sim_net_init(hwaddr base, hwaddr descriptors,
> @@ -154,7 +154,6 @@ static void openrisc_sim_init(MachineState *machine)
>              fprintf(stderr, "Unable to find CPU definition!\n");
>              exit(1);
>          }
> -        cpu_openrisc_pic_init(cpus[n]);
>  
>          cpu_openrisc_clock_init(cpus[n]);
>  
> diff --git a/hw/openrisc/pic_cpu.c b/hw/openrisc/pic_cpu.c
> deleted file mode 100644
> index 36f93508309..00000000000
> --- a/hw/openrisc/pic_cpu.c
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -/*
> - * OpenRISC Programmable Interrupt Controller support.
> - *
> - * Copyright (c) 2011-2012 Jia Liu <proljc@gmail.com>
> - *                         Feng Gao <gf91597@gmail.com>
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -
> -#include "qemu/osdep.h"
> -#include "hw/irq.h"
> -#include "cpu.h"
> -
> -/* OpenRISC pic handler */
> -static void openrisc_pic_cpu_handler(void *opaque, int irq, int level)
> -{
> -    OpenRISCCPU *cpu = (OpenRISCCPU *)opaque;
> -    CPUState *cs = CPU(cpu);
> -    uint32_t irq_bit;
> -
> -    if (irq > 31 || irq < 0) {
> -        return;
> -    }
> -
> -    irq_bit = 1U << irq;
> -
> -    if (level) {
> -        cpu->env.picsr |= irq_bit;
> -    } else {
> -        cpu->env.picsr &= ~irq_bit;
> -    }
> -
> -    if (cpu->env.picsr & cpu->env.picmr) {
> -        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> -    } else {
> -        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> -        cpu->env.picsr = 0;
> -    }
> -}
> -
> -void cpu_openrisc_pic_init(OpenRISCCPU *cpu)
> -{
> -    int i;
> -    qemu_irq *qi;
> -    qi = qemu_allocate_irqs(openrisc_pic_cpu_handler, cpu, NR_IRQS);
> -
> -    for (i = 0; i < NR_IRQS; i++) {
> -        cpu->env.irq[i] = qi[i];
> -    }
> -}
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 5528c0918f4..b0bdfbe4fe2 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -65,6 +65,34 @@ static void openrisc_cpu_reset(DeviceState *dev)
>  #endif
>  }
>  
> +#ifndef CONFIG_USER_ONLY
> +static void openrisc_cpu_set_irq(void *opaque, int irq, int level)
> +{
> +    OpenRISCCPU *cpu = (OpenRISCCPU *)opaque;
> +    CPUState *cs = CPU(cpu);
> +    uint32_t irq_bit;
> +
> +    if (irq > 31 || irq < 0) {
> +        return;
> +    }
> +
> +    irq_bit = 1U << irq;
> +
> +    if (level) {
> +        cpu->env.picsr |= irq_bit;
> +    } else {
> +        cpu->env.picsr &= ~irq_bit;
> +    }
> +
> +    if (cpu->env.picsr & cpu->env.picmr) {
> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +    } else {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +        cpu->env.picsr = 0;
> +    }
> +}
> +#endif
> +
>  static void openrisc_cpu_realizefn(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs = CPU(dev);
> @@ -88,6 +116,10 @@ static void openrisc_cpu_initfn(Object *obj)
>      OpenRISCCPU *cpu = OPENRISC_CPU(obj);
>  
>      cpu_set_cpustate_pointers(cpu);
> +
> +#ifndef CONFIG_USER_ONLY
> +    qdev_init_gpio_in_named(DEVICE(cpu), openrisc_cpu_set_irq, "IRQ", NR_IRQS);
> +#endif
>  }
>  
>  /* CPU models */
> diff --git a/hw/openrisc/meson.build b/hw/openrisc/meson.build
> index 57c42558e18..947f63ee087 100644
> --- a/hw/openrisc/meson.build
> +++ b/hw/openrisc/meson.build
> @@ -1,5 +1,5 @@
>  openrisc_ss = ss.source_set()
> -openrisc_ss.add(files('pic_cpu.c', 'cputimer.c'))
> +openrisc_ss.add(files('cputimer.c'))
>  openrisc_ss.add(when: 'CONFIG_OR1K_SIM', if_true: files('openrisc_sim.c'))
>  
>  hw_arch += {'openrisc': openrisc_ss}
> -- 
> 2.20.1

This is nice, thanks for the patch.

Reviewed-by: Stafford Horne <shorne@gmail.com>

Please feel free to merge.

