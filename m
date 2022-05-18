Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C752C1B8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 20:06:36 +0200 (CEST)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrO4B-00058Y-3B
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 14:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrO27-0002wf-QI
 for qemu-devel@nongnu.org; Wed, 18 May 2022 14:04:28 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:50958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrO25-0003az-DK
 for qemu-devel@nongnu.org; Wed, 18 May 2022 14:04:27 -0400
Received: by mail-pj1-x102b.google.com with SMTP id ds11so2853020pjb.0
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 11:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rM3KBHEKwrl8ROoU+src5bxnOtsMwO0y3TfAVRTEw+o=;
 b=HM0hFdkHhNDZzJ4qjt+MQ3GtksiUjDP2TaM3e18uSgSKwo7XyXXLNx1xfcCOvR8zbR
 7E7KKfApiXqgY/bv6cBfLU4lqPM/rNjCwfgC81i6dBDUCOw6gPfglra+VnYAwkUJu8Bz
 4EOCv67LjQ0XmKJ9wJhoxL2kl7FIhqOSK8cT5nS2x4EONfFXbeDgK7twR3mvwHl4xV6D
 nBfK2/hlm3hooTqzEXp5KwMgOF+QYlK+gdapsAVkK0VTQz0MOLAZ81BzcqHfF9mThInM
 f8seJiYbyYh0jQhFixaJMHE0hh8gzGs9VLItB87GKilk8txCXP99+h20Ow4c0ksKi1Fa
 myAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rM3KBHEKwrl8ROoU+src5bxnOtsMwO0y3TfAVRTEw+o=;
 b=2DDbi3iLLqZw6/9NUzsVFkVdGcL/iQJeBufSzUGAP0QAR+QNWep591Tjp7f6MVXYfU
 pBZzkL5NUqQEa/H2DuW2EzcQ4i/fL5K1cZTe+piAQOU2cqCKpy9wt2NpdbDUFg2KMOM2
 U2up7Zb+H7/qh291WJYRhgvUx/EjulglN48qux53Qe0Ozxw3vnVmSm0VLlwLLdxFcBcm
 QhAN4DxcBAlv9E17eSlUgR04HlWo/R9BS/1uNomawN7DKYCDLato6m/68f0pJp87E2Gz
 QZk4vAS7jLK0ZhuN6veaBJQnfKC01Gagybo6f4972ytHjcd/0QbQV6pd2jEZdHe8IE4k
 MzNA==
X-Gm-Message-State: AOAM531lcV/gURX9r0tkw6UT6o5WyCJDUo90gqtLYTvBDKYLEQJ6qV84
 cuUNWGfPe5BwcG/e2v9FwJKrZg==
X-Google-Smtp-Source: ABdhPJy3+Yth2hb9skf5HC3oSEQzyV9dL4ItxOujlyeeOYrjydUtfDgfEzyfbJakniew6C6a1JQwig==
X-Received: by 2002:a17:902:db0b:b0:161:a751:9e23 with SMTP id
 m11-20020a170902db0b00b00161a7519e23mr789665plx.44.1652897062638; 
 Wed, 18 May 2022 11:04:22 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 c84-20020a621c57000000b0050dc7628183sm2299817pfc.93.2022.05.18.11.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 11:04:21 -0700 (PDT)
Message-ID: <79bbbf79-a019-17f4-9008-f57a8c375fcb@linaro.org>
Date: Wed, 18 May 2022 11:04:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
 <20220517113023.3051143-35-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517113023.3051143-35-yangxiaojuan@loongson.cn>
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

On 5/17/22 04:30, Xiaojuan Yang wrote:
> +static void extioi_update_irq(LoongArchExtIOI *s, int irq_num, int level)
> +{
> +    int ipnum, cpu, found, irq_index, irq_mask;
> +
> +    ipnum = get_ipmap(s, irq_num);
> +    cpu = get_coremap(s, irq_num);
> +    irq_index = irq_num / 32;
> +    irq_mask = 1 << (irq_num & 0x1f);
> +
> +    if (level) {
> +        /* if not enable return false */
> +        if (((s->enable[irq_index]) & irq_mask) == 0) {
> +            s->sw_pending[irq_index] |= irq_mask;
> +            return;
> +        }
> +        s->coreisr[cpu][irq_index] |= irq_mask;
> +        found = find_first_bit(s->sw_isr[cpu][ipnum], EXTIOI_IRQS);

AGAIN!  You CANNOT use only part of the bitmap.h interface.

>> +    uint64_t sw_isr[LOONGARCH_MAX_VCPUS][LS3A_INTC_IP][EXTIOI_IRQS / 64];

This has not been declared with DECLARE_BITMAP, therefore you will see a compile-time 
error when building on an ILP32 (i686) or P64 (win64) host.

I pointed this out to you as recently as v2 of this series.
I am really disappointed to see this regress in just one month.

You can test this yourself with

   IMAGES='fedora-i386-cross fedora-win32-cross fedora-win64-cross' \
   make docker-test-build

Please do so before your next submission.

> +static void extioi_writew(void *opaque, hwaddr addr,
> +                          uint64_t val, unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    int i, cpu, index, old_data, data_offset;
> +    int old_ip, new_ip, old_core, new_core, irq_mask, irq_num;
> +    uint32_t offset;
> +    int old_ipnum[128], old_cpu[4];
> +    trace_loongarch_extioi_writew(size, (uint32_t)addr, val);
> +
> +    offset = addr & 0xffff;
> +
> +    switch (offset) {
> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
> +        index = (offset - EXTIOI_NODETYPE_START) >> 2;
> +        s->nodetype[index] = val;
> +        break;
> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
> +        /* get irq number */
> +        offset -= EXTIOI_IPMAP_START;
> +        index = offset >> 2;
> +        /*
> +         * 4 bytes writing, set 4 irq groups one time,
> +         * and one group is 32 irqs, so set 128 irqs mapping
> +         */
> +        for (i = 0; i < 128; i++) {
> +            old_ipnum[i] = get_ipmap(s, offset);
> +            offset += 1;
> +        }

You increment offset in the first loop,

> +        s->ipmap[index] = val;
> +        offset -= 128;
> +        /* if core isr is set, need to update irq */
> +        for (i = 0; i < 128; i++) {
> +            old_ip = old_ipnum[i];
> +            new_ip = get_ipmap(s, offset);
> +            cpu = get_coremap(s, offset);
> +            if (old_ip != new_ip) {
> +                if (s->coreisr[cpu][offset / 32] & (1 << (offset & 0x1f))) {
> +                    extioi_update_irq(s, offset, 1);
> +                }
> +            }
> +        }

but not the second.

> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
> +        index = (offset - EXTIOI_ENABLE_START) >> 2;
> +        old_data = s->enable[index];
> +        if (old_data != (int)val) {
> +            s->enable[index] = val;
> +            /* get data diff */
> +            old_data ^= val;
> +            /* value change from 0 to 1 */
> +            old_data &= val;
> +            data_offset = ctz32(old_data);
> +            while (data_offset != 32) {
> +                /*
> +                 * enable bit change from 0 to 1,
> +                 * need to update irq by pending bits
> +                 */
> +                irq_num = data_offset + index * 32;
> +                irq_mask = 1 << data_offset;
> +                if (s->sw_pending[index] & irq_mask) {
> +                    extioi_update_irq(s, irq_num, 1);
> +                    s->sw_pending[index] &= ~irq_mask;
> +                }
> +                old_data &= ~irq_mask;
> +                data_offset = ctz32(old_data);
> +            }

I'm still not convinced.  Why would unmasking (enabling) an irq call update_irq, but 
masking (disabling) the same irq not also call update_irq?

Even if that is correct, the testing of sw_pending could be done in parallel, like

     old_data &= s->sw_pending[index];

before the loop, instead of testing each bit one at a time within the loop.

The loop itself should be written

	while (old_data) {
	    data_offset = ctz32(old_data);
             ...
             old_data &= old_data - 1;
         }

so that you don't bother computing ctz for zero values, and with the adjustment to 
old_data before the loop, you don't need irq_mask within the loop.

Likewise with the updates to COREISR and COREMAP.


r~

