Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C7949303E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 22:58:06 +0100 (CET)
Received: from localhost ([::1]:48494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9wUO-0004w4-MH
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 16:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1n9wT3-0004En-5X
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 16:56:41 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1n9wT1-0007PR-8I
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 16:56:40 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 59B0EC60912;
 Tue, 18 Jan 2022 22:56:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1642542995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fghMFuwfDf2H9w13yDzje5yC2WohrLBfRYBOxdoRKsw=;
 b=cFkN/QuJbb8N7VoUdlRw2rkUZAcix8iZU3k2v7ZGvVtKHfWu3SY9Nq2ND3WHEo/5fiE/yH
 0sACXC1OLYMmXSl8ji3C3NPbcdSJa5KXgJNm51+STePLTD3l6Ex+YV9SEPuaVL2IEg1bH2
 MuSo0VnnGGrb99Kza3UE6U0cbSM+ox3PfdG+5nQLnz8VPgd1FMYXosNrB37G+uoB/rNcWN
 yJcOyNF1Twtd5cfw3gQQD5HDx4EFSCuf8yMaHyi1ZLe7FdgIPrrUciTnTCkSeCwnDJrkKu
 X1Wjb7QUZ2Lq+azxsr3J8L4EuD19JFTJwKWDBJgEP69bpaLeQdKkjsap5FLU9A==
Date: Tue, 18 Jan 2022 22:56:35 +0100
From: Luc Michel <luc@lmichel.fr>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v6 03/12] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Message-ID: <20220118215635.wrf26bkcsoqqcday@sekoia-pc.home.lmichel.fr>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
 <20220114152841.1740-4-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114152841.1740-4-francisco.iglesias@xilinx.com>
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
> Connect Versal's PMC SLCR (system-level control registers) model.
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/xlnx-versal.c         | 71 +++++++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/xlnx-versal.h |  5 ++++
>  2 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index fefd00b57c..c8c0c102c7 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -21,11 +21,13 @@
>  #include "kvm_arm.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/xlnx-versal.h"
> +#include "qemu/log.h"
> +#include "hw/sysbus.h"
>  
>  #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
>  #define GEM_REVISION        0x40070106
>  
> -#define VERSAL_NUM_PMC_APB_IRQS 2
> +#define VERSAL_NUM_PMC_APB_IRQS 3
>  
>  static void versal_create_apu_cpus(Versal *s)
>  {
> @@ -271,6 +273,7 @@ static void versal_create_pmc_apb_irq_orgate(Versal *s, qemu_irq *pic)
>       * models:
>       *  - RTC
>       *  - BBRAM
> +     *  - PMC SLCR
>       */
>      object_initialize_child(OBJECT(s), "pmc-apb-irq-orgate",
>                              &s->pmc.apb_irq_orgate, TYPE_OR_IRQ);
> @@ -392,6 +395,23 @@ static void versal_create_efuse(Versal *s, qemu_irq *pic)
>      sysbus_connect_irq(SYS_BUS_DEVICE(ctrl), 0, pic[VERSAL_EFUSE_IRQ]);
>  }
>  
> +static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
> +{
> +    SysBusDevice *sbd;
> +
> +    object_initialize_child(OBJECT(s), "versal-pmc-iou-slcr", &s->pmc.iou.slcr,
> +                            TYPE_XILINX_VERSAL_PMC_IOU_SLCR);
> +
> +    sbd = SYS_BUS_DEVICE(&s->pmc.iou.slcr);
> +    sysbus_realize(sbd, &error_fatal);
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_PMC_IOU_SLCR,
> +                                sysbus_mmio_get_region(sbd, 0));
> +
> +    sysbus_connect_irq(sbd, 0,
> +                       qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 2));
> +}
> +
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
>   */
> @@ -448,8 +468,31 @@ static void versal_unimp_area(Versal *s, const char *name,
>      memory_region_add_subregion(mr, base, mr_dev);
>  }
>  
> +static void versal_unimp_sd_emmc_sel(void *opaque, int n, int level)
> +{
> +    qemu_log_mask(LOG_UNIMP,
> +                  "Selecting between enabling SD mode or eMMC mode on "
> +                  "controller %d is not yet implemented\n", n);
> +}
> +
> +static void versal_unimp_qspi_ospi_mux_sel(void *opaque, int n, int level)
> +{
> +    qemu_log_mask(LOG_UNIMP,
> +                  "Selecting between enabling the QSPI or OSPI linear address "
> +                  "region is not yet implemented\n");
> +}
> +
> +static void versal_unimp_irq_parity_imr(void *opaque, int n, int level)
> +{
> +    qemu_log_mask(LOG_UNIMP,
> +                  "PMC SLCR parity interrupt behaviour "
> +                  "is not yet implemented\n");
> +}
> +
>  static void versal_unimp(Versal *s)
>  {
> +    qemu_irq gpio_in;
> +
>      versal_unimp_area(s, "psm", &s->mr_ps,
>                          MM_PSM_START, MM_PSM_END - MM_PSM_START);
>      versal_unimp_area(s, "crl", &s->mr_ps,
> @@ -464,6 +507,31 @@ static void versal_unimp(Versal *s)
>                          MM_IOU_SCNTR, MM_IOU_SCNTR_SIZE);
>      versal_unimp_area(s, "iou-scntr-seucre", &s->mr_ps,
>                          MM_IOU_SCNTRS, MM_IOU_SCNTRS_SIZE);
> +
> +    qdev_init_gpio_in_named(DEVICE(s), versal_unimp_sd_emmc_sel,
> +                            "sd-emmc-sel-dummy", 2);
> +    qdev_init_gpio_in_named(DEVICE(s), versal_unimp_qspi_ospi_mux_sel,
> +                            "qspi-ospi-mux-sel-dummy", 1);
> +    qdev_init_gpio_in_named(DEVICE(s), versal_unimp_irq_parity_imr,
> +                            "irq-parity-imr-dummy", 1);
> +
> +    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "sd-emmc-sel-dummy", 0);
> +    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr), "sd-emmc-sel", 0,
> +                                gpio_in);
> +
> +    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "sd-emmc-sel-dummy", 1);
> +    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr), "sd-emmc-sel", 1,
> +                                gpio_in);
> +
> +    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "qspi-ospi-mux-sel-dummy", 0);
> +    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr),
> +                                "qspi-ospi-mux-sel", 0,
> +                                gpio_in);
> +
> +    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "irq-parity-imr-dummy", 0);
> +    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr),
> +                                SYSBUS_DEVICE_GPIO_IRQ, 0,
> +                                gpio_in);
>  }
>  
>  static void versal_realize(DeviceState *dev, Error **errp)
> @@ -483,6 +551,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_xrams(s, pic);
>      versal_create_bbram(s, pic);
>      versal_create_efuse(s, pic);
> +    versal_create_pmc_iou_slcr(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>  
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 62fb6f0a68..811df73350 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -26,6 +26,7 @@
>  #include "hw/misc/xlnx-versal-xramc.h"
>  #include "hw/nvram/xlnx-bbram.h"
>  #include "hw/nvram/xlnx-versal-efuse.h"
> +#include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
>  
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
>  OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
> @@ -78,6 +79,7 @@ struct Versal {
>      struct {
>          struct {
>              SDHCIState sd[XLNX_VERSAL_NR_SDS];
> +            XlnxVersalPmcIouSlcr slcr;
>          } iou;
>  
>          XlnxZynqMPRTC rtc;
> @@ -179,6 +181,9 @@ struct Versal {
>  #define MM_FPD_FPD_APU              0xfd5c0000
>  #define MM_FPD_FPD_APU_SIZE         0x100
>  
> +#define MM_PMC_PMC_IOU_SLCR         0xf1060000
> +#define MM_PMC_PMC_IOU_SLCR_SIZE    0x10000
> +
>  #define MM_PMC_SD0                  0xf1040000U
>  #define MM_PMC_SD0_SIZE             0x10000
>  #define MM_PMC_BBRAM_CTRL           0xf11f0000
> -- 
> 2.11.0
> 
> 

-- 

