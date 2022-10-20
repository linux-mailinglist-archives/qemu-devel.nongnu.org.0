Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED26C6055E7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 05:23:16 +0200 (CEST)
Received: from localhost ([::1]:46928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olM9M-0004nv-2a
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:23:16 -0400
Received: from [::1] (port=40856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olM6D-0005Dh-4Y
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olM37-00084P-Gf
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:16:49 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olM31-0007Gq-F9
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:16:48 -0400
Received: by mail-pf1-x42f.google.com with SMTP id f140so19075985pfa.1
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 20:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vXZCl72guOE22w6Ah8XQdxkS4ltgUPMha9r4z5HCjY0=;
 b=CoOGoFyT59/JiQllsW8C2wHDTjOeC8CE9s1t379rLfws+JqdGogv9ErgHnKrOu0Dmj
 AIC+t//7daw3hQt+9RALMt8py+lUB3KprvdOvjEDaw4/FOH84uV8HwM6rPZ7Gjv3cpqw
 18iYKht+BHjUzXeLVsrQkmBwK+BcHZ2BXweC5poX4GnmCWhv7HJdDUd8nTYFokuqGXrj
 HwGC67njhNdLcfRM/BRwpqLUcnZ79j85Cy3JT/UBwWf+UyrG/w+ZV1g1nFRq/YNh8gGG
 rwZcKL4QO63NS5BxlSNsJP8E/QhUSd+wP7TURQRod1eN7Mm/Dx9feMwTY4qi/J0SdUVs
 +s9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vXZCl72guOE22w6Ah8XQdxkS4ltgUPMha9r4z5HCjY0=;
 b=cmcyUxRzYskw6Y+W+osSHe1CxdeDWKilGcsSB+hf1g+4TtLf/SgWu1Z0dio6xW8OS0
 NKB3tiQF4RvP5yY2GGIfYAWOQhWbUdRYbESjSruMzXADOtvZ5yG8dnuuPzumu17oeSZ0
 ohfRrDsOUmLv2vvPFYBgFHlFxUcT45TGgOHk+cOCpO197xiP7RbEjU/a3cP6Ou0YH0/9
 KiuvXKZsc2UIKAvDDr/yu8KAv12kM6s5/V1vdzM3yt4H/YcQYBxPYkaDShqgSg2yeB1m
 0G7MTzqZ/S9P844jvEEiemvAZqOlHVNefvg2Uw6xafHe0xQViIPa3dhNxT5eaKQnywmf
 qCrA==
X-Gm-Message-State: ACrzQf3OrVadXxrlTp/IEBGarC2sQnqlOePgdD9/EFiPuyPA8xbWgcWy
 Xs8uqgAcIIBIhuAq1WK6iresoA==
X-Google-Smtp-Source: AMsMyM4RmxEukM/lvqpuTNhfZjYQjMleg8dAkETNcDQSc7K2CWf9E8qzNnDLva92CVI4PMQmcHJhcw==
X-Received: by 2002:a63:4517:0:b0:464:4f06:a0f1 with SMTP id
 s23-20020a634517000000b004644f06a0f1mr9624086pga.509.1666235802141; 
 Wed, 19 Oct 2022 20:16:42 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 kx7-20020a17090b228700b001f559e00473sm632343pjb.43.2022.10.19.20.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 20:16:41 -0700 (PDT)
Message-ID: <e432447d-8a5e-4229-feab-582aa16f0f14@linaro.org>
Date: Thu, 20 Oct 2022 13:16:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 13/24] target/arm: Add ptw_idx to S1Translate
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-14-richard.henderson@linaro.org>
 <CAFEAcA_Vdc2Cxvwnd_tc7ik_-NMXk_z0URsV=r7eGYy3bqhstg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_Vdc2Cxvwnd_tc7ik_-NMXk_z0URsV=r7eGYy3bqhstg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 10/17/22 20:01, Peter Maydell wrote:
> On Tue, 11 Oct 2022 at 04:30, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Hoist the computation of the mmu_idx for the ptw up to
>> get_phys_addr_with_struct and get_phys_addr_twostage.
>> This removes the duplicate check for stage2 disabled
>> from the middle of the walk, performing it only once.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> +        if (!nstable) {
>> +            /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
>> +            ptw->in_ptw_idx &= ~1;
>> +            ptw->in_secure = false;
>> +        }
> 
> I feel like this bitwise manipulation of the mmuidx values
> is leaving a landmine for any future re-organization of
> our mmuidx use. Can we do this just using the symbolic
> constant values?

I can't think of a way with just symbolic values,
but I can add BUILD_BUG_ON to validate expectations,
so that it's not a *hidden* landmine.  :-)


r~

