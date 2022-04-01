Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22244EE8E5
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 09:14:36 +0200 (CEST)
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naBUR-0001Bb-TF
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 03:14:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1naBRo-0007ah-1E; Fri, 01 Apr 2022 03:11:52 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1naBRm-0005bx-ER; Fri, 01 Apr 2022 03:11:51 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 4D6A5C60912;
 Fri,  1 Apr 2022 09:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1648797108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v4Sh7C5xjfxkoBa7PXcY56UAN93dnkD7s6YXvpCk5Y4=;
 b=gpsZ/6WUeQtmfAm0pL0YTwJgwRUtTHyeIn/TljcEdNKvZtJ2OcTp24JPzTEGAY7/gt9yQ5
 l0AJvctkEL83+YgoEfP1Sg7HhYk7dpFZaxWCJyQzUuLxbYl0mUeTl94MSd6wALZHMmjjgX
 KWQqEAofNXRCpQFRaxpA5TDA3dAbVy1oTeyXM7Dqk2DNmXoG8g0HFBB5eO1A2l82+1dVks
 1behUW+js1ucA/NydFadleEjQxq8ngVjd8xvjJAnzkUGqSqI8LAUd8IoNF4w5MZbfAUlUu
 f8uLLf1mC1u14cLqmfRfMXQqP7xmcyYk3W2la+GeODwz+Yb5jFl/HSbyPix7Bw==
Date: Fri, 1 Apr 2022 09:11:48 +0200
From: Luc Michel <luc@lmichel.fr>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 2/2] hw/arm/xlnx-zynqmp: Connect 4 TTC timers
Message-ID: <YkaltOpNAOkuk/5E@sekoia-pc.home.lmichel.fr>
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
 <20220331222017.2914409-3-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331222017.2914409-3-edgar.iglesias@gmail.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 00:20 Fri 01 Apr     , Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Connect the 4 TTC timers on the ZynqMP.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/xlnx-zynqmp.h |  4 ++++
>  hw/arm/xlnx-zynqmp.c         | 22 ++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 9d9a9d0bf9..85fd9f53da 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -41,6 +41,7 @@
>  #include "hw/or-irq.h"
>  #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
>  #include "hw/misc/xlnx-zynqmp-crf.h"
> +#include "hw/timer/cadence_ttc.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -84,6 +85,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>  #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
>                                    XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
>  
> +#define XLNX_ZYNQMP_NUM_TTC 4
> +
>  /*
>   * Unimplemented mmio regions needed to boot some images.
>   */
> @@ -128,6 +131,7 @@ struct XlnxZynqMPState {
>      qemu_or_irq qspi_irq_orgate;
>      XlnxZynqMPAPUCtrl apu_ctrl;
>      XlnxZynqMPCRF crf;
> +    CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
>  
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 5bfe285a19..375309e68e 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -68,6 +68,9 @@
>  #define APU_ADDR            0xfd5c0000
>  #define APU_IRQ             153
>  
> +#define TTC0_ADDR           0xFF110000
> +#define TTC0_IRQ            36
> +
>  #define IPI_ADDR            0xFF300000
>  #define IPI_IRQ             64
>  
> @@ -316,6 +319,24 @@ static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
>      sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
>  }
>  
> +static void xlnx_zynqmp_create_ttc(XlnxZynqMPState *s, qemu_irq *gic)
> +{
> +    SysBusDevice *sbd;
> +    int i, irq;
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_TTC; i++) {
> +        object_initialize_child(OBJECT(s), "ttc[*]", &s->ttc[i],
> +                                TYPE_CADENCE_TTC);
> +        sbd = SYS_BUS_DEVICE(&s->ttc[i]);
> +
> +        sysbus_realize(sbd, &error_fatal);
> +        sysbus_mmio_map(sbd, 0, TTC0_ADDR + i * 0x10000);
> +        for (irq = 0; irq < 3; irq++) {
> +            sysbus_connect_irq(sbd, irq, gic[TTC0_IRQ + i * 3 + irq]);
> +        }
> +    }
> +}
> +
>  static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
>  {
>      static const struct UnimpInfo {
> @@ -721,6 +742,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      xlnx_zynqmp_create_efuse(s, gic_spi);
>      xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
>      xlnx_zynqmp_create_crf(s, gic_spi);
> +    xlnx_zynqmp_create_ttc(s, gic_spi);
>      xlnx_zynqmp_create_unimp_mmio(s);
>  
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
> -- 
> 2.25.1
> 

-- 

