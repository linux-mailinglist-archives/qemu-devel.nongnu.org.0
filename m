Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4779C304F51
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 04:05:40 +0100 (CET)
Received: from localhost ([::1]:56986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4b9G-0001Xl-H6
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 22:05:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4b7Z-000114-9P
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 22:03:53 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:33145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4b7U-0005t5-G6
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 22:03:53 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 53CE5B81;
 Tue, 26 Jan 2021 22:03:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 26 Jan 2021 22:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=p
 SCSMA99Kf60lL4J2AYE3SLLVkCciT8IyRPmvCA1hlU=; b=N/RzuCLNVh6WOSLol
 SqCV0/orjHZ1wQZYiamb332xBM4SkuAZx97kKfmECz1zr6aOOxYyCxJLXWUOx3/4
 mimxEphIZP8pOmwbbW0kaY51HNw90SFw4PSPFoeu4THPmLkc3WmSbpkPJMfRX+Yn
 yuPfcBs5+dPeJfnxzHQkXRhD7v5XKbVcC36ZDExd+d4nr8/i4umHlr/ApH6zu3s7
 kLcUoI+aPBluMoV8rcZ1fuJB1fJap4A6gngi9Mr3BGB0w/6wMsRUHEVAA6ZPdf7q
 kCxV4fG/MZcAh60lk0HVBXjCbLst91/F2f4jDLHy2kWfNrDClcZAg5B6c4rStckv
 /SIbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=pSCSMA99Kf60lL4J2AYE3SLLVkCciT8IyRPmvCA1h
 lU=; b=EnjIey01Zb21TqShrIq4ZfNOp22Ex9T86juhwII0k3ZsvDReTY94XaDH4
 2NXnEJk8Yg0IkgNSVnWzbcnl7T5CpQULyMY06hmDY1e6P8ApD+RS/BKizC/oMvqX
 PoPtYQzU3Hpkhw/UpKBrK8BHcfdb6J8XLjcFyeX+ettntT7yIE+UGXIYLVifDLGu
 SG2lax4zbIuVogTjL5/x+9lyUQc4wCSmZzDO4doI+vOPaPYUKIdAqARoY/jHCxok
 fuKItL8Rxnra6XRO2tlE4ZDWEcLxzLQnW9Wsh8zdAoVLrFQ2T5FPdta72YO3xZBH
 MkR3N1fnw6CSzVKZb2Sgu4gPJyP9Q==
X-ME-Sender: <xms:D9gQYB7uM5GUy8NTgO33whw8FQ5gpMgIPTEZFowJ78YE_JpjErozwA>
 <xme:D9gQYO5yqUqmEyDmfayK8dnbdrR0hh1jkHFK2M9ZRNzvL06CtXwXreByg_8QCJVdv
 GXYdpR1REBjk-USbZE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:D9gQYIcbMFYeJks0G0eW3hiENu-H0zpqTEiDBOpgic7boMTfGcieyQ>
 <xmx:D9gQYKJujqJOSYRYeuTjw63vZLSnw2PQY5HutXNhBAP9ziDAqcPDbg>
 <xmx:D9gQYFJrpuOFf18Kicj-aGQGExkeK6uQjYKlTrmEeOD3qLayxyY0jA>
 <xmx:ENgQYMXQwOL9Cmr05Ayntx8yShoyL2ur6v8ccboYH9e_WZMQ7-Sd6lSR5zw>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFE71108005F;
 Tue, 26 Jan 2021 22:03:41 -0500 (EST)
Subject: Re: [PATCH v2 5/8] hw/mips: Use bl_gen_kernel_jump to generate
 bootloaders
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064507.30148-2-jiaxun.yang@flygoat.com>
 <7dac375f-0cc8-7855-4578-e54b319bd2af@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <5a22bbe1-5023-6fc3-a41b-8d72ec2bb4a1@flygoat.com>
Date: Wed, 27 Jan 2021 11:03:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <7dac375f-0cc8-7855-4578-e54b319bd2af@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=64.147.123.17;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenhuacai@kernel.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/7 上午1:48, Philippe Mathieu-Daudé 写道:
> +Alex
>
> On 12/15/20 7:45 AM, Jiaxun Yang wrote:
>> Replace embedded binary with generated code.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   hw/mips/boston.c    | 17 ++---------------
>>   hw/mips/fuloong2e.c | 28 ++++------------------------
>>   hw/mips/malta.c     | 41 ++++++++++-------------------------------
>>   3 files changed, 16 insertions(+), 70 deletions(-)
>>
>> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
>> index c3b94c68e1..b622222c7d 100644
>> --- a/hw/mips/boston.c
>> +++ b/hw/mips/boston.c
>> @@ -27,6 +27,7 @@
>>   #include "hw/ide/ahci.h"
>>   #include "hw/loader.h"
>>   #include "hw/loader-fit.h"
>> +#include "hw/mips/bootloader.h"
>>   #include "hw/mips/cps.h"
>>   #include "hw/pci-host/xilinx-pcie.h"
>>   #include "hw/qdev-clock.h"
>> @@ -324,21 +325,7 @@ static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
>>        * a2/$6 = 0
>>        * a3/$7 = 0
>>        */
>> -    stl_p(p++, 0x2404fffe);                     /* li   $4, -2 */
>> -                                                /* lui  $5, hi(fdt_addr) */
>> -    stl_p(p++, 0x3c050000 | ((fdt_addr >> 16) & 0xffff));
>> -    if (fdt_addr & 0xffff) {                    /* ori  $5, lo(fdt_addr) */
>> -        stl_p(p++, 0x34a50000 | (fdt_addr & 0xffff));
>> -    }
>> -    stl_p(p++, 0x34060000);                     /* li   $6, 0 */
>> -    stl_p(p++, 0x34070000);                     /* li   $7, 0 */
>> -
>> -    /* Load kernel entry address & jump to it */
>> -                                                /* lui  $25, hi(kernel_entry) */
>> -    stl_p(p++, 0x3c190000 | ((kernel_entry >> 16) & 0xffff));
>> -                                                /* ori  $25, lo(kernel_entry) */
>> -    stl_p(p++, 0x37390000 | (kernel_entry & 0xffff));
>> -    stl_p(p++, 0x03200009);                     /* jr   $25 */
> Eh, no delay slot NOP :)
>
>> +    bl_gen_jump_kernel(&p, 0, (int32_t)-2, fdt_addr, 0, 0, kernel_entry);
>>   }
>>   
> ...
>
>> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
>> index 9afc0b427b..ffd67b8293 100644
>> --- a/hw/mips/malta.c
>> +++ b/hw/mips/malta.c
>> @@ -37,6 +37,7 @@
>>   #include "hw/i2c/smbus_eeprom.h"
>>   #include "hw/block/flash.h"
>>   #include "hw/mips/mips.h"
>> +#include "hw/mips/bootloader.h"
>>   #include "hw/mips/cpudevs.h"
>>   #include "hw/pci/pci.h"
>>   #include "sysemu/sysemu.h"
>> @@ -844,6 +845,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>>   static void write_bootloader(uint8_t *base, uint64_t run_addr,
>>                                uint64_t kernel_entry)
>>   {
>> +    target_ulong a0;
>>       uint32_t *p;
>>   
>>       /* Small bootloader */
>> @@ -872,30 +874,6 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
>>       /* Second part of the bootloader */
>>       p = (uint32_t *) (base + 0x580);
>>   
>> -    if (semihosting_get_argc()) {
>> -        /* Preserve a0 content as arguments have been passed */
>> -        stl_p(p++, 0x00000000);              /* nop */
>> -    } else {
>> -        stl_p(p++, 0x24040002);              /* addiu a0, zero, 2 */
>> -    }
>> -
>> -    /* lui sp, high(ENVP_VADDR) */
>> -    stl_p(p++, 0x3c1d0000 | (((ENVP_VADDR - 64) >> 16) & 0xffff));
>> -    /* ori sp, sp, low(ENVP_VADDR) */
>> -    stl_p(p++, 0x37bd0000 | ((ENVP_VADDR - 64) & 0xffff));
>> -    /* lui a1, high(ENVP_VADDR) */
>> -    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
>> -    /* ori a1, a1, low(ENVP_VADDR) */
>> -    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
>> -    /* lui a2, high(ENVP_VADDR + 8) */
>> -    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
>> -    /* ori a2, a2, low(ENVP_VADDR + 8) */
>> -    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
>> -    /* lui a3, high(ram_low_size) */
>> -    stl_p(p++, 0x3c070000 | (loaderparams.ram_low_size >> 16));
>> -    /* ori a3, a3, low(ram_low_size) */
>> -    stl_p(p++, 0x34e70000 | (loaderparams.ram_low_size & 0xffff));
>> -
>>       /* Load BAR registers as done by YAMON */
>>       stl_p(p++, 0x3c09b400);                  /* lui t1, 0xb400 */
>>   
>> @@ -947,13 +925,14 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
>>   #endif
>>       stl_p(p++, 0xad280088);                  /* sw t0, 0x0088(t1) */
>>   
>> -    /* Jump to kernel code */
>> -    stl_p(p++, 0x3c1f0000 |
>> -          ((kernel_entry >> 16) & 0xffff));  /* lui ra, high(kernel_entry) */
>> -    stl_p(p++, 0x37ff0000 |
>> -          (kernel_entry & 0xffff));          /* ori ra, ra, low(kernel_entry) */
>> -    stl_p(p++, 0x03e00009);                  /* jalr ra */
>> -    stl_p(p++, 0x00000000);                  /* nop */
>> +    if (semihosting_get_argc()) {
>> +        a0 = 0;
> I never used semihosting with Malta, but it seems you are
> clearing $a0 content.

That's what original code did.
I guess when semihosting is enabled, arguments are going to be
passed by semi-syscall instead of boot registers?

Thanks.

- Jiaxun

>
>> +    } else {
>> +        a0 = 2;
>> +    }
>> +    bl_gen_jump_kernel(&p, ENVP_VADDR - 64, a0, ENVP_VADDR,
>> +                       ENVP_VADDR + 8, loaderparams.ram_low_size,
>> +                       kernel_entry);
>>   
>>       /* YAMON subroutines */
>>       p = (uint32_t *) (base + 0x800);
>>


