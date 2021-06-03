Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C84639A00F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:46:02 +0200 (CEST)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lolnV-0003ZW-5m
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lolkd-0002VB-5F
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:43:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lolkZ-0006m2-CQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:43:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so3509708wmh.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hePt84QAzZ1tfsNCGGwklYvRPnR58S3Qt8jP+ioo4Kk=;
 b=EuyIWiU3aB83+K4gk5vlbhMAp84+TWYQ7cFDzh/VeTmULQraw0Py3LeaKoCqDdrLwK
 FPmiSy6PACG/G/j0Ex2iQQ1muNTtBgW7o//A6nnFzqvhLEN1mFe+HDUCAuAXFzGlqPUr
 1+l0mGaVR76BUkX9XtBbMF0FNHwf2XZstNodkbye4oXWfDS7KYiS6VfBiVpa+7GvRh1F
 WABTA/G0wxN/IBjR4rAvAoBZs+vXpK2Wx7K8wTGY1LBNZvxRFx7J8HzfdpPDby7DPqqq
 1/gAPKIgBS4Ocd/GCtx6BXa7DX/WxBknKCihWVEkHzBgJczMFGw79RKqXWafyuPdYUXZ
 GneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hePt84QAzZ1tfsNCGGwklYvRPnR58S3Qt8jP+ioo4Kk=;
 b=BucbTu0H5aS/THA/uL5ehkdqPAM608MBrdw84MgKAnlnWpMJVdOQRmLpBDVYZgDxxZ
 rIORsC2tKV39d+oQtIPkaPzqfRMaqpBYkZbvCUjwN5FpHDyh1uoCYxfJr2k0bQZB0lDn
 RL5quRpDf5MISjKlty25pB+w1t/o4ZKBqk0AMRi9IEpV/PmlV52Wm4JOpvycrtoyUnf7
 JZEUeWgQt5Ln/8iIduJorxuMSvWrl2nDuKcLwnbVr1ObCi0L/PQSJVKkOO/ZTdMCvpD1
 /D9Bef0FML0Vw1s/e+R/h7o6qpZ9550jVo6locz4OlhLUYMRNdu2Z2pYKv48e0dXF8Kl
 2jAg==
X-Gm-Message-State: AOAM532ztEPaHbLoz7UHm+J+plFnBrBR+uzgyqWtOk5Jij8Bzn+F2QSS
 PHgkcIimSgwmVn5dwRNXeF9nCdOK9hlKpQ==
X-Google-Smtp-Source: ABdhPJzWCy9tcnpuvTk1y+MdhEX+DE4D7PNvL23qPvGH0PYH9Dh5au8lHjTPUrkifOo9Ww99xq4Mcg==
X-Received: by 2002:a05:600c:22cf:: with SMTP id
 15mr30759939wmg.144.1622720576345; 
 Thu, 03 Jun 2021 04:42:56 -0700 (PDT)
Received: from leviathan (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id k82sm5821199wmf.11.2021.06.03.04.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 04:42:55 -0700 (PDT)
Date: Thu, 3 Jun 2021 12:42:54 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v4 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20210603114254.mkqr4jnpfqkx3m6w@leviathan>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-8-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602180042.111347-8-shashi.mallela@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, rad@semihalf.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 02, 2021 at 14:00:41 -0400, Shashi Mallela wrote:
> Included creation of ITS as part of SBSA platform GIC
> initialization.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 43c19b4923..3d9c073636 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -34,7 +34,7 @@
>  #include "hw/boards.h"
>  #include "hw/ide/internal.h"
>  #include "hw/ide/ahci_internal.h"
> -#include "hw/intc/arm_gicv3_common.h"
> +#include "hw/intc/arm_gicv3_its_common.h"
>  #include "hw/loader.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/qdev-properties.h"
> @@ -64,6 +64,7 @@ enum {
>      SBSA_CPUPERIPHS,
>      SBSA_GIC_DIST,
>      SBSA_GIC_REDIST,
> +    SBSA_GIC_ITS,
>      SBSA_SECURE_EC,
>      SBSA_GWDT,
>      SBSA_GWDT_REFRESH,
> @@ -107,6 +108,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
>      [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
>      [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
>      [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },

It seems customary in QEMU to flag gaps in memory space (although
admittedly, we'd already failed to do so here). This patch leaves a
gap of 0x00010000. Is there a particular reason?

> +    [SBSA_GIC_ITS] =            { 0x44090000, 0x00020000 },

And then again a gap (the one we already had).

/
    Leif

>      [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
>      [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
>      [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
> @@ -377,7 +379,20 @@ static void create_secure_ram(SBSAMachineState *sms,
>      memory_region_add_subregion(secure_sysmem, base, secram);
>  }
>  
> -static void create_gic(SBSAMachineState *sms)
> +static void create_its(SBSAMachineState *sms)
> +{
> +    DeviceState *dev;
> +
> +    dev = qdev_new(TYPE_ARM_GICV3_ITS);
> +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> +
> +    object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(sms->gic),
> +                             &error_abort);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    sysbus_mmio_map(s, 0, sbsa_ref_memmap[SBSA_GIC_ITS].base);
> +}
> +
> +static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
>  {
>      unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
>      SysBusDevice *gicbusdev;
> @@ -404,6 +419,10 @@ static void create_gic(SBSAMachineState *sms)
>      qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
>      qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
>  
> +    object_property_set_link(OBJECT(sms->gic), "sysmem", OBJECT(mem),
> +                                 &error_fatal);
> +    qdev_prop_set_bit(sms->gic, "has-lpi", true);
> +
>      gicbusdev = SYS_BUS_DEVICE(sms->gic);
>      sysbus_realize_and_unref(gicbusdev, &error_fatal);
>      sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
> @@ -450,6 +469,7 @@ static void create_gic(SBSAMachineState *sms)
>          sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
>      }
> +    create_its(sms);
>  }
>  
>  static void create_uart(const SBSAMachineState *sms, int uart,
> @@ -762,7 +782,7 @@ static void sbsa_ref_init(MachineState *machine)
>  
>      create_secure_ram(sms, secure_sysmem);
>  
> -    create_gic(sms);
> +    create_gic(sms, sysmem);
>  
>      create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
>      create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
> -- 
> 2.27.0
> 

