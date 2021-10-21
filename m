Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B6435BAD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:28:47 +0200 (CEST)
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSVL-0001jt-2L
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mdSSE-0007MG-RS; Thu, 21 Oct 2021 03:25:34 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:36832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mdSSA-0003L7-Rt; Thu, 21 Oct 2021 03:25:34 -0400
Received: by mail-lf1-x12c.google.com with SMTP id g36so849564lfv.3;
 Thu, 21 Oct 2021 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=pD002zJYWYqGlmtmb/t7NDLdy5h3nUcoNRUVEMoNxss=;
 b=FWvPB0CWtQWOrZsi1JlZAGySTzSWa+GmYsmU7nAk//OPa09PEA/pz/UGgeZh3rIeIP
 N9+dhXPLb/4jqyK8szdUXaUsNOQAGEBwOsi24/U9Hxj0azeZYbt9/pSZ+KQ+dFb3y4rC
 5Ffn8tepXxlrLJxENVMflBp3RoRKwBBb6SHjpfyU3Ffizes7mX5KXTLetOtEIjhGUqc6
 iOCj5Ye3PMiht06V3w4z9U8hh1c6ZRrcy6rFKkls41nKotc2+1vFUNAi1z0XY//2dS2y
 Ll30RE9nADuZTu77fWTcalkoABjaWxbh0RKwYOLn1l3fwj8YMZcIdHGwwYwiUKHKKEeF
 CUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=pD002zJYWYqGlmtmb/t7NDLdy5h3nUcoNRUVEMoNxss=;
 b=nExMFn+cElTKYFR68KBtACtS67cHYnXyW7/M3V/Xhrqy/Wu2G3/WPdn6QZ9QhmXKLd
 Fefy7QmJRqrlXoj15rrizFJIh3kI7sO2m2G9QhvEgsOQ4hUOznw+ozpmUDqpW1u64DCU
 iebCyivy4H3mViXdBIXh2KNBPwnxpvfth6T0dMMcJyML7Yg/G6BNBv2yQm4ti00MFLbd
 tv1ttoH9tUJsmgGKqZeyi5sf5AZ82XexvETwJeFl2bAlH/M8f0a7/lZWr7Fk1UWKCHW+
 Lm8UkbJC8qy1XULD5K6J8IEnqG315BH20IeiSSJhmunefvERhmWC1Zzv7en2cImxn639
 A9LA==
X-Gm-Message-State: AOAM53334wv7wfqzOmOJofMnSTMvWnThoy4y06VzXbHqMR4v6hZb01aX
 sJMCk3obaTa+slzkLhq4r8Y=
X-Google-Smtp-Source: ABdhPJxeV0DZJu7GqrUpAdBVXdADiW62Cb13CJEtR4YUVmGPYi4zpKIaJs/wymwJ7Frgs9lOVxocDw==
X-Received: by 2002:a05:6512:2341:: with SMTP id
 p1mr3900062lfu.204.1634801128484; 
 Thu, 21 Oct 2021 00:25:28 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 x20sm385258lfu.196.2021.10.21.00.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 00:25:28 -0700 (PDT)
Date: Thu, 21 Oct 2021 09:25:26 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 1/5] aspeed/wdt: Introduce a container for the MMIO
 region
Message-ID: <20211021072525.GG23846@fralle-msi>
References: <20211018132609.160008-1-clg@kaod.org>
 <20211018132609.160008-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211018132609.160008-2-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -1001
X-Spam_score: -100.2
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-100.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2021 Oct 18] Mon 15:26:05, Cédric Le Goater wrote:
> On the AST2600, the 2nd watchdog timer can be controlled through the
> FMC controller to disable the alternate boot function. Next changes
> will map the WDT2 registers in the AST2600 FMC memory region. Add a
> container on top of the register region for this purpose.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  include/hw/watchdog/wdt_aspeed.h | 1 +
>  hw/watchdog/wdt_aspeed.c         | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
> index f945cd6c5833..14e91acb1284 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -28,6 +28,7 @@ struct AspeedWDTState {
>      QEMUTimer *timer;
>  
>      /*< public >*/
> +    MemoryRegion iomem_container;
>      MemoryRegion iomem;
>      uint32_t regs[ASPEED_WDT_REGS_MAX];
>  
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 146ffcd71301..803e861a9c61 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -275,9 +275,13 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>       */
>      s->pclk_freq = PCLK_HZ;
>  
> +    memory_region_init(&s->iomem_container, OBJECT(s),
> +                       TYPE_ASPEED_WDT ".container", ASPEED_WDT_REGS_MAX * 4);
> +    sysbus_init_mmio(sbd, &s->iomem_container);
> +
>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
>                            TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
> -    sysbus_init_mmio(sbd, &s->iomem);
> +    memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
>  }
>  
>  static Property aspeed_wdt_properties[] = {
> -- 
> 2.31.1
> 
> 

