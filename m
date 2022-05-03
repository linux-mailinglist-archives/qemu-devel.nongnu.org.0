Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDED518D36
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:35:46 +0200 (CEST)
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyJF-0001Cq-5u
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyHN-0000Vf-K9
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:33:49 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyHL-0006Bq-Eq
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:33:49 -0400
Received: by mail-pf1-x42e.google.com with SMTP id i24so15531421pfa.7
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oCmV06myRJm0N1nJJglZK7acE9yic2mBmX4GIfYl474=;
 b=HEjNZ3PwF7uQNtF1Kdjc4STCIZ9PimTg/OF5yFEwdz+Y8UnqUDti6qYPT1i2UfTNCk
 U/xH7Ydv4eZQCTA5jyGGYRbEQSbgtDLRozVmBYvq7xUxt9DIlQh9lQyYEohIn5rQ+2dJ
 KjI39T7ruj8riK9hLHx5tH5XYWl6PrzkIMlNm2QCraoXWL+iE71q8eJHVpgOGQwiube2
 CveqUwyP24Gn30+QmvkTOdkyoDAyfhbwCMWfBEMp9KG4M8/iiK/L9qVq08cDW4MfCc0r
 ybPchSTP8r4X6uQDQvkAc2RVWr0Rpp2eDLWjA5R/OUDCekehjjO4qwG+BDbn8XypfuSX
 5JBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oCmV06myRJm0N1nJJglZK7acE9yic2mBmX4GIfYl474=;
 b=wKJQB/ne9c8xtztc8GOv2X3BkRto41AAFQ19/WxEgdSP9wIM3lZU12MgEhL331hh4d
 WpQJaOzioSGo3orcNhSegUP97beJJUCMJXSuW1jxTic1WT7wlTBRq1NCcFhQSXJIjsah
 n1Mzt/aqQ9oAMzahwY3Rk+z4tS5FhNU26SgK9vLrchqIAgO6jzC1oOpfOABjjrVmmO8N
 NZPtq0njetsK/xpks9hDyxbEt0L4SCodltCs/X43vXu4BeHlG6oaDBx+FPsz1Oi+U8NI
 rm83ZSTl5OOSPYjkBeF9RrR9JxXFqIhyrtwuRCrrfBZZ6lpu81oDiJi3RWDAEdA/hKaW
 5+iw==
X-Gm-Message-State: AOAM531KaWrCtWT0RsYeBNbiR8fM4cs8azp4BiJMXHtfjqrFLznM8nGK
 CkxiFlVaGjSDFwdDCZdfQZlgSQ==
X-Google-Smtp-Source: ABdhPJzOfySVNOXtm5b//0RExO0pROO1bOKeSNFbw02VTC9JRhP0at7kjE/oITpwU7ULKgLB+WIgkQ==
X-Received: by 2002:a63:ec46:0:b0:381:81c4:ebbd with SMTP id
 r6-20020a63ec46000000b0038181c4ebbdmr15032297pgj.534.1651606425862; 
 Tue, 03 May 2022 12:33:45 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a1709028a9400b0015e8d4eb2b7sm6709636plo.257.2022.05.03.12.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 12:33:45 -0700 (PDT)
Message-ID: <c86d2c60-5dc0-66b4-5501-60b7e6d6278d@linaro.org>
Date: Tue, 3 May 2022 12:33:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 41/45] target/arm: Enable FEAT_CSV2_2 for -cpu max
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-42-richard.henderson@linaro.org>
 <CAFEAcA9fWYT-2RucwzmrNhMxsUqu3zd338aBTGv7-tFraRVrAg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9fWYT-2RucwzmrNhMxsUqu3zd338aBTGv7-tFraRVrAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 5/3/22 10:10, Peter Maydell wrote:
> On Sun, 1 May 2022 at 08:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> There is no branch prediction in TCG, therefore there is no
>> need to actually include the context number into the predictor.
>> Therefore all we need to do is add the state for SCXTNUM_ELx.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v2: Update emulation.rst; clear CSV2_FRAC; use decimal; tidy access_scxtnum.
>> v3: Rely on EL3-no-EL2 squashing during registration.
>> ---
>>   docs/system/arm/emulation.rst |  3 ++
>>   target/arm/cpu.h              | 16 +++++++++
>>   target/arm/cpu64.c            |  3 +-
>>   target/arm/helper.c           | 61 ++++++++++++++++++++++++++++++++++-
>>   4 files changed, 81 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> (The handling of SCXTNUM_EL0 should Just Work for user-mode-only,
> right?)

Hmm, interesting.

The linux master does not support CSV2_1.2+.  This bit is supposed to be RES1 when the 
feature is not enabled, so when booted with TCG at EL1 access *should* be trapped, when 
the guest kernel is not buggy.  This falls into the

     /* ??? Lots of these bits are not implemented.  */


fixme in sctlr_write.  If the guest kernel is buggy... ya gets what ya gets.

We are particularly sloppy with SCTLR_EL1 with user-only; the res1 bits are not set,
which means that we'll expose the register at user-only.

Although context swapping is not an issue for user-only, I think we should not expose the 
value at this time.  It's plausible that the register will *never* be exposed to EL0.  We 
might get, for instance, a prctl to set a new thread/process-level random value instead.

Will provide a minimal user-only fix for v5, and work on sctlr_write another day.


r~

