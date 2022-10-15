Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40295FF9FC
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 14:10:05 +0200 (CEST)
Received: from localhost ([::1]:60722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojfzQ-0006iH-Cm
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 08:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ojftQ-0001pT-Vv; Sat, 15 Oct 2022 08:03:55 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:46743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ojftL-0006YY-85; Sat, 15 Oct 2022 08:03:50 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 101-20020a9d0bee000000b00661b54d945fso3305081oth.13; 
 Sat, 15 Oct 2022 05:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iNt484bi6sLxS5IsEk6kBx5O1lk2kCxdU7ePEGnwwkU=;
 b=LJCEjMq9Jj+E4pc+sH1DeJa2qAcDWxL6sz1tjTkH0iUQsqxHOt4mAI7vpvSX1ziP6B
 DcbAr6j3v04gHvcp0gIWTy9AKVrP8Db6W6pYflCeePA8K0FRu/qVHLXlzlBCE/zgz3Og
 X1zO1QKM5HX0SQ3UJIIlTD5AsAqBe4Mqu6qzSHXOWqcyvxqtARS89XZvkIgjFKvury3B
 XpvxBwqrv9CTQ9oHqYupPlCjFJCbDWM5hpRJQQEy/ls7c/RbFP/UyZ35Xy0M30t+tg2y
 SkaE9NnnaOSY/i2eXPhOwRtxhoz5Xj5PKwBGEXHpNAXM5mXqw7zzumjno9XA+OZRDbW6
 lYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iNt484bi6sLxS5IsEk6kBx5O1lk2kCxdU7ePEGnwwkU=;
 b=1u2td6MAmOArEqRSubWqEU+WNfIOoDBXNbt919qfv8MIeOd7B8GQcOLFrqkUGztZyy
 Pcb9AhMnafg6UXU7hI0Rdsync0mPtfb6DeZZElRKESX14y0Cu1eLiNU7e0B79zTTrOxE
 sLxVqusEmGSO1O1n8hOPnGoMxvxrx2DICW2u7mJiKZu6FeGe6MxmfFx+dJGnmI2SIpwg
 ieB+fxvIwCclIkpNkRqws87EH1yH6KXenRErBeYLPDXyx/jZSblpIpx92+VYr8ecX2KU
 ttBEa74naFTegdKbDn4F7x37I06IJ3Eu/bQWXgOkOmHUbN9At+8qKeoK/BpmnpnM2Ghl
 0LRw==
X-Gm-Message-State: ACrzQf3RsR/smNoC1o3SxDUcjvkGSHHG0FCNT0ws0ymJ9N2lo8Aid3F/
 F/3Lir3Qa17qI23WVOSsgOw=
X-Google-Smtp-Source: AMsMyM5e+SUcT/lOyegCnfNzFLb7dLq94UXEymGdQrrFQ559VajgDLi0Lj+y+XTTrvm8TQb6+qc1zQ==
X-Received: by 2002:a9d:6e15:0:b0:661:89dd:7a0a with SMTP id
 e21-20020a9d6e15000000b0066189dd7a0amr1106730otr.239.1665835424729; 
 Sat, 15 Oct 2022 05:03:44 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a056830245100b006393ea22c1csm2395894otr.16.2022.10.15.05.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Oct 2022 05:03:44 -0700 (PDT)
Message-ID: <43741d8a-eaf2-6d8c-9df7-b650ce59fb0e@gmail.com>
Date: Sat, 15 Oct 2022 09:03:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 14/25] ppc440_sdram: Move RAM size check to
 ppc440_sdram_init
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1664021647.git.balaton@eik.bme.hu>
 <41da3797392acaacc7963b79512c8af8005fa4b0.1664021647.git.balaton@eik.bme.hu>
 <d6be8094-3ab9-58e5-c4ac-a767f552e8e3@gmail.com>
 <81d25c94-ebd5-8a1-37d7-8e82b1523fa@eik.bme.hu>
 <ae017250-f2e2-9a26-8d7f-83e5614122f8@gmail.com>
 <9ad2dd14-f145-ad9c-9419-c2afd19c442@eik.bme.hu>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <9ad2dd14-f145-ad9c-9419-c2afd19c442@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.961,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/15/22 08:40, BALATON Zoltan wrote:
> On Sat, 15 Oct 2022, Daniel Henrique Barboza wrote:
>> On 10/14/22 19:52, BALATON Zoltan wrote:
>>> On Fri, 14 Oct 2022, Daniel Henrique Barboza wrote:
>>>> Zoltan,
>>>>
>>>> Gitlab didn't like this patch. It broke all 32 bits builds due to an overflow
>>>> down there:
>>>>
>>>> On 9/24/22 09:28, BALATON Zoltan wrote:
>>>>> Move the check for valid memory sizes from board to sdram controller
>>>>> init. This adds the missing valid memory sizes of 4 GiB, 16 and 8 MiB
>>>>> to the DoC and the board now only checks for additional restrictions
>>>>> imposed by its firmware then sdram init checks for valid sizes for SoC.
>>>>>
>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>> ---
>>>>>   hw/ppc/ppc440.h    |  4 ++--
>>>>>   hw/ppc/ppc440_uc.c | 15 +++++++--------
>>>>>   hw/ppc/sam460ex.c  | 32 +++++++++++++++++---------------
>>>>>   3 files changed, 26 insertions(+), 25 deletions(-)
>>>>>
>>>>> diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
>>>>> index 01d76b8000..29f6f14ed7 100644
>>>>> --- a/hw/ppc/ppc440.h
>>>>> +++ b/hw/ppc/ppc440.h
>>>>> @@ -11,13 +11,13 @@
>>>>>   #ifndef PPC440_H
>>>>>   #define PPC440_H
>>>>>   -#include "hw/ppc/ppc4xx.h"
>>>>> +#include "hw/ppc/ppc.h"
>>>>>     void ppc4xx_l2sram_init(CPUPPCState *env);
>>>>>   void ppc4xx_cpr_init(CPUPPCState *env);
>>>>>   void ppc4xx_sdr_init(CPUPPCState *env);
>>>>>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
>>>>> -                       Ppc4xxSdramBank *ram_banks);
>>>>> +                       MemoryRegion *ram);
>>>>>   void ppc4xx_ahb_init(CPUPPCState *env);
>>>>>   void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
>>>>>   void ppc460ex_pcie_init(CPUPPCState *env);
>>>>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>>>>> index edd0781eb7..2b9d666b71 100644
>>>>> --- a/hw/ppc/ppc440_uc.c
>>>>> +++ b/hw/ppc/ppc440_uc.c
>>>>> @@ -487,7 +487,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
>>>>>   typedef struct ppc440_sdram_t {
>>>>>       uint32_t addr;
>>>>>       uint32_t mcopt2;
>>>>> -    int nbanks;
>>>>> +    int nbanks; /* Banks to use from the 4, e.g. when board has less slots */
>>>>>       Ppc4xxSdramBank bank[4];
>>>>>   } ppc440_sdram_t;
>>>>>   @@ -733,18 +733,17 @@ static void sdram_ddr2_reset(void *opaque)
>>>>>   }
>>>>>     void ppc440_sdram_init(CPUPPCState *env, int nbanks,
>>>>> -                       Ppc4xxSdramBank *ram_banks)
>>>>> +                       MemoryRegion *ram)
>>>>>   {
>>>>>       ppc440_sdram_t *s;
>>>>> -    int i;
>>>>> +    const ram_addr_t valid_bank_sizes[] = {
>>>>> +        4 * GiB, 2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
>>>>
>>>>
>>>> ^ here. ram_addr_t will be a 32 bit var in a 32 bit host, and assigning 4 * GiB will
>>>> overflow it back to zero.
>>>>
>>>> Here's the Gitlab error from the 'cross-win32-system' runner:
>>>>
>>>> FAILED: libqemu-ppc64-softmmu.fa.p/hw_ppc_ppc440_uc.c.obj
>>>> 2725i686-w64-mingw32-gcc -m32 -Ilibqemu-ppc64-softmmu.fa.p -I. -I.. -Itarget/ppc -I../target/ppc -I../dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader -I/usr/i686-w64-mingw32/sys-root/mingw/include/pixman-1 -I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -iquote . -iquote /builds/danielhb/qemu -iquote /builds/danielhb/qemu/include -iquote /builds/danielhb/qemu/tcg/i386 -mms-bitfields -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fno-pie -no-pie -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 
>>>> -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -DNEED_CPU_H '-DCONFIG_TARGET="ppc64-softmmu-config-target.h"' '-DCONFIG_DEVICES="ppc64-softmmu-config-devices.h"' -MD -MQ libqemu-ppc64-softmmu.fa.p/hw_ppc_ppc440_uc.c.obj -MF libqemu-ppc64-softmmu.fa.p/hw_ppc_ppc440_uc.c.obj.d -o libqemu-ppc64-softmmu.fa.p/hw_ppc_ppc440_uc.c.obj -c ../hw/ppc/ppc440_uc.c
>>>> 2726../hw/ppc/ppc440_uc.c: In function 'ppc4xx_sdram_ddr2_realize':
>>>> 2727../hw/ppc/ppc440_uc.c:729:9: error: unsigned conversion from 'long long int' to 'unsigned int' changes value from '4294967296' to '0' [-Werror=overflow]
>>>> 2728  729 |         4 * GiB, 2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
>>>> 2729      |         ^
>>>> 2730cc1: all warnings being treated as errors
>>>> 2731
>>>>
>>>> A quick fix that I can make in-tree is to avoid the overflow by doing (4 * GiB) - 1.
>>>> But since this might affect some logic in the model I figured I should ask you
>>>> first.
>>>
>>> I think in that case we can just drop the 4*GiB value from the valid_bank_sizes[] array for now because while it's valid for the SoC the sam460ex firmware also has problems with it so having 2 GiB as largest value is OK.
>>
>> Got it.
>>
>>> Can you change the patch accordingly or should I send an updated version with this change?
>>
>> I'll fix it in-tree, no need to re-send. I'll also amend the commit msg
>> accordingly.
> 
> Thank you for taking care of it.
> 
>> Do you want a TODO marker in that line mentioning that we're pending
>> support for the 4GiB value?
> 
> Up to you, maybe does not need to be TODO just a comment saying
> 
> /* SoC also has 4 GiB but that causes problem with 32 bit build */

Got it.

Patch was amended by removing the 4*Gib size and adding the following comment
in valid_bank_sizes:

     /*
      * SoC also has 4 GiB but that causes problem with 32 bit
      * builds (4*GiB overflows the 32 bit ram_addr_attr).
      */


Thanks,


Daniel

> 
> or something like that which is enough to remind why it's missing.
> 
> Regards,
> BALATON Zoltan

