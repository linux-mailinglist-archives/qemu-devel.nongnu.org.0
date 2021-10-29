Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E984405AC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:08:31 +0200 (CEST)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgaz8-0006z3-8r
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgaxr-0005kM-7T; Fri, 29 Oct 2021 19:07:12 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgaxp-0007TN-Q5; Fri, 29 Oct 2021 19:07:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id u18so19121014wrg.5;
 Fri, 29 Oct 2021 16:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LlHm5gZnzphErtajdWAC16xHEWWWUbQsbuBq07pjqKM=;
 b=c6u54kuIVAT3pKA/31jlMvSXitKoyvRlbkPWJPQk5I5S0e7SIWOyJrG4VuVsRebkD+
 Guhd/7L5/XG4JCc/XYg8zzx0OnyRzXODNmKyytohufJOQM79QDvqccxUHZT33WXnPhib
 //da0tQjFXPw3sJK8ZYzW9gyxupALNx2gITUECBYUB4/75q39jiuR886z7ImOqmuIIfX
 SRwlHvIyc0UFT7EcQZX4GzyXHq1+D+3U+DV95HnRIghYdoQJ3IN8bv/q2SMTAXXadras
 QYxjT3wVgNvlHqADpNa5CNRUiiokePoMAevFaTIMF8r2jq8oTZEtI1G7bVWoWkK/vuXw
 a+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LlHm5gZnzphErtajdWAC16xHEWWWUbQsbuBq07pjqKM=;
 b=wY+DOL73AfZH3h4ttOzKkKRpbUUfgAQBO3UvyxShadwYTE49iqxMsONDeCAjyekZua
 eEUuUTTvfyqONTSFqLHQq91RMXCwy8mg0SWZUBup7k5vovF3nsmNn/+L9irb+6imyXS2
 UGKo9EfEMylLdelffxgCeJ0ynPRfDUTCUlNcvt+8x+8oM2Plh4FOZybpENy2ZaPjMGTu
 X4HsYnU7TRoiZ72wOZYCSveXQaK3xPwYnv1m+YrI1YMfuvipHu82smwNgoCu06dkUS0t
 BJ3alGeD/AcdqaifUmAdDAtzQItgZE+SgTThRcSPwEL4Q4sM8mxtguqBFfnmbM61Zhow
 9mdA==
X-Gm-Message-State: AOAM531T3oqbzAvtgpezJWh4JGaUEsd82GU5yUYWXM4JFZ9I6J/g/ojK
 IFWVOGGo+ydIPpkxfHt6cw0=
X-Google-Smtp-Source: ABdhPJz0Pkc0MzsTXzkCwC9SF89iuGeceHoc+b5smIHdmO02ElW/mCMnlfN+9Y5Qsp7n8wkAAsnhjw==
X-Received: by 2002:a5d:6d49:: with SMTP id k9mr16780220wri.352.1635548826685; 
 Fri, 29 Oct 2021 16:07:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b6sm8148795wrd.85.2021.10.29.16.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:07:06 -0700 (PDT)
Message-ID: <5211cb75-6d5c-91ed-1e67-391d1940b05d@amsat.org>
Date: Sat, 30 Oct 2021 01:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/4] target/arm: Introduce store_cpu_field_constant()
 helper
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211027045607.1261526-1-f4bug@amsat.org>
 <20211027045607.1261526-3-f4bug@amsat.org>
 <267b4bdc-8311-cc18-afeb-5e98aea5a3ea@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <267b4bdc-8311-cc18-afeb-5e98aea5a3ea@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 03:17, Richard Henderson wrote:
> On 10/26/21 9:56 PM, Philippe Mathieu-Daudé wrote:
>> -static inline void store_cpu_offset(TCGv_i32 var, int offset)
>> +static inline void store_cpu_offset(TCGv_i32 var, int offset, bool
>> is_temp)
>>   {
>>       tcg_gen_st_i32(var, cpu_env, offset);
>> -    tcg_temp_free_i32(var);
>> +    if (is_temp) {
>> +        tcg_temp_free_i32(var);
>> +    }
>>   }
> 
> You don't need to change the function interface; tcg_constant_* is
> ignored by free.

Now I see that in c0522136adf ("tcg: Introduce TYPE_CONST temporaries").

>> +#define store_cpu_field_constant(val, name) \
>> +    store_cpu_offset(tcg_constant_i32(val), offsetof(CPUARMState,
>> name), false)
> 
> But this could become simply
> 
>     tcg_gen_st_i32(tcg_constant_i32(val), cpu_env,
>                    offsetof(CPUARMState, name))
> 
> without the wrapper inline.

Yep :)

