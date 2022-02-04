Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B054AA155
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:46:51 +0100 (CET)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5Tm-0007kD-Hb
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:46:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nG5Ow-0005sZ-9F
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:41:50 -0500
Received: from [2607:f8b0:4864:20::629] (port=34734
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nG5Ou-0007BZ-0D
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:41:49 -0500
Received: by mail-pl1-x629.google.com with SMTP id h14so6166082plf.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=49HmvpeJTzw98Rdwj0/96P3voIH/1Epm1oFcbXVVggs=;
 b=uQRxLKmzY+vNQGs59JH3b/xHsPsz1kEtGQzyo6jK2LFxgKNM08t+shKSrGEhGjWIch
 FDzh5mSKdxe5PeW28ywnndpdVCXq0Erj0rJRMQW6BWcWT9a3uIPef2dEcVuQv8o6n9RF
 SSJJrZDgrHnudeen82HOsBhyUue4zfXR+zRO3XT6EFSSwcWJjIdxSj+IoqjSORyfB9Th
 ViCU6KisADYfJOq3qDJHdZzDPwvRlXDBI1S4IGD3hvoLgLEYdJMcuYSGeQ/qMSgc8Fjd
 ZRoU3YAHX9MCHfIYOmM6s9bLcyztwLtfaKGzHYNZZQWVJjr2gRLPPMQ+Km2QY05n72Vz
 uikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=49HmvpeJTzw98Rdwj0/96P3voIH/1Epm1oFcbXVVggs=;
 b=CHMmJ9qgJbBmhnqMbMBQMXtFGHlfD/O9Bp1iXkiPYI+mQVjyujtNe3IoxQYnkPFW8n
 Qne/MSI8xdZo5s1A1qoXkpA4pNw6FoVVf77f/eLQ2Lg52PiMkkFgjOTVdHaX/Zy/5Z3g
 qz5Ez10araNk5lUHMSCGV9koEzpLrARL+2jB/Y9bqfbtnajVU2kmLi7PfdTX7AUd9A9m
 xK9PyuSqmslmm/YyHpjsXDjCMXBotOND8g2z2gs/gN9F5J3RlH7dCiSjWb7HwjoQEP1e
 tbAz9XQrBgZEkg8xosrr7uEKYQhFo9QBnTQGs+7g1xYYHXF5uKKOZuooYJVOGFVCrRJu
 dDTA==
X-Gm-Message-State: AOAM531d0Kr6/3AkKZSCOm49MIGGUyxPI7meN81DKEAZjx6aGc9gYqIq
 3XVGhLivfTOgXq2A5w39zvm15g==
X-Google-Smtp-Source: ABdhPJz3uoapERXidaYJwLDQrospDq/6jhVcli0xhSntsM1Vs6f+W2kN5XVNmWO1Tc17RYDEHtwJ+Q==
X-Received: by 2002:a17:902:db01:: with SMTP id
 m1mr5170677plx.25.1644007306478; 
 Fri, 04 Feb 2022 12:41:46 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:d2cd:dac2:7e7f:5850?
 ([2001:8003:3a49:fd00:d2cd:dac2:7e7f:5850])
 by smtp.gmail.com with ESMTPSA id q9sm13969835pjm.20.2022.02.04.12.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 12:41:46 -0800 (PST)
Message-ID: <0c47260f-7ecc-7b67-4d29-4e9b8c3cdabc@linaro.org>
Date: Sat, 5 Feb 2022 07:41:40 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 3/5] tcg/sparc: Use the constant pool for 64-bit
 constants
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220204070011.573941-1-richard.henderson@linaro.org>
 <20220204070011.573941-4-richard.henderson@linaro.org>
 <CAFEAcA8YyrASZw7Wj1c5fLg-60KUKPsC7eVA8+YhNTsVM4t2kg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8YyrASZw7Wj1c5fLg-60KUKPsC7eVA8+YhNTsVM4t2kg@mail.gmail.com>
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 05:18, Peter Maydell wrote:
> On Fri, 4 Feb 2022 at 07:53, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/sparc/tcg-target.c.inc | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
>> index 6349f750cc..47bdf314a0 100644
>> --- a/tcg/sparc/tcg-target.c.inc
>> +++ b/tcg/sparc/tcg-target.c.inc
>> @@ -332,6 +332,13 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
>>           insn &= ~INSN_OFF19(-1);
>>           insn |= INSN_OFF19(pcrel);
>>           break;
>> +    case R_SPARC_13:
>> +        if (!check_fit_ptr(value, 13)) {
>> +            return false;
>> +        }
> 
> This code seems to contemplate that the offset might not fit
> into the 13-bit immediate field (unlike the other two reloc
> cases in this function, which just assert() that it fits)...

Ooo, thanks for noticing.  The other entries have not been updated for changes to tcg 
relocations.  They should be returning false instead of asserting.

Returning false here tells generic code the relocation didn't fit, and to restart the TB 
with half of the number of guest instructions.

>> +    /* Use the constant pool, if possible. */
>> +    if (!in_prologue && USE_REG_TB) {
>> +        new_pool_label(s, arg, R_SPARC_13, s->code_ptr,
>> +                       tcg_tbrel_diff(s, NULL));
>> +        tcg_out32(s, LDX | INSN_RD(ret) | INSN_RS1(TCG_REG_TB));
>> +        return;
>> +    }
> 
> ...but this code doesn't seem to have any mechanism for
> falling back to something else if it won't fit.

It will fit, because we'll keep trying with smaller TBs until it does.  If for some reason 
a target generates more than 8k for a single guest insn... it will go boom.


r~

