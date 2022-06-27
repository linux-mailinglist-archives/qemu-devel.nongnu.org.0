Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49555BC6F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 01:11:14 +0200 (CEST)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5xsv-0005jp-B0
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 19:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5xrk-0004n0-Lv
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 19:10:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5xrh-0003K3-Vm
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 19:09:59 -0400
Received: by mail-pg1-x536.google.com with SMTP id e63so10463171pgc.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BPp7pLcNzKMYnNiKBTAeuLk2yzuSA+Qba7rERYZtoeE=;
 b=pAclFqdVHgIl2jvrNegczqlZBwuhHxBb9RVXAiGJikmkmLvqCYdqesf0Xu6f67pFuv
 JmL9khGt8Tfu2gVV90W6SokGeYXOY4+Ed9QLZ5ICCkjadgACpNVDvjyNwA9nZulrOOdl
 6HLTwuZRuq/AuMEZzROQCrM+jtv8m/HPwR5XW8t9tSl8kN5EqJt4ba+N2M2bhs3uS0//
 oYWOBbyAIedjOwL3mAdCsFwmLxObTBM8xd51fV3qI6zgX6P0mBP5syicd1swwXkzmw4H
 9U2u/NhKu7r+oQDR+kiy2bkV6fwsICbt+qiSpqwBCKxNqXBtHSjk35T84j99+4BxpG4z
 A0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BPp7pLcNzKMYnNiKBTAeuLk2yzuSA+Qba7rERYZtoeE=;
 b=zKHzyufEjJaKZkgOfsvOUGmFx2NnZppDp1REptdUQbnF3YATrnzbhKzKW1yuK2zN1M
 KDoA5laIw+OMVTxf5PZf+p7ETuWRFNzJsdwB/FygZsCxq6KI76cfn3o20Ylvitktb9QV
 Kw9garPl7M5x+rBnFSu/xCDjAYgZDuVj87zzvfmuzUsf9TZTFyItbgrBe7VZgw6pumUE
 1TLGKhi87c1d+QnN3wQ08jGMkrpq9vA/KIleizmt7IREUKgjtgaezwjUqtfXb1LJM7ZZ
 f5o+2g1VVlncGOhwVPwsP/51srft8Nsu4syKi8yJXc0byqhNp+jGZNJlF5kd1+u1PNnn
 vtPw==
X-Gm-Message-State: AJIora90rPSin4Vy/amiSLMyKehYi8doSbWQt0DXZEJF4XRV6ZnYhlmd
 0IApyAjcvlNdKSzYDZFVISpNfg==
X-Google-Smtp-Source: AGRyM1tIrjwz3XjSJTZBZbneSwcFVF66QzQ8quIEEhY6Em9svhp+KywYeQ+pqfODBHhPhslBQfXXVA==
X-Received: by 2002:a63:2b8c:0:b0:3fe:2062:c14b with SMTP id
 r134-20020a632b8c000000b003fe2062c14bmr14664834pgr.345.1656371396403; 
 Mon, 27 Jun 2022 16:09:56 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 cp9-20020a056a00348900b005184d1e838dsm8060602pfb.12.2022.06.27.16.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 16:09:55 -0700 (PDT)
Message-ID: <b99c86d9-2a64-54df-cfdf-96c9ef6e9db9@linaro.org>
Date: Tue, 28 Jun 2022 04:39:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 48/53] semihosting: Use console_in_gf for SYS_READC
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-49-richard.henderson@linaro.org>
 <87bkuelbil.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87bkuelbil.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 6/27/22 14:37, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   semihosting/arm-compat-semi.c | 27 ++++++++++++++++++---------
>>   1 file changed, 18 insertions(+), 9 deletions(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>> index 20e99cdcc0..4c8932ad54 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -302,6 +302,22 @@ common_semi_flen_fstat_cb(CPUState *cs, uint64_t ret, int err)
>>       common_semi_cb(cs, ret, err);
>>   }
>>   
>> +static void
>> +common_semi_readc_cb(CPUState *cs, uint64_t ret, int err)
>> +{
>> +    if (!err) {
>> +        CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> 
> Why do you even both extracting env here if it's not being used?
> 
>> +        uint8_t ch;
>> +
>> +        if (get_user_u8(ch, common_semi_stack_bottom(cs) - 1)) {

It is used in here, for system-mode, but not user-mode.
It's ugly, I know, but that's the interface we inherited.
The simplest non-ifdef solution is to mark the variable unused.


r~

