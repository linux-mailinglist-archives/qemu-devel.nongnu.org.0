Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4502C5179CB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:08:18 +0200 (CEST)
Received: from localhost ([::1]:49798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nleDJ-0003Jp-8i
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle4Q-0007IE-Ta
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:59:07 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle4O-0005V8-C4
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:59:05 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so582129pju.2
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=LIn9M/WHiz1ZZT/99iQWgogRiEiTHY2or5HdjJdD/LI=;
 b=bStAYEvA25GMDyeiYji6WahWSX8g7guQk443pOJzRUDYgPXPassTys/GUiWYh8umMK
 H1Iw3JnPk6rhdJMMQ5azZQbY998R3uvcU7nrqHTPrLLJPZpELZ7qgSmQFQS1Sn2S+rL4
 HNxJd1ZcVe9jm5VRIlI9dmKlbXGgFleH+tqtr01GUmPz76Z1Ka6LUCIutbOPS1GKDOH0
 eZcppfrvVgQOtIzUqbAfQZYWQ2rmlQNmnYsAMbOfd05TQzDqTNgvUeoJqCoIcFjNp3Zk
 IaKngKDJNNdYindF1UCxSn4ie7V3fxgRI/jod9wBtub8E1iiRnzdlmtIjMti+ZrcQBoT
 b11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=LIn9M/WHiz1ZZT/99iQWgogRiEiTHY2or5HdjJdD/LI=;
 b=VgXcLUjo9igSQFprKy0+Qef6nGjOSNokhHPlkpsv12SxvFu7CtsP33Zkr+0QMPNHLA
 Whn+F7JBFAQ7IXlzVXQDyEtg+O8LSqN3b+ZjmzPC7tXXx2MoKXuVK0X6cfwsahoimdpM
 869vJyTB7xDCnKRJrq8q9aVz8hoRZg6oILpmhH45J/O1gY3She0KefnvqmhHdCUrSDRk
 XYADSlFGhRo3W6TRP6N5Zdaji+XArETp5MWnmXMP1b0fJkGk7Ssj3uRjNkWebbJzipQ9
 3fRGegard2B0JDmN/pxXU2f1TnSpFlVegtGzkLQvxuJwLtFb7h+UgKs67OoO7RQb4QA4
 ig3Q==
X-Gm-Message-State: AOAM532aoKQsqqDutbliz1688zNMrDIQoAtKVuMTCL7DTdJHRMRNYzfa
 my/3oAVoei8Nxi4j7pvge4+qiw==
X-Google-Smtp-Source: ABdhPJxuqIEwTvKwrlU9/kpFF3c3p/OwJFyoqk118O44bURnW3oHeHqwU2gQ2d9WO0EWMZWOB+LbxQ==
X-Received: by 2002:a17:90b:4b83:b0:1dc:5073:b704 with SMTP id
 lr3-20020a17090b4b8300b001dc5073b704mr1338830pjb.94.1651528743163; 
 Mon, 02 May 2022 14:59:03 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a62bd09000000b0050dc76281cdsm5156425pff.167.2022.05.02.14.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:59:02 -0700 (PDT)
Message-ID: <0a3dd630-5b73-9f10-0be5-9cc958775982@linaro.org>
Date: Mon, 2 May 2022 14:59:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 13/21] target/ppc: Remove msr_me macro
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-14-victor.colombo@eldorado.org.br>
 <51b5d3e2-2f4b-f004-7aad-fd607f793290@linaro.org>
In-Reply-To: <51b5d3e2-2f4b-f004-7aad-fd607f793290@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 5/2/22 14:38, Richard Henderson wrote:
> On 5/2/22 07:39, Víctor Colombo wrote:
>> msr_me macro hides the usage of env->msr, which is a bad behavior
>> Substitute it with FIELD_EX64 calls that explicitly use env->msr
>> as a parameter.
>>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
>>
>> ---
>>
>> v2: Remove M_MSR_CM and use FIELD_EX64 instead
>> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
>> ---
>>   target/ppc/cpu.h        | 2 +-
>>   target/ppc/mmu_common.c | 2 +-
>>   target/ppc/mmu_helper.c | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 294c61c9dc..8e652691cf 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -354,6 +354,7 @@ typedef enum {
>>   #define MSR_RI   1  /* Recoverable interrupt                        1        */
>>   #define MSR_LE   0  /* Little-endian mode                           1 hflags */
>> +FIELD(MSR, CM, MSR_CM, 1)
> 
> Patch title is wrong.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

