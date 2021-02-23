Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6FD322757
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:00:44 +0100 (CET)
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETYg-0002fm-Ji
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETX5-00026L-K2; Tue, 23 Feb 2021 03:59:03 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:42184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETX3-0005q7-Oe; Tue, 23 Feb 2021 03:59:03 -0500
Received: by mail-lj1-x232.google.com with SMTP id v17so1062933ljj.9;
 Tue, 23 Feb 2021 00:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mIP8UMSL/CqxQ2Gk1slC+3UAzXN5xQrY/w+fjMii7zU=;
 b=QRC6jXKcQ1rKUnHbRbVvtIXYUF2tb0IG/tJnJtreFKBBQsn472eawq6vO35SxbF2/w
 XoHhUftADxyniu0CDFfwD+d9fi/BQ3NTC0tvCyPq7UFR9WaFdl5iiFcSb1tzDaNSOSCa
 DMB8eGbMItqtX6/3qRtEg/kT2ZRWcyRdpjRvQClOU9dBEe2mpfjV2CghixpxcUpnlnhF
 /TkNA3lazN7reb5AkPwNiqJzGZ7c2LMXHtrJckMNUeEGZAcvO6mOAsIWWLO9IimuFZe9
 BESlO+vTm1zf/Vj1yjJJtcQfbjxYI66YkN3VYUAKmYV6kKIGeuVnhas2WFsxel8ZwSfF
 LpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mIP8UMSL/CqxQ2Gk1slC+3UAzXN5xQrY/w+fjMii7zU=;
 b=dyS4oGPbv0s9t4gCQb+MWRLao8jth2TrnkncQG1lG79/ud32uya8xqTvnrcN0EB9aQ
 1S+9m5D1f/T7tnCV6tPbM4M8yrRJYyOqxK2shBwEr40DMO7jjGW3oQ6FaFf68jHawrUE
 9J9afdeJeOjJPq8069zjN/VABZPyei6tHAvo9oXGdoECZht8BGykXO9+PJWtFVQW5CtP
 5he6NQABs6cTmLQ1Y5oayE2uPR892r/RiEXcx42zjoEY9OSuX8OJrm2Tm6T0SiZs3x94
 Zh7zQvLzRgFNA4ofI0PU503MgLmG9fP9Q6DrXM/kGkUM7H7gfbLjfILMVd3iwmgo915U
 Z2LA==
X-Gm-Message-State: AOAM532OgPPUkp/lI7l0g6x3/BYhsnOPQjWFss8ApFQOdEKNCzWJqcEM
 mgPR8igYGC6Qgm2MccOtbAc=
X-Google-Smtp-Source: ABdhPJzTZJLClSEfbK00fOomTruWJPD/m15I7WTyPV+RVIphr768ou4SgskiIYdwv8MwYjPjSSYQCA==
X-Received: by 2002:a05:651c:548:: with SMTP id
 q8mr16098203ljp.256.1614070738664; 
 Tue, 23 Feb 2021 00:58:58 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id u23sm2721526ljd.28.2021.02.23.00.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 00:58:58 -0800 (PST)
Date: Tue, 23 Feb 2021 09:58:57 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v4 2/5] hw/arm: xlnx-zynqmp: Clean up coding convention
 issues
Message-ID: <20210223085857.GR477672@toto>
References: <20210222130514.2167-1-bmeng.cn@gmail.com>
 <20210222130514.2167-3-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222130514.2167-3-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x232.google.com
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

On Mon, Feb 22, 2021 at 09:05:11PM +0800, Bin Meng wrote:
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

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> ---
> 
> Changes in v4:
> - remove one change that is not a checkpatch warning
> 
>  include/hw/arm/xlnx-zynqmp.h | 3 ++-
>  hw/arm/xlnx-zynqmp.c         | 9 ++++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 6f45387a17..be15cc8814 100644
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
> index 881847255b..49465a2794 100644
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
> 2.25.1
> 

