Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39CC358742
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:36:50 +0200 (CEST)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVm5-0000z3-BN
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUVkg-0008Pm-8g
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:35:22 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUVkd-0006MR-Et
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:35:21 -0400
Received: by mail-pf1-x42a.google.com with SMTP id q5so1952242pfh.10
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UImoBg6Dr+lRRdZHmDcbUUPqQp01+6r7w3I/JLZEKk0=;
 b=XF9prvOMDAjpznul7q/V8i/QLVLug8oOgtC527hKZ0oSp6fbTo7WKJ753V0/NAE3E2
 Lhkk8enF5b428LsJH3TdKFPAOBOKxehA5r4GSCS0P7OI+MwaLmDDkOyJfddWDQgX/M2X
 vp6jl6hd6dUQ7eSkL4eFKeYjGtYZvJ1YURcZC+t7GgLoftRwQ0hYl8squL2plLWrAi/0
 dqtBVB5T5NgxKSFPQCQlClunkL0VGR4N8hSY/qE/a8Ord7sdWtlbQg3CaJJu8jL0yWb3
 pNp90eEg1D52JQiCIuP8OhgHlPBg8kf3PJKMMHvYDWJKr3Oq67EZHoVqMW35CJNtmRHc
 gAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UImoBg6Dr+lRRdZHmDcbUUPqQp01+6r7w3I/JLZEKk0=;
 b=QIxKjWP636MdzzJ35Vdlt9NiaOBqfJzo7B6eelGe518fNrWsBOHApIpTEMuzNgSl0H
 aoEyq9EnlxBOPkaQaNdsjLnbprWEHj+6gh7aJetHTy79YSfIPpjdGlKZcRsJPOdREFt0
 EV3aCOUxZrkediHRx/DckiJQfYwc+r+sSQGsCiiL5umYlZ5FZrrTFQHasjy3d0Sjo8nn
 bvLwhhk7nRz5u32QtnQNyD8Slwg2DPc3QaW9KFb3IsMfYht8eSqlNYknEsRDJfAxO0wi
 KGgTl6vmx4oNwK/J4sTlPExJH6+NFjsZe2KthuGRJCgI5eUhMNvUQZElQxezxdqticvl
 blNA==
X-Gm-Message-State: AOAM531shQDqVGnJJ2RAVHW/rsF7iFrq0Y8tGzrpQO+i3pugRFuAh1k9
 S5AZPk8HianuxgjCk0EM6BEUhw==
X-Google-Smtp-Source: ABdhPJw2nzNXvc9iXGfbvQrYbggp2jT5zgu9QlC2ICXI3i7UhNhtWL8RA0i8cxUlLcq6THwZpr8RuA==
X-Received: by 2002:a63:48c:: with SMTP id 134mr8426253pge.347.1617892516867; 
 Thu, 08 Apr 2021 07:35:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id k11sm8941951pjs.1.2021.04.08.07.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 07:35:16 -0700 (PDT)
Subject: Re: [RFC v12 17/65] target/arm: tcg: add stubs for some helpers for
 non-tcg builds
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-18-cfontana@suse.de>
 <20afd643-604c-8b0a-fe02-3e6a08c5f848@linaro.org>
 <90f7f2b7-d9cb-d9ab-d285-9dc186981cc2@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e871b75a-a372-4a5d-75a0-9b3a88d4e0d2@linaro.org>
Date: Thu, 8 Apr 2021 07:35:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <90f7f2b7-d9cb-d9ab-d285-9dc186981cc2@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 4/8/21 3:39 AM, Claudio Fontana wrote:
> On 3/28/21 6:22 PM, Richard Henderson wrote:
>> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>>> +int fp_exception_el(CPUARMState *env, int cur_el)
>>> +{
>>> +    return 0;
>>> +}
>>
>> Oh, I'm pretty sure this should be identical with sve_exception_el, where the
>> fpu may or may not be enabled for a given cpu state (e.g. lazy fpu switching in
>> the kvm guest kernel).
>>
>> Are we really returning constant 0 for kvm before your patch set?
>>
>>
>> r~
>>
> 
> I tried to remember and follow the fp_exception_el in detail,
> and _maybe_ the assumption here was the same as I had before, ie: KVM arm_hcr_el2_eff() = 0?
> 
> So as we changed this assumption for arm_hcr_el2_eff(), and ended up taking the whole implementation for KVM too,
> we might need to do the same for fp_exception_el?

Yes, take the whole function.

The initial assumption for arm_hcr_el2_eff was correct, until nested virt came 
along.

The initial assumption for fp_exception_el was simply false.  The kernel can 
and does disable the fpu from time to time.  We were simply ignoring this for 
the purpose of arch_dump or whatever corner cases KVM actually uses this function.


r~

