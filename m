Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC614ECEE6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:40:07 +0200 (CEST)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZg2w-0005bA-2C
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:40:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZg1B-0004tN-9e; Wed, 30 Mar 2022 17:38:17 -0400
Received: from [2a00:1450:4864:20::332] (port=46645
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZg19-00058Z-K2; Wed, 30 Mar 2022 17:38:16 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so841210wmp.5; 
 Wed, 30 Mar 2022 14:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H811FSqrf0NA0tMhitclvh6mwH++rGh3YU2LMCLKtrQ=;
 b=OT8h7vsbUnhXvDFrgBV6xTaapi7vMd0iDxY58tIXvyIyCgILndrVZdPCeVRzeh8+lw
 BHczF8OZmc5F5tbbleY+FsG03GaT/Ycw1Lhqku3tzL6DIur03EPtE4hsxInjPJX/rNld
 74PYZ0oPP8l2iUea8F3Bc90XItKrIfrCggO1uVAz0BYW2iiWDLfgUqSMk4FZiBmEFUWK
 woEn3M3NbihUOJuTxNgh/poEiLioVE3yGrOoxTEe1S6hkv97jlOVqV2X/EBkPXluh6RY
 joYX1g24ca554vXeKUKIb7MAZpAqFzUCVncv1exjxVOwyVKDbwMapXedarQeSr7KIbVC
 sHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H811FSqrf0NA0tMhitclvh6mwH++rGh3YU2LMCLKtrQ=;
 b=M+YPlTb/Y3IjKbVePzrem22t/2uTv4Vp3XBfMWu5OmnnDfkPPZ7dKkFC+D/1lmksvR
 hBNXKUuTFIsbMJGRnb1Yzr97I1TtinZAZUvibuPARtZv+wUJ+qmr+bQGCpWNcxc/ksH6
 fUTiV1OXSGLdxF4T9wNHdfJiGYDmoLqnApjeBsIdnG6TEFhm20a5dCPho4Z9F5iqMp+j
 O650D8HshoR19tDRmM6uwwxbezzmd/98OzNm2JZ27M8W4/avR7whOdJUGaeMdYltYbna
 IXXBRcBIJAKPDXlvBX3h+BtnaBmebQ/Yb3B0qL5a8wYDn83U/98O2lGhtDrboxa91tFv
 N37A==
X-Gm-Message-State: AOAM530GPw8cRO2NTTWPNbwa/CeJnzmPDP7MQcAZt9rHUf3+zpPnd6Nj
 TimDIzAlbya1hR7vrcgBBTs=
X-Google-Smtp-Source: ABdhPJycEg/4mCSfFhYk+T2JSyPQtaDKmfQK75YjnZgLzkHz5xGXPMBLllkQH8sfhCQul9vkwvd4+g==
X-Received: by 2002:a1c:1941:0:b0:38b:4af1:49f8 with SMTP id
 62-20020a1c1941000000b0038b4af149f8mr1654137wmz.156.1648676293257; 
 Wed, 30 Mar 2022 14:38:13 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:403e:ab57:ee68:20ea?
 ([2600:70ff:f07f:0:403e:ab57:ee68:20ea])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a05600c2dc800b0038d05f2b34dsm6473750wmh.2.2022.03.30.14.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 14:38:12 -0700 (PDT)
Message-ID: <71449b19-88b7-0ce5-f963-15fe747d3700@gmail.com>
Date: Wed, 30 Mar 2022 23:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/4] target/ppc: initialize 'reg_val' in kvm_get_one_spr()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220330210443.597500-1-danielhb413@gmail.com>
 <20220330210443.597500-2-danielhb413@gmail.com>
 <a3211c13-cb5c-ff39-f424-f2efe8b4d706@gmail.com>
 <29927bdd-f236-8694-0426-546bbaa85eb1@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <29927bdd-f236-8694-0426-546bbaa85eb1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/3/22 23:34, Daniel Henrique Barboza wrote:
> On 3/30/22 18:22, Philippe Mathieu-Daudé wrote:
>> On 30/3/22 23:04, Daniel Henrique Barboza wrote:
>>> Valgrind isn't convinced that we are initializing the values we assign
>>> to env->spr[spr] because it doesn't understand that the 'reg_val' union
>>> is being written by the kvm_vcpu_ioctl() that follows (via struct
>>> kvm_one_reg).
>>>
>>> This results in Valgrind complaining about uninitialized values every
>>> time we use env->spr in a conditional, like this instance:
>>>
>>> ==707578== Thread 1:
>>> ==707578== Conditional jump or move depends on uninitialised value(s)
>>> ==707578==    at 0xA10A40: hreg_compute_hflags_value (helper_regs.c:106)
>>> ==707578==    by 0xA10C9F: hreg_compute_hflags (helper_regs.c:173)
>>> ==707578==    by 0xA110F7: hreg_store_msr (helper_regs.c:262)
>>> ==707578==    by 0xA051A3: ppc_cpu_reset (cpu_init.c:7168)
>>> ==707578==    by 0xD4730F: device_transitional_reset (qdev.c:799)
>>> ==707578==    by 0xD4A11B: resettable_phase_hold (resettable.c:182)
>>> ==707578==    by 0xD49A77: resettable_assert_reset (resettable.c:60)
>>> ==707578==    by 0xD4994B: resettable_reset (resettable.c:45)
>>> ==707578==    by 0xD458BB: device_cold_reset (qdev.c:296)
>>> ==707578==    by 0x48FBC7: cpu_reset (cpu-common.c:114)
>>> ==707578==    by 0x97B5EB: spapr_reset_vcpu (spapr_cpu_core.c:38)
>>> ==707578==    by 0x97BABB: spapr_cpu_core_reset (spapr_cpu_core.c:209)
>>> ==707578==  Uninitialised value was created by a stack allocation
>>> ==707578==    at 0xB11F08: kvm_get_one_spr (kvm.c:543)
>>>
>>> Initializing 'reg_val' has no impact in the logic and makes Valgrind
>>> output more bearable.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   target/ppc/kvm.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>> index dc93b99189..ce1b926e8c 100644
>>> --- a/target/ppc/kvm.c
>>> +++ b/target/ppc/kvm.c
>>> @@ -543,10 +543,12 @@ static void kvm_get_one_spr(CPUState *cs, 
>>> uint64_t id, int spr)
>>>   {
>>>       PowerPCCPU *cpu = POWERPC_CPU(cs);
>>>       CPUPPCState *env = &cpu->env;
>>> -    union {
>>> +    union reg_val {
>>>           uint32_t u32;
>>>           uint64_t u64;
>>> -    } val;
>>> +    };
>>> +    /* Init reg_val to avoid "uninitialised value" Valgrind warnings */
>>> +    union reg_val val = {0};
>>
>> This should also work:
>>
>> -- >8 --
>> @@ -546,7 +546,7 @@ static void kvm_get_one_spr(CPUState *cs, uint64_t 
>> id, int spr)
>>       union {
>>           uint32_t u32;
>>           uint64_t u64;
>> -    } val;
>> +    } val = { 0 };
> 
> Apparently it does work. I'll make a few tests and re-send.
> 
> 
> Also, do we have an official way of spelling this zeroed struct 
> initialization? I
> see several instances of {0} and { 0 } in the code. In this series I 
> used {0}.
> ./scripts/checkpatch.pl seems ok with both formats.

$ git grep -F '= {0}' | wc -l
       81
$ git grep -F '= { 0 }' | wc -l
      112
$ git grep -F '= { }' | wc -l
       61
$ git grep -F '= {}' | wc -l
      368

I am not aware of an official way. Apparently '{ }' is the way to go.

