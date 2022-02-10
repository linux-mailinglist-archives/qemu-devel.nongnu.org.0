Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236924B0182
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 01:18:56 +0100 (CET)
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHxAk-0004jY-LU
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 19:18:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHx9f-0003sG-TO
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 19:17:47 -0500
Received: from [2607:f8b0:4864:20::629] (port=39557
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHx9e-0003Fh-6y
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 19:17:47 -0500
Received: by mail-pl1-x629.google.com with SMTP id w1so377866plb.6
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 16:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8KWDcMgKGrdPSxTS6x+lvstAvPINZ/yvDe29gT8rFVA=;
 b=FkEGsz9NqEeCO4rLDiMmQC33LPggt8QrPPwFNj1xmjyLO/hX/AQHA5MNg0OiDayCuy
 qR6YQ/lk+uZsamw9q5tOzgiobaOXLZqbGg5vS1bhpiToOryw83KNReA7ApINaej6VCKQ
 ksQLpXZmEwKPIodtFy65dSKdDTtV5QCPDy+f/ugcUSlwqeOYGWYGD6yDcO2LF0vMU8Fk
 JqpwEeTNmUqvsCH8nOxQTJdKdDl2gHjXNyg3CERAlpK9vZ3NgaaXwk+VH+ZTtHKWotdl
 owI3FlfDc4GgNH1Xkf71Zw3gJ7NGunkYdpdJs1w2pphl4Bm8/gqFjXHwNmzMOwkNToZb
 lPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8KWDcMgKGrdPSxTS6x+lvstAvPINZ/yvDe29gT8rFVA=;
 b=CDsAb4x+tt4CbKKEyy2Qm4ubllqAJJJmwl45pmCK+nOWhyYJrJgXCZZ8v7hkD2kkqp
 bEwK147dEHDxNLnV968lDPlUn3JGTVqnnCDNqvhYO67U3wpfhKdvd83ntqFP+J+v6PdW
 +Qg7QmMSYDY1ddgVwSptPx874IK+Zk9A5xndbUuPCy3gs+xepq9sycvyqOSUyeiyUuNl
 S9D2KKKDJtBweMq9I5WsnrJp8IXGwQyQgs9WzZVayx7CJW6jLMvaWWKPLgK6th7n5HLt
 G4mxQNZyluI5qrwYXeiO5JzLa0AFSJIg3JPKCs4EdzFLXvZPI3tDIozpQ+/hglvZQWdT
 lLow==
X-Gm-Message-State: AOAM531V/GiGwoUdW6mFZnPm+qTDQIuTA1cx8qbscU/JikGRwHzEFaQF
 /a+glEoiHHbHe7J/5lBnbPskCw==
X-Google-Smtp-Source: ABdhPJxfUd7pO/GtzflA+M64sudBN3HAJVjR8fX0PJEgSzOtl7j9kuWTJJMAD9+Nk9i15DQtXXCZhg==
X-Received: by 2002:a17:90a:2fc5:: with SMTP id
 n5mr5432624pjm.67.1644452264677; 
 Wed, 09 Feb 2022 16:17:44 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id p6sm8198542pfo.73.2022.02.09.16.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 16:17:44 -0800 (PST)
Message-ID: <e2ea001c-7c42-f49d-29ec-94372f3e9be7@linaro.org>
Date: Thu, 10 Feb 2022 11:17:36 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/6] target/arm: Implement FEAT_LVA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-5-richard.henderson@linaro.org>
 <CAFEAcA8u3cnEzoXGk5upgTg1L+gzuERo-mbKrK5sjY22gp40cg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8u3cnEzoXGk5upgTg1L+gzuERo-mbKrK5sjY22gp40cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 07:23, Peter Maydell wrote:
> On Wed, 8 Dec 2021 at 23:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This feature is relatively small, as it applies only to
>> 64k pages and thus requires no additional changes to the
>> table descriptor walking algorithm, only a change to the
>> minimum TSZ (which is the inverse of the maximum virtual
>> address space size).
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> FEAT_LVA also expands the size of the VA field in
> DBGBVR<n>_EL1. We currently hardcode the size of that
> in hw_breakpoint_update() where we do:
>          addr = sextract64(bvr, 0, 49) & ~3ULL;
> 
> This is also true of DBGWVR<n>_EL1, except that there
> we seem to have chosen to take advantage of the spec
> defining the high bits of the register as RESS (ie
> sign-extended) and we always use all of the address bits
> regardless. Maybe we could do something similar with DBGBVR.

We treat DBGBVR and DBGWVR similarly, with the exception that DVGBVR is context dependent, 
so we must wait until we interpret it together with DBGBCR.

However, I think the combination of IMPLEMENTATION DEFINED for storing the value as 
written and CONSTRAINED UNPREDICTABLE for comparing the RESS bits means that we're allowed 
to rely on Software to perform the appropriate extension and store and compare the entire 
register.

I'll fix this in a separate patch.


r~

