Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F740D13E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 03:34:31 +0200 (CEST)
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQgII-0003ZZ-RZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 21:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgGE-0000n9-LM; Wed, 15 Sep 2021 21:32:23 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:37827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgGA-0005U1-CE; Wed, 15 Sep 2021 21:32:20 -0400
Received: by mail-qk1-x729.google.com with SMTP id 73so685386qki.4;
 Wed, 15 Sep 2021 18:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=FXH/+LW9swJgO3cAw3AdD4unBC3zLSsul4vxGmrBHYM=;
 b=EYHmgYe77pXB/YB8b15iC49jBBAVOh09DFKQBKT0Xx699kVDE3s9TvvoYaKVuRrmgH
 IIgBBPutCJoJF1ENbY1wIr2c2wiGIyuJco7gKTEhsGT4R5/T4Kh1VPPivpdp/2TybUlm
 ZjkLINrgJonRADIuiHg3Gq3nLBjEAP8Rm51nrnXMB2NYnGgJj8vIy5wH3V6ds50cp07y
 40D2gBqwd8kAngA/mKXlVZDEVBpxAeVlPm6EVxSNytLB9SLNRxdyeb22m6ZJuG9pkw7O
 fckXdAvAnsVYoyGVbmxHAcjAEspHjwdhH/5tKmKNVMqJ1jtYmBieh3iXi7gVAq/BJFU0
 FesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=FXH/+LW9swJgO3cAw3AdD4unBC3zLSsul4vxGmrBHYM=;
 b=7xsgFDBT8tnqXoTP+IKtPkzkKya/fwXtCRI/Rx/cq7YVR5LQ2B1Uq4OTYeiuv3KHlB
 i5WV64yTsQWyJa5r368QHBgk8qWNDn8i8VJOBY0UmF/jmObpoacRxcvU5bnxfCX3JvdB
 09d/UTy7WXWkLEljs2yLDNsdeumkoCOiVuSYhypW/XbuBwr57vmJmnct6Gv+E1nguHD0
 ydGv3o1zKic/y83QDSOW/ZFf6jh6BcoJgfKpS9/LyC5WIOn7KePA15o0Y0TTOfxJ7fyB
 N+R56YdWJGhR7nFEct3kM5yHLzovEBIctXWMl0qlCtWkawdh9v1BWpbOOZEY9ccSesiU
 qzMQ==
X-Gm-Message-State: AOAM533gH0+KUhEVzZHeElcZjPk+ktTYOTD73HUQIHWeqqQP6PIe976n
 YooutJ34MQRlSF7yLeT2v1aBabN3Yjc=
X-Google-Smtp-Source: ABdhPJwd0tI5+wH5rvBB2pIOc6bhK5qyzq5WTo1Gr9hp5v74B5sxaSgidZtd5RyEj4hCTcjbpcUdfw==
X-Received: by 2002:a37:9445:: with SMTP id w66mr3034323qkd.410.1631755936832; 
 Wed, 15 Sep 2021 18:32:16 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id j2sm1225061qtr.4.2021.09.15.18.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 18:32:16 -0700 (PDT)
Message-ID: <0dc516f6-8504-6d65-93f7-c8cd0de3afa2@gmail.com>
Date: Wed, 15 Sep 2021 22:32:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 3/6] spapr: introduce spapr_numa_associativity_reset()
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: Greg Kurz <groug@kaod.org>
References: <20210910195539.797170-1-danielhb413@gmail.com>
 <20210910195539.797170-4-danielhb413@gmail.com>
 <20210914135514.1896ea3e@bahia.huguette>
 <3bd59a2f-5c3b-f062-4a6c-abf34340000d@gmail.com>
In-Reply-To: <3bd59a2f-5c3b-f062-4a6c-abf34340000d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.698,
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

Greg,


On 9/14/21 16:58, Daniel Henrique Barboza wrote:
> 
> 
> On 9/14/21 08:55, Greg Kurz wrote:
>> On Fri, 10 Sep 2021 16:55:36 -0300
>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>

[...]


>>>       }
>>> @@ -167,6 +167,11 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
>>>       int nb_numa_nodes = machine->numa_state->num_nodes;
>>>       int i, j, max_nodes_with_gpus;
>>> +    /* init FORM1_assoc_array */
>>> +    for (i = 0; i < MAX_NODES + NVGPU_MAX_NUM; i++) {
>>> +        spapr->FORM1_assoc_array[i] = g_new0(uint32_t, NUMA_ASSOC_SIZE);
>>
>> Why dynamic allocation since you have fixed size ?
> 
> If I use static allocation the C compiler complains that I can't assign a
> uint32_t** pointer to a uint32_t[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE]
> array type.
> 
> And given that the FORM2 array is a [MAX_NODES + NVGPU_MAX_NUM][2] array, the
> way I worked around that here is to use dynamic allocation. Then C considers valid
> to use numa_assoc_array as an uint32_t** pointer for both FORM1 and FORM2
> 2D arrays. I'm fairly certain that there might be a way of doing static allocation
> and keeping the uint32_t** pointer as is, but didn't find any. Tips welcome :D
> 
> An alternative that I considered, without the need for this dynamic allocation hack,
> is to make both FORM1 and FORM2 data structures the same size (i.e.
> an [MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE] uint32_t array) and then numa_assoc_array
> can be a pointer of the same array type for both. Since we're controlling FORM1 and
> FORM2 sizes separately inside the functions this would work. The downside is that
> FORM2 2D array would be bigger than necessary.

I took a look and didn't find any neat way of doing a pointer switch
between 2 static arrays without either allocating dynamic mem on the
pointer and then g_memdup'ing it, or make all arrays the same size
(i.e. numa_assoc_array would also be a statically allocated array
with FORM1 size) and then memcpy() the chosen mode.

I just posted a new version in which I'm not relying on 'numa_assoc_array'.
Instead, the DT functions will use a get_associativity() to retrieve
the current associativity array based on CAS choice, in a similar
manner like it is already done with the array sizes. This also allowed
us to get rid of associativity_reset().


Thanks,


Daniel



> 
> 
> I don't have strong opinions about which way to do it, so I'm all ears.
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
>>
>>> +    }
>>> +
>>>       /*
>>>        * For all associativity arrays: first position is the size,
>>>        * position MAX_DISTANCE_REF_POINTS is always the numa_id,
>>> @@ -177,8 +182,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
>>>        * 'i' will be a valid node_id set by the user.
>>>        */
>>>       for (i = 0; i < nb_numa_nodes; i++) {
>>> -        spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
>>> -        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>>> +        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
>>> +        spapr->FORM1_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>>>       }
>>>       /*
>>> @@ -192,15 +197,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
>>>       max_nodes_with_gpus = nb_numa_nodes + NVGPU_MAX_NUM;
>>>       for (i = nb_numa_nodes; i < max_nodes_with_gpus; i++) {
>>> -        spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
>>> +        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
>>>           for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
>>>               uint32_t gpu_assoc = smc->pre_5_1_assoc_refpoints ?
>>>                                    SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
>>> -            spapr->numa_assoc_array[i][j] = gpu_assoc;
>>> +            spapr->FORM1_assoc_array[i][j] = gpu_assoc;
>>>           }
>>> -        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>>> +        spapr->FORM1_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>>>       }
>>>       /*
>>> @@ -227,14 +232,33 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>>                                      MachineState *machine)
>>>   {
>>>       spapr_numa_FORM1_affinity_init(spapr, machine);
>>> +
>>> +    /*
>>> +     * Default to FORM1 affinity until CAS. We'll call affinity_reset()
>>> +     * during CAS when we're sure about which NUMA affinity the guest
>>> +     * is going to use.
>>> +     *
>>> +     * This step is a failsafe - guests in the wild were able to read
>>> +     * FORM1 affinity info before CAS for a long time. Since affinity_reset()
>>> +     * is just a pointer switch between data that was already populated
>>> +     * here, this is an acceptable overhead to be on the safer side.
>>> +     */
>>> +    spapr->numa_assoc_array = spapr->FORM1_assoc_array;
>>
>> The right way to do that is to call spapr_numa_associativity_reset() from
>> spapr_machine_reset() because we want to revert to FORM1 each time the
>> guest is rebooted.
>>
>>> +}
>>> +
>>> +void spapr_numa_associativity_reset(SpaprMachineState *spapr)
>>> +{
>>> +    /* No FORM2 affinity implemented yet */
>>
>> This seems quite obvious at this point, not sure the comment helps.
>>
>>> +    spapr->numa_assoc_array = spapr->FORM1_assoc_array;
>>>   }
>>>   void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
>>>                                          int offset, int nodeid)
>>>   {
>>> +    /* Hardcode the size of FORM1 associativity array for now */
>>>       _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
>>>                         spapr->numa_assoc_array[nodeid],
>>> -                      sizeof(spapr->numa_assoc_array[nodeid]))));
>>> +                      NUMA_ASSOC_SIZE * sizeof(uint32_t))));
>>
>> Rather than doing this temporary change that gets undone in
>> a later patch, I suggest you introduce get_numa_assoc_size()
>> in a preliminary patch and use it here already :
>>
>> -                      NUMA_ASSOC_SIZE * sizeof(uint32_t))));
>> +                      get_numa_assoc_size(spapr) * sizeof(uint32_t))));
>>
>> This will simplify the reviewing.
>>
>>>   }
>>>   static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
>>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>>> index 637652ad16..8a9490f0bf 100644
>>> --- a/include/hw/ppc/spapr.h
>>> +++ b/include/hw/ppc/spapr.h
>>> @@ -249,7 +249,8 @@ struct SpaprMachineState {
>>>       unsigned gpu_numa_id;
>>>       SpaprTpmProxy *tpm_proxy;
>>> -    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
>>> +    uint32_t *FORM1_assoc_array[MAX_NODES + NVGPU_MAX_NUM];
>>
>> As said above, I really don't see the point in not having :
>>
>>      uint32_t *FORM1_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
>>
>>> +    uint32_t **numa_assoc_array;
>>>       Error *fwnmi_migration_blocker;
>>>   };
>>> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
>>> index 6f9f02d3de..ccf3e4eae8 100644
>>> --- a/include/hw/ppc/spapr_numa.h
>>> +++ b/include/hw/ppc/spapr_numa.h
>>> @@ -24,6 +24,7 @@
>>>    */
>>>   void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>>                                      MachineState *machine);
>>> +void spapr_numa_associativity_reset(SpaprMachineState *spapr);
>>>   void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
>>>   void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
>>>                                          int offset, int nodeid);
>>

