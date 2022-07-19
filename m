Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D88C57928E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 07:40:55 +0200 (CEST)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDfyR-0003M3-7o
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 01:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDfsm-0000Op-GY
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 01:34:56 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDfsh-00064d-1W
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 01:34:56 -0400
Received: by mail-pl1-x631.google.com with SMTP id g17so10993828plh.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rgJDmsPJVnn3XTf5Ym+SbZjZL5ITCCsuckdaEYIkgV8=;
 b=x7Mt+J7dN6e8v3cFbWOOvoeo0FRnOGgSKhhXzVyefoH5+XQzXaCLSJ+p8JqAJrNXfW
 CtjVsARURvDnQ+bJ8h1u5HYlIF2WiJFShxrWQPYcRO+x1mlYgMfDEJxhgp7St4e3NxxQ
 srbJ6rC9a0UJSjiQzwBj89gh1sTDeuUtF0llfXIUPhwJbbXKEvw84koal1AW0zLZjZdZ
 9DPfLoFSlq4CY/ClkC6gpT55vzZjDr91c+Vcrt8JYvPDbk4icYYnytcLptidMSpbarXj
 2me7skOuhDzt/a5KfGpPMqe4657KUulKYJx5waFAmVX/AAcN+yR0/5vBwtjDebyOQHhz
 ME1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rgJDmsPJVnn3XTf5Ym+SbZjZL5ITCCsuckdaEYIkgV8=;
 b=rBH2nOaitwWYo0wmZ1+a/Jgp95RVviVH9UkFH7hpF8752YurmUxG187+lGlE/CeK8z
 sY0xRwHMvetqYnORvEOVzCgWxhnG0+pyltzPfVzOIouHQ7KuxLEBlPrPx9Rc4duerIEr
 u+/itPLk85JE9hPgHLQ75D/uF/B1vCGKVxE2cQGXqLNSXyAiUvmHi4dSKSwixvpjM5Co
 QM9G4hMZ1imLVSFCNO0Evji750ayTDgiScltwsak467YFlCi97PDoEFGezfaq242dTsu
 IvUARmtkZNZPI+B8jFSxTdiPAlaUYlRRuEkOppenm9xo2cSiDNURPKsmsPCOSfPt2tds
 UbBA==
X-Gm-Message-State: AJIora9fpnbUYcs6hHgHH9QydX5k40nVnxEM9KGJe2cyx/p8qfJv8oBa
 P8cqdCM6dooGGUYtQBHlBLl1cw==
X-Google-Smtp-Source: AGRyM1v9FHYq5HnOU4KRXhqwUyjt+m9N1oyB9bvWrW79EFd5DlpdywDlRvbwkKgRyk++q+xN5Dva3w==
X-Received: by 2002:a17:903:22c8:b0:16c:4068:cd with SMTP id
 y8-20020a17090322c800b0016c406800cdmr31938945plg.59.1658208889364; 
 Mon, 18 Jul 2022 22:34:49 -0700 (PDT)
Received: from [192.168.113.227] ([123.231.102.160])
 by smtp.gmail.com with ESMTPSA id
 ls8-20020a17090b350800b001ec84b0f199sm979308pjb.1.2022.07.18.22.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 22:34:48 -0700 (PDT)
Message-ID: <29e3c671-20db-11cc-508f-ef1fdaaf12bd@linaro.org>
Date: Tue, 19 Jul 2022 11:04:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/5] hw/intc/loongarch_pch_pic: Fix bugs for update_irq
 function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
 <20220715060740.1500628-3-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220715060740.1500628-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/15/22 11:37, Xiaojuan Yang wrote:
> Fix such errors:
> 1. We should not use 'unsigned long' type as argument when we use
> find_first_bit(), and we use ctz64() to replace find_first_bit()
> to fix this bug.
> 2. It is not standard to use '1ULL << irq' to generate a irq mask.
> So, we replace it with 'MAKE_64BIT_MASK(irq, 1)'.
> 
> Fix coverity CID: 1489761 1489764 1489765
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_pch_pic.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
> index 3c9814a3b4..8fa64d2030 100644
> --- a/hw/intc/loongarch_pch_pic.c
> +++ b/hw/intc/loongarch_pch_pic.c
> @@ -15,22 +15,26 @@
>   
>   static void pch_pic_update_irq(LoongArchPCHPIC *s, uint64_t mask, int level)
>   {
> -    unsigned long val;
> +    uint64_t val;
>       int irq;
>   
>       if (level) {
>           val = mask & s->intirr & ~s->int_mask;
>           if (val) {
> -            irq = find_first_bit(&val, 64);
> -            s->intisr |= 0x1ULL << irq;
> -            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
> +            irq = ctz64(val);
> +            if (irq < 64) {

This test is always true, provable by the val != 0 test just above.


r~

> +                s->intisr |= MAKE_64BIT_MASK(irq, 1);
> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
> +            }
>           }
>       } else {
>           val = mask & s->intisr;
>           if (val) {
> -            irq = find_first_bit(&val, 64);
> -            s->intisr &= ~(0x1ULL << irq);
> -            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
> +            irq = ctz64(val);
> +            if (irq < 64) {
> +                s->intisr &= ~(MAKE_64BIT_MASK(irq, 1));
> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
> +            }
>           }
>       }
>   }


