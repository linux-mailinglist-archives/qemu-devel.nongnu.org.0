Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3F5EAD3A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:52:53 +0200 (CEST)
Received: from localhost ([::1]:58860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrLf-0006HG-V7
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrFx-0000Ci-5o; Mon, 26 Sep 2022 12:46:57 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:42821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrFu-0001g8-GP; Mon, 26 Sep 2022 12:46:56 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-130bd20fae6so9960914fac.9; 
 Mon, 26 Sep 2022 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=LyhrTSANeQPYwmQhF2u+DhJ7UmQHtjq3CAe/J1Q1cs8=;
 b=X1q0aSjyhbmramU7aKqbxTPiIKuA/ktZ9PxGObrutGWWNBfJvJWwdR2Jj8V6LBmEff
 nzVqFW8Jd9spI67kdYTTZ1zxNmaxvvJK+QeuB86H9Tme7Zl0H6SOz8Obo9vD2pCoakba
 WfLziOHP7wqmAFT7lTBMw85BAubzCXQESvu11I+Qkh3qiwvWMlOpntIZM0Tcq3mcPr+J
 5B07Q+RHuDoRgBAVx+5feLepQuhzlLLYK/IoLb/iSnDq7SavelmwrFUWig9nbAUO3tE0
 YjCB1wi9JDRHgOq1vbhtsl+2CoBhJ4+QmAJnkL21PIrNfwkE4r/wecPaOpVxGOtGUDnh
 RFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=LyhrTSANeQPYwmQhF2u+DhJ7UmQHtjq3CAe/J1Q1cs8=;
 b=SQ1mm7NQuCbO+qi7V1pY1luZoIsRrNQfHX9ytoUjlX7rp2vSckIKxzWLK+2NKdjeOm
 yDhyeyDro+V5kXHcjrKAJuq2Twl/JVACJIqQ6W8zA/48/SWzbMGFBLeBHjJvCQJ6Idv7
 xWplNxDAqq5ocbXJXHAOc/tZQE1BMfExQ7RUcUyudjXBm2j87hnrAq/rZYxhg5dlAG4t
 FNhvqpxev+4SKz7rpxdONg2wRilr7c0X0qwfTyTaWXib+ulZxTfPWqxFrxdpoPg1cvk1
 kT/6aAIZIpD0AiXoNDqpWHgHhiHc5o9uWHGjM0XFW8tsl8T9YhDQnG87kEQJLiHKM6FW
 gMLQ==
X-Gm-Message-State: ACrzQf2jGEYm1mJHtVLPX/cgA30qsd3u9zTFaMaHGQlXPRck4ReEPB26
 aCEvg+EgRpMAxJlQgxun998=
X-Google-Smtp-Source: AMsMyM7GB5KGDqyfOSy6217fF9Lmxh3ShivmkOJ6Cay9FFvi7CwiWdijzVRnR0zQkMdNMmtbD751Eg==
X-Received: by 2002:a05:6870:d114:b0:127:611d:dcb9 with SMTP id
 e20-20020a056870d11400b00127611ddcb9mr18841147oac.286.1664210811817; 
 Mon, 26 Sep 2022 09:46:51 -0700 (PDT)
Received: from [192.168.10.102] (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 cg11-20020a056830630b00b0063715f7eef8sm7995932otb.38.2022.09.26.09.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 09:46:51 -0700 (PDT)
Message-ID: <90d3c544-25ce-a3ce-ace4-69085c97a88e@gmail.com>
Date: Mon, 26 Sep 2022 13:46:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 01/25] ppc440_bamboo: Remove unnecessary memsets
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1664021647.git.balaton@eik.bme.hu>
 <529adc7705fb3e3e777439895bdaa136bacb9403.1664021647.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <529adc7705fb3e3e777439895bdaa136bacb9403.1664021647.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/24/22 09:27, BALATON Zoltan wrote:
> In ppc4xx_sdram_init() the struct is allocated with g_new0() so no
> need to clear its elements. In the bamboo machine init memset can be
> replaced with array initialiser which is shorter.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc440_bamboo.c | 6 ++----
>   hw/ppc/ppc4xx_devs.c   | 8 ++------
>   2 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index ea945a1c99..5ec82fa8c2 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -169,8 +169,8 @@ static void bamboo_init(MachineState *machine)
>       MemoryRegion *address_space_mem = get_system_memory();
>       MemoryRegion *isa = g_new(MemoryRegion, 1);
>       MemoryRegion *ram_memories = g_new(MemoryRegion, PPC440EP_SDRAM_NR_BANKS);
> -    hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS];
> -    hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS];
> +    hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS] = {0};
> +    hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS] = {0};
>       PCIBus *pcibus;
>       PowerPCCPU *cpu;
>       CPUPPCState *env;
> @@ -205,8 +205,6 @@ static void bamboo_init(MachineState *machine)
>                          qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>   
>       /* SDRAM controller */
> -    memset(ram_bases, 0, sizeof(ram_bases));
> -    memset(ram_sizes, 0, sizeof(ram_sizes));
>       ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_memories,
>                          ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
>       /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index ce38ae65e6..b4cd10f735 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -363,12 +363,8 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
>       sdram->irq = irq;
>       sdram->nbanks = nbanks;
>       sdram->ram_memories = ram_memories;
> -    memset(sdram->ram_bases, 0, 4 * sizeof(hwaddr));
> -    memcpy(sdram->ram_bases, ram_bases,
> -           nbanks * sizeof(hwaddr));
> -    memset(sdram->ram_sizes, 0, 4 * sizeof(hwaddr));
> -    memcpy(sdram->ram_sizes, ram_sizes,
> -           nbanks * sizeof(hwaddr));
> +    memcpy(sdram->ram_bases, ram_bases, nbanks * sizeof(hwaddr));
> +    memcpy(sdram->ram_sizes, ram_sizes, nbanks * sizeof(hwaddr));
>       qemu_register_reset(&sdram_reset, sdram);
>       ppc_dcr_register(env, SDRAM0_CFGADDR,
>                        sdram, &dcr_read_sdram, &dcr_write_sdram);

