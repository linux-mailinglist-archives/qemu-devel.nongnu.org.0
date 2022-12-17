Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE23164F8DF
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 12:52:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6VjB-0002wb-GU; Sat, 17 Dec 2022 06:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Vj9-0002wH-FB
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 06:51:39 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Vj7-0000ro-MC
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 06:51:39 -0500
Received: by mail-ej1-x62a.google.com with SMTP id kw15so11734275ejc.10
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HCmqKtZZ9aPGMM32v0k3MYScD00Lk+6ASnqtjFAnQ4k=;
 b=jUSc4CnXYCRwUbUDTdhUIsje5OT6g9TQ/fqGnfD7ozSQVjg27UStzut8spJ3FZKcb9
 JM2dlUDO1yHOcW8yjU/VR2RdSb/4KYtOnGX1SrJebD0APeB4taMWCssAh7JVk+T/iRAx
 1dnuo+zLll/mcDL7lT7EzpfHLpbfLpvSoIAWLH/DywzQhsp8LLgDMxWeiOcKgEj1g/ZO
 uEm2EcqUaFbAIadrv8rRdTJ+Lq5iRKYrK0BwOUU0s0+guHLgF0QgVAl1iZW4g13MjgGg
 Xp71RSJNA3QxndzjGnAZ1xpf+tmDO78YHgrpTOCTrDP5C448oy3eyrDgEk395s1xn2fG
 PHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HCmqKtZZ9aPGMM32v0k3MYScD00Lk+6ASnqtjFAnQ4k=;
 b=Vl2WRZI4PT2yGAWUedenjTnjoxBWPz9PlosWkct9k/4Ip+dKY0JJNzag2kUJlvqf8T
 +o1braDp3pqWEVRc77atfKkAsogedei8fyVkclyO2S06bLyxdh0BcyP3sx6TB9kgIINm
 69dX3BzB+n1ufB1P4DB8EuO0iCyODv7AX0UeAgv9Wk5o7BpE2rRuJ9TOJtd+B7co1Cex
 G42+nYZeN/2ZxVbKKe5zRLOeqyaM7FHDSm7LG8pwxRt/pq0v85Czq1ADRc5Kt+XkifyW
 GFT0kfv/zp1tUhCOZbndqR71WRizt3q/G4d3ZNLZR9XHqW6KuF9DVqPvkFnLyVIAttcL
 pcbg==
X-Gm-Message-State: ANoB5plcNxmLqeD+53/HZ2Ze5k6y0sIxo94J3g9NKNUgV3i3Vs7q40qx
 /b1g0LHZudY2gweKETiiYp87UQ==
X-Google-Smtp-Source: AA0mqf6EJr7J7YszPGaKyurXEyclqp+4GRQkyU5BsZiHe3wf6GvIexhP74RMdn1D91n4RL3xo3f+tg==
X-Received: by 2002:a17:906:3b5b:b0:7c1:528:bc02 with SMTP id
 h27-20020a1709063b5b00b007c10528bc02mr28372279ejf.41.1671277896054; 
 Sat, 17 Dec 2022 03:51:36 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a170906415900b007b27aefc578sm1882699ejk.126.2022.12.17.03.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 03:51:35 -0800 (PST)
Message-ID: <5cc7ac52-29a8-8d7a-1d66-0a8015f4065e@linaro.org>
Date: Sat, 17 Dec 2022 12:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 5/5] target/s390x/tcg/excp_helper: Restrict system headers
 to sysemu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
References: <20221216220411.6779-1-philmd@linaro.org>
 <20221216220411.6779-6-philmd@linaro.org>
 <e20a4f2e-2e97-87b8-495f-cc3ca95cfe0d@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e20a4f2e-2e97-87b8-495f-cc3ca95cfe0d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/12/22 01:45, Richard Henderson wrote:
> On 12/16/22 14:04, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/s390x/tcg/excp_helper.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/s390x/tcg/excp_helper.c 
>> b/target/s390x/tcg/excp_helper.c
>> index fe02d82201..e9eb7c455e 100644
>> --- a/target/s390x/tcg/excp_helper.c
>> +++ b/target/s390x/tcg/excp_helper.c
>> @@ -21,15 +21,15 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/log.h"
>>   #include "cpu.h"
>> -#include "s390x-internal.h"
>>   #include "exec/helper-proto.h"
>> -#include "qemu/timer.h"
>>   #include "exec/exec-all.h"
>> -#include "exec/cpu_ldst.h"
>> -#include "hw/s390x/ioinst.h"
>> -#include "exec/address-spaces.h"
>> +#include "s390x-internal.h"
>>   #include "tcg_s390x.h"
>>   #ifndef CONFIG_USER_ONLY
>> +#include "qemu/timer.h"
>> +#include "exec/cpu_ldst.h"
> 
> cpu_ldst.h is not a system header.  The others look plausible.

Oops, correct.


