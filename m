Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B8441474A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:07:10 +0200 (CEST)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT05l-0004Ri-SV
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSzzg-0007pq-Nr; Wed, 22 Sep 2021 07:00:54 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:45783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSzzd-000536-Cn; Wed, 22 Sep 2021 07:00:52 -0400
Received: by mail-qt1-x830.google.com with SMTP id r1so2167150qta.12;
 Wed, 22 Sep 2021 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eootF8C9gN3dRrlK7B9faSSv9YLWPd++Bl5c9QdI6Yk=;
 b=Js71vfdFLLJTozCqGscDTiw7bqLQU/u7YFEQrTrcc7iXzIQVHu586pYS9F8JNOUWyZ
 YVf5ZO0GNPNMDvQoTj8seddn/iuIy03KMKTheIecbrYftT6cu8P7906L80zKd3qj3WWc
 hhZ8qPrZ8XiuVeIMcFzoT/V1Totvo1VZi3BDrkrB4Ct1JJ8eHRwR2nma11nfJfT+tiia
 xN4mhbbc0nknxmxI/tQqZeSwvWXpx6jp1a3e6dzOEHPJhQ4SRbXjnUo6rA5XGf8CKM2s
 i9ZCT2smOxhFRg5w9ZyvRyaUkccYr1c9jw+HyqEPr66e79YPkJh9vR5GCIaTgaUlpKSU
 8KAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eootF8C9gN3dRrlK7B9faSSv9YLWPd++Bl5c9QdI6Yk=;
 b=sQNJ6xR9Hjy5LyGvEwB+wOaHww26JOgQklCxnJ8rIvvcf62k0CdXI6Tjfsxcc/ht01
 szXJ+e1ktkWCWMpi04g0N5XvJf8U5MiJ/aeYOmvFmK/GgoxaIlzmb7p8qQYLTMUSokfH
 Vrsyqq+1V9DL4aAnkyIiEuvR5wVcLBH+UNwDHuD6SoH72vWnLd0obgTiSeJfB+JchjW0
 otNTEZ0eGTVOJaOr8MijcRSRvpLYqVF7ZAjtWa6TojIldVlLfjQaydyVcBDbRPVSmzdK
 3g//R/aLx61G9Zno1WqSKUzrfW3hQrcoNfnzVys7WfiIkI1IKAuSAlO9GvL++pFGudY9
 3Yyw==
X-Gm-Message-State: AOAM533nsEGtrFZ09p9Z6W6UKL9Li5ARqX0x0i9qwS8yTzPipB+FiyXw
 TXfnIWJd/CzkWlisxSonsuCCwUjDYVw=
X-Google-Smtp-Source: ABdhPJwnoeogQXRb5gK/YPNJuE+13StHgZH7okvDQL0TE9ou2fUqV95rEtswofyNBCauGfTm94YTHw==
X-Received: by 2002:ac8:7dd4:: with SMTP id c20mr26130276qte.46.1632308447820; 
 Wed, 22 Sep 2021 04:00:47 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id l1sm1090269qti.94.2021.09.22.04.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 04:00:47 -0700 (PDT)
Message-ID: <95ebb46a-6e2f-d7b0-c8c6-11eac162c9a1@gmail.com>
Date: Wed, 22 Sep 2021 08:00:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] spapr_numa.c: fixes in
 spapr_numa_FORM2_write_rtas_tables()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Greg Kurz <groug@kaod.org>
References: <20210921194347.52347-1-danielhb413@gmail.com>
 <20210922102625.43c89e1f@bahia.huguette>
 <e58f3fce-b1b5-1e90-10a1-3a76169e3940@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <e58f3fce-b1b5-1e90-10a1-3a76169e3940@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.039,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 9/22/21 06:51, BALATON Zoltan wrote:
> On Wed, 22 Sep 2021, Greg Kurz wrote:
>> On Tue, 21 Sep 2021 16:43:47 -0300
>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>
>>> This patch has a handful of modifications for the recent added
>>> FORM2 support:
>>>
>>> - there is no particular reason for both 'lookup_index_table' and
>>> 'distance_table' to be allocated in the heap, since their sizes are
>>> known right at the start of the function. Use static allocation in
>>> them to spare a couple of g_new0() calls;
>>>
>>> - to not allocate more than the necessary size in 'distance_table'. At
>>> this moment the array is oversized due to allocating uint32_t for all
>>> elements, when most of them fits in an uint8_t;
>>>
>>> - create a NUMA_LOCAL_DISTANCE macro to avoid hardcoding the local
>>> distance value.
>>>
>>
>> Not needed. A notion of minimal distance, which is obviously
>> synonymous to local, already exists in the "sysemu/numa.h"
>> header :
>>
>> #define NUMA_DISTANCE_MIN         10
>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>  hw/ppc/spapr_numa.c | 35 +++++++++++++++++++----------------
>>>  1 file changed, 19 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>>> index 58d5dc7084..039a0439c6 100644
>>> --- a/hw/ppc/spapr_numa.c
>>> +++ b/hw/ppc/spapr_numa.c
>>> @@ -19,6 +19,9 @@
>>>  /* Moved from hw/ppc/spapr_pci_nvlink2.c */
>>>  #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
>>>
>>> +/* Macro to avoid hardcoding the local distance value */
>>> +#define NUMA_LOCAL_DISTANCE         10
>>> +
>>>  /*
>>>   * Retrieves max_dist_ref_points of the current NUMA affinity.
>>>   */
>>> @@ -500,17 +503,21 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>>      MachineState *ms = MACHINE(spapr);
>>>      NodeInfo *numa_info = ms->numa_state->nodes;
>>>      int nb_numa_nodes = ms->numa_state->num_nodes;
>>> +    /* Lookup index table has an extra uint32_t with its length */
>>> +    uint32_t lookup_index_table[nb_numa_nodes + 1];
>>>      int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
>>> -    g_autofree uint32_t *lookup_index_table = NULL;
>>> -    g_autofree uint32_t *distance_table = NULL;
>>> -    int src, dst, i, distance_table_size;
>>> -    uint8_t *node_distances;
>>> +    /*
>>> +     * Distance table is an uint8_t array with a leading uint32_t
>>> +     * containing its length.
>>> +     */
>>> +    uint8_t distance_table[distance_table_entries + 4];
>>> +    uint32_t *distance_table_length;
>>> +    int src, dst, i;
>>>
>>>      /*
>>>       * ibm,numa-lookup-index-table: array with length and a
>>>       * list of NUMA ids present in the guest.
>>>       */
>>> -    lookup_index_table = g_new0(uint32_t, nb_numa_nodes + 1);
>>>      lookup_index_table[0] = cpu_to_be32(nb_numa_nodes);
>>>
>>>      for (i = 0; i < nb_numa_nodes; i++) {
>>> @@ -518,8 +525,7 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>>      }
>>>
>>>      _FDT(fdt_setprop(fdt, rtas, "ibm,numa-lookup-index-table",
>>> -                     lookup_index_table,
>>> -                     (nb_numa_nodes + 1) * sizeof(uint32_t)));
>>> +                     lookup_index_table, sizeof(lookup_index_table)));
>>>
>>>      /*
>>>       * ibm,numa-distance-table: contains all node distances. First
>>> @@ -531,11 +537,10 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>>       * array because NUMA ids can be sparse (node 0 is the first,
>>>       * node 8 is the second ...).
>>>       */
>>> -    distance_table = g_new0(uint32_t, distance_table_entries + 1);
>>> -    distance_table[0] = cpu_to_be32(distance_table_entries);
>>> +    distance_table_length = (uint32_t *)distance_table;
>>> +    distance_table_length[0] = cpu_to_be32(distance_table_entries);
>>>
>>> -    node_distances = (uint8_t *)&distance_table[1];
>>> -    i = 0;
>>> +    i = 4;
>>>
>>
>> A comment reminding why we're doing that wouldn't hurt, e.g.
>>
>> /* Skip the array size (uint32_t) */
> 
> Then maybe instead of (or in addition to) a comment you could write sizeof(uint32_t) or sizeof(distance_rable[0]) instead of constant 4 to make this more explicit.

distance_table is an uint8_t array. sizeof(distance_table[0]) would return 1.

Doing i = sizeof(uint32_t) demands the reader to realize "this works because it is
skipping an uint32_t in an uint8_t array and sizeof(uint8_t) is 1".

I think it's clearer to just be explicit in the comment:


/* First 4 uint8_t contains the uint32_t array length */


Thanks,


Daniel


> 
> Regards,
> BALATON Zoltan
> 
>> With these fixed, especially using NUMA_DISTANCE_MIN, you
>> can add:
>>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
>>
>>>      for (src = 0; src < nb_numa_nodes; src++) {
>>>          for (dst = 0; dst < nb_numa_nodes; dst++) {
>>> @@ -546,18 +551,16 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>>               * adding the numa_info to retrieve distance info from.
>>>               */
>>>              if (src == dst) {
>>> -                node_distances[i++] = 10;
>>> +                distance_table[i++] = NUMA_LOCAL_DISTANCE;
>>>                  continue;
>>>              }
>>>
>>> -            node_distances[i++] = numa_info[src].distance[dst];
>>> +            distance_table[i++] = numa_info[src].distance[dst];
>>>          }
>>>      }
>>>
>>> -    distance_table_size = distance_table_entries * sizeof(uint8_t) +
>>> -                          sizeof(uint32_t);
>>>      _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
>>> -                     distance_table, distance_table_size));
>>> +                     distance_table, sizeof(distance_table)));
>>>  }
>>>
>>>  /*
>>
>>
>>

