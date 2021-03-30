Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4AC34F39A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 23:36:05 +0200 (CEST)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRM1r-0004Va-RX
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 17:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lRLzf-0003ZY-5i; Tue, 30 Mar 2021 17:33:48 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lRLzc-0000rX-G0; Tue, 30 Mar 2021 17:33:46 -0400
Received: by mail-qk1-x731.google.com with SMTP id g15so17386012qkl.4;
 Tue, 30 Mar 2021 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hn073zJEVr7lLuWY/Qwvf6E8E8GXxo619c3QsKTjBL4=;
 b=i0+dXNeNKWWV4nlhz64IIFTLtm7oWlQHqSRuDdZZlJOX60nbdGTm9sdqCTtd5pLRcO
 3eYIdDqirFMRTDMfpqTw4a2e/tfy6asnisYETUgb4N8RQsDD+eXJWBCeTuYs74ebCP55
 +ahw5UCRk7ldjh30gQb9oyMEfYZ5ZniyAae6yofSjvPmZwzLxDarT8cD04nfV6M2xJXN
 SCIOqWmvki9LQxFf1aQG6+uo7ImHn1IhgB+zA9gAHwii1njurTueBRI2OyV+5Jl4xcDf
 ewm+B5Q8L9tIKmpilGMYa2821vYpFV4xIjoeF2lEXkaRZjQMa+L6v5KvQsEPoxpMEyMk
 uRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hn073zJEVr7lLuWY/Qwvf6E8E8GXxo619c3QsKTjBL4=;
 b=eYKHZWf1IFIPnIV6Wf9KsaPLq1PXZknSx4rUzTfFSyVBqs7v36GC8/SqHbunENfcA1
 Kn6cmg7VazctlRWnj0ZHlz+byuVLQ75TvoL/jxZHjLytQ/H4JXFOLogW4qWfNxbnIPWB
 qb/EpfJpK7raWe9GZm6L2aUny4IMtNboWSmcx3swSVaUqf3/KaJmL3lU4XSxj3mPN9RK
 vHIQ2GoHXvuST9SngeBw41EuoVCrf8Xa/L/FqHBc0LBATLVf7BUStsKFnnC/hE7MRv+v
 QCPfPnW45HU3G6ICvx8Ted2C5Ko+u1nKAl71eThAuoyvKMPE+BuOgIdXFXZAOsI6706W
 E3zQ==
X-Gm-Message-State: AOAM533BBtJQv6MnEpZf2IDeOpLqzSd17s+bOJqE8eu7mun+yE40Ei24
 UnGj8OA+r10HzxqP8rwJVcg=
X-Google-Smtp-Source: ABdhPJzNZ97A5TpCoLfVfelbW3x8eTSSnxs97L4UOPWhtpHZ3dy89q4yKGN38SQE7dwBNu48jzjiSg==
X-Received: by 2002:a37:88d:: with SMTP id 135mr311931qki.132.1617140021771;
 Tue, 30 Mar 2021 14:33:41 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:e000:6f43:93dd:11a0:93a1?
 ([2804:431:c7c6:e000:6f43:93dd:11a0:93a1])
 by smtp.gmail.com with ESMTPSA id d24sm657qkl.49.2021.03.30.14.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 14:33:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
To: Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box> <20210330015133.11cd9334@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <4eb701b6-19cb-6b60-95fa-61e812a4c44b@gmail.com>
Date: Tue, 30 Mar 2021 18:33:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330015133.11cd9334@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/29/21 8:51 PM, Igor Mammedov wrote:
> On Tue, 23 Mar 2021 12:03:58 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
>> On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboza wrote:
>>> Kernel commit 4bce545903fa ("powerpc/topology: Update
>>> topology_core_cpumask") cause a regression in the pseries machine when
>>> defining certain SMP topologies [1]. The reasoning behind the change is
>>> explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop updating
>>> cpu_core_mask"). In short, cpu_core_mask logic was causing troubles with
>>> large VMs with lots of CPUs and was changed by cpu_cpu_mask because, as
>>> far as the kernel understanding of SMP topologies goes, both masks are
>>> equivalent.
>>>
>>> Further discussions in the kernel mailing list [2] shown that the
>>> powerpc kernel always considered that the number of sockets were equal
>>> to the number of NUMA nodes. The claim is that it doesn't make sense,
>>> for Power hardware at least, 2+ sockets being in the same NUMA node. The
>>> immediate conclusion is that all SMP topologies the pseries machine were
>>> supplying to the kernel, with more than one socket in the same NUMA node
>>> as in [1], happened to be correctly represented in the kernel by
>>> accident during all these years.
>>>
>>> There's a case to be made for virtual topologies being detached from
>>> hardware constraints, allowing maximum flexibility to users. At the same
>>> time, this freedom can't result in unrealistic hardware representations
>>> being emulated. If the real hardware and the pseries kernel don't
>>> support multiple chips/sockets in the same NUMA node, neither should we.
>>>
>>> Starting in 6.0.0, all sockets must match an unique NUMA node in the
>>> pseries machine. qtest changes were made to adapt to this new
>>> condition.
>>
>> Oof.  I really don't like this idea.  It means a bunch of fiddly work
>> for users to match these up, for no real gain.  I'm also concerned
>> that this will require follow on changes in libvirt to not make this a
>> really cryptic and irritating point of failure.
> 
> yes, it is annoying to users but we were very slowly tightening limitations
> on numa path, especially if it causes problems on guest side when user
> specify nonsense configs (and suspect there are few things to enforce in
> generic numa code left (currently just warnings)). So it's nothing new.

Do you mind elaborating a bit on the 'nonsense configs' bit? Do you mean
configs that are unrealistic because it's uncompliant with ACPI? I always
thought that all possible SMP/NUMA topologies QEMU allows were ACPI/x86
compliant.

If both x86 and PowerPC have restrictions in common we might want to consider
putting this code in a common helper/place.


> 
> So if limit applies to new machine type it should be fine (i.e. no existing
> VMs will suffer). Later on we can deprecate invalid configurations altogether
> and just error out.

hmmm I'm not warning the user about the deprecated topologies in existing
guests in this patch. I guess it doesn't hurt to add a warning for existing
VMs.



Thanks,


DHB


>   
>>>
>>> [1] https://bugzilla.redhat.com/1934421
>>> [2] https://lore.kernel.org/linuxppc-dev/daa5d05f-dbd0-05ad-7395-5d5a3d364fc6@gmail.com/
>>>
>>> CC: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>>> CC: Cédric Le Goater <clg@kaod.org>
>>> CC: Igor Mammedov <imammedo@redhat.com>
>>> CC: Laurent Vivier <lvivier@redhat.com>
>>> CC: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   hw/ppc/spapr.c                 |  3 ++
>>>   hw/ppc/spapr_numa.c            |  7 +++++
>>>   include/hw/ppc/spapr.h         |  1 +
>>>   tests/qtest/cpu-plug-test.c    |  4 +--
>>>   tests/qtest/device-plug-test.c |  9 +++++-
>>>   tests/qtest/numa-test.c        | 52 ++++++++++++++++++++++++++++------
>>>   6 files changed, 64 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>> index d56418ca29..745f71c243 100644
>>> --- a/hw/ppc/spapr.c
>>> +++ b/hw/ppc/spapr.c
>>> @@ -4611,8 +4611,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
>>>    */
>>>   static void spapr_machine_5_2_class_options(MachineClass *mc)
>>>   {
>>> +    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
>>> +
>>>       spapr_machine_6_0_class_options(mc);
>>>       compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>>> +    smc->pre_6_0_smp_topology = true;
>>>   }
>>>   
>>>   DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
>>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>>> index 779f18b994..0ade43dd79 100644
>>> --- a/hw/ppc/spapr_numa.c
>>> +++ b/hw/ppc/spapr_numa.c
>>> @@ -163,6 +163,13 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>>       int i, j, max_nodes_with_gpus;
>>>       bool using_legacy_numa = spapr_machine_using_legacy_numa(spapr);
>>>   
>>> +    if (!smc->pre_6_0_smp_topology &&
>>> +        nb_numa_nodes != machine->smp.sockets) {
>>> +        error_report("Number of CPU sockets must be equal to the number "
>>> +                     "of NUMA nodes");
>>> +        exit(EXIT_FAILURE);
>>> +    }
>>> +
>>>       /*
>>>        * For all associativity arrays: first position is the size,
>>>        * position MAX_DISTANCE_REF_POINTS is always the numa_id,
>>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>>> index 47cebaf3ac..98dc5d198a 100644
>>> --- a/include/hw/ppc/spapr.h
>>> +++ b/include/hw/ppc/spapr.h
>>> @@ -142,6 +142,7 @@ struct SpaprMachineClass {
>>>       hwaddr rma_limit;          /* clamp the RMA to this size */
>>>       bool pre_5_1_assoc_refpoints;
>>>       bool pre_5_2_numa_associativity;
>>> +    bool pre_6_0_smp_topology;
>>>   
>>>       bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>>>                             uint64_t *buid, hwaddr *pio,
>>> diff --git a/tests/qtest/cpu-plug-test.c b/tests/qtest/cpu-plug-test.c
>>> index a1c689414b..946b9129ea 100644
>>> --- a/tests/qtest/cpu-plug-test.c
>>> +++ b/tests/qtest/cpu-plug-test.c
>>> @@ -118,8 +118,8 @@ static void add_pseries_test_case(const char *mname)
>>>       data->machine = g_strdup(mname);
>>>       data->cpu_model = "power8_v2.0";
>>>       data->device_model = g_strdup("power8_v2.0-spapr-cpu-core");
>>> -    data->sockets = 2;
>>> -    data->cores = 3;
>>> +    data->sockets = 1;
>>> +    data->cores = 6;
>>>       data->threads = 1;
>>>       data->maxcpus = data->sockets * data->cores * data->threads;
>>>   
>>> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
>>> index 559d47727a..dd7d8268d2 100644
>>> --- a/tests/qtest/device-plug-test.c
>>> +++ b/tests/qtest/device-plug-test.c
>>> @@ -91,7 +91,14 @@ static void test_spapr_cpu_unplug_request(void)
>>>   {
>>>       QTestState *qtest;
>>>   
>>> -    qtest = qtest_initf("-cpu power9_v2.0 -smp 1,maxcpus=2 "
>>> +    /*
>>> +     * Default smp settings will prioritize sockets over cores and
>>> +     * threads, so '-smp 2,maxcpus=2' will add 2 sockets. However,
>>> +     * the pseries machine requires a NUMA node for each socket
>>> +     * (since 6.0.0). Specify sockets=1 to make life easier.
>>> +     */
>>> +    qtest = qtest_initf("-cpu power9_v2.0 "
>>> +                        "-smp 1,maxcpus=2,threads=1,cores=2,sockets=1 "
>>>                           "-device power9_v2.0-spapr-cpu-core,core-id=1,id=dev0");
>>>   
>>>       /* similar to test_pci_unplug_request */
>>> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
>>> index dc0ec571ca..bb13f7131b 100644
>>> --- a/tests/qtest/numa-test.c
>>> +++ b/tests/qtest/numa-test.c
>>> @@ -24,9 +24,17 @@ static void test_mon_explicit(const void *data)
>>>       QTestState *qts;
>>>       g_autofree char *s = NULL;
>>>       g_autofree char *cli = NULL;
>>> +    const char *arch = qtest_get_arch();
>>> +
>>> +    if (g_str_equal(arch, "ppc64")) {
>>> +        cli = make_cli(data, "-smp 8,threads=1,cores=4,sockets=2 "
>>> +                             "-numa node,nodeid=0,memdev=ram,cpus=0-3 "
>>> +                             "-numa node,nodeid=1,cpus=4-7");
>>> +    } else {
>>> +        cli = make_cli(data, "-smp 8 -numa node,nodeid=0,memdev=ram,cpus=0-3 "
>>> +                             "-numa node,nodeid=1,cpus=4-7");
>>> +    }
>>>   
>>> -    cli = make_cli(data, "-smp 8 -numa node,nodeid=0,memdev=ram,cpus=0-3 "
>>> -                         "-numa node,nodeid=1,cpus=4-7");
>>>       qts = qtest_init(cli);
>>>   
>>>       s = qtest_hmp(qts, "info numa");
>>> @@ -57,10 +65,18 @@ static void test_mon_partial(const void *data)
>>>       QTestState *qts;
>>>       g_autofree char *s = NULL;
>>>       g_autofree char *cli = NULL;
>>> +    const char *arch = qtest_get_arch();
>>> +
>>> +    if (g_str_equal(arch, "ppc64")) {
>>> +        cli = make_cli(data, "-smp 8,threads=1,cores=4,sockets=2 "
>>> +                             "-numa node,nodeid=0,memdev=ram,cpus=0-1 "
>>> +                             "-numa node,nodeid=1,cpus=4-5 ");
>>> +    } else {
>>> +        cli = make_cli(data, "-smp 8 "
>>> +                             "-numa node,nodeid=0,memdev=ram,cpus=0-1 "
>>> +                             "-numa node,nodeid=1,cpus=4-5 ");
>>> +    }
>>>   
>>> -    cli = make_cli(data, "-smp 8 "
>>> -                   "-numa node,nodeid=0,memdev=ram,cpus=0-1 "
>>> -                   "-numa node,nodeid=1,cpus=4-5 ");
>>>       qts = qtest_init(cli);
>>>   
>>>       s = qtest_hmp(qts, "info numa");
>>> @@ -85,9 +101,17 @@ static void test_query_cpus(const void *data)
>>>       QObject *e;
>>>       QTestState *qts;
>>>       g_autofree char *cli = NULL;
>>> +    const char *arch = qtest_get_arch();
>>> +
>>> +    if (g_str_equal(arch, "ppc64")) {
>>> +        cli = make_cli(data, "-smp 8,threads=1,cores=4,sockets=2 "
>>> +                             "-numa node,memdev=ram,cpus=0-3 "
>>> +                             "-numa node,cpus=4-7");
>>> +    } else {
>>> +        cli = make_cli(data, "-smp 8 -numa node,memdev=ram,cpus=0-3 "
>>> +                             "-numa node,cpus=4-7");
>>> +    }
>>>   
>>> -    cli = make_cli(data, "-smp 8 -numa node,memdev=ram,cpus=0-3 "
>>> -                         "-numa node,cpus=4-7");
>>>       qts = qtest_init(cli);
>>>       cpus = get_cpus(qts, &resp);
>>>       g_assert(cpus);
>>> @@ -177,7 +201,7 @@ static void spapr_numa_cpu(const void *data)
>>>       QTestState *qts;
>>>       g_autofree char *cli = NULL;
>>>   
>>> -    cli = make_cli(data, "-smp 4,cores=4 "
>>> +    cli = make_cli(data, "-smp 4,threads=1,cores=2,sockets=2 "
>>>           "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>>>           "-numa cpu,node-id=0,core-id=0 "
>>>           "-numa cpu,node-id=0,core-id=1 "
>>> @@ -554,7 +578,17 @@ int main(int argc, char **argv)
>>>   
>>>       g_test_init(&argc, &argv, NULL);
>>>   
>>> -    qtest_add_data_func("/numa/mon/cpus/default", args, test_def_cpu_split);
>>> +    /*
>>> +     * Starting on 6.0.0, for the pseries machine, '-smp 8' will only work
>>> +     * if we have 8 NUMA nodes. If we specify 'smp 8,sockets=2' to match
>>> +     * 2 NUMA nodes, the CPUs will be split as 0123/4567 instead of
>>> +     * 0246/1357 that test_def_cpu_split expects. In short, this test is
>>> +     * no longer valid for ppc64 in 6.0.0.
>>> +     */
>>> +    if (!g_str_equal(arch, "ppc64")) {
>>> +        qtest_add_data_func("/numa/mon/cpus/default", args, test_def_cpu_split);
>>> +    }
>>> +
>>>       qtest_add_data_func("/numa/mon/cpus/explicit", args, test_mon_explicit);
>>>       qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
>>>       qtest_add_data_func("/numa/qmp/cpus/query-cpus", args, test_query_cpus);
>>
> 

