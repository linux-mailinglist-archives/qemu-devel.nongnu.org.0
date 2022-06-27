Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F16B55B651
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 06:56:02 +0200 (CEST)
Received: from localhost ([::1]:33968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5gn3-0001uh-K1
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 00:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o5glJ-00012x-2r
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 00:54:13 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:35462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o5glG-0001Ue-K9
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 00:54:12 -0400
Received: by mail-pg1-x533.google.com with SMTP id r66so8052342pgr.2
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 21:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=j6KQ0xx2sEEnKzh2E0t4JGgrr1lxUxV2BmjDHZHNSM8=;
 b=AdiHqWpSPJwtFVhtt8G/EtcuME71yHc7Ufiv02Hu6cCtnvlGz1HiOTEN4COs9wmIjY
 bo+Hhq3222x9A8fiaK3giTHHHNVgIUxWzUa9mY8Lma/EKxEvOV73GPJJQjrTD4yCZLk/
 cDzLK0torn2Cc1ksvk6lTE/ZL/Tm8nIoAmTunGRs0UN65qMgzARqMD6OvjCB07Cu1twY
 l/EJj+1T7nry9TRzEE9u6i8nRZ6dVp1RIRe1KPC8zomrL4DZgQ5xLJesv4wGvSrAwlsX
 t3OzWxn3oRIN4Y5qi5jBdRAOQ6qJCr7sL/9r6BgMtnzw0nV5mUcp3sJ9zuuKhWQkZPl1
 DKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j6KQ0xx2sEEnKzh2E0t4JGgrr1lxUxV2BmjDHZHNSM8=;
 b=rebFABijBMz03pFjFrleXw3HOWKrJNf7nj75JOxiQOauXAHSCK8VF5XcrEGuJnBsHT
 rGHqMUc7tHupwLg3RUI9ART4QjymiONRwkHECi1fRk58VusiQ0D0YfV9MGG4s1MDyIfK
 N5ftunxJj2jtKKOmGmCz7Pe4BCjbX4QQ91gpx6tV1EUMKBDbrZwcc+9AEaghMfxXn9Zu
 B9hnc883LRkLO0iJv7So7TSJqzPzg7zEuA5x1zc2mKobZ47dUjGTxD2lxpPDXMc0lI5d
 OEuC37mrkJF2kp36YkK+mypyQ3mmVskqfBGSmka197fWtETyTHnFjAi/r/Tm1EK2hzib
 oLtA==
X-Gm-Message-State: AJIora+vqgynBcRXDhSH3vwRxUA88PozfqK9k/4HAvKxmzhAQKoDlBeX
 Gop/yuYF+evcGwMBpkndlhO/MA==
X-Google-Smtp-Source: AGRyM1tTA53TsIfRuJlWBZc43vXqyfi00Z40DSQzbdR8UBbE5DaoiV34MctKcLCZgOatDddz3yGxig==
X-Received: by 2002:a63:7844:0:b0:40c:9792:5d6d with SMTP id
 t65-20020a637844000000b0040c97925d6dmr10930799pgc.360.1656305647298; 
 Sun, 26 Jun 2022 21:54:07 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 y6-20020aa78f26000000b005251ec8bb5bsm6085683pfr.199.2022.06.26.21.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jun 2022 21:54:06 -0700 (PDT)
Message-ID: <6fca16ae-5df2-0bc3-8a98-0d31594f89a9@ozlabs.ru>
Date: Mon, 27 Jun 2022 14:54:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH qemu v2 1/2] ppc: Define SETFIELD for the ppc target
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220617060703.951747-1-aik@ozlabs.ru>
 <20220617060703.951747-2-aik@ozlabs.ru>
 <806270d7-c630-d436-43fc-bed8fd3ef694@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <806270d7-c630-d436-43fc-bed8fd3ef694@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 6/25/22 06:12, Daniel Henrique Barboza wrote:
> Alexey,
> 
> The newer version of this patch is having trouble with Gitlab runners, as
> you can read in my feedback there.
> 
> I've tested this one just in case. The same problems happen. E.g. for the
> cross-armel-system runner:
> 
> 
> In file included from ../hw/intc/pnv_xive.c:14:
> ../hw/intc/pnv_xive.c: In function ‘pnv_xive_block_id’:
> /builds/danielhb/qemu/target/ppc/cpu.h:45:33: error: conversion from 
> ‘long long unsigned int’ to ‘long unsigned int’ changes value from 
> ‘4222124650659840’ to ‘0’ [-Werror=overflow]
>     45 | #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) | 
> PPC_BIT(bs))
>        |                                 
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /builds/danielhb/qemu/target/ppc/cpu.h:51:42: note: in definition of 
> macro ‘GETFIELD’
>     51 |     (((word) & (mask)) >> __builtin_ctzl(mask))
>        |                                          ^~~~
> ../hw/intc/pnv_xive_regs.h:77:41: note: in expansion of macro ‘PPC_BITMASK’
>     77 | #define  PC_TCTXT_CHIPID                PPC_BITMASK(12, 15)
>        |                                         ^~~~~~~~~~~
> ../hw/intc/pnv_xive.c:80:24: note: in expansion of macro ‘PC_TCTXT_CHIPID’
>     80 |         blk = GETFIELD(PC_TCTXT_CHIPID, cfg_val);
>        |                        ^~~~~~~~~~~~~~~
> ../hw/intc/pnv_xive.c: In function ‘pnv_xive_vst_addr’:
> /builds/danielhb/qemu/target/ppc/cpu.h:45:33: error: conversion from 
> ‘long long unsigned int’ to ‘long unsigned int’ changes value from 
> ‘13835058055282163712’ to ‘0’ [-Werror=overflow]
>     45 | #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) | 
> PPC_BIT(bs))
>        |                                 
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /builds/danielhb/qemu/target/ppc/cpu.h:51:42: note: in definition of 
> macro ‘GETFIELD’
>     51 |     (((word) & (mask)) >> __builtin_ctzl(mask))
>        |                                          ^~~~
> ../hw/intc/pnv_xive_regs.h:230:33: note: in expansion of macro 
> ‘PPC_BITMASK’
>    230 | #define VSD_MODE                PPC_BITMASK(0, 1)
>        |                                 ^~~~~~~~~~~
> ../hw/intc/pnv_xive.c:226:18: note: in expansion of macro ‘VSD_MODE’
>    226 |     if (GETFIELD(VSD_MODE, vsd) == VSD_MODE_FORWARD) {
>        |                  ^~~~~~~~
> ../hw/intc/pnv_xive.c: In function ‘pnv_xive_end_update’:
> 
> 
> Link:
> 
> https://gitlab.com/danielhb/qemu/-/jobs/2637716673
> 
> 
> I don´t know how to deal with that.
> 
> 
> For the record: if this is too troublesome to fix, I am ok with just 
> consolidating
> the GETFIELD and SETFIELD inlines we already have, under cpu.h, keeping 
> them exactly
> as they are today (functions, not macros).
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
> On 6/17/22 03:07, Alexey Kardashevskiy wrote:
>> It keeps repeating, move it to the header. This uses __builtin_ctzl() to
>> allow using the macros in #define.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>   include/hw/pci-host/pnv_phb3_regs.h | 16 ----------------
>>   target/ppc/cpu.h                    |  5 +++++
>>   hw/intc/pnv_xive.c                  | 20 --------------------
>>   hw/intc/pnv_xive2.c                 | 20 --------------------
>>   hw/pci-host/pnv_phb4.c              | 16 ----------------
>>   5 files changed, 5 insertions(+), 72 deletions(-)
>>
>> diff --git a/include/hw/pci-host/pnv_phb3_regs.h 
>> b/include/hw/pci-host/pnv_phb3_regs.h
>> index a174ef1f7045..38f8ce9d7406 100644
>> --- a/include/hw/pci-host/pnv_phb3_regs.h
>> +++ b/include/hw/pci-host/pnv_phb3_regs.h
>> @@ -12,22 +12,6 @@
>>   #include "qemu/host-utils.h"
>> -/*
>> - * QEMU version of the GETFIELD/SETFIELD macros
>> - *
>> - * These are common with the PnvXive model.
>> - */
>> -static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
>> -{
>> -    return (word & mask) >> ctz64(mask);
>> -}
>> -
>> -static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
>> -                                uint64_t value)
>> -{
>> -    return (word & ~mask) | ((value << ctz64(mask)) & mask);
>> -}
>> -
>>   /*
>>    * PBCQ XSCOM registers
>>    */
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 6d78078f379d..9a1f1e9999a3 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -47,6 +47,11 @@
>>                                    PPC_BIT32(bs))
>>   #define PPC_BITMASK8(bs, be)    ((PPC_BIT8(bs) - PPC_BIT8(be)) | 
>> PPC_BIT8(bs))
>> +#define GETFIELD(mask, word)   \
>> +    (((word) & (mask)) >> __builtin_ctzl(mask))


Replacing __builtin_ctzl with __builtin_ctzll seems fixing it though, do 
you have a quick way to test this? Gitlab's CI takes time :)
https://gitlab.com/aik1/qemu/-/pipelines/573497191 is the current run.
Thanks,


-- 
Alexey

