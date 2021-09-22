Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478BA414832
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:53:04 +0200 (CEST)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0oB-00020i-Bq
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mT0mC-0000Q0-F5; Wed, 22 Sep 2021 07:51:02 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mT0mA-0006qV-1t; Wed, 22 Sep 2021 07:50:59 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id w9so1672763qvs.12;
 Wed, 22 Sep 2021 04:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pgaIamTkQI8yJRczKySH4uN8K7vsoQzSYOvWUIj6rcs=;
 b=BK1yx5gsp8qna1kjwN2Geeu90DyP0jp9HbFIOaberMB3lyKZPI3rE67j5VENoX/0zj
 /pwB453HTv8Ives8ZDQ01TkyJck0RsDS1AZ2bnKOPOH9C1qEFoSU8BrXDiq4+gwc2YVG
 IvbKmT4V5DOBJ4EEHmAYZDnLnmfw+aHlVzTG4g7ZUejIn3psi3YR70yJK6+gBcMpPcM7
 w6vjI6V4B0kQ/geAXB7T5oN62gd8BUQhEBwDJHKvHJ0NU9lcH2RCVmwBVPs8j8Qzf+XP
 z/rzD2itGTnaBsFGFJB94LqSQJPSmkEuKU34IJLN2w9zhpnpGDPTGTkCJItvN+2XVz3H
 kLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pgaIamTkQI8yJRczKySH4uN8K7vsoQzSYOvWUIj6rcs=;
 b=VTqjjeKJHePNgeyv4DwUDDqbiQq+EXEwNj80hTtdJJg31TbpHWF/yJzNc28Ne7G4fW
 uA+3m7kDgp3PVnD7GQkfwrSPnZsNqvLzNSoI4zDExJ0OSWwfLMUI/iYOtCXifHsmB/2M
 I/Bp4ZE37EQPNEeXdNGcujEgncRN4CqcK7z2+ImG7nchcMkRbKc7BKCWsyW0YmpeNS8B
 Hgm5xWk4sdgS9nP8z8BLP3+jkhauW7hZ3wEcuLJDjZiz3z9/Tvq17Lxib6es+wuHfeH4
 LqAoD6y+uG990dQ+B6CTK7njzMkF1j6QLsrz9uk8D+KD2JcWvdE1+Y0MMyeqK5zp6E39
 tgdg==
X-Gm-Message-State: AOAM533jl3A/SCLIwZbTHQcqIxO1P/B4mO1l7+bAuC7tLnoohpYxt5bq
 3krMkCmeueUw1rOabm1qANrF4R8r4DI=
X-Google-Smtp-Source: ABdhPJzenzKXm2DfEze49UR5pwyKe0FuwqzSRobT/Ekhfrk/FH5NFCIYhtbBjkS9nCX/OZou1F7VFA==
X-Received: by 2002:a0c:b44f:: with SMTP id e15mr36687161qvf.32.1632311456720; 
 Wed, 22 Sep 2021 04:50:56 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id v24sm1525618qkv.11.2021.09.22.04.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 04:50:56 -0700 (PDT)
Message-ID: <594420a3-189f-86db-8140-a508b9a9add8@gmail.com>
Date: Wed, 22 Sep 2021 08:50:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] spapr_numa.c: fixes in
 spapr_numa_FORM2_write_rtas_tables()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210921194347.52347-1-danielhb413@gmail.com>
 <78cc89be-4e4b-c23a-e40a-b41865037008@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <78cc89be-4e4b-c23a-e40a-b41865037008@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2f.google.com
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/22/21 08:17, Philippe Mathieu-Daudé wrote:
> On 9/21/21 21:43, Daniel Henrique Barboza wrote:
>> This patch has a handful of modifications for the recent added
>> FORM2 support:
>>
>> - there is no particular reason for both 'lookup_index_table' and
>> 'distance_table' to be allocated in the heap, since their sizes are
>> known right at the start of the function. Use static allocation in
>> them to spare a couple of g_new0() calls;
>>
>> - to not allocate more than the necessary size in 'distance_table'. At
>> this moment the array is oversized due to allocating uint32_t for all
>> elements, when most of them fits in an uint8_t;
>>
>> - create a NUMA_LOCAL_DISTANCE macro to avoid hardcoding the local
>> distance value.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr_numa.c | 35 +++++++++++++++++++----------------
>>   1 file changed, 19 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>> index 58d5dc7084..039a0439c6 100644
>> --- a/hw/ppc/spapr_numa.c
>> +++ b/hw/ppc/spapr_numa.c
>> @@ -19,6 +19,9 @@
>>   /* Moved from hw/ppc/spapr_pci_nvlink2.c */
>>   #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
>> +/* Macro to avoid hardcoding the local distance value */
>> +#define NUMA_LOCAL_DISTANCE         10
>> +
>>   /*
>>    * Retrieves max_dist_ref_points of the current NUMA affinity.
>>    */
>> @@ -500,17 +503,21 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>       MachineState *ms = MACHINE(spapr);
>>       NodeInfo *numa_info = ms->numa_state->nodes;
>>       int nb_numa_nodes = ms->numa_state->num_nodes;
>> +    /* Lookup index table has an extra uint32_t with its length */
>> +    uint32_t lookup_index_table[nb_numa_nodes + 1];
>>       int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
>> -    g_autofree uint32_t *lookup_index_table = NULL;
>> -    g_autofree uint32_t *distance_table = NULL;
>> -    int src, dst, i, distance_table_size;
>> -    uint8_t *node_distances;
> 
> This should have be of ptrdiff_t type.
> 
>> +    /*
>> +     * Distance table is an uint8_t array with a leading uint32_t
>> +     * containing its length.
>> +     */
>> +    uint8_t distance_table[distance_table_entries + 4];
> 
> The previous code seems better by using the heap, now we have
> to worry about stack overflow...


Fair point.

Since no one asked for this change in previous reviews I guess it's fine to keep
using the heap.


Daniel


> 
>> +    uint32_t *distance_table_length;
> 
> Please drop, ...
> 
>> +    int src, dst, i;
>>       /*
>>        * ibm,numa-lookup-index-table: array with length and a
>>        * list of NUMA ids present in the guest.
>>        */
>> -    lookup_index_table = g_new0(uint32_t, nb_numa_nodes + 1);
>>       lookup_index_table[0] = cpu_to_be32(nb_numa_nodes);
>>       for (i = 0; i < nb_numa_nodes; i++) {
>> @@ -518,8 +525,7 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>       }
>>       _FDT(fdt_setprop(fdt, rtas, "ibm,numa-lookup-index-table",
>> -                     lookup_index_table,
>> -                     (nb_numa_nodes + 1) * sizeof(uint32_t)));
>> +                     lookup_index_table, sizeof(lookup_index_table)));
>>       /*
>>        * ibm,numa-distance-table: contains all node distances. First
>> @@ -531,11 +537,10 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>        * array because NUMA ids can be sparse (node 0 is the first,
>>        * node 8 is the second ...).
>>        */
>> -    distance_table = g_new0(uint32_t, distance_table_entries + 1);
>> -    distance_table[0] = cpu_to_be32(distance_table_entries);
>> +    distance_table_length = (uint32_t *)distance_table;
>> +    distance_table_length[0] = cpu_to_be32(distance_table_entries);
> 
> ... and use instead:
> 
>         stl_be_p(distance_table, distance_table_entries);
> 
>> -    node_distances = (uint8_t *)&distance_table[1];
>> -    i = 0;
>> +    i = 4;
>>       for (src = 0; src < nb_numa_nodes; src++) {
>>           for (dst = 0; dst < nb_numa_nodes; dst++) {
>> @@ -546,18 +551,16 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>                * adding the numa_info to retrieve distance info from.
>>                */
>>               if (src == dst) {
>> -                node_distances[i++] = 10;
>> +                distance_table[i++] = NUMA_LOCAL_DISTANCE;
>>                   continue;
>>               }
>> -            node_distances[i++] = numa_info[src].distance[dst];
>> +            distance_table[i++] = numa_info[src].distance[dst];
>>           }
>>       }
>> -    distance_table_size = distance_table_entries * sizeof(uint8_t) +
>> -                          sizeof(uint32_t);
>>       _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
>> -                     distance_table, distance_table_size));
>> +                     distance_table, sizeof(distance_table)));
>>   }
>>   /*
>>
> 

