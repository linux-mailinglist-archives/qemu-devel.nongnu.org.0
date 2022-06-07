Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1435401D4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 16:55:59 +0200 (CEST)
Received: from localhost ([::1]:57552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyacg-0006He-Ja
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 10:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaZZ-0004MK-Ix
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:52:45 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaZT-0008Ip-SM
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:52:45 -0400
Received: by mail-pg1-x530.google.com with SMTP id y187so16097893pgd.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9lew3Vab93rATq9CB9iMw4gJdt0bjCsmFQH31nXWRRI=;
 b=mNC9Es6hEOll3dLCiA28pYnkXWK3EuYMXsB83X6QJ7UWTAuPSacBp0lXVuva7oaveg
 wsrFrOzrjoyJBHT23JRodPrIoWrjNEevnN+rsaUdSwBP6pSFO2s9D/N1s+Ee2UComdXj
 K0WvrnX4Zlt6x20h10j+X6Xi796Fi1xv7RgKf8Dy+rZg02gCQKkoLgAZ6LXTH1Bt5xPL
 nT6D+P42tcaxoZy6ogOdvxsjwvnfobjNyRAX2Gcq7BVyDootgb5Y9RvYlq+TOmLBTYbv
 Hm+xv4ISUgr7s+tKcLi3J1Nk+96n+jIjBX1ZlUoOd1uakPuVzVFQ2gjEQUGJGEqozvsN
 yUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9lew3Vab93rATq9CB9iMw4gJdt0bjCsmFQH31nXWRRI=;
 b=ObDAeo+Q5YLZhUrRMjolQmX8oH7u5x45B04YM2me0Xld4foh3whtpgbaUmubW42WTd
 /m9t5f1YF/Gbtqgtg6iFGnJ65adXnCwoXcMOtdYWuhFQi77XHFnCWa4az0KFocPA0BDc
 EvnCNs4YrrdM3RC1slFQDtm/dtorHeCkGlcptUWinnz/uop6Tm6uYhNZFVLWrnZVFRPd
 X1e8ZubxonHi7M0Pn/bG6TrNLINBYGTNRzQsGHokocq3qZF2ZXbgOJZRXIkzy6tdpwf4
 fb+JdEDmzouxopzRtbZSMEvtYlIfnOW99O1fW0K02qT6e2gPs7Km36OweZ8SCSv+NYVx
 6LNg==
X-Gm-Message-State: AOAM533XqfSneCDW/fFISReRMrlkHc2QKZ4AjMdTgmBUPFnrrwrtvf45
 mEdCOJjT1ddvDR5+6+PzSvIK7g==
X-Google-Smtp-Source: ABdhPJwyQ47M413CL25sZYys+6lLhlH6dJTKC35/v2EWhDprjmoGcVQnHUbSQujGreaO2aTHJ/te/w==
X-Received: by 2002:a63:594c:0:b0:3fd:9b8b:863d with SMTP id
 j12-20020a63594c000000b003fd9b8b863dmr12058114pgm.250.1654613558357; 
 Tue, 07 Jun 2022 07:52:38 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a170902710600b00163a6e1416dsm12701059pll.32.2022.06.07.07.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 07:52:37 -0700 (PDT)
Message-ID: <c2d17836-bc74-6c55-251b-0aabe223ac27@linaro.org>
Date: Tue, 7 Jun 2022 07:52:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 41/71] target/arm: Add infrastructure for disas_sme
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-42-richard.henderson@linaro.org>
 <CAFEAcA8fKsmQLqeNOJYiJ+dDTLWLnfTXiVO+wMt4OR2+ixzodw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8fKsmQLqeNOJYiJ+dDTLWLnfTXiVO+wMt4OR2+ixzodw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 6/7/22 03:03, Peter Maydell wrote:
> On Thu, 2 Jun 2022 at 23:41, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This includes the build rules for the decoder, and the
>> new file for translation, but excludes any instructions.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> @@ -14814,7 +14814,12 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>>       }
>>
>>       switch (extract32(insn, 25, 4)) {
>> -    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
>> +    case 0x0:
>> +        if (!disas_sme(s, insn)) {
>> +            unallocated_encoding(s);
>> +        }
>> +        break;
>> +    case 0x1: case 0x3: /* UNALLOCATED */
>>           unallocated_encoding(s);
>>           break;
>>       case 0x2:
> 
> This is grabbing slightly more of the encoding space than it should
> according to the Arm ARM Table C4-1 "Main encoding table": SME
> encodings require bit 31 == 1 (unlike SVE where bit 31 is not decoded
> at this level).

Yeah, well, full and proper decode is done in the generated decoder.
I don't feel the need to distinguish that bit here.

r~

> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM


