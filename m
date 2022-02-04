Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C54AA15B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:47:17 +0100 (CET)
Received: from localhost ([::1]:52102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5UC-0000Sy-JL
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:47:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nG5Q3-0006GH-9N
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:42:59 -0500
Received: from [2607:f8b0:4864:20::529] (port=33317
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nG5Q0-0007FW-8i
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:42:58 -0500
Received: by mail-pg1-x529.google.com with SMTP id 77so3131471pgc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1Oeft1IZcBTt+f3vi2beCpRiXAR4pKH5ExawC2rzVcM=;
 b=SntQh1Y3bQSQyKFIrqmBsJ35lLNJjzUeHGps6ewwSVq6DEOJKf7r590aseTQ03ezVS
 GSHvZV0hVu/UiUZLHsFhMMvBT7biZtRVBWDdfU5nYDZ0Mh4TfZs7J8+Z5NQbrPu6/Bab
 +jKnSCrrmNEQ5oRRalfqu8lFRdIS0VQsOa1uLPxo2aL7p92NLbBLpDAAynUHH6r287nM
 VOyaaB0RgT+3IpktHP2sZ/WDaDVEXP4BxFIGhxrNzGqeGg0iHwco6RfXZSmHd7DCsgpi
 CHIV8jFgz3jQhug27+8J8kHpr52mvpNrrELwEtBHenVWzujQojJ+G9JLh1Bi0cLooHzb
 VfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Oeft1IZcBTt+f3vi2beCpRiXAR4pKH5ExawC2rzVcM=;
 b=Ph7bVX4cPl8cgVC/lubc1FuCHHjkUWn1heEp21QlEyVSaCV/Vmy6s3tmswY/90U3Ay
 VAyHtWqc2BHsP+mc4XCNDd3vUIHltfW4/mOr9yVoO6ZLoQX0fVBXSYNdNR/KQvWVdY0U
 mlN/ZjtyRmGd5ncI7yO5/aNUN6gP7HH9weWHt7vYCOjmXK9XsLnvlfRqwgTtbNqlLyie
 DahgmCH6uKgmwNRo9/ze3iwdT7p69XO7wW/649nwPKsGPmvwUtdwRD74mTqOjbzUVPCg
 3BiB3rZriThmXI8/SW42ji0C+wchWwYWc5/rXr7QNyqkwvmOr+6io2hMifLWgt9Z8MkP
 cp2g==
X-Gm-Message-State: AOAM531+ksaiwE1cuG+RMI3edbb7/2+5/zwHb/WLdfNHqxbh5mr/FB+U
 ek0KE7mhcxdpjeqW/4kSqMLs6jn8NgYJ2LG0
X-Google-Smtp-Source: ABdhPJwAdP+oyOQ+OX1SgqstVY40q/QB1RjAaPT5msU4mIy7O2k999KnnaQaRsmHS0/VOgAhU9wWrA==
X-Received: by 2002:a05:6a00:1952:: with SMTP id
 s18mr4912191pfk.54.1644007364428; 
 Fri, 04 Feb 2022 12:42:44 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:d2cd:dac2:7e7f:5850?
 ([2001:8003:3a49:fd00:d2cd:dac2:7e7f:5850])
 by smtp.gmail.com with ESMTPSA id c11sm2331967pgl.92.2022.02.04.12.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 12:42:44 -0800 (PST)
Message-ID: <059b0892-9096-e5d2-8084-b1e6dd35249a@linaro.org>
Date: Sat, 5 Feb 2022 07:42:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/5] tcg/sparc: Add scratch argument to tcg_out_movi_int
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220204070011.573941-1-richard.henderson@linaro.org>
 <20220204070011.573941-2-richard.henderson@linaro.org>
 <CAFEAcA88SP8LSXgegfeC=cnzLiezzoAFujaatq2E6fT1zfzGXA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA88SP8LSXgegfeC=cnzLiezzoAFujaatq2E6fT1zfzGXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 2/5/22 04:35, Peter Maydell wrote:
> On Fri, 4 Feb 2022 at 07:53, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This will allow us to control exactly what scratch register is
>> used for loading the constant.  Also, fix a theoretical problem
>> in recursing through tcg_out_movi, which may provide a different
>> value for in_prologue.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/sparc/tcg-target.c.inc | 20 ++++++++++++--------
>>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
>>   static void tcg_out_movi(TCGContext *s, TCGType type,
>>                            TCGReg ret, tcg_target_long arg)
>>   {
>> -    tcg_out_movi_int(s, type, ret, arg, false);
>> +    tcg_debug_assert(ret != TCG_REG_T2);
>> +    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
> 
> Here we assert that 'ret' isn't TCG_REG_T2, but in
> tcg_out_addsub2_i64() we do:
> 
>             tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_T2, bh);
> and
>             tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_T2, bh + (is_sub ? -1 : 1));
> 
> Otherwise looks OK.

Oops.  Good catch.  I shouldn't have moved the assert.


r~

