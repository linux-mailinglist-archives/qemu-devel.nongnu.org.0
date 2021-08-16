Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE9D3ED228
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 12:42:24 +0200 (CEST)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFa4U-0001y8-Bs
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 06:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFa3H-00010o-HR; Mon, 16 Aug 2021 06:41:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFa3E-0008M5-8v; Mon, 16 Aug 2021 06:41:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r7so22980302wrs.0;
 Mon, 16 Aug 2021 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tn3Em6ZFGrU10eyzUMf9rfYPSQbOP2pgU6DJJZoJD3c=;
 b=izJs+aHB7t4r0UHIfQ9/5p6UFtQZWCIKwDabAZ2KT9MGa9/X9ENnngc00zXPK+yUIu
 9mehc+A/QoVqz1cRkyXdJzpUOYZbesqpTAZVTdYpBBZ2v2neZH/dXCqiS/J9fgnZSALg
 5/pQFvmBspiPunptEYrIk1ZDNm2eqOf1xXGkd+c/MUEh9390ETkyKM7MiPBNPXXwsLhd
 RTKqOgf8GxmePfVaqk32Hnonjq53hMQPhmI67ts5IENZRGUNwLokxBV12uP3pTgsGWBH
 1MZpZZYF4dacr1NzRichYYN3O75va0a50gTmNmn2ehKCC62K6A6MI9fU3LoYR+bUPFtC
 MV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tn3Em6ZFGrU10eyzUMf9rfYPSQbOP2pgU6DJJZoJD3c=;
 b=sOaR9Y+Myv5Ano2HJNRgoNcWezwK0UTujOderhubJlV90PNRKViNiUuHLdJJIAatWa
 mAAF+08a4s7iF+8f5a0PWsUSN3OBxTIralUI4gOERK9OvCM3qoyQ6INShSyc7cicjO2E
 iKuq9JPOaKq2bhUpOGfez6SKVSJsCVUJ3AuwZwwpBNKM01+J7keNy9DFp+GVKgUxr8wo
 ZvKhn/2C0TiD9r9hD+/tVYNxttDMaYnx6sdyPN/iPTZG3gcyfKQ0zrumYlOyrrRB0EX+
 SgW27DHY3ERiO2E/MZl6avpI7jexCthy0YNSJanXGHTDyFCr1/DGbqYk9hydHmK4P59H
 F9Ng==
X-Gm-Message-State: AOAM533d2t8wq1fhzcNqjIewFZTYiq+b/8W9GsBhqJ3o9IOcq2kt/jCf
 72H7+jO+7Ygr00mYipR+k2k=
X-Google-Smtp-Source: ABdhPJzXW2927vIy/kSS+oVTsmY8nyZUGejZ7R/3z/9wPjtWD9TRjKNaEFrFbJCc82YBc1eAr122aA==
X-Received: by 2002:adf:fbc9:: with SMTP id d9mr17705299wrs.152.1629110462298; 
 Mon, 16 Aug 2021 03:41:02 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z15sm10872649wrp.30.2021.08.16.03.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 03:41:01 -0700 (PDT)
Subject: Re: [PATCH v3] hw/dma/pl330: Add memory region to replace default
To: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>
References: <4C23C17B8E87E74E906A25A3254A03F4FA1FC8CE@SHASXM03.verisilicon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <74c133ba-d318-4e27-76d3-11af5d72a214@amsat.org>
Date: Mon, 16 Aug 2021 12:41:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4C23C17B8E87E74E906A25A3254A03F4FA1FC8CE@SHASXM03.verisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.147,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 12:24 PM, Wen, Jianxian wrote:
> PL330 needs a memory region which can connect with SMMU IOMMU region to support SMMU translate.
> 
> Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
> ---
> Changes v1 -> v2 (after review of Peter Maydell):
>  - Use the dma_memory_read/dma_memory_write functions, update function AddressSpace* parameter.
> Changes v2 -> v3 (after review of Philippe Mathieu-Daudé):
>  - Refine code to comply with code style, update error message if memory link is not set.
> 
>  hw/arm/exynos4210.c  |  3 +++
>  hw/arm/xilinx_zynq.c |  3 +++
>  hw/dma/pl330.c       | 20 ++++++++++++++++----
>  3 files changed, 22 insertions(+), 4 deletions(-)

> @@ -1562,6 +1565,12 @@ static void pl330_realize(DeviceState *dev, Error **errp)
>                            "dma", PL330_IOMEM_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>  
> +    if (!s->mem_mr) {
> +        error_setg(errp, "'memory' link is not set");
> +        return;
> +    }
> +    address_space_init(&s->mem_as, s->mem_mr, "pl330");

So when multiple controllers are created, this makes the 'info mtree'
output longer, all AS named similarly:

./qemu-system-arm -M smdkc210 -S -monitor stdio
QEMU 6.0.93 monitor - type 'help' for more information
(qemu) info mtree
address-space: memory
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-000000000000ffff (prio 0, rom): exynos4210.irom
    0000000002000000-000000000200ffff (prio 0, rom): alias
exynos4210.irom_alias @exynos4210.irom 0000000000000000-000000000000ffff
    0000000002020000-000000000203ffff (prio 0, ram): exynos4210.iram
    0000000005000000-00000000050000ff (prio 0, i/o): lan9118-mmio
    0000000010000000-0000000010000007 (prio 0, i/o): exynos4210.chipid
    0000000010020000-0000000010023d0b (prio 0, i/o): exynos4210.pmu
    0000000010030000-0000000010045103 (prio 0, i/o): exynos4210.clk
    0000000010050000-0000000010050443 (prio 0, i/o): exynos4210-mct
    0000000010070000-00000000100700ff (prio 0, i/o): exynos4210-rtc
    0000000010440000-0000000010440107 (prio 0, i/o): exynos4210-combiner
    0000000010448000-0000000010448107 (prio 0, i/o): exynos4210-combiner
    0000000010480000-000000001048ffff (prio 0, i/o):
exynos4210-cpu-container
      0000000010480000-00000000104800ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu0 @gic_cpu 0000000000000000-00000000000000ff
      0000000010488000-00000000104880ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu1 @gic_cpu 0000000000000000-00000000000000ff
    0000000010490000-000000001049ffff (prio 0, i/o):
exynos4210-dist-container
      0000000010490000-0000000010490fff (prio 0, i/o): alias
exynos4210-gic-alias_dist0 @gic_dist 0000000000000000-0000000000000fff
      0000000010498000-0000000010498fff (prio 0, i/o): alias
exynos4210-gic-alias_dist1 @gic_dist 0000000000000000-0000000000000fff
    0000000010500000-0000000010501fff (prio 0, i/o): a9mp-priv-container
      0000000010500000-00000000105000ff (prio 0, i/o): a9-scu
      0000000010500100-00000000105001ff (prio 0, i/o): gic_cpu
      0000000010500200-000000001050021f (prio 0, i/o): a9gtimer shared
      0000000010500600-000000001050061f (prio 0, i/o): arm_mptimer_timer
      0000000010500620-000000001050063f (prio 0, i/o): arm_mptimer_timer
      0000000010501000-0000000010501fff (prio 0, i/o): gic_dist
    0000000010502000-0000000010502fff (prio 0, i/o): l2x0_cc
    0000000010830400-00000000108305ff (prio 0, i/o): exynos4210.rng
    0000000011c00000-0000000011c04113 (prio 0, i/o): exynos4210.fimd
    0000000012510000-00000000125100ff (prio 0, i/o): sdhci
    0000000012520000-00000000125200ff (prio 0, i/o): sdhci
    0000000012530000-00000000125300ff (prio 0, i/o): sdhci
    0000000012540000-00000000125400ff (prio 0, i/o): sdhci
    0000000012580000-0000000012580fff (prio 0, i/o): ehci
      0000000012580000-000000001258000f (prio 0, i/o): capabilities
      0000000012580010-0000000012580053 (prio 0, i/o): operational
      0000000012580054-000000001258006b (prio 0, i/o): ports
    0000000012680000-0000000012680fff (prio 0, i/o): dma
    0000000012690000-0000000012690fff (prio 0, i/o): dma
    0000000012850000-0000000012850fff (prio 0, i/o): dma
    0000000013800000-000000001380003b (prio 0, i/o): exynos4210.uart
    0000000013810000-000000001381003b (prio 0, i/o): exynos4210.uart
    0000000013820000-000000001382003b (prio 0, i/o): exynos4210.uart
    0000000013830000-000000001383003b (prio 0, i/o): exynos4210.uart
    0000000013860000-0000000013860013 (prio 0, i/o): exynos4210.i2c
    0000000013870000-0000000013870013 (prio 0, i/o): exynos4210.i2c
    0000000013880000-0000000013880013 (prio 0, i/o): exynos4210.i2c
    0000000013890000-0000000013890013 (prio 0, i/o): exynos4210.i2c
    00000000138a0000-00000000138a0013 (prio 0, i/o): exynos4210.i2c
    00000000138b0000-00000000138b0013 (prio 0, i/o): exynos4210.i2c
    00000000138c0000-00000000138c0013 (prio 0, i/o): exynos4210.i2c
    00000000138d0000-00000000138d0013 (prio 0, i/o): exynos4210.i2c
    00000000138e0000-00000000138e0013 (prio 0, i/o): exynos4210.i2c
    00000000139d0000-00000000139d004f (prio 0, i/o): exynos4210-pwm
    0000000040000000-000000007fffffff (prio 0, ram): exynos4210.dram0

address-space: I/O
  0000000000000000-000000000000ffff (prio 0, i/o): io

address-space: cpu-memory-0
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-000000000000ffff (prio 0, rom): exynos4210.irom
    0000000002000000-000000000200ffff (prio 0, rom): alias
exynos4210.irom_alias @exynos4210.irom 0000000000000000-000000000000ffff
    0000000002020000-000000000203ffff (prio 0, ram): exynos4210.iram
    0000000005000000-00000000050000ff (prio 0, i/o): lan9118-mmio
    0000000010000000-0000000010000007 (prio 0, i/o): exynos4210.chipid
    0000000010020000-0000000010023d0b (prio 0, i/o): exynos4210.pmu
    0000000010030000-0000000010045103 (prio 0, i/o): exynos4210.clk
    0000000010050000-0000000010050443 (prio 0, i/o): exynos4210-mct
    0000000010070000-00000000100700ff (prio 0, i/o): exynos4210-rtc
    0000000010440000-0000000010440107 (prio 0, i/o): exynos4210-combiner
    0000000010448000-0000000010448107 (prio 0, i/o): exynos4210-combiner
    0000000010480000-000000001048ffff (prio 0, i/o):
exynos4210-cpu-container
      0000000010480000-00000000104800ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu0 @gic_cpu 0000000000000000-00000000000000ff
      0000000010488000-00000000104880ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu1 @gic_cpu 0000000000000000-00000000000000ff
    0000000010490000-000000001049ffff (prio 0, i/o):
exynos4210-dist-container
      0000000010490000-0000000010490fff (prio 0, i/o): alias
exynos4210-gic-alias_dist0 @gic_dist 0000000000000000-0000000000000fff
      0000000010498000-0000000010498fff (prio 0, i/o): alias
exynos4210-gic-alias_dist1 @gic_dist 0000000000000000-0000000000000fff
    0000000010500000-0000000010501fff (prio 0, i/o): a9mp-priv-container
      0000000010500000-00000000105000ff (prio 0, i/o): a9-scu
      0000000010500100-00000000105001ff (prio 0, i/o): gic_cpu
      0000000010500200-000000001050021f (prio 0, i/o): a9gtimer shared
      0000000010500600-000000001050061f (prio 0, i/o): arm_mptimer_timer
      0000000010500620-000000001050063f (prio 0, i/o): arm_mptimer_timer
      0000000010501000-0000000010501fff (prio 0, i/o): gic_dist
    0000000010502000-0000000010502fff (prio 0, i/o): l2x0_cc
    0000000010830400-00000000108305ff (prio 0, i/o): exynos4210.rng
    0000000011c00000-0000000011c04113 (prio 0, i/o): exynos4210.fimd
    0000000012510000-00000000125100ff (prio 0, i/o): sdhci
    0000000012520000-00000000125200ff (prio 0, i/o): sdhci
    0000000012530000-00000000125300ff (prio 0, i/o): sdhci
    0000000012540000-00000000125400ff (prio 0, i/o): sdhci
    0000000012580000-0000000012580fff (prio 0, i/o): ehci
      0000000012580000-000000001258000f (prio 0, i/o): capabilities
      0000000012580010-0000000012580053 (prio 0, i/o): operational
      0000000012580054-000000001258006b (prio 0, i/o): ports
    0000000012680000-0000000012680fff (prio 0, i/o): dma
    0000000012690000-0000000012690fff (prio 0, i/o): dma
    0000000012850000-0000000012850fff (prio 0, i/o): dma
    0000000013800000-000000001380003b (prio 0, i/o): exynos4210.uart
    0000000013810000-000000001381003b (prio 0, i/o): exynos4210.uart
    0000000013820000-000000001382003b (prio 0, i/o): exynos4210.uart
    0000000013830000-000000001383003b (prio 0, i/o): exynos4210.uart
    0000000013860000-0000000013860013 (prio 0, i/o): exynos4210.i2c
    0000000013870000-0000000013870013 (prio 0, i/o): exynos4210.i2c
    0000000013880000-0000000013880013 (prio 0, i/o): exynos4210.i2c
    0000000013890000-0000000013890013 (prio 0, i/o): exynos4210.i2c
    00000000138a0000-00000000138a0013 (prio 0, i/o): exynos4210.i2c
    00000000138b0000-00000000138b0013 (prio 0, i/o): exynos4210.i2c
    00000000138c0000-00000000138c0013 (prio 0, i/o): exynos4210.i2c
    00000000138d0000-00000000138d0013 (prio 0, i/o): exynos4210.i2c
    00000000138e0000-00000000138e0013 (prio 0, i/o): exynos4210.i2c
    00000000139d0000-00000000139d004f (prio 0, i/o): exynos4210-pwm
    0000000040000000-000000007fffffff (prio 0, ram): exynos4210.dram0

address-space: cpu-memory-1
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-000000000000ffff (prio 0, rom): exynos4210.irom
    0000000002000000-000000000200ffff (prio 0, rom): alias
exynos4210.irom_alias @exynos4210.irom 0000000000000000-000000000000ffff
    0000000002020000-000000000203ffff (prio 0, ram): exynos4210.iram
    0000000005000000-00000000050000ff (prio 0, i/o): lan9118-mmio
    0000000010000000-0000000010000007 (prio 0, i/o): exynos4210.chipid
    0000000010020000-0000000010023d0b (prio 0, i/o): exynos4210.pmu
    0000000010030000-0000000010045103 (prio 0, i/o): exynos4210.clk
    0000000010050000-0000000010050443 (prio 0, i/o): exynos4210-mct
    0000000010070000-00000000100700ff (prio 0, i/o): exynos4210-rtc
    0000000010440000-0000000010440107 (prio 0, i/o): exynos4210-combiner
    0000000010448000-0000000010448107 (prio 0, i/o): exynos4210-combiner
    0000000010480000-000000001048ffff (prio 0, i/o):
exynos4210-cpu-container
      0000000010480000-00000000104800ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu0 @gic_cpu 0000000000000000-00000000000000ff
      0000000010488000-00000000104880ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu1 @gic_cpu 0000000000000000-00000000000000ff
    0000000010490000-000000001049ffff (prio 0, i/o):
exynos4210-dist-container
      0000000010490000-0000000010490fff (prio 0, i/o): alias
exynos4210-gic-alias_dist0 @gic_dist 0000000000000000-0000000000000fff
      0000000010498000-0000000010498fff (prio 0, i/o): alias
exynos4210-gic-alias_dist1 @gic_dist 0000000000000000-0000000000000fff
    0000000010500000-0000000010501fff (prio 0, i/o): a9mp-priv-container
      0000000010500000-00000000105000ff (prio 0, i/o): a9-scu
      0000000010500100-00000000105001ff (prio 0, i/o): gic_cpu
      0000000010500200-000000001050021f (prio 0, i/o): a9gtimer shared
      0000000010500600-000000001050061f (prio 0, i/o): arm_mptimer_timer
      0000000010500620-000000001050063f (prio 0, i/o): arm_mptimer_timer
      0000000010501000-0000000010501fff (prio 0, i/o): gic_dist
    0000000010502000-0000000010502fff (prio 0, i/o): l2x0_cc
    0000000010830400-00000000108305ff (prio 0, i/o): exynos4210.rng
    0000000011c00000-0000000011c04113 (prio 0, i/o): exynos4210.fimd
    0000000012510000-00000000125100ff (prio 0, i/o): sdhci
    0000000012520000-00000000125200ff (prio 0, i/o): sdhci
    0000000012530000-00000000125300ff (prio 0, i/o): sdhci
    0000000012540000-00000000125400ff (prio 0, i/o): sdhci
    0000000012580000-0000000012580fff (prio 0, i/o): ehci
      0000000012580000-000000001258000f (prio 0, i/o): capabilities
      0000000012580010-0000000012580053 (prio 0, i/o): operational
      0000000012580054-000000001258006b (prio 0, i/o): ports
    0000000012680000-0000000012680fff (prio 0, i/o): dma
    0000000012690000-0000000012690fff (prio 0, i/o): dma
    0000000012850000-0000000012850fff (prio 0, i/o): dma
    0000000013800000-000000001380003b (prio 0, i/o): exynos4210.uart
    0000000013810000-000000001381003b (prio 0, i/o): exynos4210.uart
    0000000013820000-000000001382003b (prio 0, i/o): exynos4210.uart
    0000000013830000-000000001383003b (prio 0, i/o): exynos4210.uart
    0000000013860000-0000000013860013 (prio 0, i/o): exynos4210.i2c
    0000000013870000-0000000013870013 (prio 0, i/o): exynos4210.i2c
    0000000013880000-0000000013880013 (prio 0, i/o): exynos4210.i2c
    0000000013890000-0000000013890013 (prio 0, i/o): exynos4210.i2c
    00000000138a0000-00000000138a0013 (prio 0, i/o): exynos4210.i2c
    00000000138b0000-00000000138b0013 (prio 0, i/o): exynos4210.i2c
    00000000138c0000-00000000138c0013 (prio 0, i/o): exynos4210.i2c
    00000000138d0000-00000000138d0013 (prio 0, i/o): exynos4210.i2c
    00000000138e0000-00000000138e0013 (prio 0, i/o): exynos4210.i2c
    00000000139d0000-00000000139d004f (prio 0, i/o): exynos4210-pwm
    0000000040000000-000000007fffffff (prio 0, ram): exynos4210.dram0

address-space: pl330
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-000000000000ffff (prio 0, rom): exynos4210.irom
    0000000002000000-000000000200ffff (prio 0, rom): alias
exynos4210.irom_alias @exynos4210.irom 0000000000000000-000000000000ffff
    0000000002020000-000000000203ffff (prio 0, ram): exynos4210.iram
    0000000005000000-00000000050000ff (prio 0, i/o): lan9118-mmio
    0000000010000000-0000000010000007 (prio 0, i/o): exynos4210.chipid
    0000000010020000-0000000010023d0b (prio 0, i/o): exynos4210.pmu
    0000000010030000-0000000010045103 (prio 0, i/o): exynos4210.clk
    0000000010050000-0000000010050443 (prio 0, i/o): exynos4210-mct
    0000000010070000-00000000100700ff (prio 0, i/o): exynos4210-rtc
    0000000010440000-0000000010440107 (prio 0, i/o): exynos4210-combiner
    0000000010448000-0000000010448107 (prio 0, i/o): exynos4210-combiner
    0000000010480000-000000001048ffff (prio 0, i/o):
exynos4210-cpu-container
      0000000010480000-00000000104800ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu0 @gic_cpu 0000000000000000-00000000000000ff
      0000000010488000-00000000104880ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu1 @gic_cpu 0000000000000000-00000000000000ff
    0000000010490000-000000001049ffff (prio 0, i/o):
exynos4210-dist-container
      0000000010490000-0000000010490fff (prio 0, i/o): alias
exynos4210-gic-alias_dist0 @gic_dist 0000000000000000-0000000000000fff
      0000000010498000-0000000010498fff (prio 0, i/o): alias
exynos4210-gic-alias_dist1 @gic_dist 0000000000000000-0000000000000fff
    0000000010500000-0000000010501fff (prio 0, i/o): a9mp-priv-container
      0000000010500000-00000000105000ff (prio 0, i/o): a9-scu
      0000000010500100-00000000105001ff (prio 0, i/o): gic_cpu
      0000000010500200-000000001050021f (prio 0, i/o): a9gtimer shared
      0000000010500600-000000001050061f (prio 0, i/o): arm_mptimer_timer
      0000000010500620-000000001050063f (prio 0, i/o): arm_mptimer_timer
      0000000010501000-0000000010501fff (prio 0, i/o): gic_dist
    0000000010502000-0000000010502fff (prio 0, i/o): l2x0_cc
    0000000010830400-00000000108305ff (prio 0, i/o): exynos4210.rng
    0000000011c00000-0000000011c04113 (prio 0, i/o): exynos4210.fimd
    0000000012510000-00000000125100ff (prio 0, i/o): sdhci
    0000000012520000-00000000125200ff (prio 0, i/o): sdhci
    0000000012530000-00000000125300ff (prio 0, i/o): sdhci
    0000000012540000-00000000125400ff (prio 0, i/o): sdhci
    0000000012580000-0000000012580fff (prio 0, i/o): ehci
      0000000012580000-000000001258000f (prio 0, i/o): capabilities
      0000000012580010-0000000012580053 (prio 0, i/o): operational
      0000000012580054-000000001258006b (prio 0, i/o): ports
    0000000012680000-0000000012680fff (prio 0, i/o): dma
    0000000012690000-0000000012690fff (prio 0, i/o): dma
    0000000012850000-0000000012850fff (prio 0, i/o): dma
    0000000013800000-000000001380003b (prio 0, i/o): exynos4210.uart
    0000000013810000-000000001381003b (prio 0, i/o): exynos4210.uart
    0000000013820000-000000001382003b (prio 0, i/o): exynos4210.uart
    0000000013830000-000000001383003b (prio 0, i/o): exynos4210.uart
    0000000013860000-0000000013860013 (prio 0, i/o): exynos4210.i2c
    0000000013870000-0000000013870013 (prio 0, i/o): exynos4210.i2c
    0000000013880000-0000000013880013 (prio 0, i/o): exynos4210.i2c
    0000000013890000-0000000013890013 (prio 0, i/o): exynos4210.i2c
    00000000138a0000-00000000138a0013 (prio 0, i/o): exynos4210.i2c
    00000000138b0000-00000000138b0013 (prio 0, i/o): exynos4210.i2c
    00000000138c0000-00000000138c0013 (prio 0, i/o): exynos4210.i2c
    00000000138d0000-00000000138d0013 (prio 0, i/o): exynos4210.i2c
    00000000138e0000-00000000138e0013 (prio 0, i/o): exynos4210.i2c
    00000000139d0000-00000000139d004f (prio 0, i/o): exynos4210-pwm
    0000000040000000-000000007fffffff (prio 0, ram): exynos4210.dram0

address-space: pl330
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-000000000000ffff (prio 0, rom): exynos4210.irom
    0000000002000000-000000000200ffff (prio 0, rom): alias
exynos4210.irom_alias @exynos4210.irom 0000000000000000-000000000000ffff
    0000000002020000-000000000203ffff (prio 0, ram): exynos4210.iram
    0000000005000000-00000000050000ff (prio 0, i/o): lan9118-mmio
    0000000010000000-0000000010000007 (prio 0, i/o): exynos4210.chipid
    0000000010020000-0000000010023d0b (prio 0, i/o): exynos4210.pmu
    0000000010030000-0000000010045103 (prio 0, i/o): exynos4210.clk
    0000000010050000-0000000010050443 (prio 0, i/o): exynos4210-mct
    0000000010070000-00000000100700ff (prio 0, i/o): exynos4210-rtc
    0000000010440000-0000000010440107 (prio 0, i/o): exynos4210-combiner
    0000000010448000-0000000010448107 (prio 0, i/o): exynos4210-combiner
    0000000010480000-000000001048ffff (prio 0, i/o):
exynos4210-cpu-container
      0000000010480000-00000000104800ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu0 @gic_cpu 0000000000000000-00000000000000ff
      0000000010488000-00000000104880ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu1 @gic_cpu 0000000000000000-00000000000000ff
    0000000010490000-000000001049ffff (prio 0, i/o):
exynos4210-dist-container
      0000000010490000-0000000010490fff (prio 0, i/o): alias
exynos4210-gic-alias_dist0 @gic_dist 0000000000000000-0000000000000fff
      0000000010498000-0000000010498fff (prio 0, i/o): alias
exynos4210-gic-alias_dist1 @gic_dist 0000000000000000-0000000000000fff
    0000000010500000-0000000010501fff (prio 0, i/o): a9mp-priv-container
      0000000010500000-00000000105000ff (prio 0, i/o): a9-scu
      0000000010500100-00000000105001ff (prio 0, i/o): gic_cpu
      0000000010500200-000000001050021f (prio 0, i/o): a9gtimer shared
      0000000010500600-000000001050061f (prio 0, i/o): arm_mptimer_timer
      0000000010500620-000000001050063f (prio 0, i/o): arm_mptimer_timer
      0000000010501000-0000000010501fff (prio 0, i/o): gic_dist
    0000000010502000-0000000010502fff (prio 0, i/o): l2x0_cc
    0000000010830400-00000000108305ff (prio 0, i/o): exynos4210.rng
    0000000011c00000-0000000011c04113 (prio 0, i/o): exynos4210.fimd
    0000000012510000-00000000125100ff (prio 0, i/o): sdhci
    0000000012520000-00000000125200ff (prio 0, i/o): sdhci
    0000000012530000-00000000125300ff (prio 0, i/o): sdhci
    0000000012540000-00000000125400ff (prio 0, i/o): sdhci
    0000000012580000-0000000012580fff (prio 0, i/o): ehci
      0000000012580000-000000001258000f (prio 0, i/o): capabilities
      0000000012580010-0000000012580053 (prio 0, i/o): operational
      0000000012580054-000000001258006b (prio 0, i/o): ports
    0000000012680000-0000000012680fff (prio 0, i/o): dma
    0000000012690000-0000000012690fff (prio 0, i/o): dma
    0000000012850000-0000000012850fff (prio 0, i/o): dma
    0000000013800000-000000001380003b (prio 0, i/o): exynos4210.uart
    0000000013810000-000000001381003b (prio 0, i/o): exynos4210.uart
    0000000013820000-000000001382003b (prio 0, i/o): exynos4210.uart
    0000000013830000-000000001383003b (prio 0, i/o): exynos4210.uart
    0000000013860000-0000000013860013 (prio 0, i/o): exynos4210.i2c
    0000000013870000-0000000013870013 (prio 0, i/o): exynos4210.i2c
    0000000013880000-0000000013880013 (prio 0, i/o): exynos4210.i2c
    0000000013890000-0000000013890013 (prio 0, i/o): exynos4210.i2c
    00000000138a0000-00000000138a0013 (prio 0, i/o): exynos4210.i2c
    00000000138b0000-00000000138b0013 (prio 0, i/o): exynos4210.i2c
    00000000138c0000-00000000138c0013 (prio 0, i/o): exynos4210.i2c
    00000000138d0000-00000000138d0013 (prio 0, i/o): exynos4210.i2c
    00000000138e0000-00000000138e0013 (prio 0, i/o): exynos4210.i2c
    00000000139d0000-00000000139d004f (prio 0, i/o): exynos4210-pwm
    0000000040000000-000000007fffffff (prio 0, ram): exynos4210.dram0

address-space: pl330
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-000000000000ffff (prio 0, rom): exynos4210.irom
    0000000002000000-000000000200ffff (prio 0, rom): alias
exynos4210.irom_alias @exynos4210.irom 0000000000000000-000000000000ffff
    0000000002020000-000000000203ffff (prio 0, ram): exynos4210.iram
    0000000005000000-00000000050000ff (prio 0, i/o): lan9118-mmio
    0000000010000000-0000000010000007 (prio 0, i/o): exynos4210.chipid
    0000000010020000-0000000010023d0b (prio 0, i/o): exynos4210.pmu
    0000000010030000-0000000010045103 (prio 0, i/o): exynos4210.clk
    0000000010050000-0000000010050443 (prio 0, i/o): exynos4210-mct
    0000000010070000-00000000100700ff (prio 0, i/o): exynos4210-rtc
    0000000010440000-0000000010440107 (prio 0, i/o): exynos4210-combiner
    0000000010448000-0000000010448107 (prio 0, i/o): exynos4210-combiner
    0000000010480000-000000001048ffff (prio 0, i/o):
exynos4210-cpu-container
      0000000010480000-00000000104800ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu0 @gic_cpu 0000000000000000-00000000000000ff
      0000000010488000-00000000104880ff (prio 0, i/o): alias
exynos4210-gic-alias_cpu1 @gic_cpu 0000000000000000-00000000000000ff
    0000000010490000-000000001049ffff (prio 0, i/o):
exynos4210-dist-container
      0000000010490000-0000000010490fff (prio 0, i/o): alias
exynos4210-gic-alias_dist0 @gic_dist 0000000000000000-0000000000000fff
      0000000010498000-0000000010498fff (prio 0, i/o): alias
exynos4210-gic-alias_dist1 @gic_dist 0000000000000000-0000000000000fff
    0000000010500000-0000000010501fff (prio 0, i/o): a9mp-priv-container
      0000000010500000-00000000105000ff (prio 0, i/o): a9-scu
      0000000010500100-00000000105001ff (prio 0, i/o): gic_cpu
      0000000010500200-000000001050021f (prio 0, i/o): a9gtimer shared
      0000000010500600-000000001050061f (prio 0, i/o): arm_mptimer_timer
      0000000010500620-000000001050063f (prio 0, i/o): arm_mptimer_timer
      0000000010501000-0000000010501fff (prio 0, i/o): gic_dist
    0000000010502000-0000000010502fff (prio 0, i/o): l2x0_cc
    0000000010830400-00000000108305ff (prio 0, i/o): exynos4210.rng
    0000000011c00000-0000000011c04113 (prio 0, i/o): exynos4210.fimd
    0000000012510000-00000000125100ff (prio 0, i/o): sdhci
    0000000012520000-00000000125200ff (prio 0, i/o): sdhci
    0000000012530000-00000000125300ff (prio 0, i/o): sdhci
    0000000012540000-00000000125400ff (prio 0, i/o): sdhci
    0000000012580000-0000000012580fff (prio 0, i/o): ehci
      0000000012580000-000000001258000f (prio 0, i/o): capabilities
      0000000012580010-0000000012580053 (prio 0, i/o): operational
      0000000012580054-000000001258006b (prio 0, i/o): ports
    0000000012680000-0000000012680fff (prio 0, i/o): dma
    0000000012690000-0000000012690fff (prio 0, i/o): dma
    0000000012850000-0000000012850fff (prio 0, i/o): dma
    0000000013800000-000000001380003b (prio 0, i/o): exynos4210.uart
    0000000013810000-000000001381003b (prio 0, i/o): exynos4210.uart
    0000000013820000-000000001382003b (prio 0, i/o): exynos4210.uart
    0000000013830000-000000001383003b (prio 0, i/o): exynos4210.uart
    0000000013860000-0000000013860013 (prio 0, i/o): exynos4210.i2c
    0000000013870000-0000000013870013 (prio 0, i/o): exynos4210.i2c
    0000000013880000-0000000013880013 (prio 0, i/o): exynos4210.i2c
    0000000013890000-0000000013890013 (prio 0, i/o): exynos4210.i2c
    00000000138a0000-00000000138a0013 (prio 0, i/o): exynos4210.i2c
    00000000138b0000-00000000138b0013 (prio 0, i/o): exynos4210.i2c
    00000000138c0000-00000000138c0013 (prio 0, i/o): exynos4210.i2c
    00000000138d0000-00000000138d0013 (prio 0, i/o): exynos4210.i2c
    00000000138e0000-00000000138e0013 (prio 0, i/o): exynos4210.i2c
    00000000139d0000-00000000139d004f (prio 0, i/o): exynos4210-pwm
    0000000040000000-000000007fffffff (prio 0, ram): exynos4210.dram0

memory-region: exynos4210.irom
  0000000000000000-000000000000ffff (prio 0, rom): exynos4210.irom

memory-region: gic_cpu
  0000000000000000-00000000000000ff (prio 0, i/o): gic_cpu

memory-region: gic_dist
  0000000000000000-0000000000000fff (prio 0, i/o): gic_dist

(qemu) info mtree -f
FlatView #0
 AS "I/O", root: io
 Root memory region: io
  0000000000000000-000000000000ffff (prio 0, i/o): io

FlatView #1
 AS "memory", root: system
 AS "cpu-memory-0", root: system
 AS "cpu-memory-1", root: system
 AS "pl330", root: system
 AS "pl330", root: system
 AS "pl330", root: system
 Root memory region: system
  0000000000000000-000000000000ffff (prio 0, rom): exynos4210.irom
  0000000002000000-000000000200ffff (prio 0, rom): exynos4210.irom
  0000000002020000-000000000203ffff (prio 0, ram): exynos4210.iram
  0000000005000000-00000000050000ff (prio 0, i/o): lan9118-mmio
  0000000010000000-0000000010000007 (prio 0, i/o): exynos4210.chipid
  0000000010020000-0000000010023d0b (prio 0, i/o): exynos4210.pmu
  0000000010030000-0000000010045103 (prio 0, i/o): exynos4210.clk
  0000000010050000-0000000010050443 (prio 0, i/o): exynos4210-mct
  0000000010070000-00000000100700ff (prio 0, i/o): exynos4210-rtc
  0000000010440000-0000000010440107 (prio 0, i/o): exynos4210-combiner
  0000000010448000-0000000010448107 (prio 0, i/o): exynos4210-combiner
  0000000010480000-00000000104800ff (prio 0, i/o): gic_cpu
  0000000010488000-00000000104880ff (prio 0, i/o): gic_cpu
  0000000010490000-0000000010490fff (prio 0, i/o): gic_dist
  0000000010498000-0000000010498fff (prio 0, i/o): gic_dist
  0000000010500000-00000000105000ff (prio 0, i/o): a9-scu
  0000000010500100-00000000105001ff (prio 0, i/o): gic_cpu
  0000000010500200-000000001050021f (prio 0, i/o): a9gtimer shared
  0000000010500600-000000001050061f (prio 0, i/o): arm_mptimer_timer
  0000000010500620-000000001050063f (prio 0, i/o): arm_mptimer_timer
  0000000010501000-0000000010501fff (prio 0, i/o): gic_dist
  0000000010502000-0000000010502fff (prio 0, i/o): l2x0_cc
  0000000010830400-00000000108305ff (prio 0, i/o): exynos4210.rng
  0000000011c00000-0000000011c04113 (prio 0, i/o): exynos4210.fimd
  0000000012510000-00000000125100ff (prio 0, i/o): sdhci
  0000000012520000-00000000125200ff (prio 0, i/o): sdhci
  0000000012530000-00000000125300ff (prio 0, i/o): sdhci
  0000000012540000-00000000125400ff (prio 0, i/o): sdhci
  0000000012580000-000000001258000f (prio 0, i/o): capabilities
  0000000012580010-0000000012580053 (prio 0, i/o): operational
  0000000012580054-000000001258006b (prio 0, i/o): ports
  0000000012680000-0000000012680fff (prio 0, i/o): dma
  0000000012690000-0000000012690fff (prio 0, i/o): dma
  0000000012850000-0000000012850fff (prio 0, i/o): dma
  0000000013800000-000000001380003b (prio 0, i/o): exynos4210.uart
  0000000013810000-000000001381003b (prio 0, i/o): exynos4210.uart
  0000000013820000-000000001382003b (prio 0, i/o): exynos4210.uart
  0000000013830000-000000001383003b (prio 0, i/o): exynos4210.uart
  0000000013860000-0000000013860013 (prio 0, i/o): exynos4210.i2c
  0000000013870000-0000000013870013 (prio 0, i/o): exynos4210.i2c
  0000000013880000-0000000013880013 (prio 0, i/o): exynos4210.i2c
  0000000013890000-0000000013890013 (prio 0, i/o): exynos4210.i2c
  00000000138a0000-00000000138a0013 (prio 0, i/o): exynos4210.i2c
  00000000138b0000-00000000138b0013 (prio 0, i/o): exynos4210.i2c
  00000000138c0000-00000000138c0013 (prio 0, i/o): exynos4210.i2c
  00000000138d0000-00000000138d0013 (prio 0, i/o): exynos4210.i2c
  00000000138e0000-00000000138e0013 (prio 0, i/o): exynos4210.i2c
  00000000139d0000-00000000139d004f (prio 0, i/o): exynos4210-pwm
  0000000040000000-000000007fffffff (prio 0, ram): exynos4210.dram0

'info mtree' is mostly for debugging, what matters is the flatview,
so no need to make the controller model more complex by adding an
'id' property (which would be useful for trace event btw).

AS are not QOM so we can not pass them via link property,
we have to use MR for that. So not much room to improve.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

