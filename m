Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674B74115FD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:41:26 +0200 (CEST)
Received: from localhost ([::1]:59076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJXx-0004y1-GC
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSJW3-00031H-Av; Mon, 20 Sep 2021 09:39:27 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSJW1-00079e-DY; Mon, 20 Sep 2021 09:39:27 -0400
Received: by mail-qt1-x82c.google.com with SMTP id j13so10632828qtq.6;
 Mon, 20 Sep 2021 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d+9E9SFGue65fgCzFcWL0856vgJZeOFoYmNRDU/qMzw=;
 b=mf5ml2/U8YfSmNB9y77uOnK54MvBI4sjbl2+iHzv+c8K0hqMIeU2wX0gBdTgvOslKK
 cF2rWsrQKrDiKTGW6sPgEQMYdzNBOwHNyJzwaYhdb3vzaNBddTWu33E/FhyeO69XVtKj
 pNR1/luCiTnkzy2Q6sT9Zef3YZoT2AXmOpX3M5famEmdVyxauTSrcG74wqdgailgvNCF
 CNgLvQs3+5JCkD2FlG4yE+ZK0HICl9TtRRsK0nYYY+rwgTalZldavLyZX8rIowE0mpiC
 MGVXkcoIaNEiqCi7sBozAQEHJnC71qveIlFiQtZDfIMgKoVqcKN78p4ThbFxsESxTE23
 GMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d+9E9SFGue65fgCzFcWL0856vgJZeOFoYmNRDU/qMzw=;
 b=Q5LbD1h8ziWKaezSus+lOaKkhu9VezKAA8dNn2gDiJipWg2VsqrLpCt9PFViPI17cD
 acY5PpCKIt9H7sJGrzbYJmVhnZEqlCb+xgPkSpqthLS8y9wvDZh7V5LEUw4ynUFF8DZb
 pjSTs/GX4n8+cBAlT9v3vcK+cusXm8fsUqMLMfy723F7Tgu+b5gdJJvHhMYEpVqFoZNs
 ltZnQ6FyaNAVH9B2N5fQ1s63l+SgeaMp+klafs2xM7f+TSETb+XEatAQb2udQ1Q07+rU
 TqPaoqQ5o0zt8ngpf2+pDYbKm6RVndQ0aJM+IAQho6ih7kkCLGPOkZb8RNt5ITq26MeN
 Iupw==
X-Gm-Message-State: AOAM530r+j9GtLqzi9LnKLm+58/HCxV5DkQ0Sv74/KF+hV2yjAf77qwO
 wtkYP1f14WNEmeoHPR6+EK4yG/TH5g4=
X-Google-Smtp-Source: ABdhPJxKOpedCE+o0sm3yQmj53d9R+sWu/WyV67lWqfDT6rkaXEbg2Y1/Kob0pkXyD7Tn0M9om8tWQ==
X-Received: by 2002:ac8:7ee4:: with SMTP id r4mr22991249qtc.148.1632145163129; 
 Mon, 20 Sep 2021 06:39:23 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id v7sm11417478qkd.41.2021.09.20.06.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:39:22 -0700 (PDT)
Message-ID: <824f1a4d-3fed-fe77-ae9e-efadfdc6268d@gmail.com>
Date: Mon, 20 Sep 2021 10:39:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v8 4/7] spapr_numa.c: rename numa_assoc_array to
 FORM1_assoc_array
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
References: <20210917212802.424481-1-danielhb413@gmail.com>
 <20210917212802.424481-5-danielhb413@gmail.com>
 <20210920112132.35d430df@bahia.huguette>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20210920112132.35d430df@bahia.huguette>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 9/20/21 06:21, Greg Kurz wrote:
> On Fri, 17 Sep 2021 18:27:59 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> Introducing a new NUMA affinity, FORM2, requires a new mechanism to
>> switch between affinity modes after CAS. Also, we want FORM2 data
>> structures and functions to be completely separated from the existing
>> FORM1 code, allowing us to avoid adding new code that inherits the
>> existing complexity of FORM1.
>>
>> The idea of switching values used by the write_dt() functions in
>> spapr_numa.c was already introduced in the previous patch, and
>> the same approach will be used when dealing with the FORM1 and FORM2
>> arrays.
>>
>> We can accomplish that by that by renaming the existing numa_assoc_array
>> to FORM1_assoc_array, which now is used exclusively to handle FORM1 affinity
>> data. A new helper get_associativity() is then introduced to be used by the
>> write_dt() functions to retrieve the current ibm,associativity array of
>> a given node, after considering affinity selection that might have been
>> done during CAS. All code that was using numa_assoc_array now needs to
>> retrieve the array by calling this function.
>>
>> This will allow for an easier plug of FORM2 data later on.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
> 
> This looks good. Just one suggestion, see below.
> 
>>   hw/ppc/spapr_hcall.c   |  1 +
>>   hw/ppc/spapr_numa.c    | 38 +++++++++++++++++++++++++-------------
>>   include/hw/ppc/spapr.h |  2 +-
>>   3 files changed, 27 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 0e9a5b2e40..9056644890 100644
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
>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>> index 08e2d6aed8..7339d00d20 100644
>> --- a/hw/ppc/spapr_numa.c
>> +++ b/hw/ppc/spapr_numa.c
>> @@ -46,6 +46,15 @@ static int get_vcpu_assoc_size(SpaprMachineState *spapr)
>>       return get_numa_assoc_size(spapr) + 1;
>>   }
>>   
>> +/*
>> + * Retrieves the ibm,associativity array of NUMA node 'node_id'
>> + * for the current NUMA affinity.
>> + */
>> +static uint32_t *get_associativity(SpaprMachineState *spapr, int node_id)
>> +{
>> +    return spapr->FORM1_assoc_array[node_id];
>> +}
> 
> All users of this helper only need to read the content of the
> associativity array. And since these arrays are static, the
> returned pointer should certainly not be passed to g_free()
> for example. This wouldn't be detected by compilers though,
> unless you have the helper to return a pointer to const
> data. So I suggest you just do that for extra safety.

Good point. I'll be more vigilant about the use of const pointers in these
cases. The extra safety is always welcome.


Daniel

> 
>> +
>>   static bool spapr_numa_is_symmetrical(MachineState *ms)
>>   {
>>       int src, dst;
>> @@ -124,7 +133,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
>>        */
>>       for (i = 1; i < nb_numa_nodes; i++) {
>>           for (j = 1; j < FORM1_DIST_REF_POINTS; j++) {
>> -            spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
>> +            spapr->FORM1_assoc_array[i][j] = cpu_to_be32(i);
>>           }
>>       }
>>   
>> @@ -176,8 +185,8 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
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
>> @@ -204,8 +213,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
>>        * 'i' will be a valid node_id set by the user.
>>        */
>>       for (i = 0; i < nb_numa_nodes; i++) {
>> -        spapr->numa_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
>> -        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
>> +        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
>> +        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
>>       }
>>   
>>       /*
>> @@ -219,15 +228,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
>>       max_nodes_with_gpus = nb_numa_nodes + NVGPU_MAX_NUM;
>>   
>>       for (i = nb_numa_nodes; i < max_nodes_with_gpus; i++) {
>> -        spapr->numa_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
>> +        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
>>   
>>           for (j = 1; j < FORM1_DIST_REF_POINTS; j++) {
>>               uint32_t gpu_assoc = smc->pre_5_1_assoc_refpoints ?
>>                                    SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
>> -            spapr->numa_assoc_array[i][j] = gpu_assoc;
>> +            spapr->FORM1_assoc_array[i][j] = gpu_assoc;
>>           }
>>   
>> -        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
>> +        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
>>       }
>>   
>>       /*
>> @@ -259,8 +268,10 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>   void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
>>                                          int offset, int nodeid)
>>   {
>> +    uint32_t *associativity = get_associativity(spapr, nodeid);
>> +
>>       _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
>> -                      spapr->numa_assoc_array[nodeid],
>> +                      associativity,
>>                         get_numa_assoc_size(spapr) * sizeof(uint32_t))));
>>   }
>>   
>> @@ -270,6 +281,7 @@ static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
>>       int max_distance_ref_points = get_max_dist_ref_points(spapr);
>>       int vcpu_assoc_size = get_vcpu_assoc_size(spapr);
>>       uint32_t *vcpu_assoc = g_new(uint32_t, vcpu_assoc_size);
>> +    uint32_t *associativity = get_associativity(spapr, cpu->node_id);
>>       int index = spapr_get_vcpu_id(cpu);
>>   
>>       /*
>> @@ -280,7 +292,7 @@ static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
>>        */
>>       vcpu_assoc[0] = cpu_to_be32(max_distance_ref_points + 1);
>>       vcpu_assoc[vcpu_assoc_size - 1] = cpu_to_be32(index);
>> -    memcpy(vcpu_assoc + 1, spapr->numa_assoc_array[cpu->node_id] + 1,
>> +    memcpy(vcpu_assoc + 1, associativity + 1,
>>              (vcpu_assoc_size - 2) * sizeof(uint32_t));
>>   
>>       return vcpu_assoc;
>> @@ -319,10 +331,10 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
>>       cur_index += 2;
>>       for (i = 0; i < nr_nodes; i++) {
>>           /*
>> -         * For the lookup-array we use the ibm,associativity array,
>> -         * from numa_assoc_array. without the first element (size).
>> +         * For the lookup-array we use the ibm,associativity array of the
>> +         * current NUMA affinity, without the first element (size).
>>            */
>> -        uint32_t *associativity = spapr->numa_assoc_array[i];
>> +        uint32_t *associativity = get_associativity(spapr, i);
>>           memcpy(cur_index, ++associativity,
>>                  sizeof(uint32_t) * max_distance_ref_points);
>>           cur_index += max_distance_ref_points;
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index 814e087e98..6b3dfc5dc2 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -249,7 +249,7 @@ struct SpaprMachineState {
>>       unsigned gpu_numa_id;
>>       SpaprTpmProxy *tpm_proxy;
>>   
>> -    uint32_t numa_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE];
>> +    uint32_t FORM1_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE];
>>   
>>       Error *fwnmi_migration_blocker;
>>   };
> 

