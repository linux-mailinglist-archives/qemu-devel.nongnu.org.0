Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7DC573B16
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:23:15 +0200 (CEST)
Received: from localhost ([::1]:42436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBf8s-0000So-3R
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBeuN-0007JW-L0
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:08:16 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBeuK-0005tD-RC
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:08:14 -0400
Received: by mail-pg1-x52c.google.com with SMTP id g4so10901422pgc.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6ToSvnA3VkBh4RDdA6w/4EDtbMaa6RcRI/AxbbLVH1M=;
 b=c7HfPpDkr3EjYttNZZ1D7nD3adSN5dW+7xslxRbrmT+eJbp1s6nvJqhyBKKFizcvVs
 A52g0CPEFkfC2K9IE99o3r9oBMLySm5VTfW25UP4Hgk1BZ3f0Ry+4W2u+gqzGESBisDI
 3ZueRL1Q2UO/GAYjpGhPmjBl+ncb0B9Mkn4ga6RnLkxuOwhiza4LxKUqnjy7HZvHupXM
 CJgZYGDeC7VkGey7mt93VatMucmFSnCsxbO8ZvFaYhbckdaqoNl72rLG+FzS6f3FKkyS
 j90oLD2/Jp0cvu7V3u8yGABBkCDn/4f+SyP69u1WVbnz4swwJjkDWxFFjxFDgTBZ6GdL
 b0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6ToSvnA3VkBh4RDdA6w/4EDtbMaa6RcRI/AxbbLVH1M=;
 b=XZtQeD6M9OHheHlhW+SBS75y4S+s6/MDf452QjZVHEbdXM+Q8BJdDc+WirtIxzFZXO
 YfTomu8ZGcwykX7pte8qRUPdgvbK5RSTnIfjpJsWu/g+6AbFd95EeFLTd702Jk7gFjY/
 B2CD34WjhaCyMHfVHchSaCelOyWNwFWS0dSxRZSBqL5fdX64xnYq2XifSKHWISb3JKBX
 gZjZMTuiRPblqPa9dE0l9aX4AF7itjTdELVRsHqWfZ0tYBG7DdlKuKFcpEUzuLD466UO
 UniVSpP/vA7kLZLfyOnVNIkgx3AJqJrq44LknStzLITiCsd8gKHivbe+/sf/epFvdc+f
 i/2g==
X-Gm-Message-State: AJIora+TLTB4NoRjVpgU+7UfdeEpEKBALHRYYPek2B1z9b4MkSx+5h6z
 vPxMduD1UXmB/GXbwBPHEwz28ETUx6ADWvFb
X-Google-Smtp-Source: AGRyM1sdtLAQJUqmfcH2pKs+O70LKuyzmeZy1Q+3yEGzcgtqQ01Xkiwd7SCJPIAFMSrFUPeYzSiaQQ==
X-Received: by 2002:a05:6a00:4481:b0:52a:c7b2:4fe with SMTP id
 cu1-20020a056a00448100b0052ac7b204femr3748365pfb.10.1657728491422; 
 Wed, 13 Jul 2022 09:08:11 -0700 (PDT)
Received: from [192.168.138.227] ([202.124.167.115])
 by smtp.gmail.com with ESMTPSA id
 q89-20020a17090a4fe200b001ef3cec7f47sm1790799pjh.52.2022.07.13.09.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 09:08:10 -0700 (PDT)
Message-ID: <5d8a67e9-8009-36e5-d712-0f172809114d@linaro.org>
Date: Wed, 13 Jul 2022 21:38:03 +0530
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
References: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
 <20220713095036.705102-3-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220713095036.705102-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

On 7/13/22 15:20, Xiaojuan Yang wrote:
> Fix coverity errors:
> 1. In find_first_bit function, the 'size' argument need
> 'unsigned long' type, so we change the 'size' to unsigned
> long type when use the function.
> 2. In expression 1ULL << irq, left shifting by more than
> 63 bits has undefined behavior. And out-of-bounds access
> error occured when 'irq' >= 64. So we add a condition to
> avoid this.
> 3. Use 'MAKE_64BIT_MASK(irq, 1)' to replace '1ULL << shift'.
> 
> Fix coverity CID: 1489761 1489764 1489765
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_pch_pic.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
> index 3c9814a3b4..040b89861c 100644
> --- a/hw/intc/loongarch_pch_pic.c
> +++ b/hw/intc/loongarch_pch_pic.c
> @@ -15,22 +15,27 @@
>   
>   static void pch_pic_update_irq(LoongArchPCHPIC *s, uint64_t mask, int level)
>   {
> -    unsigned long val;
> +    unsigned long val, max_irq;

You did not follow any of my direction from v1.

(1) val must be uint64_t.

(and, generally, any use of 'unsigned long' is probably a bug)

> +            irq = find_first_bit(&val, max_irq);

Use ctz64().

> +            if (irq < max_irq) {

This, really, should be a test of val != 0 before the ctz.


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
> +            irq = find_first_bit(&val, max_irq);
> +            if (irq < max_irq) {
> +                s->intisr &= ~(MAKE_64BIT_MASK(irq, 1));
> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);

etc.


r~

> +            }
>           }
>       }
>   }


