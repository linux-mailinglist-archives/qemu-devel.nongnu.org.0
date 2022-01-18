Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79220493047
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 23:02:56 +0100 (CET)
Received: from localhost ([::1]:53520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9wZ5-0008WH-2a
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 17:02:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1n9wV2-0006IC-4M
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 16:58:44 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1n9wV0-0007XP-9u
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 16:58:43 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id DC981C60912;
 Tue, 18 Jan 2022 22:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1642543120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dh6GB3ONMbWsvICG3tFQVtZlEHusqi2mp2JKUPbXp+k=;
 b=VvqaGELgMRhuPH+HknDQB7SXfKQQQCqkRnbD0MYMBfhTxYvBDG1UlBYr/Z0wdUbzGpAUd3
 5ZWsO4xtfIvQ5kut53vHtNwek7QygiiAdcQZs0EtiF+Ja5aCNI1lj6eMklm3FEwCzqvkcu
 c344XGBoJ9m09PZGEE2WCIszeTh9qICnBEFkBYrRpstYJL2EFBcflucAPcA0Q3U+ANXCi3
 UeP7U7QASR4aQw70XMSWkEYGOZ9fqrZIMoJAPAb1vQeaRvgDKUFIXIGOzlogK3f7lG9Fpe
 nUKYTewA3wcisnbpNaTZk9oFVN+lbFnHs//lIllZjrR4N8947Ztu8wo8rlZHVQ==
Date: Tue, 18 Jan 2022 22:58:40 +0100
From: Luc Michel <luc@lmichel.fr>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v6 02/12] hw/arm/xlnx-versal: 'Or' the interrupts from
 the BBRAM and RTC models
Message-ID: <20220118215840.gk7fninq7avhutcq@sekoia-pc.home.lmichel.fr>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
 <20220114152841.1740-3-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114152841.1740-3-francisco.iglesias@xilinx.com>
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 alistair23@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15:28 Fri 14 Jan     , Francisco Iglesias wrote:
> Add an orgate and 'or' the interrupts from the BBRAM and RTC models.
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/xlnx-versal-virt.c    |  2 +-
>  hw/arm/xlnx-versal.c         | 28 ++++++++++++++++++++++++++--
>  include/hw/arm/xlnx-versal.h |  5 +++--
>  3 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 0c5edc898e..8ea9979710 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -365,7 +365,7 @@ static void fdt_add_bbram_node(VersalVirt *s)
>      qemu_fdt_add_subnode(s->fdt, name);
>  
>      qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> -                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_BBRAM_APB_IRQ_0,
> +                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_PMC_APB_IRQ,
>                             GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>      qemu_fdt_setprop(s->fdt, name, "interrupt-names",
>                       interrupt_names, sizeof(interrupt_names));
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index b2705b6925..fefd00b57c 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -25,6 +25,8 @@
>  #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
>  #define GEM_REVISION        0x40070106
>  
> +#define VERSAL_NUM_PMC_APB_IRQS 2
> +
>  static void versal_create_apu_cpus(Versal *s)
>  {
>      int i;
> @@ -260,6 +262,25 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
>      }
>  }
>  
> +static void versal_create_pmc_apb_irq_orgate(Versal *s, qemu_irq *pic)
> +{
> +    DeviceState *orgate;
> +
> +    /*
> +     * The VERSAL_PMC_APB_IRQ is an 'or' of the interrupts from the following
> +     * models:
> +     *  - RTC
> +     *  - BBRAM
> +     */
> +    object_initialize_child(OBJECT(s), "pmc-apb-irq-orgate",
> +                            &s->pmc.apb_irq_orgate, TYPE_OR_IRQ);
> +    orgate = DEVICE(&s->pmc.apb_irq_orgate);
> +    object_property_set_int(OBJECT(orgate),
> +                            "num-lines", VERSAL_NUM_PMC_APB_IRQS, &error_fatal);
> +    qdev_realize(orgate, NULL, &error_fatal);
> +    qdev_connect_gpio_out(orgate, 0, pic[VERSAL_PMC_APB_IRQ]);
> +}
> +
>  static void versal_create_rtc(Versal *s, qemu_irq *pic)
>  {
>      SysBusDevice *sbd;
> @@ -277,7 +298,8 @@ static void versal_create_rtc(Versal *s, qemu_irq *pic)
>       * TODO: Connect the ALARM and SECONDS interrupts once our RTC model
>       * supports them.
>       */
> -    sysbus_connect_irq(sbd, 1, pic[VERSAL_RTC_APB_ERR_IRQ]);
> +    sysbus_connect_irq(sbd, 1,
> +                       qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 0));
>  }
>  
>  static void versal_create_xrams(Versal *s, qemu_irq *pic)
> @@ -328,7 +350,8 @@ static void versal_create_bbram(Versal *s, qemu_irq *pic)
>      sysbus_realize(sbd, &error_fatal);
>      memory_region_add_subregion(&s->mr_ps, MM_PMC_BBRAM_CTRL,
>                                  sysbus_mmio_get_region(sbd, 0));
> -    sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
> +    sysbus_connect_irq(sbd, 0,
> +                       qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 1));
>  }
>  
>  static void versal_realize_efuse_part(Versal *s, Object *dev, hwaddr base)
> @@ -455,6 +478,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_gems(s, pic);
>      versal_create_admas(s, pic);
>      versal_create_sds(s, pic);
> +    versal_create_pmc_apb_irq_orgate(s, pic);
>      versal_create_rtc(s, pic);
>      versal_create_xrams(s, pic);
>      versal_create_bbram(s, pic);
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 895ba12c61..62fb6f0a68 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -85,6 +85,8 @@ struct Versal {
>          XlnxEFuse efuse;
>          XlnxVersalEFuseCtrl efuse_ctrl;
>          XlnxVersalEFuseCache efuse_cache;
> +
> +        qemu_or_irq apb_irq_orgate;
>      } pmc;
>  
>      struct {
> @@ -111,8 +113,7 @@ struct Versal {
>  #define VERSAL_GEM1_WAKE_IRQ_0     59
>  #define VERSAL_ADMA_IRQ_0          60
>  #define VERSAL_XRAM_IRQ_0          79
> -#define VERSAL_BBRAM_APB_IRQ_0     121
> -#define VERSAL_RTC_APB_ERR_IRQ     121
> +#define VERSAL_PMC_APB_IRQ         121
>  #define VERSAL_SD0_IRQ_0           126
>  #define VERSAL_EFUSE_IRQ           139
>  #define VERSAL_RTC_ALARM_IRQ       142
> -- 
> 2.11.0
> 
> 

-- 

