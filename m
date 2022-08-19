Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE375998D9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:44:27 +0200 (CEST)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyYD-0008Un-EV
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOyWX-0006qg-Jf; Fri, 19 Aug 2022 05:42:41 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:46833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOyWV-0005yl-L5; Fri, 19 Aug 2022 05:42:41 -0400
Received: by mail-vs1-xe33.google.com with SMTP id d126so3922865vsd.13;
 Fri, 19 Aug 2022 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=2fSJ5fe0EMtAVrih2IjP8yEBWdmSwzXt6J8erL75Dhs=;
 b=JpP15tkOM8hyeWlnBTgUhyPR60C9jZsQ8yWWz4CscCw67MnG7kEHiqxAirgpmMUzma
 su4XVfvG9edJ9V48ACC0IDRfkYgFcE/228PEzpo/4qyFb8O6GgNns6Qwp76+OOUcUyHJ
 r2HmklhbhHEFJknayspKgxDhTT7lm8JidPcZqc4c4EG4Vez/sO28B4BrLXzs6icgrqmT
 UhXNFyvLIcKBs/y7eTGWXN+Scw/nwbDGj1rAh703ffrRnFiduEH/5vKW6iW6/ONQVKG5
 geejI/x+BtGuTQ08XSM07Qq6TtZO6Vp+ZkQXp5R/g2UDTk1PZaaY91GtPvYGjkMkv5Mv
 Pidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2fSJ5fe0EMtAVrih2IjP8yEBWdmSwzXt6J8erL75Dhs=;
 b=1DSe9dZJoAucyjNXQ+gdSZPfsT1Qc4DYqgWd5GrV7gtyW82E2eAcPXIXAWWbXOuGSC
 Pt6xzrq/pPfH0vEswmxPVFEYWvYLbFO10WTkUdmirO4zKO9AsxQOViuOmS5YHvbK92gg
 blao001TJ1MbZCQDaOWQn0qyMjwVwblUCmJqwVPFEtrpfK+ymZCSSpmBstT1pT+5ZOtk
 5trZj5AZFGG8HLcX3fXj5EJyjmLRaA0otyPbfPZrOyybphcgpar8OPAHol7+zsMk0F3i
 gDFBEQWn83poAovbkwRMdXWR9ONGhQzvZbPIWFZqvPfgL62qtDMCyT94cz3QEJ8J4cY/
 cBRg==
X-Gm-Message-State: ACgBeo1/zoYV5Umf4A+DGk6nZfpE29hvPy6p7AjUIjPMq2M3wIxe8P7G
 OHJA3b+RNVZlEIEYBHHHNv+ZdMNJC2Co4A==
X-Google-Smtp-Source: AA6agR4/O7zhNmuk9kHlDiXTLhk5Gu/IUSZVwnFgBYXdKnOW6diTez0Kgc806oUmP6R+sCGQjX9I8Q==
X-Received: by 2002:a67:ac44:0:b0:38a:b369:f562 with SMTP id
 n4-20020a67ac44000000b0038ab369f562mr2731570vsh.14.1660902158236; 
 Fri, 19 Aug 2022 02:42:38 -0700 (PDT)
Received: from [192.168.10.102] ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a05612200d900b0037cf5f15a71sm2148888vkc.1.2022.08.19.02.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 02:42:37 -0700 (PDT)
Message-ID: <f2c2e6f9-0da4-443d-55cd-c214e710d0f7@gmail.com>
Date: Fri, 19 Aug 2022 06:42:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com>
 <99485a63-f799-2741-8006-f4167c985e54@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <99485a63-f799-2741-8006-f4167c985e54@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe33.google.com
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



On 8/18/22 23:11, Alexey Kardashevskiy wrote:
> 
> 
> On 05/08/2022 19:39, Daniel Henrique Barboza wrote:
>> The pSeries machine never bothered with the common machine->fdt
>> attribute. We do all the FDT related work using spapr->fdt_blob.
>>
>> We're going to introduce HMP commands to read and save the FDT, which
>> will rely on setting machine->fdt properly to work across all machine
>> archs/types.
> 
> 
> Out of curiosity - why new HMP command, is not QOM'ing this ms::fdt property enough?

I tried to do the minimal changes needed for the commands to work. ms::fdt is
one of the few MachineState fields that hasn't been QOMified by
machine_class_init() yet. All pre-existing code that uses ms::fdt are using the
pointer directly. To make a QOMified use of it would require extra patches
in machine.c to QOMify the property first.

There's also the issue with how each machine is creating the FDT. Most are using
helpers from device_tree.c, some are creating it from scratch, others required
a .dtb file, most of them are not doing a fdt_pack() and so on. To really QOMify
the use of ms::fdt we would need some machine hooks that standardize all that.
I believe it's worth the trouble, but it would be too much to do right now.


Thanks,



Daniel

> 
> Another thing is that on every HMP dump I'd probably rebuild the entire FDT for the reasons David explained. Thanks,
> 
> 
>>
>> Let's set machine->fdt in the two places where we manipulate the FDT:
>> spapr_machine_reset() and CAS. spapr->fdt_blob is left untouched: what
>> we want is a way to access the FDT from HMP, not replace
>> spapr->fdt_blob.
>>
>> Cc: Cédric Le Goater <clg@kaod.org>
>> Cc: qemu-ppc@nongnu.org
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr.c       | 6 ++++++
>>   hw/ppc/spapr_hcall.c | 8 ++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index bc9ba6e6dc..94c90f0351 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -1713,6 +1713,12 @@ static void spapr_machine_reset(MachineState *machine)
>>       spapr->fdt_initial_size = spapr->fdt_size;
>>       spapr->fdt_blob = fdt;
>> +    /*
>> +     * Set the common machine->fdt pointer to enable support
>> +     * for 'dumpdtb' and 'info fdt' commands.
>> +     */
>> +    machine->fdt = fdt;
>> +
>>       /* Set up the entry state */
>>       first_ppc_cpu->env.gpr[5] = 0;
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index a8d4a6bcf0..0079bc6fdc 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>>       spapr->fdt_initial_size = spapr->fdt_size;
>>       spapr->fdt_blob = fdt;
>> +    /*
>> +     * Set the machine->fdt pointer again since we just freed
>> +     * it above (by freeing spapr->fdt_blob). We set this
>> +     * pointer to enable support for 'dumpdtb' and 'info fdt'
>> +     * HMP commands.
>> +     */
>> +    MACHINE(spapr)->fdt = fdt;
>> +
>>       return H_SUCCESS;
>>   }
> 

