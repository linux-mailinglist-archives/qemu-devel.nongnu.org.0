Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E36B4100AC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 23:19:55 +0200 (CEST)
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRLGz-0000Ue-PR
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 17:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLFs-00084c-8L; Fri, 17 Sep 2021 17:18:44 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:34789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLFq-0007an-Km; Fri, 17 Sep 2021 17:18:44 -0400
Received: by mail-oi1-x234.google.com with SMTP id p2so15838030oif.1;
 Fri, 17 Sep 2021 14:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OSiBlqLacKhCEhT4rz0FdO+a9FUEtfVs24ZJ+f0/KYo=;
 b=pUawTNZw3h17XK9yXNIQEqMQG2By4vw/+myFCTGh8oJJll0N3oU/NIE7rh/d+I15Et
 uKUU16Zocg/+z6Hy4ZMt6Ujq4q1rrssjJOq92Sc2M7x6ILwIMdLc/VNJ+8I7c0Pp/hQ3
 u+RF+9dOruxgLpJl3rt3qdIn+sttKOeizoM3Jb/T2fk327GSGCbF+GK8UgGGdt+h9ukl
 vYqLqRSSdrRfjYFFUINlkr2KLG/hXIT1RaGYUTeAPzTvjK3BQXsPbR0Jgd5AS0zu5K4R
 mynLZiNpjZql4uLgqnoksLVeWpDt1/U3k7kq5JcgigV0jKC7Jz0WKHP88nVGtI4jJiua
 Py9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OSiBlqLacKhCEhT4rz0FdO+a9FUEtfVs24ZJ+f0/KYo=;
 b=WgI+qWyG2MGRkBa2diA2TCN6SujEB7pvxgfpR1vJ9Ocy/ArZ6ay4+wwN6N1/3r9yBt
 GNmG+WHG7h7xl5q2A7FUfbrXQ45rZuBpvSAAq+lCYDGnpTnHcaLmd4lWHKncs8UCUh1T
 BNGHmqTE7ul1D4uubpV0msSvdSHtxFSflgxd363XVZwfNCPc9NgY1Wzc42lkQagV+k33
 WxqZZKZHXb95kiAUgU+rPxVLYVv09bAhf75P/e5UbjUKEM+QYlPZnQrUc9RMvFbuq8S5
 aH7YbMHdxSEBlV63bmFFcu5sypLtO/6BVJFDR8sSode6YBjqR0qIiqQqRSVIE7ag6+tq
 X/Pg==
X-Gm-Message-State: AOAM530eZod+8a7Fjrtejr2KPWCYDF3y17M0vNktCu6YexhoDFIq7dmZ
 hIdnfPtD0ym/yPvdgkoOS2w=
X-Google-Smtp-Source: ABdhPJz0OvdfX9jGaoBFx1IesSaQfnWP75y9TMh1C0JbYSNCkiE4Fn9iNNGunsDlftcw5Z8U6BSZ+A==
X-Received: by 2002:a54:4f89:: with SMTP id g9mr3475921oiy.71.1631913521201;
 Fri, 17 Sep 2021 14:18:41 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id v24sm1767701ote.66.2021.09.17.14.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 14:18:40 -0700 (PDT)
Message-ID: <81d53dc4-d69b-6931-9cda-b07598df2a19@gmail.com>
Date: Fri, 17 Sep 2021 18:18:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v7 7/7] spapr_numa.c: handle auto NUMA node with no
 distance info
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20210916013004.272059-1-danielhb413@gmail.com>
 <20210916013004.272059-8-danielhb413@gmail.com>
 <20210917102552.7ce1cbcb@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20210917102552.7ce1cbcb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.488,
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/17/21 05:25, Igor Mammedov wrote:
> On Wed, 15 Sep 2021 22:30:04 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> numa_complete_configuration() in hw/core/numa.c always adds a NUMA node
>> for the pSeries machine if none was specified, but without node distance
>> information for the single node created.
> 
> distance is optional feature, hence generic auto create magic doesn't
> do anything with it (it does bare minimum for memhotplug to work).
> I'd like to drop auto-generated node altogether and ask user to explicitly
> provide needed -numa options (now with deprecation it's possible) if it's required.

This means that there's a need to handle the case of local distance for a
single NUMA node. Thanks for confirming that.

> 
>> This added node is also not
>> accounted for in numa_state->num_nodes, which returns zero.
> 
> that's probably a bug, parse_numa_node() should always increments on success,
> can you check why it doesn't happen in your case?

After checking the problem further I realized that this isn't true.
numa_state->num_nodes is correctly reporting size = 1 in this case as
well.

The problem is just the absence of node distance information for the
auto-generated NUMA node. I'll fix both the code and commit message
in the next version.


Thanks,


Daniel

> 
>> NUMA FORM1 affinity code didn't rely on numa_state information to do its
>> job, but FORM2 does. As is now, this is the result of a pSeries guest
>> with NUMA FORM2 affinity when no NUMA nodes is specified:
>>
>> $ numactl -H available: 1 nodes (0) node 0 cpus: 0 node 0 size: 16222 MB
>> node 0 free: 15681 MB No distance information available.
>>
>> This can be amended in spapr_numa_FORM2_write_rtas_tables(). We're
>> always expecting at least one NUMA node, and we're going to enforce that
>> the local distance (the distance to the node to itself) is always 10.
>> This allows for the proper creation of the NUMA distance tables, fixing
>> the output of 'numactl -H' in the guest:
>>
>> $ numactl -H available: 1 nodes (0) node 0 cpus: 0 node 0 size: 16222 MB
>> node 0 free: 15685 MB node distances: node   0
>>    0:  10
>>
>> CC: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>
>> Igor,
>>
>> CCing you as a FYI. I wasn't sure whether there is a reason for
>> numa_complete_configuration() not adding distance info an update 'num_nodes'
>> for the auto-generated NUMA node, I decided to handle this case in
>> pseries side instead.
>>
>>
>>
>>   hw/ppc/spapr_numa.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>> index 659513b405..d8caf5f6bd 100644
>> --- a/hw/ppc/spapr_numa.c
>> +++ b/hw/ppc/spapr_numa.c
>> @@ -499,7 +499,7 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>   {
>>       MachineState *ms = MACHINE(spapr);
>>       NodeInfo *numa_info = ms->numa_state->nodes;
>> -    int nb_numa_nodes = ms->numa_state->num_nodes;
>> +    int nb_numa_nodes = ms->numa_state->num_nodes ?: 1;
>>       int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
>>       g_autofree uint32_t *lookup_index_table = NULL;
>>       g_autofree uint32_t *distance_table = NULL;
>> @@ -539,6 +539,17 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>   
>>       for (src = 0; src < nb_numa_nodes; src++) {
>>           for (dst = 0; dst < nb_numa_nodes; dst++) {
>> +            /*
>> +             * We need to be explicit with the local distance
>> +             * value to cover the case where the user didn't added any
>> +             * NUMA nodes, but QEMU adds the default NUMA node without
>> +             * adding the numa_info to retrieve the info from.
>> +             */
>> +            if (src == dst) {
>> +                node_distances[i++] = 10;
>> +                continue;
>> +            }
>> +
>>               node_distances[i++] = numa_info[src].distance[dst];
>>           }
>>       }
> 

