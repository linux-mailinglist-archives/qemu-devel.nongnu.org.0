Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E943C219
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:22:32 +0200 (CEST)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfbOR-00005W-4t
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mfbMk-0007bE-4F
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:20:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mfbMg-000695-I6
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635312042;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JpGSizgBFtVNG8BCv524YGUrBZk4/+K/1JMKV+/s490=;
 b=DR0CrWjOlUhZaMV+e+4szgP/8YlWfEuO2FNMt4SE8BpNrW3rxDhMacob8qkKBGIWJlfYHn
 7OoJMUBLqJTiysNwi79kygxftoLbuRJoxLyO2oo+ZupytUtubE3JZNBUHOeLqnxxtYAcOE
 twCXWMin4+8jTQcAnAtw6g1AFivXnb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-xN5De8obNHyGEIAEHRhxFw-1; Wed, 27 Oct 2021 01:20:38 -0400
X-MC-Unique: xN5De8obNHyGEIAEHRhxFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 357D49F92A;
 Wed, 27 Oct 2021 05:20:37 +0000 (UTC)
Received: from [10.64.54.187] (vpn2-54-187.bne.redhat.com [10.64.54.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4698A104253E;
 Wed, 27 Oct 2021 05:20:32 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Expose empty NUMA nodes through ACPI
To: Igor Mammedov <imammedo@redhat.com>
References: <20211025234101.224705-1-gshan@redhat.com>
 <20211026114751.427205bc@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <b7b100dc-0555-774a-5b98-2ebc4f2645b0@redhat.com>
Date: Wed, 27 Oct 2021 16:20:30 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211026114751.427205bc@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 8:47 PM, Igor Mammedov wrote:
> On Tue, 26 Oct 2021 07:41:01 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> The empty NUMA nodes, where no memory resides, aren't exposed
>> through ACPI SRAT table. It's not user preferred behaviour because
>> the corresponding memory node devices are missed from the guest
>> kernel as the following example shows, and memory can't be hot
>> added to these empty NUMA nodes at later point.
> 
> a error message one gets would be useful here.
> 
> btw:
> memory hotplug seems to work for x86 without adding empty nodes.
> So it beg a question, if absence of empty nodes is the issue here.
> 

Yes, the memory can be still hot added even the empty NUMA nodes
aren't exposed. However, we still need to expose them so that
the guest kernel has the information as the users specifies.

I will make the commit log more precise in v2.

>>
>>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>>    -accel kvm -machine virt,gic-version=host               \
>>    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>>    -m 1024M,slots=16,maxmem=64G                            \
>>    -object memory-backend-ram,id=mem0,size=512M            \
>>    -object memory-backend-ram,id=mem1,size=512M            \
>>    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>>    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>>    -numa node,nodeid=2                                     \
>>    -numa node,nodeid=3                                     \
>>       :
>>    guest# ls /sys/devices/system/node | grep node
>>    node0
>>    node1
>>    node2
>>
>> This exposes these empty NUMA nodes through ACPI SRAT table. With
>> this applied, the corresponding memory node devices can be found
>> from the guest. Note that the hotpluggable capability is explicitly
>> given to these empty NUMA nodes for sake of completeness.
>>
>>    guest# ls /sys/devices/system/node | grep node
>>    node0
>>    node1
>>    node2
>>    node3
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 674f902652..a4c95b2f64 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -526,6 +526,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(ms);
>>       AcpiTable table = { .sig = "SRAT", .rev = 3, .oem_id = vms->oem_id,
>>                           .oem_table_id = vms->oem_table_id };
>> +    MemoryAffinityFlags flags;
>>   
>>       acpi_table_begin(&table, table_data);
>>       build_append_int_noprefix(table_data, 1, 4); /* Reserved */
>> @@ -547,12 +548,15 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>   
>>       mem_base = vms->memmap[VIRT_MEM].base;
>>       for (i = 0; i < ms->numa_state->num_nodes; ++i) {
>> -        if (ms->numa_state->nodes[i].node_mem > 0) {
>> -            build_srat_memory(table_data, mem_base,
>> -                              ms->numa_state->nodes[i].node_mem, i,
>> -                              MEM_AFFINITY_ENABLED);
>> -            mem_base += ms->numa_state->nodes[i].node_mem;
>> +        if (ms->numa_state->nodes[i].node_mem) {
>> +            flags = MEM_AFFINITY_ENABLED;
>> +        } else {
>> +            flags = MEM_AFFINITY_ENABLED | MEM_AFFINITY_HOTPLUGGABLE;
>>           }
>> +
>> +        build_srat_memory(table_data, mem_base,
>> +                          ms->numa_state->nodes[i].node_mem, i, flags);
>> +        mem_base += ms->numa_state->nodes[i].node_mem;
>>       }
>>   
>>       if (ms->nvdimms_state->is_enabled) {
> 

Thanks,
Gavin


