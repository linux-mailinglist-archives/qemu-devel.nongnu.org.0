Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B1730070F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:23:36 +0100 (CET)
Received: from localhost ([::1]:51044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2yHf-0001GN-8M
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2yGf-0000NV-NK; Fri, 22 Jan 2021 10:22:33 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:37712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2yGc-0005my-8l; Fri, 22 Jan 2021 10:22:33 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 95D2FC602E6;
 Fri, 22 Jan 2021 16:22:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611328946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=15fOifz/s2qaB9c3W+VK6YNYLcyJJVryTUTa8SIj7dw=;
 b=iUHmCl5dPn3QfSUvxZ+T28QitJ0CYlioBNp0x7DTWkfcmxZrzsAo7tHv/kMlnDtkTHEWPk
 gjRedd09/zvWQIIk4ClBWmxlOG3kYvjGwWWhWOSa5wMu7gNWtpwi4wQ+2CnEsgYZ+qPmdk
 twZmq6w//qVBcJ9Uxc4KPCjWu6KQYPzgfa9DgZkL9EH2Piawj4kG7H2ergptcEMIUvoW9D
 vfcFsEEClMHcTy14q8Jme8J/3SKNwVnwpP1l4hcMRR/MnpEc+lrLIlzUu3kPYDDugL+taI
 phIChPLS3HxJ/IUYhoZYxK7y85LklUVG5IVQ7T7+7PFQRWLBo9jvzcBeGtgUqQ==
Date: Fri, 22 Jan 2021 16:22:47 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 10/25] hw/arm/armsse: Rename "MAINCLK" property to
 "MAINCLK_FRQ"
Message-ID: <20210122152247.pjqnmrccj2i3wc2n@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-11-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-11-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> While we transition the ARMSSE code from integer properties
> specifying clock frequencies to Clock objects, we want to have the
> device provide both at once.  We want the final name of the main
> input Clock to be "MAINCLK", following the hardware name.
> Unfortunately creating an input Clock with a name X creates an
> under-the-hood QOM property X; for "MAINCLK" this clashes with the
> existing UINT32 property of that name.
> 
> Rename the UINT32 property to MAINCLK_FRQ so it can coexist with the
> MAINCLK Clock; once the transition is complete MAINCLK_FRQ will be
> deleted.
> 
> Commit created with:
>  perl -p -i -e 's/MAINCLK/MAINCLK_FRQ/g' hw/arm/{armsse,mps2-tz,musca}.c include/hw/arm/armsse.h
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/armsse.h | 2 +-
>  hw/arm/armsse.c         | 6 +++---
>  hw/arm/mps2-tz.c        | 2 +-
>  hw/arm/musca.c          | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
> index 83f5e28c16e..4860a793f4b 100644
> --- a/include/hw/arm/armsse.h
> +++ b/include/hw/arm/armsse.h
> @@ -39,7 +39,7 @@
>   * QEMU interface:
>   *  + QOM property "memory" is a MemoryRegion containing the devices provided
>   *    by the board model.
> - *  + QOM property "MAINCLK" is the frequency of the main system clock
> + *  + QOM property "MAINCLK_FRQ" is the frequency of the main system clock
>   *  + QOM property "EXP_NUMIRQ" sets the number of expansion interrupts.
>   *    (In hardware, the SSE-200 permits the number of expansion interrupts
>   *    for the two CPUs to be configured separately, but we restrict it to
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index baac027659d..d2ba0459c44 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -47,7 +47,7 @@ static Property iotkit_properties[] = {
>      DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
>                       MemoryRegion *),
>      DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
> -    DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
> +    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
>      DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
>      DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
>      DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
> @@ -59,7 +59,7 @@ static Property armsse_properties[] = {
>      DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
>                       MemoryRegion *),
>      DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
> -    DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
> +    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
>      DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
>      DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
>      DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], false),
> @@ -448,7 +448,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>      }
>  
>      if (!s->mainclk_frq) {
> -        error_setg(errp, "MAINCLK property was not set");
> +        error_setg(errp, "MAINCLK_FRQ property was not set");
>          return;
>      }
>  
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 3707876d6d4..6a9eed9022a 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -402,7 +402,7 @@ static void mps2tz_common_init(MachineState *machine)
>      object_property_set_link(OBJECT(&mms->iotkit), "memory",
>                               OBJECT(system_memory), &error_abort);
>      qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
> -    qdev_prop_set_uint32(iotkitdev, "MAINCLK", SYSCLK_FRQ);
> +    qdev_prop_set_uint32(iotkitdev, "MAINCLK_FRQ", SYSCLK_FRQ);
>      sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
>  
>      /*
> diff --git a/hw/arm/musca.c b/hw/arm/musca.c
> index b50157f63a6..d82bef11cf2 100644
> --- a/hw/arm/musca.c
> +++ b/hw/arm/musca.c
> @@ -375,7 +375,7 @@ static void musca_init(MachineState *machine)
>      qdev_prop_set_uint32(ssedev, "EXP_NUMIRQ", mmc->num_irqs);
>      qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
>      qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
> -    qdev_prop_set_uint32(ssedev, "MAINCLK", SYSCLK_FRQ);
> +    qdev_prop_set_uint32(ssedev, "MAINCLK_FRQ", SYSCLK_FRQ);
>      /*
>       * Musca-A takes the default SSE-200 FPU/DSP settings (ie no for
>       * CPU0 and yes for CPU1); Musca-B1 explicitly enables them for CPU0.
> -- 
> 2.20.1
> 

-- 

