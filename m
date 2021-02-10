Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353183165C4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:56:27 +0100 (CET)
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9o6c-0007e4-AK
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9o5G-0006gG-2P; Wed, 10 Feb 2021 06:55:02 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:42680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9o5E-0004nZ-9o; Wed, 10 Feb 2021 06:55:01 -0500
Received: by mail-lf1-x133.google.com with SMTP id f23so2355401lfk.9;
 Wed, 10 Feb 2021 03:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QIzABhLDJ5Q0Ngs3M8y9FymRO6TSDU6K0+h95jO2/Fk=;
 b=bdmKM/rHjNurSB4QyBJIQFRRufejPNJxWd34uwnD8kc3DLG6AZnGOT5oa/eB58tRQD
 uWdSdcE+lKyyhtSH/UfO8QhtsNw0HW0RgnR7VO3BvpAYb1f/9h+cJJenZ75Yh6VY3jG9
 ImfQXKdfybHmNRjNSV3sr8gtizBm1n0VBfI9XktF9mBaaV4sp6snDRb0V5vhIqUF7Hn7
 MpottabbJtZ63VO4z4NYkhkLRHPhf3KIV/sucxtV5wW4xiF4yMCHCtDjBMBRwiL1/6VX
 nI3BsB6nv4aDt4RoqGRMiJdtw0jnuqASUUEmsIzm2sS+QeOqIl5l7Gemb2zaxAwiRyuR
 jnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QIzABhLDJ5Q0Ngs3M8y9FymRO6TSDU6K0+h95jO2/Fk=;
 b=qUkYstGPuN3Kf8rUCw4YVayJVcYZZm0Fl71icJeRLyAsARTzZynvGeNUMlIun6q/eW
 jiYDLB97nxZuO3lP86fWwQ7N10yH5pyP+jQQ1y+M1PbUsVpTLkXSnszyRN++Q+Jrz8sD
 nzWGllZ5BXSqhYNkn9Py6sLIT4ObKFGPjgkIR3kMGR49YKJftgHm+cxdI5HQvlrRZ2d7
 4u7uLsvoNtVqY21Hvm7oLEeJWSqYyi/be6zC8RQnpKYBA2ym//HhYt7pvGrgcMGKtO0J
 TwD7x4Pxb0I2QQxclZjgy7Bh7QFGj00cRGuI7ZjauaGn/Z5RqRrPjhPX2XnAP8FEqf2j
 uM3w==
X-Gm-Message-State: AOAM5309zqFf8cg9Cyhvoufnldju4DTCavhzcwF8pJkf3zAOxQnBGhMJ
 C20YqBn8ylhJ+O5+rjlL6p0=
X-Google-Smtp-Source: ABdhPJyU0L+VCZwvkMotjtUzTq/zW/YRGH9VsYul3OAVUgjWGDQS7GmU4Y26spIZQ5P9TvdBUEntYA==
X-Received: by 2002:ac2:539b:: with SMTP id g27mr1556105lfh.580.1612958098351; 
 Wed, 10 Feb 2021 03:54:58 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id r26sm293246lfi.295.2021.02.10.03.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 03:54:58 -0800 (PST)
Date: Wed, 10 Feb 2021 12:54:57 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 2/5] hw/arm: xlnx-zynqmp: Clean up coding convention
 issues
Message-ID: <20210210115457.GO477672@toto>
References: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
 <1612951813-50542-3-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612951813-50542-3-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x133.google.com
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

On Wed, Feb 10, 2021 at 06:10:10PM +0800, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> There are some coding convention warnings in xlnx-zynqmp.c and
> xlnx-zynqmp.h, as reported by:
> 
>   $ ./scripts/checkpatch.pl include/hw/arm/xlnx-zynqmp.h
>   $ ./scripts/checkpatch.pl hw/arm/xlnx-zynqmp.c
> 
> Let's clean them up.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v3:
> - new patch: xlnx-zynqmp: Clean up coding convention issues
> 
>  include/hw/arm/xlnx-zynqmp.h |  3 ++-
>  hw/arm/xlnx-zynqmp.c         | 11 +++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 6f45387..be15cc8 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -60,7 +60,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>  
>  #define XLNX_ZYNQMP_GIC_REGIONS 6
>  
> -/* ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
> +/*
> + * ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
>   * and under-decodes the 64k region. This mirrors the 4k regions to every 4k
>   * aligned address in the 64k region. To implement each GIC region needs a
>   * number of memory region aliases.
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 8818472..76b94a5 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -301,11 +301,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>  
>      ram_size = memory_region_size(s->ddr_ram);
>  
> -    /* Create the DDR Memory Regions. User friendly checks should happen at
> +    /*
> +     * Create the DDR Memory Regions. User friendly checks should happen at
>       * the board level
>       */
>      if (ram_size > XLNX_ZYNQMP_MAX_LOW_RAM_SIZE) {
> -        /* The RAM size is above the maximum available for the low DDR.
> +        /*
> +         * The RAM size is above the maximum available for the low DDR.
>           * Create the high DDR memory region as well.
>           */
>          assert(ram_size <= XLNX_ZYNQMP_MAX_RAM_SIZE);
> @@ -351,7 +353,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>  
>      qdev_realize(DEVICE(&s->apu_cluster), NULL, &error_fatal);
>  
> -    /* Realize APUs before realizing the GIC. KVM requires this.  */
> +    /* Realize APUs before realizing the GIC. KVM requires this. */

This doesn't look like a checkpatch fix...




>      for (i = 0; i < num_apus; i++) {
>          const char *name;
>  
> @@ -526,7 +528,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sdhci[i]);
>          Object *sdhci = OBJECT(&s->sdhci[i]);
>  
> -        /* Compatible with:
> +        /*
> +         * Compatible with:
>           * - SD Host Controller Specification Version 3.00
>           * - SDIO Specification Version 3.0
>           * - eMMC Specification Version 4.51
> -- 
> 2.7.4
> 

