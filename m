Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0262254C288
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 09:18:29 +0200 (CEST)
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1NIK-0000eB-FB
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 03:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o1NBV-0006Wj-Ca
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 03:11:29 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o1NBS-00009N-CP
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 03:11:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id n18so9667775plg.5
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 00:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :content-language:from:in-reply-to:content-transfer-encoding;
 bh=CrS9/L+vZBtztNjsKhL3XPYQw9asv9WYioh/o99Vymk=;
 b=D/y4nhqcUQyhAuO/FvLz4sqCwoQb1yuHK7UXMF/DCinrwnlJKZLhDBp0jy43RCPBOV
 0g17tiAx1kF7ChTk/oxL3Nin/IiXmRoB3rS1Ih/2RE5jbVDcCULXbQZNy4cTo3ViLAeX
 z6ai+DE36XuIxor82kcN1qv55rF/0POh8oqyR5zaoaEqDcTv2Bdkng+jw8N2bcHDDDyS
 4LnUQTh1y+DEhlxfWwrPTkq/y7UM/nHu8xwosZv1V/XVY4mE1XUY9+nCWe41MFG952eZ
 vprhCL7KT7dC43bs0h3N2xv+kTmFbbZB05keCl0PXV11stvr9jsBH3BQ3p4Eeh9psilO
 T1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:content-language:from:in-reply-to
 :content-transfer-encoding;
 bh=CrS9/L+vZBtztNjsKhL3XPYQw9asv9WYioh/o99Vymk=;
 b=rmRuWy7Nhnt+VVMuP4vHNTSPI+f0wp4hp4KMpXOxKLOrmbFv9FsFNf/Oq+e9BwZ6gu
 oMnupjHDmCOFvrozoTM1Ig5axoIErgCMnoXAaU0PJvoCNoSGOyxsSNA35SfKOI3E48MN
 aAXVBys3JbIbkOqGT40yFJXdujBY/ISZKTey/T/0DzYqm/WN2jeBhxmTN4nWRpQP+xUp
 ndj75344WG5ebOxQXSddFxBuHAFFbRaJbhZMuNDXd0U5L/GU37L8CcLDXKj4uN1Jjq2C
 7+94neELDZT/MO3PayWOkMUl80FKjhNTwxIKjtCR69W4RhrVTFAcnyEYdrutC2JOpwOs
 RKxw==
X-Gm-Message-State: AJIora+Zv+I946X/DlNUyNkpSEDjIadU7KXiIPPYr94OQaugQj1lYi28
 60K+mSy6MperZ3VD7/pLFJ5spg==
X-Google-Smtp-Source: AGRyM1v7cWoIJxK4jCSKmdox44Js4tpE3sYtQ4KBtRlGt7lbqGgHnXzoUzADWVYxaPTvik5vRiQRZg==
X-Received: by 2002:a17:90b:1e47:b0:1e6:7d04:2f4 with SMTP id
 pi7-20020a17090b1e4700b001e67d0402f4mr8495452pjb.93.1655277079070; 
 Wed, 15 Jun 2022 00:11:19 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 jb14-20020a170903258e00b0015e8d4eb2c5sm8421070plb.271.2022.06.15.00.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 00:11:18 -0700 (PDT)
Message-ID: <2f635e96-7b1a-b860-ebbd-4080b6bc555f@ozlabs.ru>
Date: Wed, 15 Jun 2022 17:11:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH qemu] ppc/spapr: Implement H_WATCHDOG
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Scott Cheloha <cheloha@linux.ibm.com>
References: <20220608030153.1862335-1-aik@ozlabs.ru>
 <51d016d2-4684-aad5-1319-e9d0cef7f98e@kaod.org>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <51d016d2-4684-aad5-1319-e9d0cef7f98e@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 6/15/22 14:48, Cédric Le Goater wrote:
> Hello Alexey,
> 
> On 6/8/22 05:01, Alexey Kardashevskiy wrote:
>> The new PAPR 2.12 defines a watchdog facility managed via the new
>> H_WATCHDOG hypercall.
>>
>> This adds H_WATCHDOG support which a proposed driver for pseries uses:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=303120
>>
>> This was tested by running QEMU with a debug kernel and command line:
>> -append \
>>   "pseries-wdt.timeout=60 pseries-wdt.nowayout=1 pseries-wdt.action=2"
>>
>> and running "echo V > /dev/watchdog0" inside the VM.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>   include/hw/ppc/spapr.h  |  23 +++-
>>   hw/ppc/spapr.c          |   5 +
>>   hw/ppc/spapr_watchdog.c | 239 ++++++++++++++++++++++++++++++++++++++++
> 
> Watchdogs are under :
> 
>    hw/watchdog/
> 
>>   hw/ppc/meson.build      |   1 +
>>   hw/ppc/trace-events     |   7 ++
>>   5 files changed, 274 insertions(+), 1 deletion(-)
>>   create mode 100644 hw/ppc/spapr_watchdog.c
>>
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index 072dda2c7265..39aa8609df7b 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -164,6 +164,19 @@ struct SpaprMachineClass {
>>       SpaprIrq *irq;
>>   };
>> +#define WDT_MAX_WATCHDOGS       4      /* Maximum number of watchdog 
>> devices */
>> +
>> +#define WDT_HARD_POWER_OFF      0
>> +#define WDT_HARD_RESTART        1
>> +#define WDT_DUMP_RESTART        2
>> +
>> +typedef struct SpaprWatchdog {
>> +    unsigned num;
>> +    QEMUTimer timer;
>> +    uint8_t action;
>> +    uint64_t timeout;
>> +} SpaprWatchdog;
> 
> 
> couldn't we QOM'ify this model ?


What is the benefit of that besides inspecting those via QMP?


-- 
Alexey

