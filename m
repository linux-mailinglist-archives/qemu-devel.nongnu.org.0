Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5942134BE6D
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 21:04:36 +0200 (CEST)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaiB-0001xp-Eo
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 15:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQagi-0001Xl-Tx
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:03:04 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:38416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQagh-0000HT-31
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:03:04 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 n12-20020a4ad12c0000b02901b63e7bc1b4so2520516oor.5
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 12:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CYyqzyuy8Am+ajv+q/UkFLnV6TMO5jpofOsVrk2vCpM=;
 b=gvqQA+mxrWNkaNVriG4yIzG1M25P/FPd6t894ADN4dwbD81sIz6mDDSAvHXo06fN3f
 zYZwz2j7Ze+PsVmM+pU8SvKZdAIBg0SX7TU+9WIt2XOehiKIXe7QZeeIAg+pcJfgU2Up
 zHLZ/DODtzJ6DeFIK34cbfUMNmr8IWPArptDGTXl3yj9S2Fzf1upLIAjlFmhxz4Tz7vK
 qhd9kDG93VqIx6wvILFYNqcgm5PaYOcDplDMPAYpnutcY7Xd7OJZTZC++1x2P8/4nePn
 u3znv7DU3af/fLm419v2KD9MQyQPhdlCE8+cbRswLGiBwi6bQuoT7MXu/KmYkCSDbc+a
 D7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CYyqzyuy8Am+ajv+q/UkFLnV6TMO5jpofOsVrk2vCpM=;
 b=hAEKDza1K5cf2WpHCaiYkhO/j5YKlM9xB7/5OO72Rmcch5ZXZxqkZBC/t7J3NU9Nk+
 FvX4+rjmjmZuPBpGJMS9zQFC/r2raCjRriBdnF5Du+J8ANq4pNnBfx1yANnIcOhXd9ap
 iZ6UVwAqC0V2Ro609reqBImrY1CyRBMkiN3UVJiQKRW5RtsTN2e24lNbfN2bxhqxl/Vs
 S+FAu2T4fmLcvOHm69IWkz0w+nb3ELpljqLx2srOUm0xs7X9IjVPGeiYfiHb+ENbMQ3v
 m+OSi0xpPZCYQ9cdlYJcTjASbivPFV7+dJWSLBiMPpyuAy0u5LyPR2Vk5SAc9DLAZRXP
 ERzA==
X-Gm-Message-State: AOAM530q7jPpxipVNw6QgOak8TXeHkJmiK7Y1oCBRSUqWSC0YrrfAUSF
 738lH7s1Bcm+xn6j1ii/9XhlwQ==
X-Google-Smtp-Source: ABdhPJyyXbQJM89FgwxXwqSH8/tsHTx5coqgkeTPA39SgsA0nNXhfNZ5ongz7UfmJJ9BxNS9chw9RQ==
X-Received: by 2002:a4a:e615:: with SMTP id f21mr18992278oot.91.1616958181632; 
 Sun, 28 Mar 2021 12:03:01 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id w21sm3082748oiw.33.2021.03.28.12.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 12:03:01 -0700 (PDT)
Subject: Re: [RFC v12 53/65] target/arm: restrict rebuild_hflags_a64 to
 TARGET_AARCH64
From: Richard Henderson <richard.henderson@linaro.org>
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-54-cfontana@suse.de>
 <595e3b23-9503-21ac-6ad7-6b7c70d1bb9f@linaro.org>
Message-ID: <6c12f14f-cbc9-0859-de8e-4a81b244a4ff@linaro.org>
Date: Sun, 28 Mar 2021 13:02:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <595e3b23-9503-21ac-6ad7-6b7c70d1bb9f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/21 12:34 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> @@ -1084,6 +1084,8 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, 
>> int fp_el,
>>       return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
>>   }
>> +#ifdef TARGET_AARCH64
>> +
>>   static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>>                                      ARMMMUIdx mmu_idx)
>>   {
>> @@ -1204,6 +1206,16 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, 
>> int el, int fp_el,
>>       return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
>>   }
>> +#else
>> +
>> +static inline uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>> +                                          ARMMMUIdx mmu_idx)
>> +{
>> +    return 0;
>> +}
>> +/
>> +#endif /* TARGET_AARCH64 */
> 
> Is this even necessary?  Isn't it removed by the is_a64 test?

Ah, this for patch 59, sve_zcr_len_for_el.
You could perhaps mention that.

Also, the #else could be just the declaration

uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                             ARMMMUIdx mmu_idx) QEMU_ERROR;

which produces a nice compile-time error message when the function is not 
optimized away.


r~

