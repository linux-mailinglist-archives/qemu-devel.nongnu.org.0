Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1310441BE8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 14:45:50 +0100 (CET)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhXdF-0000dS-ET
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 09:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhXbN-0007NT-Ee
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 09:43:53 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:35452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhXbL-00042L-Hf
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 09:43:53 -0400
Received: by mail-qt1-x830.google.com with SMTP id n2so15832411qta.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 06:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uPqs+kGpObJkDTQds21v2tho79t4oo3Qlh/XQ3ax2uY=;
 b=Wi9trFY/zHoJPzNtfGhJ/9KWNax1sNzHAqvn/hfMJ1I5E+R/LkfVHIGLq4POAAqEG3
 7vw34eZT98GgzC30CikJH4mlxJ03J7qFAGRwxSwwI3oFYapFB9ciWxJiGdI4Vz/kELvT
 vjM+XdJalchiAM6SFavi4T/1DuMS0BzEKsPOTIJTtvltY8aFrazuTiOtyY8AP781sS7n
 5/p9Pvf+VQy8XHndtHX++hWY8+Wo6e7KjFO3TpPKeL0oJsRAZq3jjD2oNUKjUPLmlAon
 XHHwROKxDqTA0C3byrauExbbLUV7vNPlAJqlq/xLJnIDkkJBY//BMYyn26EFm3QBEOFh
 j//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uPqs+kGpObJkDTQds21v2tho79t4oo3Qlh/XQ3ax2uY=;
 b=3kuIcpqtfsfSiV8W9bjnB+CpK6L5qip2UBnEZEf6RxgzEJuK8jSrOL5r0NjUR/+JZE
 /DWmvP+aA8iGlbZXhnnAf2GxTbfDkF3w3U6qB5Wegxv5+4yehySVIF/MeUNghvzmMued
 68GJH0nlIfm6dAhUG/RKhWeGM3XTNet8r2bfWlp0rLmgZPjg8tIfqMNH4BLKbwZj6QSy
 uuF7Py9WVGCGPY7EW07/bBoHXy6ajgv11/LjCV7MdkbDy6H03c8H/nkf+81ILsDYyUES
 6ZwpGmJTnCkvgywWEirGYPlhC/+Uz0JkqBZoELe9t1c8Sb9kwhdOuvJGIeClEP4Bq6Kx
 tYbA==
X-Gm-Message-State: AOAM533tZyg/4X7ihhgYFswCPrDXJnpNUJ7SqxQQ2XV8O28PO+LuPtJg
 D43yyTs6L5T7a0IkTxCM0LMe3Q==
X-Google-Smtp-Source: ABdhPJysR9McSoIWF/fe4MtwVV9b2X9FBnWqd/xS2RjY9lpJPl+JtBWt6Y9t6pETQuvf/38o30oW+w==
X-Received: by 2002:ac8:701b:: with SMTP id x27mr29857940qtm.246.1635774230349; 
 Mon, 01 Nov 2021 06:43:50 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t11sm9934388qkm.92.2021.11.01.06.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 06:43:49 -0700 (PDT)
Subject: Re: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
 <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
 <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f35d0c6-0ba7-b911-56db-c1ed9ae4afbc@linaro.org>
Date: Mon, 1 Nov 2021 09:43:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 6:33 AM, Philippe Mathieu-Daudé wrote:
> On 10/31/21 17:43, Taylor Simpson wrote:
>> Tests for
>>      packet semantics
>>      vector loads (aligned and unaligned)
>>      vector stores (aligned and unaligned)
>>      vector masked stores
>>      vector new value store
>>      maximum HVX temps in a packet
>>      vector operations
>>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>> ---
>>   tests/tcg/hexagon/hvx_misc.c      | 469 ++++++++++++++++++++++++++++++++++++++
>>   tests/tcg/hexagon/Makefile.target |   2 +
>>   2 files changed, 471 insertions(+)
>>   create mode 100644 tests/tcg/hexagon/hvx_misc.c
> 
>> +static void test_load_tmp(void)
>> +{
>> +    void *p0 = buffer0;
>> +    void *p1 = buffer1;
>> +    void *pout = output;
>> +
>> +    for (int i = 0; i < BUFSIZE; i++) {
>> +        /*
>> +         * Load into v12 as .tmp, then use it in the next packet
>> +         * Should get the new value within the same packet and
>> +         * the old value in the next packet
>> +         */
>> +        asm("v3 = vmem(%0 + #0)\n\t"
>> +            "r1 = #1\n\t"
>> +            "v12 = vsplat(r1)\n\t"
>> +            "{\n\t"
>> +            "    v12.tmp = vmem(%1 + #0)\n\t"
>> +            "    v4.w = vadd(v12.w, v3.w)\n\t"
>> +            "}\n\t"
>> +            "v4.w = vadd(v4.w, v12.w)\n\t"
>> +            "vmem(%2 + #0) = v4\n\t"
>> +            : : "r"(p0), "r"(p1), "r"(pout)
>> +            : "r1", "v12", "v3", "v4", "v6", "memory");
>> +        p0 += sizeof(MMVector);
>> +        p1 += sizeof(MMVector);
>> +        pout += sizeof(MMVector);
>> +
>> +        for (int j = 0; j < MAX_VEC_SIZE_BYTES / 4; j++) {
>> +            expect[i].w[j] = buffer0[i].w[j] + buffer1[i].w[j] + 1;
>> +        }
>> +    }
>> +
>> +    check_output_w(__LINE__, BUFSIZE);
>> +}
> 
> This test fails guest-tests:
> 
> tests/tcg/hexagon/hvx_misc.c:111:21: error: unknown register name 'v12'
> in asm
>              : "r1", "v12", "v3", "v4", "v6", "memory");
>                      ^
> tests/tcg/hexagon/hvx_misc.c:362:9: note: expanded from macro 'TEST_VEC_OP2'
>          VEC_OP2(ASM, EL, p0, p1, pout); \
>          ^
> 

Yep, this PR depends on the toolchain update that's pending.
I'll ask Alex to hurry up the docker patch queue.


r~

