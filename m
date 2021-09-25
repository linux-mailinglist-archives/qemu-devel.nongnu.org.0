Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA941827E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:07:21 +0200 (CEST)
Received: from localhost ([::1]:37474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU8Kl-00036x-Ai
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU8ID-00022C-OC
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:04:41 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:39716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU8IC-0000DB-0p
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:04:41 -0400
Received: by mail-qk1-x72e.google.com with SMTP id f130so31494909qke.6
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H8uh4VbwWnZxId2dxKCRyF3TLNV43+jvwMHiaXK17ok=;
 b=VUqcNhmP8kk+yVUwvaG205BjrGz54xWZc2ZS46FuQqA+HYvIdAmvMiia8N7cCp4A7z
 EqtLDc03VsQQti25RCx802BzL4TO26XpchiVQ+m0Qpqx5hZJdYyaLqSsj+hjFyaDVVYM
 QcfUUkNp6KCqmbm4dJu5iJskCTBC25Xwdo6lwQ36Ub2PTiEQmogjaI0AIifcIarC6ZUY
 H3k4S0czRPRAyGHbL1ZX3uMLFFjm65bFnhvIAWnDeJQqL7qHSSjWgcsTxGWwemT+vBZR
 W0xBTwNsUNLXH5/AYw5I5yS0RZmXPZ9q2Ikylq6tQ3WD9kDf7p7Kw1DDaBi+MfixJiOQ
 hC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H8uh4VbwWnZxId2dxKCRyF3TLNV43+jvwMHiaXK17ok=;
 b=a1VSb3hThPCS1pxRLH1orV0C0r/eaRwSHplXrxAFFrYQTH1q1tIRy2KbPIuRIlwJoZ
 jhTAWOM+C6/I1nMd00AMn4VkhpzhzgZKPTIgbTOj+GkYp7StOzp4dqwhrp0dRAab/ydj
 XzbSmG4gswm8+RjowOQR2X3BQR0w8W+cZTzjQKgFDkwGnT7dSxb8alifUoaj7xMZZECR
 J03KyYV/9TnEiuHR+xrT2mMaC771QCwXd8uIcGNb83q25k2S7uvnLsYkMlfwa2v2mVIT
 x9Jbtqvbdswj2QKBTqHSB/+bcGEd9Y9ZKdEPuAhzlGbZ0tCRXNEavAzjqv57eCRkEubT
 RHag==
X-Gm-Message-State: AOAM531yJKCq2qCkMCk4TBUL+x1+m2c6W5d1qZzvVkLW3gsk1TjPpht/
 Im7hn26hniNKe/xXV5AEf1hQbg==
X-Google-Smtp-Source: ABdhPJwTKZFdSgX2Hc3+3nEeUhsHsFSw82sfFIeN9eQrH4sOC74uHt9jGd0jIRfROTfiQ/dAfOJVUw==
X-Received: by 2002:a37:9182:: with SMTP id
 t124mr15627149qkd.449.1632578674005; 
 Sat, 25 Sep 2021 07:04:34 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id y22sm8105233qkp.9.2021.09.25.07.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 07:04:32 -0700 (PDT)
Subject: Re: [PATCH v5 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-10-git@xen0n.name>
 <b1b97929-ef62-72ec-609f-bd84c49481d1@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd22f801-6d96-3dc6-3a51-2d5adb21d80c@linaro.org>
Date: Sat, 25 Sep 2021 10:04:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b1b97929-ef62-72ec-609f-bd84c49481d1@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 5:54 AM, Philippe Mathieu-Daudé wrote:
>> +    /* High bits must be set; load with lu12i.w + optional ori.  */
>> +    tcg_target_long hi12 = sextreg(val, 12, 20);
> 
> Please declare variables in function prologue.

Ah, true.  Officially, that's qemu coding style.  I tend to overlook it because I don't 
like the rule.


>> +    tcg_out_opc_lu12i_w(s, rd, hi12);
>> +    if (lo != 0) {
>> +        tcg_out_opc_ori(s, rd, rd, lo & 0xfff);
> 
> Isn't lo already 12-bit? Why the mask?

lo was extracted signed, for addi; ori wants the value unsigned.
The value range asserts in tcg_out_opc_* will notice the difference.

>> +    /* Slow path.  Initialize the low 32 bits, then concat high bits.  */
>> +    tcg_out_movi_i32(s, rd, val);
>> +
>> +    bool rd_high_bits_are_ones = (int32_t)val < 0;
> 
> Declare in prologue, however this is hard to read. KISS:

If anything was to change here, I think I'd simply re-use "lo":

     lo = (int32_t)val;

and then check lo < 0 rather than rd_high_bits_are_ones as a boolean.

>> +        rd_high_bits_are_ones = hi32 < 0;
> 
> Again KISS:
> 
>             if (hi32 < 0) {
>                 rd_high_bits_are_ones = true;
>             }

This is certainly not KISS, and also wrong.  We would want an unconditional write to 
rd_high_bits_are_ones.  Although if there were any change,

     lo = hi32.

so that, again, we test lo < 0 for hi52.


r~

