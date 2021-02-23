Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A2132276C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:05:07 +0100 (CET)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETcw-0004Dm-EB
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETZu-0003Oa-Bg; Tue, 23 Feb 2021 04:01:59 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETZj-0007HQ-Hx; Tue, 23 Feb 2021 04:01:58 -0500
Received: by mail-lf1-x12c.google.com with SMTP id v30so10042489lfq.6;
 Tue, 23 Feb 2021 01:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DJKVKp2e/bvZWh6JX2hIAyLRkq3EWS7zABejf59Hue4=;
 b=WAFj9CJJGHVfaFzpZKOXXh2vQWjE11D506pk86NCw94g0rRf5RSsL+ajXhuGSG+BZv
 Y3rF7LhehXgouEfc2tXaPtqxfzFQtXwH1CoxuMxO68eMaWtLs0WBnO2QqDb8d3qU7HoN
 9E8obdLgq5/moCRhf9c9eeo6zGwJNnzf08pkAGQQzHY9UwxWP6Hp46v0h/v3MvjG/K5/
 ympUAHlLaNWsUZnG5yHqx65kK4bVwnMcYJNotNvf9iHIX19mNGGOwXfUrHEavCKWTTvu
 14e1NgCRYG2FOs66GE51clNX1u5dRPitbhEO5wUeWAMgBzpkI2We6J5+YmPzfYzQEebh
 xq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DJKVKp2e/bvZWh6JX2hIAyLRkq3EWS7zABejf59Hue4=;
 b=k55NlncyeSX192dtJ82+c6d/mykBGWtaWiz+AOtGR0pggzynnjQuw2OFTatDJ4VG3x
 77CYo4PZKup+w1s1cHLtTG4c0ehknJqRbmanYYFOi7J0priP+UngYAO4k6d7WQAyOM9e
 PQdh4sJdcunj2mTmhO3y/LOdgiIMS51bfGG8C0HDKO6GWhKAyXDVsi5aQefN29yuICZl
 nwKGVhf2VnglbvnQXYZCr73056nsA7aHV8em2LG55phyi/NSU3ZXKZkvEmKs9I108X9p
 EQjCK5hcqZQCqH7KWvnzGKFINxq6V7qZifQn4We54g/BtgAuC4JPaldLzs29sTQ5gFxe
 b8uA==
X-Gm-Message-State: AOAM531t6dgpvXv7OJhEAnZZVxJOMiXUcu6iZbUoWGgt96WIQacpPviy
 4+w0BYk+io9SvosGB1+AzFc=
X-Google-Smtp-Source: ABdhPJxBzAlzohck/ZiVVeHg4IP6RKHCs3oT4x/0WZjBOwwF6TO19LZtf+MubMBK6Hi+uVS4G4nYug==
X-Received: by 2002:a19:c189:: with SMTP id
 r131mr15758393lff.348.1614070905299; 
 Tue, 23 Feb 2021 01:01:45 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id l3sm1742768lje.43.2021.02.23.01.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 01:01:44 -0800 (PST)
Date: Tue, 23 Feb 2021 10:01:44 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v4 3/5] hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA
 module for QSPI
Message-ID: <20210223090144.GS477672@toto>
References: <20210222130514.2167-1-bmeng.cn@gmail.com>
 <20210222130514.2167-4-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222130514.2167-4-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12c.google.com
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

On Mon, Feb 22, 2021 at 09:05:12PM +0800, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Add a Xilinx CSU DMA module to ZynqMP SoC, and connent the stream
> link of GQSPI to CSU DMA.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v4:
> - Rename "csu_dma" to "qspi_dma"
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
> index be15cc8814..2edeed911c 100644
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
> +    XlnxCSUDMA qspi_dma;
>  
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 49465a2794..30f43dfda2 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -50,6 +50,7 @@
>  #define QSPI_ADDR           0xff0f0000
>  #define LQSPI_ADDR          0xc0000000
>  #define QSPI_IRQ            15
> +#define QSPI_DMA_ADDR       0xff0f0800
>  
>  #define DP_ADDR             0xfd4a0000
>  #define DP_IRQ              113
> @@ -63,6 +64,8 @@
>  #define RTC_ADDR            0xffa60000
>  #define RTC_IRQ             26
>  
> +
> +

These blank lines look un-related, if you remove them, this looks good to me:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



>  #define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
>  
>  static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
> @@ -284,6 +287,8 @@ static void xlnx_zynqmp_init(Object *obj)
>      for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
>          object_initialize_child(obj, "adma[*]", &s->adma[i], TYPE_XLNX_ZDMA);
>      }
> +
> +    object_initialize_child(obj, "qspi-dma", &s->qspi_dma, TYPE_XLNX_CSU_DMA);
>  }
>  
>  static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> @@ -643,6 +648,15 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->adma[i]), 0,
>                             gic_spi[adma_ch_intr[i]]);
>      }
> +
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi_dma), errp)) {
> +        return;
> +    }
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ]);
> +    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
> +                             OBJECT(&s->qspi_dma), errp);
>  }
>  
>  static Property xlnx_zynqmp_props[] = {
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 4e6f4ffe90..27ec10f89b 100644
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
> 2.25.1
> 

