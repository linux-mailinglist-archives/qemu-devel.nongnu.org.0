Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9C3505A2A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 16:41:31 +0200 (CEST)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngSZG-0002DL-SP
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 10:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngSXi-0001Il-4g
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:39:54 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngSXg-000654-I0
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:39:53 -0400
Received: by mail-pg1-x535.google.com with SMTP id t184so6235393pgd.4
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=juoRlV6qiPR0k3zVsERBhIT+ltOLuZsTRvVFc+AbJ1Y=;
 b=fDcXIe1dMBjYRRTfwUB4jHaJRUmFhPcPHHnxu3TQvJgMCtjqT0UJoxQ8DlBh6Nh8/X
 pHqlaKRKgHI39AKEmwAelsSoqYbdOCayzQ66KVxo71/cTi1LVbpXRXpHNNd030g+XW+1
 fzkFkXaXmHQhDw72K7h/lkaIw5aV6nfMbFr2JczZHOnB6d34qr4CjkPXWb7WpN3MrsAV
 69Eb2+nTkm95c/2HJr+KSBZ2SZlJp+SnbPR0bT0xDqW7nGI/6Wnb/r+MGTuk+SDMVhwE
 CfYyJh0nDFA4laR3HG/Fi1KwlEaDc+aUDezJcKHvCZBGoDHwOw8YNXG9lyt8wxJ/NPhE
 RFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=juoRlV6qiPR0k3zVsERBhIT+ltOLuZsTRvVFc+AbJ1Y=;
 b=sAjy0iaB5VAXmbH4/WMv4LlxqukQVbCGDe60NFO/FmF743A89zVI5VfPEdJp4r8GWe
 D2t6HdGyDfV477xao2/gJP8T4qykUFRTIvEg4UyuVTdgErxCLYLIEHsVR52Leky5J3dJ
 3eYiLB4ciHUpbmiAXUPMnPsiOjvpQ+To3VHZQPNcCP/Ojv/dbiaWqkFYSv09++G+OZ+Q
 hxl5ydo0kgIyiMJbiheJoP0cBESSJBxmbcfAchiWuOrka8MUi2CndQOMv5vl58rFs3UY
 F/0oSv4o0/FJe4ghJaL+9wl1spXduhtDNCmvgsDp+DP6gylVCwYtSpazxjvCQYhraLhI
 OnWQ==
X-Gm-Message-State: AOAM531mGvo9puEvsIXC3QB/xH3zn5QlR5SyY1A1nmfgqkSaFlTonmM1
 knUMRrFKZ5YCo3LJCGcCUvCA3A==
X-Google-Smtp-Source: ABdhPJzuhc4PyOO3r9ZwKLaAqkp+HQ75n2ulzb6C1MSR9pkQJa7zFD50OF0v0lJcS5BREShRMjQ2kQ==
X-Received: by 2002:a63:5b61:0:b0:39d:2aef:c024 with SMTP id
 l33-20020a635b61000000b0039d2aefc024mr10497189pgm.589.1650292790930; 
 Mon, 18 Apr 2022 07:39:50 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a62a20d000000b004fe0ce6d7a1sm12903243pff.193.2022.04.18.07.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 07:39:50 -0700 (PDT)
Message-ID: <5c8d218b-ad1a-ae6f-2540-8499c4808d42@linaro.org>
Date: Mon, 18 Apr 2022 07:39:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 33/43] hw/intc: Add LoongArch ls7a interrupt controller
 support(PCH-PIC)
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-34-yangxiaojuan@loongson.cn>
 <832efe6e-f647-9691-202c-e8713caf97d5@linaro.org>
 <cb22faf4-8166-e91a-1cdb-3f0bd5736fe3@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cb22faf4-8166-e91a-1cdb-3f0bd5736fe3@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 4/18/22 02:14, yangxiaojuan wrote:
> Hi, Richard
> 
> On 2022/4/18 上午11:15, Richard Henderson wrote:
>> On 4/15/22 02:40, Xiaojuan Yang wrote:
>>> +static void pch_pic_update_irq(LoongArchPCHPIC *s, uint32_t mask,
>>> +                               int level, int hi)
>>> +{
>>> +    uint32_t val, irq;
>>> +
>>> +    if (level == 1) {
>>> +        if (hi) {
>>> +            val = mask & s->intirr_hi & (~s->int_mask_hi);
>>> +            irq = find_first_bit((unsigned long *)&val, 32);
>>
>> This does not work -- you're accessing beyond the end of the uint32_t for all LP64 
>> hosts.  I think you just want ctz32()...
>>
>>
>>> +            if (irq != 32) {
>>> +                s->intisr_hi |= 1ULL << irq;
>>> + qemu_set_irq(s->parent_irq[s->htmsi_vector[irq + 32]], 1);
>>> +            }
>>
>> ... which should in fact only be tested if val != 0, which is to what this IF equates.
>>
>> Is there a good reason that this function is treating hi and lo separately, as opposed 
>> to simply doing all of the computation on uint64_t?
>>
> 
> In the part of linux kernel, pch pic driver use 32 bits for reading and writing.
> e.g in the drivers/irqchip/irq-loongson-pch-pic.c， pch_pic_mask_irq() function use 
> writel() to write pch_pic mask reg.

So?  update_irq is not writel.

I expect that you should have done something (manual deposit64 or .impl.min_access_size = 
8) with the actual writel, but by the time we arrive in this subroutine we have a complete 
uint64_t.


r~

