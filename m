Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8831B31655E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:40:21 +0100 (CET)
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nr1-0007rM-GA
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9npC-00078R-Ka; Wed, 10 Feb 2021 06:38:26 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:37652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9npA-00068y-PB; Wed, 10 Feb 2021 06:38:26 -0500
Received: by mail-lj1-x235.google.com with SMTP id q14so2331075ljp.4;
 Wed, 10 Feb 2021 03:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ugP1BL51zar+LdcP7OJZ/TG+q0jBU98pQqunqRtJX0s=;
 b=miRVJ8m4y8ls4+GyipUKJgKGkg5hGFfLGp0r8H03jDVaOCA/otQxQT+cGpae3muhRS
 O37VVyXFMSngQRlET5GymKNDPlR+tjzxQUisDtzLl+hF07omFjqhCeREdxz2LOdKE7Nn
 pa4WzmPXF1YMK6IpUOFwmhON64iMlP9KqbnkQ59r6wShpW2HX6ARZQ058E00YsO8duv7
 1QddH8XaxOfPXUT4R8S2vgn3g7rZGgmgBsjkca+PCvT6WcF6p0wuKa7tk10tWCjaD7qn
 OQOaT2n538Uw7i/f/0zPQHl819Nb0AKae9m9CRM7Y0UTDFK0hH/BOHZWgh9WJr+/1hvY
 GtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ugP1BL51zar+LdcP7OJZ/TG+q0jBU98pQqunqRtJX0s=;
 b=mMWrMylFZZxZV/oSiAs7bjNbcxOQmfnIxtT/LJ6imVaSpMwGBZWuwdH3M04u8CmFcC
 XJS9kJ/q/7y4O6AwSvfaqclfGhhyoqLObpTLuJkY2kVZ8gzkJwl0d8j/OoBpjJT/PRFh
 XeRUHQZIG5OdxpWHxJVoyvIvbXJD6ElWRCPTWDVIQYLmsLFv54GQF4fcQTpNUtkZYLvx
 mBrEswd0XLBxrdowE854+FX4wl5Glgl8QjpwK4QzZEga3Vt0LIPUqeQrK8DORUp0Kb0C
 WXVDIo7pKRO7cvOcg1zG67rjP5CjwGg9Flr68YqDkcvosETOBKbGRDsHKAPjzchgrHcD
 GyGg==
X-Gm-Message-State: AOAM531FXx7XTnFe95wKjCmldITcYhfol0hgC/aNkFDSRvCELeRrLkiC
 rpSJoEa7CIT7zpigfk7VreM=
X-Google-Smtp-Source: ABdhPJwZIGkj0Y+MMbrLjrpUIUNbdVs8wL36m0u138kAbdPSSrKP10zmOxD9+jbvPZpkuZl112Owvw==
X-Received: by 2002:a2e:b803:: with SMTP id u3mr1673415ljo.481.1612957102470; 
 Wed, 10 Feb 2021 03:38:22 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id z4sm29454lfr.242.2021.02.10.03.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 03:38:22 -0800 (PST)
Date: Wed, 10 Feb 2021 12:38:21 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 3/5] hw/arm: xlnx-zynqmp: Add XLNX CSU DMA module
Message-ID: <20210210113821.GK477672@toto>
References: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
 <1612951813-50542-4-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612951813-50542-4-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 06:10:11PM +0800, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Insert XLNX CSU DMA module to ZynqMP SoC, and connent the stream
> link of GQSPI to CSU DMA.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v3:
> - new patch: xlnx-zynqmp: Add XLNX CSU DMA module
> 
>  include/hw/arm/xlnx-zynqmp.h |  2 ++
>  hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++++
>  hw/arm/Kconfig               |  1 +
>  3 files changed, 17 insertions(+)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index be15cc8..d387c85 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -35,6 +35,7 @@
>  #include "target/arm/cpu.h"
>  #include "qom/object.h"
>  #include "net/can_emu.h"
> +#include "hw/dma/xlnx_csu_dma.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -108,6 +109,7 @@ struct XlnxZynqMPState {
>      XlnxZynqMPRTC rtc;
>      XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
>      XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
> +    XlnxCSUDMA csu_dma;


This should be named in relation to QSPI, e.g qspi_dma.

Otherwise, this looks good to me.


>  
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 76b94a5..ed34692 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -63,6 +63,9 @@
>  #define RTC_ADDR            0xffa60000
>  #define RTC_IRQ             26
>  
> +#define CSU_DMA_ADDR        0xff0f0800
> +#define CSU_DMA_IRQ         15
> +
>  #define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
>  
>  static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
> @@ -284,6 +287,8 @@ static void xlnx_zynqmp_init(Object *obj)
>      for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
>          object_initialize_child(obj, "adma[*]", &s->adma[i], TYPE_XLNX_ZDMA);
>      }
> +
> +    object_initialize_child(obj, "csu-dma", &s->csu_dma, TYPE_XLNX_CSU_DMA);
>  }
>  
>  static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> @@ -643,6 +648,15 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->adma[i]), 0,
>                             gic_spi[adma_ch_intr[i]]);
>      }
> +
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->csu_dma), errp)) {
> +        return;
> +    }
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->csu_dma), 0, CSU_DMA_ADDR);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->csu_dma), 0, gic_spi[CSU_DMA_IRQ]);
> +    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
> +                             OBJECT(&s->csu_dma), errp);
>  }
>  
>  static Property xlnx_zynqmp_props[] = {
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index be017b9..0c0384c 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -353,6 +353,7 @@ config XLNX_ZYNQMP_ARM
>      select SSI_M25P80
>      select XILINX_AXI
>      select XILINX_SPIPS
> +    select XLNX_CSU_DMA
>      select XLNX_ZYNQMP
>      select XLNX_ZDMA
>  
> -- 
> 2.7.4
> 

