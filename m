Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976BD57942B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:30:00 +0200 (CEST)
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhg7-0005Iu-Jh
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhdf-0003Og-Ug
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:27:31 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:44802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhdP-0006gF-Uy
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:27:13 -0400
Received: by mail-io1-xd2c.google.com with SMTP id v185so11118607ioe.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 00:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=vsHmx4kPN+aBNnMYvhie98TTq7HoYEOIM0fFoH5Cyog=;
 b=Ydg6AbsxtxsLsPSvUMtjGSS0ZOhp5GsTene/Xs+9gGvnQ3NMZr94Kppy3g2vGpOPs4
 H8sDB4h1V4IcyToXxtOrhdHnk0zh/IIZwSrtdWSlOD9BJZAfPhKckP4g+AVYwWfwcTVl
 f/lcJ3Ina79glBeWoWO3MhLFHSDwpK0TMgMztWJTTotcbnSoaTFU7SYnTrvup+BTiiSS
 Z/tbHmI9PnD8zv3pZEOJeBYmA5rmROF7q8pWCW0Ds0yZGi19Glw4ZGxAkwrpv5JTmi9t
 i8Nfoj9MuWXkGH5TVqd2xcVlo8ymi6Qa1Gj86cYx1xDT+BxBX9YQ97jXi21VHJnoBWvU
 16BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=vsHmx4kPN+aBNnMYvhie98TTq7HoYEOIM0fFoH5Cyog=;
 b=S/T44C5k8WLm4zP+XNH7pNTgg3Sq3Fj6G3G6wJ7qo9zJ/tuxUSzZBoFFLJRUYwbEpo
 XPG8+mxFglyhX+xZ5iUO+tTCYNCCFR8XviygNP/wP73XwERrRIIvNJCMAke6ZBwIJmlK
 HhZSlQroYytKWTKcXukCUZXJ2N4RLLWTxIVgd+MGjIpzNvZiC1Pp6CIgdVpkciRw91Wv
 A+JT6eCAODOBN01BNtcegRO40s400UkTaxohakYzGFFG7hIJyeNMp0eopLZxSszcZE4X
 vchByEHcZp1wQd5Vlvzj99vmfeAi1gFC45H21Tvu303y4taXWNZVMpjh+usLOWzoUcRs
 dNLg==
X-Gm-Message-State: AJIora8TgkywHcDAhklnfPQP/KuXLFkAtONPGUIzXFnxIRE0DIA6h2vO
 0mN8jVGsZFASKy5SP7UI9sOtOg==
X-Google-Smtp-Source: AGRyM1sKwxMKb1gNbo8iHcTSdeJsgWw/hgWT8045JXTtgmV1cRUrLtzccFNqsJDGPCEDA2lbDkNvhQ==
X-Received: by 2002:a02:c4c3:0:b0:33f:4fb4:834b with SMTP id
 h3-20020a02c4c3000000b0033f4fb4834bmr16568115jaj.231.1658215630600; 
 Tue, 19 Jul 2022 00:27:10 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 ch6-20020a0566383e8600b0034173e8f66csm1901298jab.97.2022.07.19.00.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 00:27:09 -0700 (PDT)
Message-ID: <446f4c5d-bd25-c742-7064-72579cfe5923@linaro.org>
Date: Tue, 19 Jul 2022 12:56:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/8] target/loongarch: Fix float_convd/float_convs test
 failing
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org, peter.maydell@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220716085426.3098060-1-gaosong@loongson.cn>
 <20220716085426.3098060-4-gaosong@loongson.cn>
 <00a72795-ced5-5e0f-bf0b-5a5056540589@linaro.org>
In-Reply-To: <00a72795-ced5-5e0f-bf0b-5a5056540589@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
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

On 7/19/22 12:42, Richard Henderson wrote:
> On 7/16/22 14:24, Song Gao wrote:
>> We should result zero when exception is invalid and operation is nan
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/fpu_helper.c | 143 +++++++++++++++++++---------------
>>   1 file changed, 80 insertions(+), 63 deletions(-)
>>
>> diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
>> index 3d0cb8dd0d..bd76529219 100644
>> --- a/target/loongarch/fpu_helper.c
>> +++ b/target/loongarch/fpu_helper.c
>> @@ -13,9 +13,6 @@
>>   #include "fpu/softfloat.h"
>>   #include "internals.h"
>> -#define FLOAT_TO_INT32_OVERFLOW 0x7fffffff
>> -#define FLOAT_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
>> -
>>   static inline uint64_t nanbox_s(float32 fp)
>>   {
>>       return fp | MAKE_64BIT_MASK(32, 32);
>> @@ -544,9 +541,10 @@ uint64_t helper_ftintrm_l_d(CPULoongArchState *env, uint64_t fj)
>>       fd = float64_to_int64(fj, &env->fp_status);
>>       set_float_rounding_mode(old_mode, &env->fp_status);
>> -    if (get_float_exception_flags(&env->fp_status) &
>> -        (float_flag_invalid | float_flag_overflow)) {
>> -        fd = FLOAT_TO_INT64_OVERFLOW;
>> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
>> +        if (float64_is_any_nan(fj)) {
>> +            fd = 0;
>> +        }
> 
> The check for invalid is sufficient, the check for nan should be redundant with that.

Whoops, the other way around -- sometimes we get invalid raised from Inf.


r~

