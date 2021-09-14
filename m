Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33140B89D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:01:44 +0200 (CEST)
Received: from localhost ([::1]:43312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQEch-0001jE-Bf
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQEZq-0000U2-BG; Tue, 14 Sep 2021 15:58:46 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:38594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQEZn-0003Nt-IO; Tue, 14 Sep 2021 15:58:46 -0400
Received: by mail-qk1-x72b.google.com with SMTP id f22so804137qkm.5;
 Tue, 14 Sep 2021 12:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c0DQsqke/ZAQtkrcN37lXth2ILyrTPOmyilpDr0IsKE=;
 b=isIGFr9JiKlyzd9JYU2h1dDUxXJo9zLA/Vj439jtL2PNVRhId+lMqnIJ4Ox79CzDZg
 kGsOvCT+DPXa5sMQpedtKzReaSdeJ0Nz4BCnWi5MA/A3mOQRUVaA/mJaPkGgneqaShZd
 20jZ0yXY55TDWOpsoU6+LkZyO+5nrn/4navFu8wfxm9kS+E4mnqM1iVKeDhglT5dW0GW
 eFNrPywa3NEjgBIrzhHufwdMZ6XW//FvhSp90+QeScGioHvMNHZJ0hkR20+QYSNXjSbc
 xjgB1RrJjnjUbYKXHqsrpnf4MMNcC+Gj6mYwOmZ0w3DxLIWuuPEA9cmj9VhN4EL+GplP
 PjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c0DQsqke/ZAQtkrcN37lXth2ILyrTPOmyilpDr0IsKE=;
 b=zVkOe0jMyS0COsrHbAAaovPdbOB50LnHKcC5+78eKz6KuOADxHVIy0m3S6/6fQ26j+
 le62tnXyekKu6j74mZ0mdrsbruwBcRyy4Qw0P+llCoT+VubICFKn+T7Sp1zgyOjYzblv
 TdcaTB/hfNrNMAuDbT5fyUYNplE0FHbuc+LsihsGw+a1ejddgKfMqdbxQY0Dsalxsff9
 aXKjIlMLVS6QEs3MJPBG4xMZMN6Fi+3dGFmPFNGBi1e0TNTNrqY9p2kPio55gcCMLkNY
 YPXAV9yMU2zhUjNdGB5IRFdyvHbwTnLlRMWqm50GP3//RtDQEkJpaY5xFH+w5LEnMCb9
 xx9Q==
X-Gm-Message-State: AOAM533Z6tki5rEQL21jglkN0A3iZ8hhq7WVsf6V2HhtDqt0pKAoZTMk
 +zCz+3VRqOauXXhHPv+8RTxGFXuIrE0=
X-Google-Smtp-Source: ABdhPJxUKsmZAhSVampTmSU1PeGW1U71X84fBHX3Zg9gtLdbIY41YLgonPcerBo9Cv3zQBtYAfQ81w==
X-Received: by 2002:a05:620a:4404:: with SMTP id
 v4mr6872961qkp.344.1631649521499; 
 Tue, 14 Sep 2021 12:58:41 -0700 (PDT)
Received: from ?IPV6:2804:18:c9:d5fb:c4f1:6f26:5434:d63e?
 ([2804:18:c9:d5fb:c4f1:6f26:5434:d63e])
 by smtp.gmail.com with ESMTPSA id j23sm8390907qkl.65.2021.09.14.12.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 12:58:41 -0700 (PDT)
Message-ID: <3bd59a2f-5c3b-f062-4a6c-abf34340000d@gmail.com>
Date: Tue, 14 Sep 2021 16:58:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 3/6] spapr: introduce spapr_numa_associativity_reset()
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
References: <20210910195539.797170-1-danielhb413@gmail.com>
 <20210910195539.797170-4-danielhb413@gmail.com>
 <20210914135514.1896ea3e@bahia.huguette>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20210914135514.1896ea3e@bahia.huguette>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/14/21 08:55, Greg Kurz wrote:
> On Fri, 10 Sep 2021 16:55:36 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> Introducing a new NUMA affinity, FORM2, requires a new mechanism to
>> switch between affinity modes after CAS. Also, we want FORM2 data
>> structures and functions to be completely separated from the existing
>> FORM1 code, allowing us to avoid adding new code that inherits the
>> existing complexity of FORM1.
>>
>> At the same time, it's also desirable to minimize the amount of changes
>> made in write_dt() functions that are used to write ibm,associativity of
>> the resources, RTAS artifacts and h_home_node_associativity. These
>> functions can work in the same way in both NUMA affinity modes, as long
>> as we use a similar data structure and parametrize it properly depending
>> on the affinity mode selected.
>>
>> This patch introduces spapr_numa_associativity_reset() to start this
>> process. This function will be used to switch to the chosen NUMA
>> affinity after CAS and after migrating the guest. To do that, the
>> existing 'numa_assoc_array' is renamed to 'FORM1_assoc_array' and will
>> hold FORM1 data that is populated at associativity_init().
>> 'numa_assoc_array' is now a pointer that can be switched between the
>> existing affinity arrays. We don't have FORM2 data structures yet, so
>> 'numa_assoc_array' will always point to 'FORM1_assoc_array'.
>>
>> We also take the precaution of pointing 'numa_assoc_array' to
>> 'FORM1_assoc_array' in associativity_init() time, before CAS, to not
>> change FORM1 availability for existing guests.
>>
>> A small change in spapr_numa_write_associativity_dt() is made to reflect
>> the fact that 'numa_assoc_array' is now a pointer and we must be
>> explicit with the size being written in the DT.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr.c              | 14 +++++++++++++
>>   hw/ppc/spapr_hcall.c        |  7 +++++++
>>   hw/ppc/spapr_numa.c         | 42 +++++++++++++++++++++++++++++--------
>>   include/hw/ppc/spapr.h      |  3 ++-
>>   include/hw/ppc/spapr_numa.h |  1 +
>>   5 files changed, 57 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index d39fd4e644..5afbb76cab 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -1786,6 +1786,20 @@ static int spapr_post_load(void *opaque, int version_id)
>>           return err;
>>       }
>>   
>> +    /*
>> +     * NUMA affinity selection is made in CAS time. There is no reliable
>> +     * way of telling whether the guest already went through CAS before
>> +     * migration due to how spapr_ov5_cas_needed works: a FORM1 guest can
>> +     * be migrated with ov5_cas empty regardless of going through CAS
>> +     * first.
>> +     *
>> +     * One solution is to call numa_associativity_reset(). The downside
>> +     * is that a guest migrated before CAS will reset it again when going
>> +     * through it, but since it's a lightweight operation it's worth being
>> +     * a little redundant to be safe.
> 
> Also this isn't a hot path.
> 
>> +     */
>> +     spapr_numa_associativity_reset(spapr);
>> +
>>       return err;
>>   }
>>   
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 0e9a5b2e40..82ab92ddba 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -17,6 +17,7 @@
>>   #include "kvm_ppc.h"
>>   #include "hw/ppc/fdt.h"
>>   #include "hw/ppc/spapr_ovec.h"
>> +#include "hw/ppc/spapr_numa.h"
>>   #include "mmu-book3s-v3.h"
>>   #include "hw/mem/memory-device.h"
>>   
>> @@ -1197,6 +1198,12 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>>       spapr->cas_pre_isa3_guest = !spapr_ovec_test(ov1_guest, OV1_PPC_3_00);
>>       spapr_ovec_cleanup(ov1_guest);
>>   
>> +    /*
>> +     * Reset numa_assoc_array now that we know which NUMA affinity
>> +     * the guest will use.
>> +     */
>> +    spapr_numa_associativity_reset(spapr);
>> +
>>       /*
>>        * Ensure the guest asks for an interrupt mode we support;
>>        * otherwise terminate the boot.
>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>> index fb6059550f..327952ba9e 100644
>> --- a/hw/ppc/spapr_numa.c
>> +++ b/hw/ppc/spapr_numa.c
>> @@ -97,7 +97,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
>>        */
>>       for (i = 1; i < nb_numa_nodes; i++) {
>>           for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
>> -            spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
>> +            spapr->FORM1_assoc_array[i][j] = cpu_to_be32(i);
>>           }
>>       }
>>   
>> @@ -149,8 +149,8 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
>>                * and going up to 0x1.
>>                */
>>               for (i = n_level; i > 0; i--) {
>> -                assoc_src = spapr->numa_assoc_array[src][i];
>> -                spapr->numa_assoc_array[dst][i] = assoc_src;
>> +                assoc_src = spapr->FORM1_assoc_array[src][i];
>> +                spapr->FORM1_assoc_array[dst][i] = assoc_src;
>>               }
>>           }
>>       }
>> @@ -167,6 +167,11 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
>>       int nb_numa_nodes = machine->numa_state->num_nodes;
>>       int i, j, max_nodes_with_gpus;
>>   
>> +    /* init FORM1_assoc_array */
>> +    for (i = 0; i < MAX_NODES + NVGPU_MAX_NUM; i++) {
>> +        spapr->FORM1_assoc_array[i] = g_new0(uint32_t, NUMA_ASSOC_SIZE);
> 
> Why dynamic allocation since you have fixed size ?

If I use static allocation the C compiler complains that I can't assign a
uint32_t** pointer to a uint32_t[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE]
array type.

And given that the FORM2 array is a [MAX_NODES + NVGPU_MAX_NUM][2] array, the
way I worked around that here is to use dynamic allocation. Then C considers valid
to use numa_assoc_array as an uint32_t** pointer for both FORM1 and FORM2
2D arrays. I'm fairly certain that there might be a way of doing static allocation
and keeping the uint32_t** pointer as is, but didn't find any. Tips welcome :D

An alternative that I considered, without the need for this dynamic allocation hack,
is to make both FORM1 and FORM2 data structures the same size (i.e.
an [MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE] uint32_t array) and then numa_assoc_array
can be a pointer of the same array type for both. Since we're controlling FORM1 and
FORM2 sizes separately inside the functions this would work. The downside is that
FORM2 2D array would be bigger than necessary.


I don't have strong opinions about which way to do it, so I'm all ears.


Thanks,


Daniel



> 
>> +    }
>> +
>>       /*
>>        * For all associativity arrays: first position is the size,
>>        * position MAX_DISTANCE_REF_POINTS is always the numa_id,
>> @@ -177,8 +182,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
>>        * 'i' will be a valid node_id set by the user.
>>        */
>>       for (i = 0; i < nb_numa_nodes; i++) {
>> -        spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
>> -        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>> +        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
>> +        spapr->FORM1_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>>       }
>>   
>>       /*
>> @@ -192,15 +197,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
>>       max_nodes_with_gpus = nb_numa_nodes + NVGPU_MAX_NUM;
>>   
>>       for (i = nb_numa_nodes; i < max_nodes_with_gpus; i++) {
>> -        spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
>> +        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
>>   
>>           for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
>>               uint32_t gpu_assoc = smc->pre_5_1_assoc_refpoints ?
>>                                    SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
>> -            spapr->numa_assoc_array[i][j] = gpu_assoc;
>> +            spapr->FORM1_assoc_array[i][j] = gpu_assoc;
>>           }
>>   
>> -        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>> +        spapr->FORM1_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>>       }
>>   
>>       /*
>> @@ -227,14 +232,33 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>                                      MachineState *machine)
>>   {
>>       spapr_numa_FORM1_affinity_init(spapr, machine);
>> +
>> +    /*
>> +     * Default to FORM1 affinity until CAS. We'll call affinity_reset()
>> +     * during CAS when we're sure about which NUMA affinity the guest
>> +     * is going to use.
>> +     *
>> +     * This step is a failsafe - guests in the wild were able to read
>> +     * FORM1 affinity info before CAS for a long time. Since affinity_reset()
>> +     * is just a pointer switch between data that was already populated
>> +     * here, this is an acceptable overhead to be on the safer side.
>> +     */
>> +    spapr->numa_assoc_array = spapr->FORM1_assoc_array;
> 
> The right way to do that is to call spapr_numa_associativity_reset() from
> spapr_machine_reset() because we want to revert to FORM1 each time the
> guest is rebooted.
> 
>> +}
>> +
>> +void spapr_numa_associativity_reset(SpaprMachineState *spapr)
>> +{
>> +    /* No FORM2 affinity implemented yet */
> 
> This seems quite obvious at this point, not sure the comment helps.
> 
>> +    spapr->numa_assoc_array = spapr->FORM1_assoc_array;
>>   }
>>   
>>   void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
>>                                          int offset, int nodeid)
>>   {
>> +    /* Hardcode the size of FORM1 associativity array for now */
>>       _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
>>                         spapr->numa_assoc_array[nodeid],
>> -                      sizeof(spapr->numa_assoc_array[nodeid]))));
>> +                      NUMA_ASSOC_SIZE * sizeof(uint32_t))));
> 
> Rather than doing this temporary change that gets undone in
> a later patch, I suggest you introduce get_numa_assoc_size()
> in a preliminary patch and use it here already :
> 
> -                      NUMA_ASSOC_SIZE * sizeof(uint32_t))));
> +                      get_numa_assoc_size(spapr) * sizeof(uint32_t))));
> 
> This will simplify the reviewing.
> 
>>   }
>>   
>>   static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index 637652ad16..8a9490f0bf 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -249,7 +249,8 @@ struct SpaprMachineState {
>>       unsigned gpu_numa_id;
>>       SpaprTpmProxy *tpm_proxy;
>>   
>> -    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
>> +    uint32_t *FORM1_assoc_array[MAX_NODES + NVGPU_MAX_NUM];
> 
> As said above, I really don't see the point in not having :
> 
>      uint32_t *FORM1_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
> 
>> +    uint32_t **numa_assoc_array;
>>   
>>       Error *fwnmi_migration_blocker;
>>   };
>> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
>> index 6f9f02d3de..ccf3e4eae8 100644
>> --- a/include/hw/ppc/spapr_numa.h
>> +++ b/include/hw/ppc/spapr_numa.h
>> @@ -24,6 +24,7 @@
>>    */
>>   void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>                                      MachineState *machine);
>> +void spapr_numa_associativity_reset(SpaprMachineState *spapr);
>>   void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
>>   void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
>>                                          int offset, int nodeid);
> 

