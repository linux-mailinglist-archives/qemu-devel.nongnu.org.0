Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097CF27332C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 21:53:06 +0200 (CEST)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKRs0-0006fQ-UC
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 15:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKRgH-0001ae-2B; Mon, 21 Sep 2020 15:40:57 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKRgF-0007zu-BR; Mon, 21 Sep 2020 15:40:56 -0400
Received: from [172.17.10.14] (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E994D21CC5;
 Mon, 21 Sep 2020 19:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1600717251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJhzqHGenUT2igcwbjLJQqVVKAgdEOLOrVJsUbOHY6U=;
 b=1g4iVbCfHMycB7ABVES038Y/m+7wh/OWHJMsmtlhOcDzBlEL/wsvkHDICXWIO86wxGXA/x
 1u/wAYXP1ooOBwYunlHMTiCWlI/q0X9zLOvkf4mUH9hcJI/4O6bYG5+gVkowsFD+WReFBD
 AbpQxGLpve7Q+6jE900h3IUzPtqCbyw=
Subject: Re: [PATCH v2 1/5] hw/intc/bcm2835_ic: Trace GPU/CPU IRQ handlers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200921035257.434532-1-f4bug@amsat.org>
 <20200921035257.434532-2-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <36eba17d-58a9-3521-7c6a-aec211819232@greensocs.com>
Date: Mon, 21 Sep 2020 21:41:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921035257.434532-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 15:38:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/20 5:52 AM, Philippe Mathieu-Daudé wrote:
> Add trace events for GPU and CPU IRQs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   hw/intc/bcm2835_ic.c | 4 +++-
>   hw/intc/trace-events | 4 ++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
> index 53ab8f58810..9000d995e81 100644
> --- a/hw/intc/bcm2835_ic.c
> +++ b/hw/intc/bcm2835_ic.c
> @@ -18,6 +18,7 @@
>   #include "migration/vmstate.h"
>   #include "qemu/log.h"
>   #include "qemu/module.h"
> +#include "trace.h"
>   
>   #define GPU_IRQS 64
>   #define ARM_IRQS 8
> @@ -51,7 +52,6 @@ static void bcm2835_ic_update(BCM2835ICState *s)
>       set = (s->gpu_irq_level & s->gpu_irq_enable)
>           || (s->arm_irq_level & s->arm_irq_enable);
>       qemu_set_irq(s->irq, set);
> -
>   }
>   
>   static void bcm2835_ic_set_gpu_irq(void *opaque, int irq, int level)
> @@ -59,6 +59,7 @@ static void bcm2835_ic_set_gpu_irq(void *opaque, int irq, int level)
>       BCM2835ICState *s = opaque;
>   
>       assert(irq >= 0 && irq < 64);
> +    trace_bcm2835_ic_set_gpu_irq(irq, level);
>       s->gpu_irq_level = deposit64(s->gpu_irq_level, irq, 1, level != 0);
>       bcm2835_ic_update(s);
>   }
> @@ -68,6 +69,7 @@ static void bcm2835_ic_set_arm_irq(void *opaque, int irq, int level)
>       BCM2835ICState *s = opaque;
>   
>       assert(irq >= 0 && irq < 8);
> +    trace_bcm2835_ic_set_cpu_irq(irq, level);
>       s->arm_irq_level = deposit32(s->arm_irq_level, irq, 1, level != 0);
>       bcm2835_ic_update(s);
>   }
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 527c3f76cae..22782b3f089 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -199,3 +199,7 @@ nvic_sysreg_write(uint64_t addr, uint32_t value, unsigned size) "NVIC sysreg wri
>   heathrow_write(uint64_t addr, unsigned int n, uint64_t value) "0x%"PRIx64" %u: 0x%"PRIx64
>   heathrow_read(uint64_t addr, unsigned int n, uint64_t value) "0x%"PRIx64" %u: 0x%"PRIx64
>   heathrow_set_irq(int num, int level) "set_irq: num=0x%02x level=%d"
> +
> +# bcm2835_ic.c
> +bcm2835_ic_set_gpu_irq(int irq, int level) "GPU irq #%d level %d"
> +bcm2835_ic_set_cpu_irq(int irq, int level) "CPU irq #%d level %d"
> 

