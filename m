Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7AA442487
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:16:55 +0100 (CET)
Received: from localhost ([::1]:57930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhTx-0000at-VF
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mhgz0-00024j-De
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mhgyx-0004HB-6C
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810286;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=24nsF4ZtaCyzRKg197wRJW9Z98ZF+IBhr+7cVNt8by8=;
 b=AP12uIt7nAaNUzH9+OKCR+aJobGseYYg7SS/SUnfxEvEcI68WvdA/3+LfpL8nRVFo27ofP
 I28Dn+Qam5h0Oa11Ws9W81S1y8GVbWfDh4qRnq+cRJJ1J+akNqik6ZUOG7FVwQexixqiHE
 xW+ZOoyj1GQRpHXHCDsI8iy/tzzjd80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-UBm2_NHVMMOmf35hYOLQJg-1; Mon, 01 Nov 2021 19:44:40 -0400
X-MC-Unique: UBm2_NHVMMOmf35hYOLQJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA1580668A;
 Mon,  1 Nov 2021 23:44:39 +0000 (UTC)
Received: from [10.64.54.26] (vpn2-54-26.bne.redhat.com [10.64.54.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40BEB79446;
 Mon,  1 Nov 2021 23:44:10 +0000 (UTC)
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
To: Igor Mammedov <imammedo@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
Date: Tue, 2 Nov 2021 10:44:08 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211101094431.71e1a50a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 7:44 PM, Igor Mammedov wrote:
> On Thu, 28 Oct 2021 22:32:09 +1100
> Gavin Shan <gshan@redhat.com> wrote: 
>> On 10/28/21 2:40 AM, Igor Mammedov wrote:
>>> On Wed, 27 Oct 2021 13:29:58 +0800
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>    
>>>> The empty NUMA nodes, where no memory resides, aren't exposed
>>>> through ACPI SRAT table. It's not user preferred behaviour because
>>>> the corresponding memory node devices are missed from the guest
>>>> kernel as the following example shows. It means the guest kernel
>>>> doesn't have the node information as user specifies. However,
>>>> memory can be still hot added to these empty NUMA nodes when
>>>> they're not exposed.
>>>>
>>>>     /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>>>>     -accel kvm -machine virt,gic-version=host               \
>>>>     -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>>>>     -m 1024M,slots=16,maxmem=64G                            \
>>>>     -object memory-backend-ram,id=mem0,size=512M            \
>>>>     -object memory-backend-ram,id=mem1,size=512M            \
>>>>     -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>>>>     -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>>>>     -numa node,nodeid=2                                     \
>>>>     -numa node,nodeid=3                                     \
>>>>        :
>>>>     guest# ls /sys/devices/system/node | grep node
>>>>     node0
>>>>     node1
>>>>     (qemu) object_add memory-backend-ram,id=hp-mem0,size=1G
>>>>     (qemu) device_add pc-dimm,id=hp-dimm0,node=3,memdev=hp-mem0
>>>>     guest# ls /sys/devices/system/node | grep node
>>>>     node0
>>>>     node1
>>>>     node2
>>>>     guest# cat /sys/devices/system/node/node2/meminfo | grep MemTotal
>>>>     Node 2 MemTotal:    1048576 kB
>>>>
>>>> This exposes these empty NUMA nodes through ACPI SRAT table. With
>>>> this applied, the corresponding memory node devices can be found
>>>> from the guest. Note that the hotpluggable capability is explicitly
>>>> given to these empty NUMA nodes for sake of completeness.
>>>>
>>>>     guest# ls /sys/devices/system/node | grep node
>>>>     node0
>>>>     node1
>>>>     node2
>>>>     node3
>>>>     guest# cat /sys/devices/system/node/node3/meminfo | grep MemTotal
>>>>     Node 3 MemTotal:    0 kB
>>>>     (qemu) object_add memory-backend-ram,id=hp-mem0,size=1G
>>>>     (qemu) device_add pc-dimm,id=hp-dimm0,node=3,memdev=hp-mem0
>>>>     guest# cat /sys/devices/system/node/node3/meminfo | grep MemTotal
>>>>     Node 3 MemTotal:    1048576 kB
>>>
>>> I'm still not sure why this is necessary and if it's a good idea,
>>> is there a real hardware that have such nodes?
>>>
>>> SRAT is used to assign resources to nodes, I haven't seen it being
>>> used  as means to describe an empty node anywhere in the spec.
>>> (perhaps we should not allow empty nodes on QEMU CLI at all).
>>>
>>> Then if we really need this, why it's done for ARM only
>>> and not for x86?
>>>    
>>
>> I think this case exists in real hardware where the memory DIMM
>> isn't plugged, but the node is still probed.
> Then please, provide SRAT table from such hw
> (a lot of them (to justify it as defacto 'standard')?
> since such hw firmware could be buggy as well).
> 
> BTW, fake memory node doesn't have to be present to make guest
> notice an existing numa node. it can be represented by affinity
> entries as well (see chapter:System Resource Affinity Table (SRAT)
> in the spec).
> 
> At the moment, I'm totally unconvinced that empty numa nodes
> are valid to provide.
> 

Igor, thanks for your continuous review. I don't have strong sense
the fake nodes should be presented. So please ignore this patch
until it's needed by virtio-mem. In that time, I can revisit this.
More context is provided as below to make the discussion complete.

> 
>> Besides, this patch
>> addresses two issues:
>>
>> (1) To make the information contained in guest kernel consistent
>>       to the command line as the user expects. It means the sysfs
>>       entries for these empty NUMA nodes in guest kernel reflects
>>       what user provided.
> -numa/SRAT describe boot time configuration.
> So if you do not specify empty nodes on CLI, then number of nodes
> would be consistent.
> 

Correct.

>> (2) Without this patch, the node number can be twisted from user's
>>       perspective. As the example included in the commit log, node3
>>       should be created, but node2 is actually created. The patch
>>       reserves the NUMA node IDs in advance to avoid the issue.
>>
>>       /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>>          :
>>       -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>>       -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>>       -numa node,nodeid=2                                     \
>>       -numa node,nodeid=3                                     \
>>       guest# ls /sys/devices/system/node | grep node
>>       node0  node1
>>       (qemu) object_add memory-backend-ram,id=hp-mem0,size=1G
>>       (qemu) device_add pc-dimm,id=hp-dimm0,node=3,memdev=hp-mem0
>>       guest# ls /sys/devices/system/node | grep node
>>       node0  node1  node2
> 
> The same node numbering on guest side and QEMU CLI works only
> by accident not by design. In short numbers may not match
> (in linux kernel case it depends on the order the nodes
> are enumerated), if you really want numbers to match then fix
> guest kernel to use proximity domain for numbering.
> 
> The important thing here is that resources are grouped
> together, according to proximity domain.
> 

Linux ACPI driver avoids to take the proximity domain as node number,
meaning Linux kernel doesn't support discrete node IDs.

>> We definitely need empty NUMA nodes from QEMU CLI. One case I heard
>> of is kdump developer specify NUMA nodes and corresponding pc-dimm
>> objects for memory hot-add and test the memory usability.
> 
> Question is if the node has to be absolutely empty for this?
> It should be possible to use a node that has CPUs assigned to it.
> 
> Or add pc-dimm at runtime, which should dynamically create
> a numa node for it if the node wasn't described before.
> 

Yes, I think so.

>> I'm not
>> familiar with ACPI specification, but linux kernel fetches NUMA
>> node IDs from the following ACPI tables on ARM64. It's possible
>> the empty NUMA node IDs are parsed from GENERIC_AFFINITY or SLIT
>> tables if they exist in the corresponding ACPI tables.
>>
>>       ACPI_SRAT_TYPE_MEMORY_AFFINITY
>>       ACPI_SRAT_TYPE_GENERIC_AFFINITY
> any possible entry type can be a source for numa node,
> if guest doesn't do this it's guest's bug to fix.
> 
>>       ACPI_SIG_SLIT                          # if it exists
> that's a recent addition tied to [1].
> 1) https://www.mail-archive.com/qemu-devel@nongnu.org/msg843453.html
> If I recall correctly, related QEMU patch was dropped.
> 
>> So I think other architectures including x86 needs similar mechanism
>> to expose NUMA node IDs through ACPI table. If you agree, I can post
>> additional patches to do this after this one is settled and merged.
> 
> I do not agree to bogus entries approach at all.
> Sometimes, we merge 'out of spec' changes but that should be
> baked by 'must have' justification and tested with wide
> range of guest OSes (if Windows (with its more strict ACPI impl.)
> boots on virt-arm machine it should be tested as well).
> 
> So far I don't see 'must have' aspect in bogus nodes,
> only a convenience one (with 'works by accident' caveat).
> 
> I'm sorry for being stingy about out of spec things,
> but that is typical source of regressions on ACPI side
> which is noticed too late when users come back with broken
> guest after release.
> 

Yeah, I agree. I don't have strong sense to expose these empty nodes
for now. Please ignore the patch.

>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>> ---
>>>> v2: Improved commit log as suggested by Drew and Igor.
>>>> ---
>>>>    hw/arm/virt-acpi-build.c | 14 +++++++++-----
>>>>    1 file changed, 9 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index 674f902652..a4c95b2f64 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -526,6 +526,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>        const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(ms);
>>>>        AcpiTable table = { .sig = "SRAT", .rev = 3, .oem_id = vms->oem_id,
>>>>                            .oem_table_id = vms->oem_table_id };
>>>> +    MemoryAffinityFlags flags;
>>>>    
>>>>        acpi_table_begin(&table, table_data);
>>>>        build_append_int_noprefix(table_data, 1, 4); /* Reserved */
>>>> @@ -547,12 +548,15 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>    
>>>>        mem_base = vms->memmap[VIRT_MEM].base;
>>>>        for (i = 0; i < ms->numa_state->num_nodes; ++i) {
>>>> -        if (ms->numa_state->nodes[i].node_mem > 0) {
>>>> -            build_srat_memory(table_data, mem_base,
>>>> -                              ms->numa_state->nodes[i].node_mem, i,
>>>> -                              MEM_AFFINITY_ENABLED);
>>>> -            mem_base += ms->numa_state->nodes[i].node_mem;
>>>> +        if (ms->numa_state->nodes[i].node_mem) {
>>>> +            flags = MEM_AFFINITY_ENABLED;
>>>> +        } else {
>>>> +            flags = MEM_AFFINITY_ENABLED | MEM_AFFINITY_HOTPLUGGABLE;
>>>>            }
>>>> +
>>>> +        build_srat_memory(table_data, mem_base,
>>>> +                          ms->numa_state->nodes[i].node_mem, i, flags);
>>> that will create 0 length memory range, which is "Enabled",
>>> I'm not sure it's safe thing to do.
>>>
>>> As side effect this will also create empty ranges for memory-less
>>> nodes that have only CPUs, where it's not necessary.
>>>
>>> I'd really try avoid adding empty ranges unless it hard requirement,
>>> described somewhere or fixes a bug that can't be fixed elsewhere.
>>>    
>>
>> It's safe to Linux at least as I tested on ARM64. The (zero) memory
>> block doesn't affect anything. Besides, the memory block which has
>> been marked as hotpluggable won't be handled in Linux on ARM64
>> actually.
>>
>> Yes, the empty NUMA nodes are meaningless to CPUs until memory is
>> hot added into them.
>>
>>>> +        mem_base += ms->numa_state->nodes[i].node_mem;
>>>>        }
>>>>    
>>>>        if (ms->nvdimms_state->is_enabled) {
>>>    
>>

Thanks,
Gavin


