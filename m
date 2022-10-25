Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE3C60D616
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 23:23:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onRKw-0002Tk-6F; Tue, 25 Oct 2022 17:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onRKt-0002OS-KP
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:19:47 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onRKr-0006NR-UP
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:19:47 -0400
Received: by mail-pg1-x530.google.com with SMTP id g129so11155447pgc.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 14:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZNCervn93EzAIvfECJ7PAGpejYeNsGSdA2JgT2xKcLc=;
 b=TuXDkxKwHVD5OD46WpX2tDjbHmpEuxfSrhaGCgqa0hUCEE+Xm5aaVrVstnSF7LA6br
 WQ85c9vzHjNoKmQsn4OMj8uwx66iT4A3YYEq2G8xpa0xuQ36v31H9obpUkuk9zuScRek
 EZHtZEDIC2Q4hO4wQOZ6Y0gftv83ZAVTqNCfUkyfZONG3Tly7qIPJETkLr7okIsLF9Ax
 T8IXnw/gFDWp6PExq1Om4rE0PwIp4dav2XmZ+7uGnhRlLawcq+Zw4LRDFMInHp0JW53D
 BKc7fG9uauTjUk+bs3k8w16hzVpUoIvV8J5zzHN/l59snjYAs1E4m3LcQZNGrl6uLL69
 43Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZNCervn93EzAIvfECJ7PAGpejYeNsGSdA2JgT2xKcLc=;
 b=Ky7NcDKI4yJrov050lZtDWcG6ZDYF5eaWXYH4FTvCKSXnlRNysdbXDXvYe4/7Czq7a
 Vp/wHfcXhRAC3W8HPJCXLQ9C+8bnFd9Vx4PfAclrWwVPP/Z8oqdPO7Rb/wTasq1Mz7+d
 UUtk582biCdjGnRWfb7UHHpkU/Vbt7K/r63icicyTyJKzcn69Yonse1B8hZ0ea5D/knw
 f/GT+PGnwm1w2lEvtKRcz+NXM0hFTwAt6WU8xOGBmFpJlDA+gecwPnK9+uA5ZeJMkz3m
 UtA12unF8zq2cZGDGCil36HZG1cASPin8q0AMUEwA/mtvEm4Q1wHEiPwEpRJIlCpe+Yo
 CFnA==
X-Gm-Message-State: ACrzQf1ILbLz8bKUUihuzToWsTd+tnbsydzkOrfLWEXLBoqvvfuMEWMo
 ggBS+9xCZNOi16YR2s13/OLqfA==
X-Google-Smtp-Source: AMsMyM66KWMrP7MIDrDzeOsU/dZjOXcqpDyFmgsSXH5YM4kEa07yUZv5J3W8pE41aIDerUT9ChFQhA==
X-Received: by 2002:a05:6a00:124d:b0:566:8645:dad2 with SMTP id
 u13-20020a056a00124d00b005668645dad2mr41419884pfi.5.1666732784250; 
 Tue, 25 Oct 2022 14:19:44 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 g127-20020a625285000000b00562a526cd2esm1783959pfb.55.2022.10.25.14.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 14:19:43 -0700 (PDT)
Message-ID: <508c7d0e-8e2a-c99f-a87f-e740a2bd70a9@linaro.org>
Date: Wed, 26 Oct 2022 07:19:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 15/24] accel/tcg: Use interval tree for TBs in user-only
 mode
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-16-richard.henderson@linaro.org>
 <87wn8n6g1v.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87wn8n6g1v.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/26/22 01:58, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Begin weaning user-only away from PageDesc.
>>
>> Since, for user-only, all TB (and page) manipulation is done with
>> a single mutex, and there is no virtual/physical discontinuity to
>> split a TB across discontinuous pages, place all of the TBs into
>> a single IntervalTree. This makes it trivial to find all of the
>> TBs intersecting a range.
>>
>> Retain the existing PageDesc + linked list implementation for
>> system mode.  Move the portion of the implementation that overlaps
>> the new user-only code behind the common ifdef.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/internal.h      |  16 +-
>>   include/exec/exec-all.h   |  43 ++++-
>>   accel/tcg/tb-maint.c      | 388 ++++++++++++++++++++++----------------
>>   accel/tcg/translate-all.c |   4 +-
>>   4 files changed, 280 insertions(+), 171 deletions(-)
>>
> <snip>
>> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
>> index c8e921089d..14e8e47a6a 100644
>> --- a/accel/tcg/tb-maint.c
>> +++ b/accel/tcg/tb-maint.c
>> @@ -18,6 +18,7 @@
>>    */
>>   
>>   #include "qemu/osdep.h"
>> +#include "qemu/interval-tree.h"
>>   #include "exec/cputlb.h"
>>   #include "exec/log.h"
>>   #include "exec/exec-all.h"
>> @@ -50,6 +51,75 @@ void tb_htable_init(void)
>>       qht_init(&tb_ctx.htable, tb_cmp, CODE_GEN_HTABLE_SIZE, mode);
>>   }
> 
> I wonder for the sake of avoiding recompilation of units later on and
> having a clean separation between user and system mode it would be worth
> putting this stuff in a tb-maint-user.c?

Something like that might be possible toward the end of the series, but there's too much 
tangle in the middle.

>> +bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
>> +{
>> +    assert(pc != 0);
>> +#ifdef TARGET_HAS_PRECISE_SMC
>> +    assert_memory_lock();
> 
> Out of interest is this just because x86 has such a strong memory model
> you can get away with this sort of patching without explicit flushes?

Yes.

> I'm curious why this is the only arch we jump through these hoops for?

It's probably the only one for which we have extensive test cases for self-modifying code 
(aka msdos).  I can imagine that other old targets might technically require it, e.g. 
m68k, or some of the micro-controllers.

I'm actually not sure why we don't enable it everywhere -- it doesn't seem like it's 
adding lots of overhead.  But until someone reports a bug, or it gets in the way of 
multi-target, I'm happy to not enable it anywhere else.

>>       /*
>>        * We remove all the TBs in the range [start, end[.
>>        * XXX: see if in some cases it could be faster to invalidate all the code
>>        */
> 
> I'm guessing this comment is quite stale now given we try quite hard to
> avoid doing lots of code gen over and over again. The only case I can
> think of is memory clear routines after we've had code which there might
> be some heuristics we could use to detect but don't currently.

I think there's still room for exploration here, especially detecting page clearing as you 
say.


r~

