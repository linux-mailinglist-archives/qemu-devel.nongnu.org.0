Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429CA49074B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 12:49:33 +0100 (CET)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9QVw-0003ci-DS
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 06:49:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9QTh-0002m1-FB; Mon, 17 Jan 2022 06:47:13 -0500
Received: from [2a00:1450:4864:20::329] (port=47030
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9QTf-0000w8-Mx; Mon, 17 Jan 2022 06:47:13 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso22033465wmd.5; 
 Mon, 17 Jan 2022 03:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dqOmpL1FcairqlcBfpTkt9DgGiDvAf8SlLksjcCl6xI=;
 b=FN0LisYf2P2YKik2IDDGl7rTGFHvzqoxbEVRCbNKPtPYahAVyqrUCk05J4X6n7uTa0
 JX4NWgCKpv9H1EwASSa5lRPvkVyVkarEksjglnrgCdoLxAi1vVpv1R7R5s1csnXeZUXE
 QCoAFsZcCYhcaKFsqeW0ZAokrFwgvIglQM3lHYb/xDuWADSKJu0G3s7L415uTkVoz7Be
 jvHOYQFcJIwntjz2exxpTsm3gGdATH8YS/zayywB5MpPUnAZEv6VA7Sk7WSDBSSIgTjO
 TeSvY4RYSTJhIJKEQegB1ugi1j4vTfPYCNKbFQtqIVdGxbPb4YD7Mh96iZAwMK+eIqgU
 LUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dqOmpL1FcairqlcBfpTkt9DgGiDvAf8SlLksjcCl6xI=;
 b=JE/0yBBGsYT3ymHsJHJhAXlq6Ae7Nb2d+7TOHGExpe580AoLGKChx8Ma9RYkNdKNyJ
 6APZkz7+IcYriQnxED2gHYz4OrRf2sfisNJdPLOupsmGWiJIA/tLf7LqGhNYbalBeuyo
 fLgR89Q+A0ac/iFKofIzqoGdHv3eo+wJ94R613GUKvRJPoGJF3URWc0/BJRX+ZZipWCw
 gwF1oJdvak2YcmPLur4Y43CBCtak3Q3QAhSNE4HLIZSk5u2XqowASn1M91t9Qjg4N4h8
 KertzxVAgCDcgF49imNTpCqk5HDzr/Znigsqq0yU4GnMLq1mRlBMzBs0Eep2RS/wyT0S
 wUUw==
X-Gm-Message-State: AOAM5308Rca5Y0OkFcthVbbz7NFGFsq9SFsUQ7fRM+ZbNPageitC5dGC
 pTeWnE9xExkfoNYDVMLWC1M=
X-Google-Smtp-Source: ABdhPJw7H/aHyrGDXpIeWGO5pFHrWqxSsHhryuvBHXqEg0L3wJWO2DYcluX/l3Rzv5F5KYYIRCZIgA==
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr19049700wri.337.1642420029773; 
 Mon, 17 Jan 2022 03:47:09 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id g13sm4298817wmq.22.2022.01.17.03.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 03:47:09 -0800 (PST)
Message-ID: <127028e9-7df1-5ccd-30ef-d7b327a1d788@redhat.com>
Date: Mon, 17 Jan 2022 12:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] intc: Unexport InterruptStatsProviderClass-related
 functions
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220116122327.73048-1-shentey@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220116122327.73048-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/22 13:23, Bernhard Beschow wrote:
> The functions are only used within their respective source files, so no
> need for exporting.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/intc/i8259_common.c            | 6 +++---
>   hw/intc/ioapic_common.c           | 2 +-
>   include/hw/i386/ioapic_internal.h | 1 -
>   include/hw/isa/i8259_internal.h   | 3 ---
>   4 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
> index d90b40fe4c..af2e4a2241 100644
> --- a/hw/intc/i8259_common.c
> +++ b/hw/intc/i8259_common.c
> @@ -116,8 +116,8 @@ void pic_stat_update_irq(int irq, int level)
>       }
>   }
>   
> -bool pic_get_statistics(InterruptStatsProvider *obj,
> -                        uint64_t **irq_counts, unsigned int *nb_irqs)
> +static bool pic_get_statistics(InterruptStatsProvider *obj,
> +                               uint64_t **irq_counts, unsigned int *nb_irqs)
>   {
>       PICCommonState *s = PIC_COMMON(obj);
>   
> @@ -132,7 +132,7 @@ bool pic_get_statistics(InterruptStatsProvider *obj,
>       return true;
>   }
>   
> -void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
> +static void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
>   {
>       PICCommonState *s = PIC_COMMON(obj);
>   
> diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
> index 3cccfc1556..aa5f760871 100644
> --- a/hw/intc/ioapic_common.c
> +++ b/hw/intc/ioapic_common.c
> @@ -76,7 +76,7 @@ static void ioapic_irr_dump(Monitor *mon, const char *name, uint32_t bitmap)
>       monitor_printf(mon, "\n");
>   }
>   
> -void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s)
> +static void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s)
>   {
>       static const char *delm_str[] = {
>           "fixed", "lowest", "SMI", "...", "NMI", "INIT", "...", "extINT"};
> diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
> index 021e715f11..9880443cc7 100644
> --- a/include/hw/i386/ioapic_internal.h
> +++ b/include/hw/i386/ioapic_internal.h
> @@ -112,7 +112,6 @@ struct IOAPICCommonState {
>   
>   void ioapic_reset_common(DeviceState *dev);
>   
> -void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s);
>   void ioapic_stat_update_irq(IOAPICCommonState *s, int irq, int level);
>   
>   #endif /* QEMU_IOAPIC_INTERNAL_H */
> diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
> index a6ae8a583f..d272d879fb 100644
> --- a/include/hw/isa/i8259_internal.h
> +++ b/include/hw/isa/i8259_internal.h
> @@ -72,8 +72,5 @@ struct PICCommonState {
>   void pic_reset_common(PICCommonState *s);
>   ISADevice *i8259_init_chip(const char *name, ISABus *bus, bool master);
>   void pic_stat_update_irq(int irq, int level);
> -bool pic_get_statistics(InterruptStatsProvider *obj,
> -                        uint64_t **irq_counts, unsigned int *nb_irqs);
> -void pic_print_info(InterruptStatsProvider *obj, Monitor *mon);
>   
>   #endif /* QEMU_I8259_INTERNAL_H */

Queued, thanks.

Paolo

