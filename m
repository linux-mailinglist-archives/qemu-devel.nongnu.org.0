Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B916504E6
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:00:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71hG-0001Ck-J1; Sun, 18 Dec 2022 16:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71hD-0001CO-3X
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:59:47 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71h9-0001cw-QJ
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:59:45 -0500
Received: by mail-ej1-x632.google.com with SMTP id fc4so17483931ejc.12
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J8S//YFk7Qxr/A/o2mPr+EqiOylBWHJwIpYB2Hkpt2Q=;
 b=g5qtCrCKcPxJl6Z7mNCaw5cO2hjKu9riJWat1SGOzGxuTJ42dF5SJbAZd0TMl23Em0
 Zhaeve5A1u8lhcz2vot3ceuGlcwsJD4RXiz3t9pUSUY/k+Ndm0uDbfGwPjkWqM6XpeDa
 /BtQ3BfHqNFcbKbw8GNUM46r618caZs1td67IBKqSwW6WG9KtDHzjVUdPY52nJBVDLu0
 Qv4vXI0W+cV2wspEIYrZZPfrdlgI4DZrBkC8jcdUWPPs4AaJo38xpQ1zTqal7zMbr7Qg
 1SW9SwXF6pF3WKFD++p32RX0y0XSLxFL+LSOqnxuWb5JCDRz2rC0VwohyBOaP6KS118+
 rlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8S//YFk7Qxr/A/o2mPr+EqiOylBWHJwIpYB2Hkpt2Q=;
 b=X46R6xmAzX7hDs3r28lY12Ga0j24j9H1i3m5tgQMZ8a8w9m9D9iL5DHwIf/sEWzgmt
 nIe/zgusyWCR1+epjaYwPis7ZrdFGhfltn0cz8OQgrxjAJvcvfUI/iRUyvCbE0xuKsQJ
 Ss/Jn7kg7YAHuo30YNs0j5mkYGm4u/+e/MwTRNEfZqHT6AkfG+YSaqmXU8uTn4QonpKV
 FEfsVciHa8Omy5GGI1xujewr/vXs9G/8IeRzcmCNNUa6beCd80As5ZgoQN74MgsH7rrJ
 tyiaw+7Us8srmTqq9zBDEbmB87mAC/F/WRRoAd02Te+LEl7D32ifK2xEuDZZUOm8DvFR
 /ZZQ==
X-Gm-Message-State: AFqh2kpA6+q0ku45fYMSYbSIwIRYr3Qw4UKoW/PtMvkmJ5+PSypJr2Sp
 uc/7uUXYuExVfow4De8pmF1Mow==
X-Google-Smtp-Source: AMrXdXs12gJBS1JoDsllYjnHpM+BxZeXFQ4RgidUw4jGjHgwLkcr3SAsPW7n1scd4fP86AdR106YWA==
X-Received: by 2002:a17:907:d408:b0:7c1:d4c:f08c with SMTP id
 vi8-20020a170907d40800b007c10d4cf08cmr9635639ejc.4.1671400781868; 
 Sun, 18 Dec 2022 13:59:41 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a170906bc4900b007c0e6d6bd10sm3602571ejv.132.2022.12.18.13.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 13:59:41 -0800 (PST)
Message-ID: <5bfa53e5-210f-bca4-20bf-e7f39862fbef@linaro.org>
Date: Sun, 18 Dec 2022 22:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 6/7] hw/arm: Allwinner A10 enable SPL load from MMC
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-7-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218211918.3592-7-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/12/22 22:19, Strahinja Jankovic wrote:
> This patch enables copying of SPL from MMC if `-kernel` parameter is not
> passed when starting QEMU. SPL is copied to SRAM_A.
> 
> The approach is reused from Allwinner H3 implementation.
> 
> Tested with Armbian and custom Yocto image.
> 
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> 
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   hw/arm/allwinner-a10.c         | 18 ++++++++++++++++++
>   hw/arm/cubieboard.c            |  5 +++++
>   include/hw/arm/allwinner-a10.h | 21 +++++++++++++++++++++
>   3 files changed, 44 insertions(+)
> 
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 17e439777e..dc1966ff7a 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -24,7 +24,9 @@
>   #include "sysemu/sysemu.h"
>   #include "hw/boards.h"
>   #include "hw/usb/hcd-ohci.h"
> +#include "hw/loader.h"
>   
> +#define AW_A10_SRAM_A_BASE      0x00000000
>   #define AW_A10_DRAMC_BASE       0x01c01000
>   #define AW_A10_MMC0_BASE        0x01c0f000
>   #define AW_A10_CCM_BASE         0x01c20000
> @@ -38,6 +40,22 @@
>   #define AW_A10_RTC_BASE         0x01c20d00
>   #define AW_A10_I2C0_BASE        0x01c2ac00
>   
> +void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk)
> +{
> +    const int64_t rom_size = 32 * KiB;
> +    g_autofree uint8_t *buffer = g_new0(uint8_t, rom_size);
> +
> +    if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) < 0) {
> +        error_setg(&error_fatal, "%s: failed to read BlockBackend data",
> +                   __func__);
> +        return;
> +    }
> +
> +    rom_add_blob("allwinner-a10.bootrom", buffer, rom_size,
> +                  rom_size, AW_A10_SRAM_A_BASE,
> +                  NULL, NULL, NULL, NULL, false);
> +}
> +
>   static void aw_a10_init(Object *obj)
>   {
>       AwA10State *s = AW_A10(obj);
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index afc7980414..37659c35fd 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -99,6 +99,11 @@ static void cubieboard_init(MachineState *machine)
>       memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BASE,
>                                   machine->ram);
>   
> +    /* Load target kernel or start using BootROM */
> +    if (!machine->kernel_filename && blk && blk_is_available(blk)) {
> +        /* Use Boot ROM to copy data from SD card to SRAM */
> +        allwinner_a10_bootrom_setup(a10, blk);
> +    }
>       /* TODO create and connect IDE devices for ide_drive_get() */
>   
>       cubieboard_binfo.ram_size = machine->ram_size;
> diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
> index 763935fca9..b3c9ed24c7 100644
> --- a/include/hw/arm/allwinner-a10.h
> +++ b/include/hw/arm/allwinner-a10.h
> @@ -15,6 +15,7 @@
>   #include "hw/misc/allwinner-a10-ccm.h"
>   #include "hw/misc/allwinner-a10-dramc.h"
>   #include "hw/i2c/allwinner-i2c.h"
> +#include "sysemu/block-backend.h"
>   
>   #include "target/arm/cpu.h"
>   #include "qom/object.h"
> @@ -47,4 +48,24 @@ struct AwA10State {
>       OHCISysBusState ohci[AW_A10_NUM_USB];
>   };
>   
> +/**
> + * Emulate Boot ROM firmware setup functionality.
> + *
> + * A real Allwinner A10 SoC contains a Boot ROM
> + * which is the first code that runs right after
> + * the SoC is powered on. The Boot ROM is responsible
> + * for loading user code (e.g. a bootloader) from any
> + * of the supported external devices and writing the
> + * downloaded code to internal SRAM. After loading the SoC
> + * begins executing the code written to SRAM.
> + *
> + * This function emulates the Boot ROM by copying 32 KiB
> + * of data

"at offset 8 KiB" ?

> from the given block device and writes it to
> + * the start of the first internal SRAM memory.
> + *
> + * @s: Allwinner A10 state object pointer
> + * @blk: Block backend device object pointer
> + */
> +void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk);
> +
>   #endif


