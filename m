Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57930564FBC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:29:58 +0200 (CEST)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8HSv-0007tw-0t
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8HRC-0006Od-V2
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:28:11 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8HRA-0003er-LR
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:28:10 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so4548718pjm.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 01:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yNKG7IpIr7TYhwY1wBtLpL+Qo3iWdUHl1AGVBxprW2o=;
 b=nE68Pu/xQKg20UqVUwRX210PooQOPkDJ8E3rVW5Ng6LbZd9hvOuAjc8l8ZfyWXnE5/
 xEr6JjlSLFOacPAf6pgiNybXLZB+5LIXPwx2A8rUlRv6IZdsGnIaK5zESGIhRuvvHm5+
 hH4dgKj4VGC2tWqB1KiUN01wPvrSn0hJ9UKyKPi6oyIDOoD2vb9WPWoefTqXQuLc4a+c
 L53BE1wBRdw080nuju8jZmM8zx8azhzghZf7aS+sxKW8miBhj9fudPPcQ1HL+F8yhlTY
 uil5ars2Uf0NcZJc+MrVUyJpZZW7r03iPM9OAMckVXS0UjVrFEIPkDgCmY8r11TJeYAO
 4qNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yNKG7IpIr7TYhwY1wBtLpL+Qo3iWdUHl1AGVBxprW2o=;
 b=y8erXAWs3jG4v+DGZlslX5TVaYieU7cDQCEfIXf9pCYa4c1cOAvzwRXJAIBLXDKF2j
 4B+nbFkzf8SpkU6LBC60foVb88IBROcxM8v2kvdrsYTCL4erJAKNCJl4VqYyE2eChYvs
 /ocVYPHOirHvdPEugRDK5CDp8n9Hb4eA+4SJMsQhfdpRTX/T7g11dzfpF0rBIGqza3HN
 Err9eHWVQTjHRtL99Wzq6x5nxsDqg5OajO1x8M1gv9ZY/MwsLve60ucKrGUOZ24jHSsk
 I47OJ6pkzVT90w999A077ggA93e6syZeuaq6ey+i8yi0fd749Z5ZgdAr/CCYQm10KyTT
 RGDw==
X-Gm-Message-State: AJIora8hAUs2YfmaDvHvYmpIruw174P9JtLR6o7BCzcTO/iPxjGefVSC
 6vN9xv6GKuk5wrPfYofPkPtUGA==
X-Google-Smtp-Source: AGRyM1vKnfcedLoLqzqwaBGHByNBhH463Y9+O7niMCeH288lQ5KD7JvFzr7mP7XkSxmSNAAhTgysjA==
X-Received: by 2002:a17:90b:1b49:b0:1ec:a756:edc with SMTP id
 nv9-20020a17090b1b4900b001eca7560edcmr33695124pjb.200.1656923285147; 
 Mon, 04 Jul 2022 01:28:05 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 70-20020a621849000000b0051bb79437f7sm20452640pfy.37.2022.07.04.01.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 01:28:04 -0700 (PDT)
Message-ID: <bea0892e-ab42-a61d-418e-37ea49cb5a25@linaro.org>
Date: Mon, 4 Jul 2022 13:58:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 03/45] target/arm: Trap non-streaming usage when
 Streaming SVE is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-4-richard.henderson@linaro.org>
 <CAFEAcA9MNTrD=O+v53TsejbbpJrNzfhWv-uq6tJfXnXzLKSQRg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9MNTrD=O+v53TsejbbpJrNzfhWv-uq6tJfXnXzLKSQRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 7/1/22 16:36, Peter Maydell wrote:
>> +    /*
>> +     * The SME exception we are testing for is raised via
>> +     * AArch64.CheckFPAdvSIMDEnabled(), and for AArch32 this is called
>> +     * when EL1 is using A64 or EL2 using A64 and !TGE.
>> +     * See AArch32.CheckAdvSIMDOrFPEnabled().
>> +     */
>> +    if (el == 0
>> +        && FIELD_EX64(env->svcr, SVCR, SM)
>> +        && (!arm_is_el2_enabled(env)
>> +            || (arm_el_is_aa64(env, 2) && !(env->cp15.hcr_el2 & HCR_TGE)))
>> +        && arm_el_is_aa64(env, 1)
>> +        && !sme_fa64(env, el)) {
> 
> I can't get any of:
>   * the logic in the comment
>   * the logic in the C code
>   * the logic in the the pseudocode AArch32.CheckAdvSIMDOrFPEnabled()
>     which causes it to call AArch64.CheckFPEnabled()
> to line up with each other.
> 
> The comment has:
>   * (EL1 A64) OR (EL2 A64 && !TGE)
> The pseudocode has:
>   * (!TGE && EL1 A64) OR (TGE && EL2 A64 && EL1 A64)
>     [seems odd that it is checking the width of EL1 in the TGE case
>      but I haven't followed the logic through to find out why]
> The C code here has:
>   * (!TGE && EL2 A64 && EL1 A64)
> 
> What am I missing ?

I'm looking at 0487H.a... are you looking at a different version?
Because the pseudocode I see isn't what you list above:

> if PSTATE.EL == EL0 && (!EL2Enabled() || (!ELUsingAArch32(EL2) && HCR_EL2.TGE == '0')) &&

> !ELUsingAArch32(EL1) then
So

   (!EL2 || (EL2 A64 && !TGE)) && EL1 A64

which is, as far as I can see, what the C code has.

I'll adjust the comment, anyway.


r~

