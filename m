Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF2D6531E4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:38:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7z7w-0001T5-Vo; Wed, 21 Dec 2022 08:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7z7c-0001Sg-1u; Wed, 21 Dec 2022 08:27:00 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7z7a-00080f-2r; Wed, 21 Dec 2022 08:26:59 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1443a16b71cso19090152fac.13; 
 Wed, 21 Dec 2022 05:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sfAx5V1o1e/QdKHDl+1bc+xUXDa6fYhV+plOxuA3aLU=;
 b=TB1ijPDYtOSaO3IZyGxMDT/6TdAnpolPx4fLsdc8SA71rFwP1skxv4IsCc55qHIxu+
 NClrSfUmJOlZeHUR3QkbC54WbwdOFMDhsQ6zIn/FCHGDle0mrScIiCHPOgbRulCG4xj/
 7vMT3GCKx88q0S1cTCsvI68p/mgmKd8r/qhOJ2ntPBv06dg6zzHhVRbhugcoqPXD08gP
 rzfzIf+ql8UTAL54vWTUIhOljBMw1VEAyOcZmlM2f1aC7lzis1qIt/bchYqB14n4Mw+g
 X4tRLY/lJzvlvgtAJW3/eZOa380HOOelg6Qo+Gu8rQYwLodrnu+ivY1OhMQH7NYbEwhT
 KK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sfAx5V1o1e/QdKHDl+1bc+xUXDa6fYhV+plOxuA3aLU=;
 b=RCTovuqz+fwMuqj2kGzzJkSILATMAZa7m7sOh5JkrGnRg257NyzHgpxt80FOuBSp2M
 +N50yrH4Evlq+xk6V71k92sw83sjv+LCG6/dO0t+ohcoAbzMZCLUH4Qkzy6PgF8Pzw0Z
 LskK5bOH+nffEKvddXuobo3SALR16v5MbB9BsoYWqYwTZWlBofzKagN94tdoVLhI6V7k
 O32uk7m2Tt+5zWAMhl2WtWyeYAp+7B4V4+/0goy6iSuq6JwUlWqZXwKzCiwa9v8/dwGS
 xCUkCkbudl8YrseT7/Ck5OG8QDYnLnx13Qe+MWCr6SAsbn2UiIo1N3ymiktw9uP1exKF
 9IZQ==
X-Gm-Message-State: AFqh2kobPewgPtVdw0Ss3JLwqb5nlsW8K+lmidGS+/w5YVbLnzK9PuMV
 QM4+gj1dICInC4N/Qksose0=
X-Google-Smtp-Source: AMrXdXtIWCAc/Brt99I1yXYQ8Xd5LCkRdCPuf4H7uKUWRmqQjsFd1UpmWmuwoIruy1wunRiRtqjyZQ==
X-Received: by 2002:a05:6871:458f:b0:144:df53:a4f6 with SMTP id
 nl15-20020a056871458f00b00144df53a4f6mr742685oab.10.1671629216186; 
 Wed, 21 Dec 2022 05:26:56 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 i3-20020a056870890300b001446d5702b5sm7193582oao.56.2022.12.21.05.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 05:26:55 -0800 (PST)
Message-ID: <7c67f0e8-f7b7-8d0d-ba72-06cd2c8d29d3@gmail.com>
Date: Wed, 21 Dec 2022 10:26:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH-for-8.0 4/4] hw/ppc/spapr_ovec: Avoid target_ulong
 spapr_ovec_parse_vector()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221213123550.39302-1-philmd@linaro.org>
 <20221213123550.39302-5-philmd@linaro.org>
 <c871b044-4241-2f02-ebd6-6b797663a140@gmail.com>
 <5f70da81-2854-766f-1804-59a037a605b8@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <5f70da81-2854-766f-1804-59a037a605b8@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.148,
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



On 12/21/22 06:46, Cédric Le Goater wrote:
> On 12/16/22 17:47, Daniel Henrique Barboza wrote:
>>
>>
>> On 12/13/22 09:35, Philippe Mathieu-Daudé wrote:
>>> spapr_ovec.c is a device, but it uses target_ulong which is
>>> target specific. The hwaddr type (declared in "exec/hwaddr.h")
>>> better fits hardware addresses.
>>
>> As said by Harsh, spapr_ovec is in fact a data structure that stores platform
>> options that are supported by the guest.
>>
>> That doesn't mean that I oppose the change made here. Aside from semantics - which
>> I also don't have a strong opinion about it - I don't believe it matters that
>> much - spapr is 64 bit only, so hwaddr will always be == target_ulong.
>>
>> Cedric/David/Greg, let me know if you have any restriction/thoughts about this.
>> I'm inclined to accept it as is.
> 
> Well, I am not sure.
> 
> The vector table variable is the result of a ppc64_phys_to_real() conversion
> of the CAS hcall parameter, which is a target_ulong, but ppc64_phys_to_real()
> returns a uint64_t.
> 
> The code is not consistent in another places :
> 
>    hw/ppc/spapr_tpm_proxy.c uses a uint64_t
>    hw/ppc/spapr_hcall.c, a target_ulong
>    hw/ppc/spapr_rtas.c, a hwaddr
>    hw/ppc/spapr_drc.c, a hwaddr indirectly
> 
> Should we change ppc64_phys_to_real() to return an hwaddr (also) ?

It makes sense to me a function called ppc64_phys_to_real() returning
a hwaddr type.

Daniel


> 
> C.
> 
> 
>>
>>
>> Daniel
>>
>>>
>>> Change spapr_ovec_parse_vector() to take a hwaddr argument,
>>> allowing the removal of "cpu.h" in a device header.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/ppc/spapr_ovec.c         | 3 ++-
>>>   include/hw/ppc/spapr_ovec.h | 4 ++--
>>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
>>> index b2567caa5c..a18a751b57 100644
>>> --- a/hw/ppc/spapr_ovec.c
>>> +++ b/hw/ppc/spapr_ovec.c
>>> @@ -19,6 +19,7 @@
>>>   #include "qemu/error-report.h"
>>>   #include "trace.h"
>>>   #include <libfdt.h>
>>> +#include "cpu.h"
>>>   #define OV_MAXBYTES 256 /* not including length byte */
>>>   #define OV_MAXBITS (OV_MAXBYTES * BITS_PER_BYTE)
>>> @@ -176,7 +177,7 @@ static target_ulong vector_addr(target_ulong table_addr, int vector)
>>>       return table_addr;
>>>   }
>>> -SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector)
>>> +SpaprOptionVector *spapr_ovec_parse_vector(hwaddr table_addr, int vector)
>>>   {
>>>       SpaprOptionVector *ov;
>>>       target_ulong addr;
>>> diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
>>> index c3e8b98e7e..d756b916e4 100644
>>> --- a/include/hw/ppc/spapr_ovec.h
>>> +++ b/include/hw/ppc/spapr_ovec.h
>>> @@ -37,7 +37,7 @@
>>>   #ifndef SPAPR_OVEC_H
>>>   #define SPAPR_OVEC_H
>>> -#include "cpu.h"
>>> +#include "exec/hwaddr.h"
>>>   typedef struct SpaprOptionVector SpaprOptionVector;
>>> @@ -73,7 +73,7 @@ void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
>>>   void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
>>>   bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
>>>   bool spapr_ovec_empty(SpaprOptionVector *ov);
>>> -SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector);
>>> +SpaprOptionVector *spapr_ovec_parse_vector(hwaddr table_addr, int vector);
>>>   int spapr_dt_ovec(void *fdt, int fdt_offset,
>>>                     SpaprOptionVector *ov, const char *name);
> 

