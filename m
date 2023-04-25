Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2206EEB1D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 01:50:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prSOn-0000wl-65; Tue, 25 Apr 2023 19:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1prSOl-0000wT-DS; Tue, 25 Apr 2023 19:48:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1prSOj-0005n2-JI; Tue, 25 Apr 2023 19:48:39 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5055141a8fdso9403971a12.3; 
 Tue, 25 Apr 2023 16:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682466515; x=1685058515;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=uaYFvHm29BBfEQDertdXYpsZcLpIFUD9q62gMhoLdOc=;
 b=YxkzhQmU1t+Ge2MwWM/dxdV+kIp0isvAwkwYusySyApMBY5McjyU2+5gaOeoLRYr1F
 Vo/G7hlfJxHPGZnEkOyMRLZOp63FFrMBsL1SkgK3NUWWJns/gSGgsXrvHUshd2k90Ybg
 NBUgv1jOV96xW4xRig3Z/euBfmY2NzFL5y5mMmsjEkrRrs0kzuL6Xt2JxW0o+/kTIBIn
 WAO3oSWLY0+vU3C3lc1SkGU8/8SV5eLEoXD1IFkvV3MDyfF3cEP9Mfs5YU7poC9Q3jF4
 UyL+UmfMNCcDC6wCMLCfE1LC53cw7dCH9g9Ue0KbabzQNc+HDehoZBJmhOwS+4PR+f8o
 w2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682466515; x=1685058515;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uaYFvHm29BBfEQDertdXYpsZcLpIFUD9q62gMhoLdOc=;
 b=NeKMQa8POt0RXaNPXUk8KIyEAzNBj0L9unbegoON6QuKNvfFXdBTojq6RD8tWrY3MB
 Xap99523UQLt7oTOWNXTdl9tbcTmo6RJAbMZxHvPVfCToymovN89LWXZIbpLe5QFJaid
 AvZN4gmCFYNXCZT7luXp6+xC8tDpgcAjHY1DM6zi9DUDwpK2EfF3PpKLv4o9oJqTTNB8
 ESxL7CQ2AmhspO/MM1lmbNsFpKJi52xVbtoUqRgy/DSIS0F4XsV3kDDxvAjpQYlEjkM3
 aW9elVUu3x4fBssLTlNQ7IV5qrQ1w9UNB40cYTjhzNyheEfNcad3LIqeiljrU7/+p3wz
 zc+w==
X-Gm-Message-State: AAQBX9f4eeQoXodwWsbRTzi51Fep581GRO5fDlZtGj3PHR1d+CNAgydY
 DtJUFYw5fv9vHnO9ESdVg5k=
X-Google-Smtp-Source: AKy350ZDyM46CHQELWoMLlf0TCA+mn0VX5W5zNS5nz4RuA9eRU+IDDRtANN+rIkrqZoQtowWDFiQ5g==
X-Received: by 2002:aa7:c051:0:b0:506:741e:5c1b with SMTP id
 k17-20020aa7c051000000b00506741e5c1bmr15257211edo.12.1682466514960; 
 Tue, 25 Apr 2023 16:48:34 -0700 (PDT)
Received: from [192.168.2.129] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a17090633db00b0094ed0370f8fsm7480771eja.147.2023.04.25.16.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 16:48:34 -0700 (PDT)
Message-ID: <46ffc696-cd15-e881-7901-d07b32ece684@amsat.org>
Date: Wed, 26 Apr 2023 00:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2] hw/net: npcm7xx_emc: set MAC in register space
Content-Language: en-US
To: Patrick Venture <venture@google.com>, hskinnemoen@google.com,
 kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, jasowang@redhat.com,
 Hao Wu <wuhaotsh@google.com>
References: <20221003173810.1933849-1-venture@google.com>
In-Reply-To: <20221003173810.1933849-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 3/10/22 19:38, Patrick Venture wrote:
> The MAC address set from Qemu wasn't being saved into the register space.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2: only set the registers from qemu on reset
>      once registers set, only read and write to them
> ---
>   hw/net/npcm7xx_emc.c | 30 +++++++++++++++++++++++-------
>   1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
> index 7c86bb52e5..a33f8c7b23 100644
> --- a/hw/net/npcm7xx_emc.c
> +++ b/hw/net/npcm7xx_emc.c
> @@ -112,6 +112,16 @@ static void emc_reset(NPCM7xxEMCState *emc)
>   
>       emc->tx_active = false;
>       emc->rx_active = false;
> +
> +    /* Set the MAC address in the register space. */
> +    uint32_t value = (emc->conf.macaddr.a[0] << 24) |
> +        (emc->conf.macaddr.a[1] << 16) |
> +        (emc->conf.macaddr.a[2] << 8) |
> +        emc->conf.macaddr.a[3];

Per QEMU Coding style:

   Mixed declarations (interleaving statements and declarations
   within blocks) are generally not allowed; declarations should
   be at the beginning of blocks.

https://qemu-project.gitlab.io/qemu/devel/style.html#declarations

> +    emc->regs[REG_CAMM_BASE] = value;

Alternatively:

   emc->regs[REG_CAMM_BASE] = ldl_be_p(s->conf.macaddr.a);
   emc->regs[REG_CAML_BASE] = lduw_be_p(s->conf.macaddr.a + 4);

> +
> +    value = (emc->conf.macaddr.a[4] << 24) | (emc->conf.macaddr.a[5] << 16);
> +    emc->regs[REG_CAML_BASE] = value;
>   }
>   
>   static void npcm7xx_emc_reset(DeviceState *dev)
> @@ -432,13 +442,25 @@ static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_t *buf,
>           }
>       case ETH_PKT_UCAST: {
>           bool matches;
> +        uint32_t value;
> +        struct MACAddr mac;
>           if (emc->regs[REG_CAMCMR] & REG_CAMCMR_AUP) {
>               return true;
>           }
> +
> +        value = emc->regs[REG_CAMM_BASE];
> +        mac.a[0] = value >> 24;
> +        mac.a[1] = value >> 16;
> +        mac.a[2] = value >> 8;
> +        mac.a[3] = value >> 0;
> +        value = emc->regs[REG_CAML_BASE];
> +        mac.a[4] = value >> 24;
> +        mac.a[5] = value >> 16;

Similarly:

   stl_be_p(mac.a, emc->regs[REG_CAMM_BASE]);
   stw_be_p(mac.a + 4, emc->regs[REG_CAML_BASE]);

>           matches = ((emc->regs[REG_CAMCMR] & REG_CAMCMR_ECMP) &&
>                      /* We only support one CAM register, CAM0. */
>                      (emc->regs[REG_CAMEN] & (1 << 0)) &&
> -                   memcmp(buf, emc->conf.macaddr.a, ETH_ALEN) == 0);
> +                   memcmp(buf, mac.a, ETH_ALEN) == 0);
>           if (emc->regs[REG_CAMCMR] & REG_CAMCMR_CCAM) {
>               *fail_reason = "MACADDR matched, comparison complemented";
>               return !matches;
> @@ -661,15 +683,9 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
>           break;
>       case REG_CAMM_BASE + 0:
>           emc->regs[reg] = value;
> -        emc->conf.macaddr.a[0] = value >> 24;
> -        emc->conf.macaddr.a[1] = value >> 16;
> -        emc->conf.macaddr.a[2] = value >> 8;
> -        emc->conf.macaddr.a[3] = value >> 0;
>           break;
>       case REG_CAML_BASE + 0:
>           emc->regs[reg] = value;
> -        emc->conf.macaddr.a[4] = value >> 24;
> -        emc->conf.macaddr.a[5] = value >> 16;
>           break;
>       case REG_MCMDR: {
>           uint32_t prev;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

(original patch: 
https://lore.kernel.org/qemu-devel/20221003173810.1933849-1-venture@google.com/)

