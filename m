Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD59F441C79
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 15:18:46 +0100 (CET)
Received: from localhost ([::1]:44666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhY97-0004Gu-82
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 10:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhY7n-0003aM-O0
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:17:23 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhY7m-0004j0-1w
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:17:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso17261833wmd.3
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9//tppxlOceYcBaIWDpBn0EcJALu8Gk9fw8iCyEOg7s=;
 b=JwSCYQtCLwVJ4iNftxnyWr4srLzMzuHKWSvXj2VMHoMf1tAY6oKw6WOgTFB60TeXcF
 v2knZHIdfRElZEsqAZxa3q1muto7wafeLwyrgGXWQ819iOfOhhJTca+7ZWZDrGoLnGlY
 l9qJUVr7Hv2jBmjOAkXJLst06svxH/eWatscDpXSxYFh3PGWXWvLaekqrWiki3rU4h+V
 E0MlzPcNogYW4+3glhTU2bSHe9PwzJj4LNaeKMaHunJ3P2/mLTeKm1iTPpudBdOa4JvR
 QBya2YWCuZchVMCBaKrM/6F6zWvJt4ELCoCXzZL48nyS4cXiOjCTlHilxwbzjGVLh5Ff
 zOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9//tppxlOceYcBaIWDpBn0EcJALu8Gk9fw8iCyEOg7s=;
 b=JEv7U5SBFXlXg+8FV/hRwJE66IUbVYQJXxCG38glNIEYlgGZfBoiLZ69HqHslz9vss
 hNkEw4nbOj0xhf86ePYHH8G+bwcPtsIhgXc6KbHW/Q0nBZmaqfZsoKXDgPhuSgLNUFEs
 weZN+T6UDJKqZX4e7XIvqUk7lq1yI5zh9IlmM31fDdMs9c9+0yfZ9MS99ZWmZ1xMO2cD
 Ze7sqo6HUwDpVjrK/9tdfTWXR6S51w4QNeENx+wDYKEi9jLyVeZzInaQ/14U78XRQEdC
 dQzMvVTomn5ab1IZzWLyCX4rDU42gFtnFynVVFH5XjwuKas8P+RB8Q77Vf4wzyvPukj1
 oJeA==
X-Gm-Message-State: AOAM533HU1gB9fTPs77iIuNi7Sq/A4JTZTs4+xVpT7Pu0uq0PitBQ1jA
 oEUSeLU4PP05UmY8524pfbA=
X-Google-Smtp-Source: ABdhPJwsXn5ukCbafG0HH4DOxVhq4ZfmFUWDicPXcscDZPvN5M7CICPSFiqncEweQRwR4ImjQ+JWyA==
X-Received: by 2002:a1c:f213:: with SMTP id s19mr39873163wmc.169.1635776240592; 
 Mon, 01 Nov 2021 07:17:20 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u5sm14569630wrg.57.2021.11.01.07.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 07:17:19 -0700 (PDT)
Message-ID: <3e93e507-da92-0a1c-346b-ebfde27168fc@amsat.org>
Date: Mon, 1 Nov 2021 15:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
 <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
 <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
 <2f35d0c6-0ba7-b911-56db-c1ed9ae4afbc@linaro.org>
 <SN4PR0201MB8808814113CBE84889CD5234DE8A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <SN4PR0201MB8808814113CBE84889CD5234DE8A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 15:09, Taylor Simpson wrote:
> Plan-A should be to update the container with the new toolchain.

IIUC Richard is going with Plan-A: wait Alex queue get merged,
then retry merging this pull request.

> Plan-B would be to remove the vector registers from the inline asm.
> 
> 
> Thanks!
> Taylor
> 
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Monday, November 1, 2021 8:44 AM
>> To: Philippe Mathieu-Daudé <f4bug@amsat.org>; Taylor Simpson
>> <tsimpson@quicinc.com>; qemu-devel@nongnu.org; Alex Bennée
>> <alex.bennee@linaro.org>
>> Cc: peter.maydell@linaro.org
>> Subject: Re: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
>>
>> WARNING: This email originated from outside of Qualcomm. Please be wary
>> of any links or attachments, and do not enable macros.
>>
>> On 11/1/21 6:33 AM, Philippe Mathieu-Daudé wrote:
>>> On 10/31/21 17:43, Taylor Simpson wrote:
>>>> Tests for
>>>>      packet semantics
>>>>      vector loads (aligned and unaligned)
>>>>      vector stores (aligned and unaligned)
>>>>      vector masked stores
>>>>      vector new value store
>>>>      maximum HVX temps in a packet
>>>>      vector operations
>>>>
>>>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>>>> ---
>>>>   tests/tcg/hexagon/hvx_misc.c      | 469
>> ++++++++++++++++++++++++++++++++++++++
>>>>   tests/tcg/hexagon/Makefile.target |   2 +
>>>>   2 files changed, 471 insertions(+)
>>>>   create mode 100644 tests/tcg/hexagon/hvx_misc.c
>>>
>>>> +static void test_load_tmp(void)
>>>> +{
>>>> +    void *p0 = buffer0;
>>>> +    void *p1 = buffer1;
>>>> +    void *pout = output;
>>>> +
>>>> +    for (int i = 0; i < BUFSIZE; i++) {
>>>> +        /*
>>>> +         * Load into v12 as .tmp, then use it in the next packet
>>>> +         * Should get the new value within the same packet and
>>>> +         * the old value in the next packet
>>>> +         */
>>>> +        asm("v3 = vmem(%0 + #0)\n\t"
>>>> +            "r1 = #1\n\t"
>>>> +            "v12 = vsplat(r1)\n\t"
>>>> +            "{\n\t"
>>>> +            "    v12.tmp = vmem(%1 + #0)\n\t"
>>>> +            "    v4.w = vadd(v12.w, v3.w)\n\t"
>>>> +            "}\n\t"
>>>> +            "v4.w = vadd(v4.w, v12.w)\n\t"
>>>> +            "vmem(%2 + #0) = v4\n\t"
>>>> +            : : "r"(p0), "r"(p1), "r"(pout)
>>>> +            : "r1", "v12", "v3", "v4", "v6", "memory");
>>>> +        p0 += sizeof(MMVector);
>>>> +        p1 += sizeof(MMVector);
>>>> +        pout += sizeof(MMVector);
>>>> +
>>>> +        for (int j = 0; j < MAX_VEC_SIZE_BYTES / 4; j++) {
>>>> +            expect[i].w[j] = buffer0[i].w[j] + buffer1[i].w[j] + 1;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    check_output_w(__LINE__, BUFSIZE); }
>>>
>>> This test fails guest-tests:
>>>
>>> tests/tcg/hexagon/hvx_misc.c:111:21: error: unknown register name 'v12'
>>> in asm
>>>              : "r1", "v12", "v3", "v4", "v6", "memory");
>>>                      ^
>>> tests/tcg/hexagon/hvx_misc.c:362:9: note: expanded from macro
>> 'TEST_VEC_OP2'
>>>          VEC_OP2(ASM, EL, p0, p1, pout); \
>>>          ^
>>>
>>
>> Yep, this PR depends on the toolchain update that's pending.
>> I'll ask Alex to hurry up the docker patch queue.
>>
>>
>> r~

