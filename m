Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270950765C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 19:17:00 +0200 (CEST)
Received: from localhost ([::1]:60716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngrTG-00005h-SY
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 13:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngrQt-0007Q8-RO
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:14:31 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngrQs-0005RF-3e
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:14:31 -0400
Received: by mail-pl1-x62e.google.com with SMTP id s17so5559667plg.9
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 10:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4KqVeuPCblMaT6wo99mEyGbAj+/D+bppHMD6X2wYcBM=;
 b=xer0Y+Bvx5Mn+sUlfkEI4EbZyhVHvCGoK3ldMReeD9gh9X1cYNY0JgDa+9/mgeG9tH
 JI5BuL5jl1TlFMNvFyU5RO8Br5x1TJWZwe0IixRvyMIq60a3oE6voAO/ITJeGphNaIEN
 Hi9ARO8xvAg57zo9KdwGxE6PlcZyuJGv/1w9GDaMxKbw3/gjaOOzlbfa5qaUUzAYRrks
 7y+RMW3JMnsNN6OqdrihRpxltXEVUImdoBFUTj0mpBr0b+aX7hIzlRzOMD4si9W7ZP5C
 K4MU41ZFT7zr8p+5DX4G1HOqKxu4QEerGErXg2jcgjdxiJJZIO0H3s+hYlU1G8ABLcnO
 eWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4KqVeuPCblMaT6wo99mEyGbAj+/D+bppHMD6X2wYcBM=;
 b=2yGa/NzJqJMg6tLT6+tFNuSPB51UAtZeV1676evIQzz5KpDouJnLHTBPwBiZYOJGhL
 5xHx8MOnGZI+cO55HTeN+eGZ6EkESoIQ2gbz1yaq4fql03KryYFQbDKwmpPBltkS/107
 TkUNsWojs4+DZunC5gLMWtM4LHPEUYRqSqCvTDYYFqjybKcOlsl+2K8rxr2AVARAw7Mt
 E8X7V7K0zWzIBEHsbk8QDtxDkZG9/zkoQYpJCvmt2lft5v0bQi8yAw/hVZZ8HhCFlvzV
 8JtPMTsE7yaRt8/iU2S/dv+RBe0hbja/vsT3kDzyh6nky5R1316PjUF9Vp/X0yg4kjYP
 +9Yw==
X-Gm-Message-State: AOAM533Ad7OlBxzAYHnHdkAn7qfMNvweY3uFglsllZ+tsWA7vS6lQxeo
 dK7q9jDgvXKn014JQW/MZyMAFg==
X-Google-Smtp-Source: ABdhPJyKUwkKhtxuUs3yocoDe9M8/5KXOmAFsx73MPcjRM0FiagBzsDehiAHtut0HN1nyiO4i0EvsA==
X-Received: by 2002:a17:90b:1e0c:b0:1d2:7f67:f56c with SMTP id
 pg12-20020a17090b1e0c00b001d27f67f56cmr15212846pjb.69.1650388468515; 
 Tue, 19 Apr 2022 10:14:28 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e126-20020a621e84000000b0050567191161sm16990681pfe.210.2022.04.19.10.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 10:14:27 -0700 (PDT)
Message-ID: <d0506536-de1f-52d9-a498-46de3d42a6cc@linaro.org>
Date: Tue, 19 Apr 2022 10:14:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 33/43] hw/intc: Add LoongArch ls7a interrupt controller
 support(PCH-PIC)
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-34-yangxiaojuan@loongson.cn>
 <832efe6e-f647-9691-202c-e8713caf97d5@linaro.org>
 <cb22faf4-8166-e91a-1cdb-3f0bd5736fe3@loongson.cn>
 <5c8d218b-ad1a-ae6f-2540-8499c4808d42@linaro.org>
 <9be28479-bc66-81a5-5842-4ad705ed0de2@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9be28479-bc66-81a5-5842-4ad705ed0de2@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 00:27, yangxiaojuan wrote:
> On 2022/4/18 下午10:39, Richard Henderson wrote:
>>>> Is there a good reason that this function is treating hi and lo separately, as opposed 
>>>> to simply doing all of the computation on uint64_t?
>>>>
>>>
>>> In the part of linux kernel, pch pic driver use 32 bits for reading and writing.
>>> e.g in the drivers/irqchip/irq-loongson-pch-pic.c， pch_pic_mask_irq() function use 
>>> writel() to write pch_pic mask reg.
>>
>> So?  update_irq is not writel.
>>
>> I expect that you should have done something (manual deposit64 or .impl.min_access_size 
>> = 8) with the actual writel, but by the time we arrive in this subroutine we have a 
>> complete uint64_t.
>>
> 
> In the linux kernel pch_pic driver, pch_pic_unmask_irq() use writel to config PCH_PIC_CLR reg:
> 
> writel(BIT(PIC_REG_BIT(d->hwirq)),
>                      priv->base + PCH_PIC_CLR + PIC_REG_IDX(d->hwirq) * 4);
> 
> And writel() need u32 value.
> 
> static inline void writel(u32 value, volatile void __iomem *addr)
> {
>      __io_bw();
>      __raw_writel((u32 __force)__cpu_to_le32(value), addr);
>      __io_aw();
> }

Are we talking past one another?
I said just above: it does not matter what the kernel is doing.


> The emulate of PCH_PIC_CLR in qemu LoongArchPCHPIC struct member is intirr_lo/hi(we devide 
> 64bits reg to two 32bits reg to match the linux kernel), it will be changed when we config 
> clear reg or handler irq.
> 
> static void loongarch_pch_pic_low_writew(void *opaque, hwaddr addr,
>                                       uint64_t data, unsigned size)
> {
> ...
> case PCH_PIC_INT_CLEAR_LO:
>      if (s->intedge_lo & data) {
>          s->intirr_lo &= (~data);
>          pch_pic_update_irq(s, data, 0, 0);
>          s->intisr_lo &= (~data);
>       }
>      break;
> case PCH_PIC_INT_CLEAR_HI:
>      if (s->intedge_hi & data) {
>          s->intirr_hi &= (~data);
>          pch_pic_update_irq(s, data, 0, 1);
>          s->intisr_hi &= (~data);
>       }
>      break;

One can just as easily do

     case PCH_PIC_INT_CLEAR_LO:
         data = (uint32_t)data;
         goto do_clear;
     case PCH_PIC_INT_CLEAR_HI:
         data <<= 32;
     do_clear:
         s->intrr &= ~data;
         pch_pic_update_irq(s...);
         s->intrs &= ~data;

with the values internal to qemu be represented with uint64_t instead of a pair of 
uint32_t.  Which would in fact be *much* clearer to read, and would seem to cut down the 
number of code lines required by half.


r~

