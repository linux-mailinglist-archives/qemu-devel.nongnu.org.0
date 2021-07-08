Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D73BF6EA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 10:33:15 +0200 (CEST)
Received: from localhost ([::1]:48850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1PT8-0002iA-6q
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 04:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1PSG-000219-Q7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:32:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1PSF-0004Qb-6S
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:32:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so3426780wms.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 01:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TfVKzjZOfg1kRWMydx0p+soilkjSFL5ekN7mSt1x61w=;
 b=cSwCCZcl2u1iRKouD5XPFiyqYRjVnS+mVeaYEDL3+6HLcQ2UZej2lLdD1U2LYbJred
 /4HQXZ7SZJGfXIMMg42ZF/eRHjeFJz1EL3iakWI+3fd4k7guWBaWaMoTJ7ovgC+iRkdC
 DOEFURpYSWiG+G0sQOR5xQlEo87ghQ/Xod4S7EwIrHvKtSlTlMOsXqNwUbzglKMoZYl1
 oeGhjBlAtLKSHaOVwvWaufOpjUsma1N2NZD3xh3zLCWJI7o/h1dEMb8mqUA/dzJRgUIe
 kLntsQVn9qM6qhnGESu8lTfZ5R5tIhHFCIba+bK50iX9LGhwU7ql4Cm6zIFeT/i1bfPW
 rjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TfVKzjZOfg1kRWMydx0p+soilkjSFL5ekN7mSt1x61w=;
 b=KWxVRaSYD8GJX4qSPme+6eFKlzBRsbYQH8uBSptumx0lHD2rV3S7K96+295TLt0fbq
 PCexo2tnCTmT5sZ3DDj/MSmQiVuGYozjmoXGOcQJyUWqnbPcL2H2kRP0hR8u5a11/XJc
 ZPTQsPVyfEEPH0kzYLPp+6nai3FTyuaRJBfCrIwJze75BtrA3Fpz1H7gGwZJIBGiJUH3
 vXgK6kQhN3xUH9EM7qJ4UexzZ/y4cjIolOZhY4y2/A4n6GyJ2PM68x3pvykwskInpzSl
 Wbg0iEiYmp4mCpd3RAFpv90G+U2ZtH1c/NIFi7Cjo7v/TX1YnEEATasyB8NqLL8LvUpo
 nGBA==
X-Gm-Message-State: AOAM5306QQHeuQNTMv5ngfcxPsfZy9u+BOnZ0VG2Engc6gxaVLWKXC7+
 UOHbx0rpKgRKrwZaRhAWDP0=
X-Google-Smtp-Source: ABdhPJzYdQPuPZzAwueJzkeFzCLOTwfFY4limTXKyOfybPkPHXKPGqAm/YAzM7o1CvdIsVG8C+5IGg==
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr31057391wmb.39.1625733137490; 
 Thu, 08 Jul 2021 01:32:17 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n18sm7365988wms.3.2021.07.08.01.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 01:32:16 -0700 (PDT)
Subject: Re: [PATCH 05/12] linux-user: Extract target errno to
 'target_errno_defs.h'
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-6-f4bug@amsat.org>
 <11e451c0-dfc7-5709-9441-28da39b237e6@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1a4beab8-aa19-ed90-3091-7717ab7d5f21@amsat.org>
Date: Thu, 8 Jul 2021 10:32:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <11e451c0-dfc7-5709-9441-28da39b237e6@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Helge Deller <deller@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 3:53 AM, Richard Henderson wrote:
> On 7/4/21 11:37 AM, Philippe Mathieu-Daudé wrote:
>> We want to access the target errno indepently of the rest
>> of the linux-user code. Extract it to a new target-specific
>> header: 'target_errno_defs.h'.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   linux-user/aarch64/target_errno_defs.h    | 6 ++++++
>>   linux-user/alpha/target_errno_defs.h      | 4 ++++
>>   linux-user/arm/target_errno_defs.h        | 6 ++++++
>>   linux-user/cris/target_errno_defs.h       | 6 ++++++
>>   linux-user/errno_defs.h                   | 3 +++
>>   linux-user/hexagon/target_errno_defs.h    | 6 ++++++
>>   linux-user/hppa/target_errno_defs.h       | 4 ++++
>>   linux-user/i386/target_errno_defs.h       | 6 ++++++
>>   linux-user/m68k/target_errno_defs.h       | 6 ++++++
>>   linux-user/microblaze/target_errno_defs.h | 6 ++++++
>>   linux-user/mips/target_errno_defs.h       | 4 ++++
>>   linux-user/mips64/target_errno_defs.h     | 4 ++++
>>   linux-user/nios2/target_errno_defs.h      | 6 ++++++
>>   linux-user/openrisc/target_errno_defs.h   | 6 ++++++
>>   linux-user/ppc/target_errno_defs.h        | 6 ++++++
>>   linux-user/riscv/target_errno_defs.h      | 6 ++++++
>>   linux-user/s390x/target_errno_defs.h      | 6 ++++++
>>   linux-user/sh4/target_errno_defs.h        | 6 ++++++
>>   linux-user/sparc/target_syscall.h         | 2 --
>>   linux-user/x86_64/target_errno_defs.h     | 6 ++++++
>>   linux-user/xtensa/target_errno_defs.h     | 6 ++++++
>>   21 files changed, 109 insertions(+), 2 deletions(-)
>>   create mode 100644 linux-user/aarch64/target_errno_defs.h
>>   create mode 100644 linux-user/alpha/target_errno_defs.h
>>   create mode 100644 linux-user/arm/target_errno_defs.h
>>   create mode 100644 linux-user/cris/target_errno_defs.h
>>   create mode 100644 linux-user/hexagon/target_errno_defs.h
>>   create mode 100644 linux-user/hppa/target_errno_defs.h
>>   create mode 100644 linux-user/i386/target_errno_defs.h
>>   create mode 100644 linux-user/m68k/target_errno_defs.h
>>   create mode 100644 linux-user/microblaze/target_errno_defs.h
>>   create mode 100644 linux-user/mips/target_errno_defs.h
>>   create mode 100644 linux-user/mips64/target_errno_defs.h
>>   create mode 100644 linux-user/nios2/target_errno_defs.h
>>   create mode 100644 linux-user/openrisc/target_errno_defs.h
>>   create mode 100644 linux-user/ppc/target_errno_defs.h
>>   create mode 100644 linux-user/riscv/target_errno_defs.h
>>   create mode 100644 linux-user/s390x/target_errno_defs.h
>>   create mode 100644 linux-user/sh4/target_errno_defs.h
>>   create mode 100644 linux-user/x86_64/target_errno_defs.h
>>   create mode 100644 linux-user/xtensa/target_errno_defs.h
>>
>> diff --git a/linux-user/aarch64/target_errno_defs.h
>> b/linux-user/aarch64/target_errno_defs.h
>> new file mode 100644
>> index 00000000000..a809381165a
>> --- /dev/null
>> +++ b/linux-user/aarch64/target_errno_defs.h
>> @@ -0,0 +1,6 @@
>> +#ifndef AARCH64_TARGET_ERRNO_H
>> +#define AARCH64_TARGET_ERRNO_H
>> +
>> +/* Target uses generic errno */
>> +
>> +#endif
> 
> This could be better.
> 
> Consider e.g. termbits.h as the model.

Thanks for the tip!

> These targets should have exactly one line:
> 
> #include "../generic/target_errno.h"
> 
>> diff --git a/linux-user/alpha/target_errno_defs.h
>> b/linux-user/alpha/target_errno_defs.h
>> new file mode 100644
>> index 00000000000..13770b14b82
>> --- /dev/null
>> +++ b/linux-user/alpha/target_errno_defs.h
>> @@ -0,0 +1,4 @@
>> +#ifndef ALPHA_TARGET_ERRNO_H
>> +#define ALPHA_TARGET_ERRNO_H
>> +
>> +#endif
> 
> This one, and ones like it, become
> 
> #ifndef ALPHA_TARGET_ERRNO_H
> #define ALPHA_TARGET_ERRNO_H
> 
> #include "../generic/target_errno.h"
> 
> #undef  TARGET_EBAR
> #define TARGET_EBAR  xxx
> ...
> 
> #endif
> 
> 
> r~
> 

