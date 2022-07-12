Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0F657174E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:28:57 +0200 (CEST)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBD8S-0005RU-LT
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBD4I-0001JT-FK
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:24:38 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBD4G-0002HZ-N0
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:24:38 -0400
Received: by mail-pj1-x102b.google.com with SMTP id o15so7226691pjh.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wHGRN1Ts27Pn6pcbEYbTDBiuE1jkkLoQuXzxYR1/VqI=;
 b=u/eiqulU12onUUC8lzlfnlnZ4BxlnLC28tljpz9vXatB6ZD9ZvLZsIKswxpNGscuYU
 jAm25LzwwLOBeLZYUPDXBQmMyVOhdvrtcCl/dZ+7ZFf4DkaZn/ueQ1edlfyHcuH1gfjb
 17KDf0JPdS96iX6LXlbEFTzVLgahBVbTrNIdwT0IBEw8NISrVm1/tuT3b1NWpZD7ay7p
 xfuW+kkA+Nvrx5YnpxZte3Yq9kdTaI90+Hu9onpjrHbcZ1RL2zwCLmx/6J5d+3prI7Si
 XHhbhi24DTJWW2USz+iIyR/5wusr2ITkLA/YveHXNPGw4gLu0Xr7zppYvAIRTAI66ORI
 I6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wHGRN1Ts27Pn6pcbEYbTDBiuE1jkkLoQuXzxYR1/VqI=;
 b=JIWKySmZaBHJJW3CsAL1RS/H+zbXwa2d5i6Ji9vNtHn28RyAn++0SU3FcuO9O00rck
 tgxr/y69YFVgEjbczpHe2kVqNxskDTDFgwfwonU4Wb8bI6f0GvSbv4H/Ky29m0bzvMwj
 LJ30jLKTzswYifdhGCcCdZ15clXvO/BJgYfzT1PlbMBo9wkUOiD6na5Hc3qk3ZRXuQ2O
 ohZorfnr5jJ0gxMw5mmc5RqS34pomyt68SMgGpfWcZsOer6K/TbEruNn9ClJpv3AUxet
 CCJOUn85JEItJG7Vmaj2lmtRKTspr1aOi9PIpRCM+KRIGCrk7lAENnCJuSrhVNIp4wvO
 m31w==
X-Gm-Message-State: AJIora/nPQTuytgG/YI/zdFq8zI3sq51ugsvIbdQNtJM42WKam4iyr/8
 GutwLF04qxWHLq/kEddttfeybg==
X-Google-Smtp-Source: AGRyM1uQYCOYlLc01/xz1ff5SoLic8fHXWkrofSEdEiDbDbwKSRfv2Z/zti/UtQXQcsWUzybUoxmAw==
X-Received: by 2002:a17:903:2310:b0:16c:1546:19ba with SMTP id
 d16-20020a170903231000b0016c154619bamr23118376plh.57.1657621474214; 
 Tue, 12 Jul 2022 03:24:34 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0052abfc4b4a4sm5732255pfj.12.2022.07.12.03.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 03:24:33 -0700 (PDT)
Message-ID: <4fa14e76-0f18-debe-e05f-a342af193b9a@linaro.org>
Date: Tue, 12 Jul 2022 15:54:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/5] hw/intc/loongarch_pch_pic: Fix coverity errors in
 update irq
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
 <20220712080133.4176971-3-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712080133.4176971-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/22 13:31, Xiaojuan Yang wrote:
> Fix coverity errors:
> 1. In find_first_bit function, the 'size' argument need
> 'unsigned long' type, so we add the suffix 'UL' on 'size'
> argument when use the function.
> 2. In expression 1ULL << irq, left shifting by more than
> 63 bits has undefined behavior. And out-of-bounds access
> error occured when 'irq' >= 64. So we add a condition to
> avoid this.
> 
> Fix coverity CID: 1489761 1489764 1489765
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_pch_pic.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
> index 3c9814a3b4..779a087a03 100644
> --- a/hw/intc/loongarch_pch_pic.c
> +++ b/hw/intc/loongarch_pch_pic.c
> @@ -21,16 +21,20 @@ static void pch_pic_update_irq(LoongArchPCHPIC *s, uint64_t mask, int level)
>       if (level) {
>           val = mask & s->intirr & ~s->int_mask;
>           if (val) {
> -            irq = find_first_bit(&val, 64);
> -            s->intisr |= 0x1ULL << irq;
> -            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
> +            irq = find_first_bit(&val, 64UL);
> +            if (irq < 64) {
> +                s->intisr |= 0x1ULL << irq;
> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
> +            }
>           }
>       } else {
>           val = mask & s->intisr;
>           if (val) {
> -            irq = find_first_bit(&val, 64);
> -            s->intisr &= ~(0x1ULL << irq);
> -            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
> +            irq = find_first_bit(&val, 64UL);
> +            if (irq < 64) {
> +                s->intisr &= ~(0x1ULL << irq);
> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
> +            }

This needs to be rewritten.  I mentioned this multiple times during review, but this 
instance seems to have slipped through anyway.

You absolutely cannot use find_first_bit etc on raw 'unsigned long' -- bitmap.h functions 
may only be used on DECLARE_BITMAP objects.

That said, there is no point in using any of the bitmap.h functions here.  You should 
simply use uint64_t val, and ctz64() instead of find_first_bit().


r~

