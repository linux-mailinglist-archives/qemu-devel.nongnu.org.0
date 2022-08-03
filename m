Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B0588969
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:28:50 +0200 (CEST)
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJAgL-0004A5-DO
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAbR-0007C7-42; Wed, 03 Aug 2022 05:23:47 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:33703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAbO-0001Zp-SK; Wed, 03 Aug 2022 05:23:44 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id q15so1327226vsr.0;
 Wed, 03 Aug 2022 02:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=7oEWcIVoejYc07UamP34Oa32PqbqZkY4JKOQiZfgB6Y=;
 b=Pber1jJNDk9iV0h+xAErGZ1TvA5s6WLl0mO6DkkwmEfSdYrsJIFCkpgnMGKJEMPocn
 TLgl0+tPhVpFZ0h+ig1SXQ3kIeG/MkssFVSmWOsMCWoSEP0r0rZ+vbDFUKWLh27naXs3
 WwNQAVsRblKEmUTXb9CSOgi4GygK51K9scDh26p3TfOS6NReZcohXlDboPlyJctDzqpi
 4DfwRRxQFq4z8AsEHVICb7EoCixf7B2wa8z0KJpWYBy0hnXbV0CQ6QFMdD1FoIOjHfpy
 jdFu9tJzwCRRPWvKeDOqLmMAi3avdkB5cIJ1y2IMiy1Ox7geZCCutrrIlhAjds1GyMpv
 uDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7oEWcIVoejYc07UamP34Oa32PqbqZkY4JKOQiZfgB6Y=;
 b=2erlzUuCEJk6Y0GHjVJisNZ5kY+9VBJ1mSv9ZiuVMn7gGW/q76Z6syE2QT8Fccfw+t
 yVMoQA+Bvu+K14aos9E7mz9mxB9KA2LKUlpFz4/MIYGZQH1dqjp/G1Y2ebq56auW5C/n
 4OguUPf3Lw0/c0j7hZlppRFF4OIRUCI7Zdl+xekSdG347DTH37nBwRlhAggBlz3MO6K4
 wcMXgukz9qXPkGrneUlKYTvw1JxIIUzUKQ1YlTVC+tkYA2mAivOGeiF+PJjVmfBpN7Nl
 4K8iznJOcl+KglZjTb4Muz9xKYn3pPpRjKmkVQJcHxF3ZOg3Ak5HT1Z49HEDPNDcYGrC
 1PaQ==
X-Gm-Message-State: ACgBeo16y+gRbPJwX9EtWQds0BulVdQeq6JQ0Wa3NhG5z9ofKYF7yolg
 Aae0CWTZpN5/1BX6EVyhhTM=
X-Google-Smtp-Source: AA6agR7MLMiM1V6XtaBEPApIwWaAJSiRRXsbM/iEHfM7p2E1uN3P5SZ9w2T4Ly4c3AUgAf61dphcQg==
X-Received: by 2002:a05:6102:1489:b0:35a:1317:7600 with SMTP id
 d9-20020a056102148900b0035a13177600mr4704625vsv.79.1659518621292; 
 Wed, 03 Aug 2022 02:23:41 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 t129-20020a1fc387000000b003763269206dsm9740457vkf.54.2022.08.03.02.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:23:41 -0700 (PDT)
Message-ID: <15b601d1-e18a-d16b-a9dc-a226b479a192@gmail.com>
Date: Wed, 3 Aug 2022 06:23:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 05/19] ppc/ppc405: Start QOMification of the SoC
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-6-clg@kaod.org>
 <e437d81d-37e6-2a31-21e9-0cf7a8be73fd@gmail.com>
 <7abaf022-b2ef-ed5a-be3a-a04c915eb736@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <7abaf022-b2ef-ed5a-be3a-a04c915eb736@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/2/22 18:24, BALATON Zoltan wrote:
> On Tue, 2 Aug 2022, Daniel Henrique Barboza wrote:
>> On 8/1/22 10:10, Cédric Le Goater wrote:
>>> This moves all the code previously done in the ppc405ep_init() routine
>>> under ppc405_soc_realize().
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/ppc/ppc405.h        |  12 ++--
>>>   hw/ppc/ppc405_boards.c |  12 ++--
>>>   hw/ppc/ppc405_uc.c     | 151 ++++++++++++++++++++---------------------
>>>   3 files changed, 84 insertions(+), 91 deletions(-)
>>>
>>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>>> index c8cddb71733a..5e4e96d86ceb 100644
>>> --- a/hw/ppc/ppc405.h
>>> +++ b/hw/ppc/ppc405.h
>>> @@ -74,9 +74,14 @@ struct Ppc405SoCState {
>>>       MemoryRegion sram;
>>>       MemoryRegion ram_memories[2];
>>>       hwaddr ram_bases[2], ram_sizes[2];
>>> +    bool do_dram_init;
>>>         MemoryRegion *dram_mr;
>>>       hwaddr ram_size;
>>> +
>>> +    uint32_t sysclk;
>>> +    PowerPCCPU *cpu;
>>> +    DeviceState *uic;
>>>   };
>>>     /* PowerPC 405 core */
>>> @@ -85,11 +90,4 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
>>>   void ppc4xx_plb_init(CPUPPCState *env);
>>>   void ppc405_ebc_init(CPUPPCState *env);
>>>   -PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>>> -                        MemoryRegion ram_memories[2],
>>> -                        hwaddr ram_bases[2],
>>> -                        hwaddr ram_sizes[2],
>>> -                        uint32_t sysclk, DeviceState **uicdev,
>>> -                        int do_init);
>>> -
>>>   #endif /* PPC405_H */
>>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>>> index 96db52c5a309..363cb0770506 100644
>>> --- a/hw/ppc/ppc405_boards.c
>>> +++ b/hw/ppc/ppc405_boards.c
>>> @@ -237,9 +237,7 @@ static void ppc405_init(MachineState *machine)
>>>       Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
>>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>>       const char *kernel_filename = machine->kernel_filename;
>>> -    PowerPCCPU *cpu;
>>>       MemoryRegion *sysmem = get_system_memory();
>>> -    DeviceState *uicdev;
>>>         if (machine->ram_size != mc->default_ram_size) {
>>>           char *sz = size_to_str(mc->default_ram_size);
>>> @@ -254,12 +252,12 @@ static void ppc405_init(MachineState *machine)
>>>                                machine->ram_size, &error_fatal);
>>>       object_property_set_link(OBJECT(&ppc405->soc), "dram",
>>>                                OBJECT(machine->ram), &error_abort);
>>> +    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
>>> +                             !(kernel_filename == NULL), &error_abort);
>>> +    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
>>> +                             &error_abort);
>>>       qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
>>>   -    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_memories, ppc405->soc.ram_bases,
>>> -                        ppc405->soc.ram_sizes,
>>> -                        33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>>> -
>>>       /* allocate and load BIOS */
>>>       if (machine->firmware) {
>>>           MemoryRegion *bios = g_new(MemoryRegion, 1);
>>> @@ -315,7 +313,7 @@ static void ppc405_init(MachineState *machine)
>>>         /* Load ELF kernel and rootfs.cpio */
>>>       } else if (kernel_filename && !machine->firmware) {
>>> -        boot_from_kernel(machine, cpu);
>>> +        boot_from_kernel(machine, ppc405->soc.cpu);
>>>       }
>>>   }
>>>   diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>> index 156e839b8283..59612504bf3f 100644
>>> --- a/hw/ppc/ppc405_uc.c
>>> +++ b/hw/ppc/ppc405_uc.c
>>> @@ -1432,134 +1432,131 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
>>>   #endif
>>>   }
>>>   -PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>>> -                        MemoryRegion ram_memories[2],
>>> -                        hwaddr ram_bases[2],
>>> -                        hwaddr ram_sizes[2],
>>> -                        uint32_t sysclk, DeviceState **uicdevp,
>>> -                        int do_init)
>>> +static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>>   {
>>> +    Ppc405SoCState *s = PPC405_SOC(dev);
>>>       clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
>>>       qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
>>> -    PowerPCCPU *cpu;
>>>       CPUPPCState *env;
>>> -    DeviceState *uicdev;
>>> -    SysBusDevice *uicsbd;
>>> +    Error *err = NULL;
>>> +
>>> +    /* XXX: fix this ? */
>>
>> So, this comment, originally from ppc405_boards.c, was added by commit
>> 1a6c088620368 and it seemed to make reference to something with the refering
>> to the ram_* values:
>>
>>
>>    /* XXX: fix this */
>>    ram_bases[0] = 0x00000000;
>>    ram_sizes[0] = 0x08000000;
>>    ram_bases[1] = 0x00000000;
>>    ram_sizes[1] = 0x00000000;
>> (...)
>>
>>
>> No more context is provided aside from a git-svn-id from savannah.nongnu.org.
>>
>> If no one can provide more context about what is to be fixed here, I'll
>> remove the comment.
> 
> I'm not sure about it because I don't know 405 and only vaguely remember how this was on 440/460EX but I think it might be that the memory controller can be programmed to map RAM to different places but we don't fully emulate that nor the different chunks/DIMM sockets that could be possible and just map all system RAM to address 0 which is what most guest firmware or OS does anyway. Maybe I'm wrong and don't remember this correctly, the SDRAM controller model in ppc4xx_devs.c seems to do some mapping but I think this is what the comment might refer to or something similar. If so, I don't think it's worth emulating this more precisely unless we know about a guest which needs this.


Thanks for the explanation!

I'm not sure if this is something worth documenting in this comment or not. I
guess it wouldn't hurt to mention "the memory controller can map RAM in different
sockets but we don't implement that" or something similar. Or just remove the
comment entirely.

Both works for me as long as we get rid of the 'fix this' comment. It implies
that we're doing something wrong on purpose, which doesn't seem to be the
case.


Thanks,


Daniel




> 
> Regards,
> BALATON Zoltan

