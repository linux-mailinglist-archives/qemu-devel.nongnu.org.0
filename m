Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC90A55BDB8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 04:58:31 +0200 (CEST)
Received: from localhost ([::1]:39970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o61Qs-0006zd-Ih
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 22:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o61Pg-0005ho-8i
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 22:57:16 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o61Pd-00006T-Kp
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 22:57:16 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso14437181pjn.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 19:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mtxZcIgAgA3zLkRaoKC04cTY8dfapO5EArjpu0qV1nQ=;
 b=vGxGJUa0st9hD234FPMQw5ieltkZ5loWU3wyLdc6z0sA4UlhvPAExtMXMxmMv2n8i3
 A+WMRVDVn90+3yPSscdUZh6gpUDPGJ678ot8i1XM8WtGR03yROT4SIXSLTqPj3G9VQH2
 1LyUP4B3ViGmtW5VjDAcB8Kn5WCE95WRtcfaub4htMJSENMVXQK4WK+Gmbkai0jKcq/u
 NInkTkJlHOS6e6uPloUymzc+P8PVdXcHZzKBFhSRXhmWWOm7RbvW8+sElCCqPAowIlMD
 jwKN4iDNcQgmmXFuI+yoit5UmgXeniefc8t3tDbUZ+WUELToiiHaGLTHZNZ0hnptkWNl
 W+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mtxZcIgAgA3zLkRaoKC04cTY8dfapO5EArjpu0qV1nQ=;
 b=EtEoNQM3nSp5/rJBEyHKm+4p4D6V05IPKXQpaf80nmT19Iv1JpjbT520JCkjo7ijZI
 9GvRbbIOce3yDE95lMCVwhYognwYm2NlT5HDv9FzsU+mhRMhxxITtYNmV+eeP2FWkdST
 6vmSHt0lWQvHGxMNop0TdsKBOGGOcPVObn5uRVYc4ZS5rOvAmEh427sRiNp+ymNMceD/
 Ppn2cvnj4KpjIbmBw9XdgF3PAWpgl6LdGoiKCkFUaov7nSn6DOM5mVArdhbYkwCdQxYB
 mrzdDyDyBHC48qKYKxHrdVvBOR5gVD3UTVYgjyUi6beulUvr56Sm+11yL4+Llu32en5N
 oUiw==
X-Gm-Message-State: AJIora/j7wKLYmAUoGrDhX+jKNAnAC2d+sWJxKYpbu5ndQuY2BvWuRtm
 lULubBQzCeoC9+Gzkz3829ME6w==
X-Google-Smtp-Source: AGRyM1ujhRM4Xf+YbZwPbsaoHq6U4LDWqyqHriYJBzf/CcjQE3gtmMegbECMj3fczWo1Gmi9uoQ4dQ==
X-Received: by 2002:a17:90a:d195:b0:1ee:dd88:4ea2 with SMTP id
 fu21-20020a17090ad19500b001eedd884ea2mr9263544pjb.133.1656385031086; 
 Mon, 27 Jun 2022 19:57:11 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 8-20020aa79208000000b0050dc76281e0sm3764604pfo.186.2022.06.27.19.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 19:57:10 -0700 (PDT)
Message-ID: <bcf9acb8-d83c-a5fa-02da-eff9d5bab204@ozlabs.ru>
Date: Tue, 28 Jun 2022 12:57:06 +1000
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
 <6fca16ae-5df2-0bc3-8a98-0d31594f89a9@ozlabs.ru>
 <68899a51-f375-38ad-3196-d7d9c557f5c6@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <68899a51-f375-38ad-3196-d7d9c557f5c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102e.google.com
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



On 6/28/22 04:04, Daniel Henrique Barboza wrote:
> 
> 
> On 6/27/22 01:54, Alexey Kardashevskiy wrote:
>>
>>
>> On 6/25/22 06:12, Daniel Henrique Barboza wrote:
>>> Alexey,
>>>
>>> The newer version of this patch is having trouble with Gitlab 
>>> runners, as
>>> you can read in my feedback there.
>>>
>>> I've tested this one just in case. The same problems happen. E.g. for 
>>> the
>>> cross-armel-system runner:
>>>
>>>
>>> In file included from ../hw/intc/pnv_xive.c:14:
>>> ../hw/intc/pnv_xive.c: In function ‘pnv_xive_block_id’:
>>> /builds/danielhb/qemu/target/ppc/cpu.h:45:33: error: conversion from 
>>> ‘long long unsigned int’ to ‘long unsigned int’ changes value from 
>>> ‘4222124650659840’ to ‘0’ [-Werror=overflow]
>>>     45 | #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) 
>>> | PPC_BIT(bs))
>>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> /builds/danielhb/qemu/target/ppc/cpu.h:51:42: note: in definition of 
>>> macro ‘GETFIELD’
>>>     51 |     (((word) & (mask)) >> __builtin_ctzl(mask))
>>>        |                                          ^~~~
>>> ../hw/intc/pnv_xive_regs.h:77:41: note: in expansion of macro 
>>> ‘PPC_BITMASK’
>>>     77 | #define  PC_TCTXT_CHIPID                PPC_BITMASK(12, 15)
>>>        |                                         ^~~~~~~~~~~
>>> ../hw/intc/pnv_xive.c:80:24: note: in expansion of macro 
>>> ‘PC_TCTXT_CHIPID’
>>>     80 |         blk = GETFIELD(PC_TCTXT_CHIPID, cfg_val);
>>>        |                        ^~~~~~~~~~~~~~~
>>> ../hw/intc/pnv_xive.c: In function ‘pnv_xive_vst_addr’:
>>> /builds/danielhb/qemu/target/ppc/cpu.h:45:33: error: conversion from 
>>> ‘long long unsigned int’ to ‘long unsigned int’ changes value from 
>>> ‘13835058055282163712’ to ‘0’ [-Werror=overflow]
>>>     45 | #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) 
>>> | PPC_BIT(bs))
>>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> /builds/danielhb/qemu/target/ppc/cpu.h:51:42: note: in definition of 
>>> macro ‘GETFIELD’
>>>     51 |     (((word) & (mask)) >> __builtin_ctzl(mask))
>>>        |                                          ^~~~
>>> ../hw/intc/pnv_xive_regs.h:230:33: note: in expansion of macro 
>>> ‘PPC_BITMASK’
>>>    230 | #define VSD_MODE                PPC_BITMASK(0, 1)
>>>        |                                 ^~~~~~~~~~~
>>> ../hw/intc/pnv_xive.c:226:18: note: in expansion of macro ‘VSD_MODE’
>>>    226 |     if (GETFIELD(VSD_MODE, vsd) == VSD_MODE_FORWARD) {
>>>        |                  ^~~~~~~~
>>> ../hw/intc/pnv_xive.c: In function ‘pnv_xive_end_update’:
>>>
>>>
>>> Link:
>>>
>>> https://gitlab.com/danielhb/qemu/-/jobs/2637716673
>>>
>>>
>>> I don´t know how to deal with that.
>>>
>>>
>>> For the record: if this is too troublesome to fix, I am ok with just 
>>> consolidating
>>> the GETFIELD and SETFIELD inlines we already have, under cpu.h, 
>>> keeping them exactly
>>> as they are today (functions, not macros).
>>>
>>>
>>> Thanks,
>>>
>>>
>>> Daniel
>>>
>>>
>>>
>>> On 6/17/22 03:07, Alexey Kardashevskiy wrote:
>>>> It keeps repeating, move it to the header. This uses 
>>>> __builtin_ctzl() to
>>>> allow using the macros in #define.
>>>>
>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> ---
>>>>   include/hw/pci-host/pnv_phb3_regs.h | 16 ----------------
>>>>   target/ppc/cpu.h                    |  5 +++++
>>>>   hw/intc/pnv_xive.c                  | 20 --------------------
>>>>   hw/intc/pnv_xive2.c                 | 20 --------------------
>>>>   hw/pci-host/pnv_phb4.c              | 16 ----------------
>>>>   5 files changed, 5 insertions(+), 72 deletions(-)
>>>>
>>>> diff --git a/include/hw/pci-host/pnv_phb3_regs.h 
>>>> b/include/hw/pci-host/pnv_phb3_regs.h
>>>> index a174ef1f7045..38f8ce9d7406 100644
>>>> --- a/include/hw/pci-host/pnv_phb3_regs.h
>>>> +++ b/include/hw/pci-host/pnv_phb3_regs.h
>>>> @@ -12,22 +12,6 @@
>>>>   #include "qemu/host-utils.h"
>>>> -/*
>>>> - * QEMU version of the GETFIELD/SETFIELD macros
>>>> - *
>>>> - * These are common with the PnvXive model.
>>>> - */
>>>> -static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
>>>> -{
>>>> -    return (word & mask) >> ctz64(mask);
>>>> -}
>>>> -
>>>> -static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
>>>> -                                uint64_t value)
>>>> -{
>>>> -    return (word & ~mask) | ((value << ctz64(mask)) & mask);
>>>> -}
>>>> -
>>>>   /*
>>>>    * PBCQ XSCOM registers
>>>>    */
>>>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>>>> index 6d78078f379d..9a1f1e9999a3 100644
>>>> --- a/target/ppc/cpu.h
>>>> +++ b/target/ppc/cpu.h
>>>> @@ -47,6 +47,11 @@
>>>>                                    PPC_BIT32(bs))
>>>>   #define PPC_BITMASK8(bs, be)    ((PPC_BIT8(bs) - PPC_BIT8(be)) | 
>>>> PPC_BIT8(bs))
>>>> +#define GETFIELD(mask, word)   \
>>>> +    (((word) & (mask)) >> __builtin_ctzl(mask))
>>
>>
>> Replacing __builtin_ctzl with __builtin_ctzll seems fixing it though, 
>> do you have a quick way to test this? Gitlab's CI takes time :)
>> https://gitlab.com/aik1/qemu/-/pipelines/573497191 is the current run.
>> Thanks,
> 
> This worked for me as well.
> 
> Can you re-send this patch with this fix plus the extra comment Peter 
> mentioned
> in his review?
> 
> ----
> Can we retain the explanatory comment that says why we don't
> use the standard QEMU mechanism for field extraction
> (ie the FIELD_EX*/FIELD_DP* macros and the extract64()/deposit64()
> functions) ?
> ------
> 
> 
> You can re-send this as v4 (I'm assuming that we're giving up trying to 
> copy
> the Skiboot macros) and


Sure, will do.

> then I'll take the patch together with the watchdog
> v3 implementation.

The watchdog patch is not using these macros anymore, I moved to QEMU's 
macros, this is why separate patches. Thanks,


> 
> 
> Thanks,
> 
> Daniel
> 
>>
>>

-- 
Alexey

