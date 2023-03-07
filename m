Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E18F6AE0B6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:37:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXUx-0000PS-IN; Tue, 07 Mar 2023 08:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZXUt-0000M8-BK; Tue, 07 Mar 2023 08:36:57 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZXUn-0005JM-QU; Tue, 07 Mar 2023 08:36:53 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-176d1a112bfso6226455fac.5; 
 Tue, 07 Mar 2023 05:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678196205;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bmsyqhiLDd4j3vJiTqVF0j3sJ6qyHH5ZY8Q8nNXKrKE=;
 b=LJQO+dZQjO2h6HKug4qX/7kr5Ib8yOWXHG9ZBKxBiwJ+oAedi+vPdn3AOKoF4oGFuD
 YzPt1uWouPnV1NugF3DVtMlDbbTvUuUYrktx13HTUR9K5sAHpc8ylWyc5PCAXT2yEj5F
 WlN4CpV2+gyabpd6QLORB4aEIIsDaSRM3qM+yiegIte9QLaouev/rxJgLAScfreCGY2C
 NGv5vCqjtZw9SwSwi/xFp7SqxWC5qu4drm9+lPrH8Y133CM+YH4Yj+GYxhRwr7qh0GFo
 vb73cHGunSfXUT3MzzragNF+6FcSGBEiHz7BHhs73jRH1ftyklf3sIiMQPOZpo4itjQe
 B8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678196205;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bmsyqhiLDd4j3vJiTqVF0j3sJ6qyHH5ZY8Q8nNXKrKE=;
 b=e9zqBT+wPm7UI1kq0ySNuHTXa88ZmwMS5Va9Dy+j90n4lyyFcIe3SPryyJp+2ScSJH
 Tvn5Jb+r436O6GNaVj+yiyDnQwIgmCFwJNCmXJx24+Z88LzKmv6XDsqi2FtCgAvslPu3
 gyjlKqkfu18wq3qz0+XPuVXne2fZNaS4eWlTIxT2uxu/35FAbEn0tOAb9YblxtOjsBRb
 DihsWxau0rJTqHZdqq25w6AJcI1/ugY+CTyApG2UadLa8yLf3pTQZrf0BO0yFhWhmisZ
 UYH5bA23ZekO4XkTfzOTB/ouEbJpWqhaExxdSvdP8ghjKT3G5haDp7UiqCVUwU1aDWW3
 pyNA==
X-Gm-Message-State: AO0yUKUTzkdod9M73GKbfqEijPfiiObYa7AffwnCYjV2YrfulvfzxJdi
 1jqnpxu+/WSpXCQJ2FdDvtU=
X-Google-Smtp-Source: AK7set8iiZhC/wFCAtSEZhViY+mKhGorBepewdpws3NeSMuShcwkeC/unisaHYS/uVeIKwnEeEUvIQ==
X-Received: by 2002:a05:6871:14d:b0:176:6c0b:cd5c with SMTP id
 z13-20020a056871014d00b001766c0bcd5cmr9981857oab.22.1678196204481; 
 Tue, 07 Mar 2023 05:36:44 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 ec52-20020a0568708c3400b0017297d93c7csm5124730oab.22.2023.03.07.05.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:36:44 -0800 (PST)
Message-ID: <10178ae9-e306-0885-a14a-20fc651a8494@gmail.com>
Date: Tue, 7 Mar 2023 10:36:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 2/7] hw/intc/i8259: Implement legacy LTIM Edge/Level
 Bank Select
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de, David Woodhouse <dwmw2@infradead.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <cover.1678188711.git.balaton@eik.bme.hu>
 <3f09b2dd109d19851d786047ad5c2ff459c90cd7.1678188711.git.balaton@eik.bme.hu>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <3f09b2dd109d19851d786047ad5c2ff459c90cd7.1678188711.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 3/7/23 08:42, BALATON Zoltan wrote:
> From: David Woodhouse <dwmw2@infradead.org>
> 
> Back in the mists of time, before EISA came along and required per-pin
> level control in the ELCR register, the i8259 had a single chip-wide
> level-mode control in bit 3 of ICW1.
> 
> Even in the PIIX3 datasheet from 1996 this is documented as 'This bit is
> disabled', but apparently MorphOS is using it in the version of the
> i8259 which is in the Pegasos2 board as part of the VT8231 chipset.
> 
> It's easy enough to implement, and I think it's harmless enough to do so
> unconditionally.
> 
> Signed-off-by: David Woodhouse <dwmw2@infradead.org>
> [balaton: updated commit message as asked by author]
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/intc/i8259.c                 | 10 ++++------
>   hw/intc/i8259_common.c          | 24 +++++++++++++++++++++++-
>   include/hw/isa/i8259_internal.h |  1 +
>   3 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 17910f3bcb..bbae2d87f4 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -133,7 +133,7 @@ static void pic_set_irq(void *opaque, int irq, int level)
>       }
>   #endif
>   
> -    if (s->elcr & mask) {
> +    if (s->ltim || (s->elcr & mask)) {
>           /* level triggered */
>           if (level) {
>               s->irr |= mask;
> @@ -167,7 +167,7 @@ static void pic_intack(PICCommonState *s, int irq)
>           s->isr |= (1 << irq);
>       }
>       /* We don't clear a level sensitive interrupt here */
> -    if (!(s->elcr & (1 << irq))) {
> +    if (!s->ltim && !(s->elcr & (1 << irq))) {
>           s->irr &= ~(1 << irq);
>       }
>       pic_update_irq(s);
> @@ -224,6 +224,7 @@ static void pic_reset(DeviceState *dev)
>       PICCommonState *s = PIC_COMMON(dev);
>   
>       s->elcr = 0;
> +    s->ltim = 0;
>       pic_init_reset(s);
>   }
>   
> @@ -243,10 +244,7 @@ static void pic_ioport_write(void *opaque, hwaddr addr64,
>               s->init_state = 1;
>               s->init4 = val & 1;
>               s->single_mode = val & 2;
> -            if (val & 0x08) {
> -                qemu_log_mask(LOG_UNIMP,
> -                              "i8259: level sensitive irq not supported\n");
> -            }
> +            s->ltim = val & 8;
>           } else if (val & 0x08) {
>               if (val & 0x04) {
>                   s->poll = 1;
> diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
> index af2e4a2241..c931dc2d07 100644
> --- a/hw/intc/i8259_common.c
> +++ b/hw/intc/i8259_common.c
> @@ -51,7 +51,7 @@ void pic_reset_common(PICCommonState *s)
>       s->special_fully_nested_mode = 0;
>       s->init4 = 0;
>       s->single_mode = 0;
> -    /* Note: ELCR is not reset */
> +    /* Note: ELCR and LTIM are not reset */
>   }
>   
>   static int pic_dispatch_pre_save(void *opaque)
> @@ -144,6 +144,24 @@ static void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
>                      s->special_fully_nested_mode);
>   }
>   
> +static bool ltim_state_needed(void *opaque)
> +{
> +    PICCommonState *s = PIC_COMMON(opaque);
> +
> +    return !!s->ltim;
> +}
> +
> +static const VMStateDescription vmstate_pic_ltim = {
> +    .name = "i8259/ltim",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = ltim_state_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(ltim, PICCommonState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static const VMStateDescription vmstate_pic_common = {
>       .name = "i8259",
>       .version_id = 1,
> @@ -168,6 +186,10 @@ static const VMStateDescription vmstate_pic_common = {
>           VMSTATE_UINT8(single_mode, PICCommonState),
>           VMSTATE_UINT8(elcr, PICCommonState),
>           VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription*[]) {

Checkpatch will nag about it claiming that we need spaces between '*'. The maintainer
can fix it in-tree though.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> +        &vmstate_pic_ltim,
> +        NULL
>       }
>   };
>   
> diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
> index 155b098452..f9dcc4163e 100644
> --- a/include/hw/isa/i8259_internal.h
> +++ b/include/hw/isa/i8259_internal.h
> @@ -61,6 +61,7 @@ struct PICCommonState {
>       uint8_t single_mode; /* true if slave pic is not initialized */
>       uint8_t elcr; /* PIIX edge/trigger selection*/
>       uint8_t elcr_mask;
> +    uint8_t ltim; /* Edge/Level Bank Select (pre-PIIX, chip-wide) */
>       qemu_irq int_out[1];
>       uint32_t master; /* reflects /SP input pin */
>       uint32_t iobase;

