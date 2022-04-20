Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F850901B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:14:07 +0200 (CEST)
Received: from localhost ([::1]:54986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFmA-00022h-AM
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEuf-0007am-6j
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:18:49 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEud-00031x-IJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:18:48 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a15so2694403pfv.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Qu/TDCpBLjrBNtIrb20HlPVl0WyjAHGNWRMIyjC1KMM=;
 b=wYSqqi5a16TETqJMCQ3YdLlcLeodZGZvqm84N/iugjm0mFRXnyiXiwpakoZR403jdC
 ozRpYLE1KbSsHv1Kd8aZJUShSjg1kN5xZXlnzYl1ihN7tnwYp0OgiyG2aFTKfcfsJpLg
 nWmF4QIDIx1ThpNBwla83wIhx/jJ+JXM69/Ig2gpG/KGsdqER85fJJf0eAmTPyE8A1MR
 zzq1Nu8n3VPv/4QuzYRt+ZgEt3SlDQjh6aiaGCN0DUCButrax4SNmug5No3CprI5BxCl
 /K6YraJ8Sb4QUZ31zNU/xOfWry2ucOiD3dod6zHsAyDLva3clapnTM2K+t7sn43pEFer
 qB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qu/TDCpBLjrBNtIrb20HlPVl0WyjAHGNWRMIyjC1KMM=;
 b=7UPQdFlZpTas/mDHqx2ETHb+K4+/CLIgwaF6QY86+Y2OJ9oUKlfXAxbtiONwMXoml8
 HbHgAzFMeivt8wdYVS2yOKqAnl7lC/n1VMnKP0Y8PCD7Yaq03CaPzbq5YdWpx5IswNmj
 06SjaoJJMtGLGVsktWos6yys5mOpNJBCx5XkCYQcXafp49D6Ol5FKnsCR73HQNxSJ8TH
 xoPF/wfcx3DAZRwX8ZYss4bgcQytQI2McPFYVClBknUSMvkGcgm7Joy2feyc/iZ8C00Z
 Ovz0Ag/SxVKrBdq805TVH85JS/B11cZtGZaFjp0wJiIvrraREBjA+wC1TTT9is6SIVZY
 nXKA==
X-Gm-Message-State: AOAM530vrh/xh4tpTwHfb0brV4abTKx0m+8duV8hqrmK6/YFmVuhrTw3
 GYd4wzA5HIYSI1Go3H0s9vMM/g==
X-Google-Smtp-Source: ABdhPJyLqubKbWbwE2+4aXLsB6vlnlpZ2rQYyhVtJ5vkwPxP7kOJmoraVXrm8SDiu745G1UxLLHN8A==
X-Received: by 2002:a63:164f:0:b0:3a2:ced0:3327 with SMTP id
 15-20020a63164f000000b003a2ced03327mr20402225pgw.425.1650478726029; 
 Wed, 20 Apr 2022 11:18:46 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a62520d000000b0050a923a7754sm7300256pfb.119.2022.04.20.11.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 11:18:45 -0700 (PDT)
Message-ID: <9c037b8d-04d3-4c5b-cd61-f5a96dd40e28@linaro.org>
Date: Wed, 20 Apr 2022 11:18:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
 <92025187-7b4a-f8da-2204-d45160f9d711@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <92025187-7b4a-f8da-2204-d45160f9d711@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: danielhb413@gmail.com, groug@kaod.org, Nicholas Piggin <npiggin@gmail.com>,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 10:54, Leandro Lupori wrote:
> On 4/18/22 17:22, Cédric Le Goater wrote:
> 
>>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>>> index 7a51fd0737..e1279c316c 100644
>>> --- a/semihosting/arm-compat-semi.c
>>> +++ b/semihosting/arm-compat-semi.c
>>> @@ -268,6 +268,31 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
>>>
>>>   #endif
>>>
>>> +#ifdef TARGET_PPC64
>>
>> This PPC ifdef in an ARM file seems wrong.
>>
>> The rest looks OK.
> 
> IIUC, arm-compat-semi.c is not an ARM specific file, but it's used by targets that 
> implement ARM-compatible semihosting. It's currently used by ARM and RISC-V and both use 
> target ifdefs in small parts of this file.

It would be nice to split these out to target/arch/arm-compat-semi.h or something akin.


r~

