Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77826606A61
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 23:37:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldEE-0008J6-AC
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 17:37:26 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldAt-000723-4J
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 17:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldAV-0006v6-Op
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 17:33:41 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldAT-0007Oc-KY
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 17:33:35 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso3768000pjq.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 14:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=osywi9KAPWWC0ItUbxdT2uxPhm62V5O+ECk8jHDBxSM=;
 b=npgDljUs9DQ8YbgEir/A5jlFzet6lEI0APZbjggqNPypBDY8nQfC1SIfI7g3m0QxS1
 iX9/xIld0EwF4t1MiDS43bfHQ7BUfKV9j8YU7uiNOhB4zHBmNLJCKC751CkBgdXNXzwr
 1KGkkQvwZW+2rnX/zifj9lZ8wMoS2u+LPI2lFcmMq6An/4aKxS6BoBjiweGC33GV8zxt
 PSLL5MK5BN+w0hGBiz8gHfAWxQElnW7hsu13GForcviWWRAqwwW01prMzQ7L3v7DaJb0
 +nwFYYcmTaUgXsGg1QzCSgmlXoweBYOnGVm+rAq0BBCLO2arfe/w5LuiPmLQsVcJXw2V
 0UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=osywi9KAPWWC0ItUbxdT2uxPhm62V5O+ECk8jHDBxSM=;
 b=fz6uK3M4ES54aRFB09TlnNLS/p3HXEaaE3IOaIauS+PjgBTy/Xm2HDfTnXGQmozEga
 V43IgBSPv3CfXXS6gGo5Ad4o2VQ1h0LgFEKgm1a7f3e7EdbQvWOWYMeueEK8bGOzblCn
 tV9ahG6l91UNBHt98x63E9ohrwI5vHMq8/UkSvqAoXh6BZl3AbQfiE6JTncnxrnCAygg
 0mCGaC3CfnpVbL6p8va84GkK4zZhYjmW1AwMV8IhoV13/wQBKSUN6RwYuNF10/DTpijF
 I5KpJ419u7ei1UyFnfivxCMt72r04+XmMg4t4UEdCK/IxQbUxhQjUQa5mvXY+/bAyRBH
 qsHw==
X-Gm-Message-State: ACrzQf3TXsccP+aAYS9+woDkgLCWGcD0WMliFK6PVSEpdN1A+T4BJLsK
 s57MwoW8L4aVLPON3YqEBwUEcw==
X-Google-Smtp-Source: AMsMyM5ncDDIM77LIRvDSE507fGYbSAM1OGGJqclGHUemrRRlZsLYeoD2AJdCB3caQojbuBn2HcrKg==
X-Received: by 2002:a17:90a:f3ca:b0:20a:d4ee:3859 with SMTP id
 ha10-20020a17090af3ca00b0020ad4ee3859mr18582350pjb.70.1666301611831; 
 Thu, 20 Oct 2022 14:33:31 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 on16-20020a17090b1d1000b0020b21019086sm6655770pjb.3.2022.10.20.14.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 14:33:31 -0700 (PDT)
Message-ID: <abe68570-b833-4e72-0947-995c6c5af912@linaro.org>
Date: Fri, 21 Oct 2022 07:33:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 11/31] tcg: Allocate TCGTemp pairs in host memory order
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
 <20221020115242.2301066-12-richard.henderson@linaro.org>
 <52685842-3305-18c5-188f-d68297ab35e9@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <52685842-3305-18c5-188f-d68297ab35e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/22 01:01, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 20/10/22 13:52, Richard Henderson wrote:
>> Allocate the first of a pair at the lower address, and the
>> second of a pair at the higher address.  This will make it
>> easier to find the beginning of the larger memory block.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tcg-internal.h |  4 ++--
>>   tcg/tcg.c          | 60 ++++++++++++++++++++--------------------------
>>   2 files changed, 28 insertions(+), 36 deletions(-)
> 
>> @@ -4116,18 +4114,12 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
>>       }
>>       /* If the two inputs form one 64-bit value, try dupm_vec. */
>> -    if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
>> -        if (!itsl->mem_coherent) {
>> -            temp_sync(s, itsl, s->reserved_regs, 0, 0);
>> -        }
>> -        if (!itsh->mem_coherent) {
>> -            temp_sync(s, itsh, s->reserved_regs, 0, 0);
>> -        }
>> -#if HOST_BIG_ENDIAN
>> -        TCGTemp *its = itsh;
>> -#else
>> -        TCGTemp *its = itsl;
>> -#endif
>> +    if (itsl - itsl->temp_subindex == itsh - itsh->temp_subindex) {
>> +        TCGTemp *its = itsl - itsl->temp_subindex;
>> +
>> +        temp_sync(s, its + 0, s->reserved_regs, 0, 0);
>> +        temp_sync(s, its + 1, s->reserved_regs, 0, 0);
> 
> No mention of dropping the 'mem_coherent' checks?

Hmm.  I guess I should split that out as a separate patch.
The first thing that temp_sync does is check mem_coherent...


r~

> 
>>           if (tcg_out_dupm_vec(s, vtype, MO_64, ots->reg,
>>                                its->mem_base->reg, its->mem_offset)) {
>>               goto done;
> 


