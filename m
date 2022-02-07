Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFED4ACBA5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 22:51:49 +0100 (CET)
Received: from localhost ([::1]:36798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHBvI-0008OK-JB
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 16:51:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHBsM-0007XN-Rm
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:48:46 -0500
Received: from [2607:f8b0:4864:20::435] (port=40670
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHBsJ-0006IQ-Rm
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:48:45 -0500
Received: by mail-pf1-x435.google.com with SMTP id e6so15319911pfc.7
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 13:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W5UH/1OtTBgouTcUfFPQpJPoDIU2YTD/dAHnoVXZTsk=;
 b=mMT1ep+wyNGompVN1/h74jpS24c3S/Wd4mEeRV72lUvwv2D0zXPotSDCyPkKgQH0BL
 ju1Aw56Pd78fSVf6XIfzEbMmKHCXjT3Smuto4+a26DKuiHUF1YFSDe8QcWul1rDBHYwY
 2jKTPiqu32EMWRyu0eTD1MKqAxCvvVHrgUtiTnJAgFsyioA/1mez1P8Y5gFe4WFjLjWe
 B0ksdbx8f/Wh1lYn9clDIHwXBZNwNX8Jxb2FMbDYsau994ONhBmuW3Fa6li1hphxrrJE
 1jX7KcB0+2QSV732DX7ZodttcLW0llYJ4r1TGfA3sLeorgIU4VGENTQXP7WMdeTxl819
 71cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W5UH/1OtTBgouTcUfFPQpJPoDIU2YTD/dAHnoVXZTsk=;
 b=g9fSVJ+/oCBfe9UPh9ARFfNi5piNTKMk7YceojnGnNn9WoQ6QbV2CEBqnO0wyR9chU
 8FsYXcC48YwPeKJB3oj+154TMwczvKHNWzHvYm9KZBJeLh+lelk3fAFWi+XkmnFlHL9j
 /MgLdqobLRUbqJ7bq6SDEn9GWKCvgYuGqb+O3X9RwGXUZYq8mDBQ0mAPOjBbXZTJdRTx
 lrF+fM8aOan5fb4xsO9tPpoeJ3Muel1TD1VTnVV+JYV9ooIxKH8pE4cELip2P4bLuyBW
 ydWXb6yEgdLmhrPRW9YFtq/XIyUteOPLPJT6TPb2I0Z5qdG/3OkWaEKiYEVFskBFQ9m5
 lE+g==
X-Gm-Message-State: AOAM531YH19DlF87Ep8wLyo8nfF2KWXvZQPSyM3OCzhrNCL1JyZ7eI4c
 fV0QXINhbwvwZCphRS77zbl+Tg==
X-Google-Smtp-Source: ABdhPJwGQH9Dh2huo2Y/2WZozoDiqhhooca3YaLkMSqYwZsj1VPE2DNAz0FTS+E6TQWo7AD2EvI43A==
X-Received: by 2002:a05:6a00:181f:: with SMTP id
 y31mr1452388pfa.35.1644270521239; 
 Mon, 07 Feb 2022 13:48:41 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id 69sm9256722pgc.61.2022.02.07.13.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 13:48:40 -0800 (PST)
Message-ID: <48050141-383a-30ec-d8af-17a1621986ca@linaro.org>
Date: Tue, 8 Feb 2022 08:48:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 1/6] tcg/sparc: Add scratch argument to tcg_out_movi_int
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220206103138.36105-1-richard.henderson@linaro.org>
 <20220206103138.36105-2-richard.henderson@linaro.org>
 <CAFEAcA-dW89Q829RBPEp+wuPXvpDp=UXa1xzf=qJirxExddtCQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-dW89Q829RBPEp+wuPXvpDp=UXa1xzf=qJirxExddtCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 2/8/22 04:59, Peter Maydell wrote:
> On Sun, 6 Feb 2022 at 10:31, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This will allow us to control exactly what scratch register is
>> used for loading the constant.  Also, fix a theoretical problem
>> in recursing through tcg_out_movi, which may provide a different
>> value for in_prologue.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/sparc/tcg-target.c.inc | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
>> index 0c062c60eb..8c3671f56a 100644
>> --- a/tcg/sparc/tcg-target.c.inc
>> +++ b/tcg/sparc/tcg-target.c.inc
>> @@ -414,7 +414,8 @@ static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
>>   }
>>
>>   static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>> -                             tcg_target_long arg, bool in_prologue)
>> +                             tcg_target_long arg, bool in_prologue,
>> +                             TCGReg scratch)
>>   {
>>       tcg_target_long hi, lo = (int32_t)arg;
>>       tcg_target_long test, lsb;
>> @@ -471,22 +472,25 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>>       /* A 64-bit constant decomposed into 2 32-bit pieces.  */
>>       if (check_fit_i32(lo, 13)) {
>>           hi = (arg - lo) >> 32;
>> -        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
>> +        tcg_out_movi_int(s, TCG_TYPE_I32, ret, hi, in_prologue, scratch);
>>           tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
>>           tcg_out_arithi(s, ret, ret, lo, ARITH_ADD);
>>       } else {
>> +        tcg_debug_assert(scratch != TCG_REG_G0);
>>           hi = arg >> 32;
>> -        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
>> -        tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_T2, lo);
>> +        tcg_out_movi_int(s, TCG_TYPE_I32, ret, hi, in_prologue, scratch);
>> +        tcg_out_movi_int(s, TCG_TYPE_I32, scratch, lo, in_prologue, TCG_REG_G0);
>>           tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
>> -        tcg_out_arith(s, ret, ret, TCG_REG_T2, ARITH_OR);
>> +        tcg_out_arith(s, ret, ret, scratch, ARITH_OR);
>>       }
>>   }
>>
>>   static void tcg_out_movi(TCGContext *s, TCGType type,
>>                            TCGReg ret, tcg_target_long arg)
>>   {
>> -    tcg_out_movi_int(s, type, ret, arg, false);
>> +    /* When outputting to T2, we have no scratch available. */
>> +    TCGReg scratch = ret != TCG_REG_T2 ? TCG_REG_T2 : TCG_REG_G0;
> 
> Why won't using G0 trip the assertion above that scratch != TCG_REG_G0 ?

It would only do so for full 64-bit constants, where the scratch is needed.  For the case 
in which we use T2 explicitly, the value is constrained to J (a 13-bit constant).

I suppose I could have also changed addsub2 to use tcg_out_movi_imm13 directly...


r~

