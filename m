Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43582137CD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 11:38:13 +0200 (CEST)
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrI96-00037b-T9
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 05:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jrI4B-000271-Ea
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 05:33:07 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33979
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jrI3y-0003fF-7T
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 05:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593768773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/h8hSh1DauZ6Ru4bBBqPc6jTYPCjb2A85Ri3QPbmLDs=;
 b=Ern1VgmUcoK7T2KWv6gVoubA7JZkAT9N0xxmamrQy5+VDIABxP0nyKNITMwSR9pD64Mm2D
 lpS0lf6c6USCeBZ0oZKmoFT9VCXqQCKj1ZJo2wat8PCyWcaqM1AbqAiPsk5ngxygGpdoeA
 hruVDqku5vgU1ZNTZykLzIrg/Q7Q3tU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-9Xfv5SIIPOGir0mhCtCbHg-1; Fri, 03 Jul 2020 05:32:51 -0400
X-MC-Unique: 9Xfv5SIIPOGir0mhCtCbHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55B0718A8249;
 Fri,  3 Jul 2020 09:32:50 +0000 (UTC)
Received: from [10.36.114.0] (ovpn-114-0.ams2.redhat.com [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5CF45C221;
 Fri,  3 Jul 2020 09:32:45 +0000 (UTC)
Subject: Re: [PULL 13/41] virtio-mem: Paravirtualized memory hot(un)plug
From: David Hildenbrand <david@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20200703090252.368694-1-mst@redhat.com>
 <20200703090252.368694-14-mst@redhat.com>
 <3691367f-9b31-dfa2-f180-823b1f080c09@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <2d233963-effc-5238-8125-c56dc6d93700@redhat.com>
Date: Fri, 3 Jul 2020 11:32:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3691367f-9b31-dfa2-f180-823b1f080c09@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:34:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.07.20 11:18, David Hildenbrand wrote:
> On 03.07.20 11:04, Michael S. Tsirkin wrote:
>> From: David Hildenbrand <david@redhat.com>
>>
>> This is the very basic/initial version of virtio-mem. An introduction to
>> virtio-mem can be found in the Linux kernel driver [1]. While it can be
>> used in the current state for hotplug of a smaller amount of memory, it
>> will heavily benefit from resizeable memory regions in the future.
>>
>> Each virtio-mem device manages a memory region (provided via a memory
>> backend). After requested by the hypervisor ("requested-size"), the
>> guest can try to plug/unplug blocks of memory within that region, in order
>> to reach the requested size. Initially, and after a reboot, all memory is
>> unplugged (except in special cases - reboot during postcopy).
>>
>> The guest may only try to plug/unplug blocks of memory within the usable
>> region size. The usable region size is a little bigger than the
>> requested size, to give the device driver some flexibility. The usable
>> region size will only grow, except on reboots or when all memory is
>> requested to get unplugged. The guest can never plug more memory than
>> requested. Unplugged memory will get zapped/discarded, similar to in a
>> balloon device.
>>
>> The block size is variable, however, it is always chosen in a way such that
>> THP splits are avoided (e.g., 2MB). The state of each block
>> (plugged/unplugged) is tracked in a bitmap.
>>
>> As virtio-mem devices (e.g., virtio-mem-pci) will be memory devices, we now
>> expose "VirtioMEMDeviceInfo" via "query-memory-devices".
>>
>> --------------------------------------------------------------------------
>>
>> There are two important follow-up items that are in the works:
>> 1. Resizeable memory regions: Use resizeable allocations/RAM blocks to
>>    grow/shrink along with the usable region size. This avoids creating
>>    initially very big VMAs, RAM blocks, and KVM slots.
>> 2. Protection of unplugged memory: Make sure the gust cannot actually
>>    make use of unplugged memory.
>>
>> Other follow-up items that are in the works:
>> 1. Exclude unplugged memory during migration (via precopy notifier).
>> 2. Handle remapping of memory.
>> 3. Support for other architectures.
>>
>> --------------------------------------------------------------------------
>>
>> Example usage (virtio-mem-pci is introduced in follow-up patches):
>>
>> Start QEMU with two virtio-mem devices (one per NUMA node):
>>  $ qemu-system-x86_64 -m 4G,maxmem=20G \
>>   -smp sockets=2,cores=2 \
>>   -numa node,nodeid=0,cpus=0-1 -numa node,nodeid=1,cpus=2-3 \
>>   [...]
>>   -object memory-backend-ram,id=mem0,size=8G \
>>   -device virtio-mem-pci,id=vm0,memdev=mem0,node=0,requested-size=0M \
>>   -object memory-backend-ram,id=mem1,size=8G \
>>   -device virtio-mem-pci,id=vm1,memdev=mem1,node=1,requested-size=1G
>>
>> Query the configuration:
>>  (qemu) info memory-devices
>>  Memory device [virtio-mem]: "vm0"
>>    memaddr: 0x140000000
>>    node: 0
>>    requested-size: 0
>>    size: 0
>>    max-size: 8589934592
>>    block-size: 2097152
>>    memdev: /objects/mem0
>>  Memory device [virtio-mem]: "vm1"
>>    memaddr: 0x340000000
>>    node: 1
>>    requested-size: 1073741824
>>    size: 1073741824
>>    max-size: 8589934592
>>    block-size: 2097152
>>    memdev: /objects/mem1
>>
>> Add some memory to node 0:
>>  (qemu) qom-set vm0 requested-size 500M
>>
>> Remove some memory from node 1:
>>  (qemu) qom-set vm1 requested-size 200M
>>
>> Query the configuration again:
>>  (qemu) info memory-devices
>>  Memory device [virtio-mem]: "vm0"
>>    memaddr: 0x140000000
>>    node: 0
>>    requested-size: 524288000
>>    size: 524288000
>>    max-size: 8589934592
>>    block-size: 2097152
>>    memdev: /objects/mem0
>>  Memory device [virtio-mem]: "vm1"
>>    memaddr: 0x340000000
>>    node: 1
>>    requested-size: 209715200
>>    size: 209715200
>>    max-size: 8589934592
>>    block-size: 2097152
>>    memdev: /objects/mem1
>>
>> [1] https://lkml.kernel.org/r/20200311171422.10484-1-david@redhat.com
>>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> Message-Id: <20200626072248.78761-11-david@redhat.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>  qapi/misc.json                 |  39 +-
>>  include/hw/virtio/virtio-mem.h |  78 ++++
>>  hw/virtio/virtio-mem.c         | 724 +++++++++++++++++++++++++++++++++
>>  hw/virtio/Kconfig              |  11 +
>>  hw/virtio/Makefile.objs        |   1 +
>>  5 files changed, 852 insertions(+), 1 deletion(-)
>>  create mode 100644 include/hw/virtio/virtio-mem.h
>>  create mode 100644 hw/virtio/virtio-mem.c
>>
>> diff --git a/qapi/misc.json b/qapi/misc.json
>> index a5a0beb902..65ca3edf32 100644
>> --- a/qapi/misc.json
>> +++ b/qapi/misc.json
>> @@ -1356,19 +1356,56 @@
>>            }
>>  }
>>  
>> +##
>> +# @VirtioMEMDeviceInfo:
>> +#
>> +# VirtioMEMDevice state information
>> +#
>> +# @id: device's ID
>> +#
>> +# @memaddr: physical address in memory, where device is mapped
>> +#
>> +# @requested-size: the user requested size of the device
>> +#
>> +# @size: the (current) size of memory that the device provides
>> +#
>> +# @max-size: the maximum size of memory that the device can provide
>> +#
>> +# @block-size: the block size of memory that the device provides
>> +#
>> +# @node: NUMA node number where device is assigned to
>> +#
>> +# @memdev: memory backend linked with the region
>> +#
>> +# Since: 5.1
>> +##
>> +{ 'struct': 'VirtioMEMDeviceInfo',
>> +  'data': { '*id': 'str',
>> +            'memaddr': 'size',
>> +            'requested-size': 'size',
>> +            'size': 'size',
>> +            'max-size': 'size',
>> +            'block-size': 'size',
>> +            'node': 'int',
>> +            'memdev': 'str'
>> +          }
>> +}
>> +
>>  ##
>>  # @MemoryDeviceInfo:
>>  #
>>  # Union containing information about a memory device
>>  #
>>  # nvdimm is included since 2.12. virtio-pmem is included since 4.1.
>> +# virtio-mem is included since 5.1.
>>  #
>>  # Since: 2.1
>>  ##
>>  { 'union': 'MemoryDeviceInfo',
>>    'data': { 'dimm': 'PCDIMMDeviceInfo',
>>              'nvdimm': 'PCDIMMDeviceInfo',
>> -            'virtio-pmem': 'VirtioPMEMDeviceInfo'
>> +            'virtio-pmem': 'VirtioPMEMDeviceInfo',
>> +            'virtio-mem': 'VirtioMEMDeviceInfo'
>>            }
>>  }
>>  
>> diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
>> new file mode 100644
>> index 0000000000..6981096f7c
>> --- /dev/null
>> +++ b/include/hw/virtio/virtio-mem.h
>> @@ -0,0 +1,78 @@
>> +/*
>> + * Virtio MEM device
>> + *
>> + * Copyright (C) 2020 Red Hat, Inc.
>> + *
>> + * Authors:
>> + *  David Hildenbrand <david@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef HW_VIRTIO_MEM_H
>> +#define HW_VIRTIO_MEM_H
>> +
>> +#include "standard-headers/linux/virtio_mem.h"
>> +#include "hw/virtio/virtio.h"
>> +#include "qapi/qapi-types-misc.h"
>> +#include "sysemu/hostmem.h"
>> +
>> +#define TYPE_VIRTIO_MEM "virtio-mem"
>> +
>> +#define VIRTIO_MEM(obj) \
>> +        OBJECT_CHECK(VirtIOMEM, (obj), TYPE_VIRTIO_MEM)
>> +#define VIRTIO_MEM_CLASS(oc) \
>> +        OBJECT_CLASS_CHECK(VirtIOMEMClass, (oc), TYPE_VIRTIO_MEM)
>> +#define VIRTIO_MEM_GET_CLASS(obj) \
>> +        OBJECT_GET_CLASS(VirtIOMEMClass, (obj), TYPE_VIRTIO_MEM)
>> +
>> +#define VIRTIO_MEM_MEMDEV_PROP "memdev"
>> +#define VIRTIO_MEM_NODE_PROP "node"
>> +#define VIRTIO_MEM_SIZE_PROP "size"
>> +#define VIRTIO_MEM_REQUESTED_SIZE_PROP "requested-size"
>> +#define VIRTIO_MEM_BLOCK_SIZE_PROP "block-size"
>> +#define VIRTIO_MEM_ADDR_PROP "memaddr"
>> +
>> +typedef struct VirtIOMEM {
>> +    VirtIODevice parent_obj;
>> +
>> +    /* guest -> host request queue */
>> +    VirtQueue *vq;
>> +
>> +    /* bitmap used to track unplugged memory */
>> +    int32_t bitmap_size;
>> +    unsigned long *bitmap;
>> +
>> +    /* assigned memory backend and memory region */
>> +    HostMemoryBackend *memdev;
>> +
>> +    /* NUMA node */
>> +    uint32_t node;
>> +
>> +    /* assigned address of the region in guest physical memory */
>> +    uint64_t addr;
>> +
>> +    /* usable region size (<= region_size) */
>> +    uint64_t usable_region_size;
>> +
>> +    /* actual size (how much the guest plugged) */
>> +    uint64_t size;
>> +
>> +    /* requested size */
>> +    uint64_t requested_size;
>> +
>> +    /* block size and alignment */
>> +    uint64_t block_size;
>> +} VirtIOMEM;
>> +
>> +typedef struct VirtIOMEMClass {
>> +    /* private */
>> +    VirtIODevice parent;
>> +
>> +    /* public */
>> +    void (*fill_device_info)(const VirtIOMEM *vmen, VirtioMEMDeviceInfo *vi);
>> +    MemoryRegion *(*get_memory_region)(VirtIOMEM *vmem, Error **errp);
>> +} VirtIOMEMClass;
>> +
>> +#endif
>> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
>> new file mode 100644
>> index 0000000000..d8a0c974d3
>> --- /dev/null
>> +++ b/hw/virtio/virtio-mem.c
>> @@ -0,0 +1,724 @@
>> +/*
>> + * Virtio MEM device
>> + *
>> + * Copyright (C) 2020 Red Hat, Inc.
>> + *
>> + * Authors:
>> + *  David Hildenbrand <david@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +#include "qemu/iov.h"
>> +#include "qemu/cutils.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/units.h"
>> +#include "sysemu/numa.h"
>> +#include "sysemu/sysemu.h"
>> +#include "sysemu/reset.h"
>> +#include "hw/virtio/virtio.h"
>> +#include "hw/virtio/virtio-bus.h"
>> +#include "hw/virtio/virtio-access.h"
>> +#include "hw/virtio/virtio-mem.h"
>> +#include "qapi/error.h"
>> +#include "qapi/visitor.h"
>> +#include "exec/ram_addr.h"
>> +#include "migration/misc.h"
>> +#include "hw/boards.h"
>> +#include "hw/qdev-properties.h"
>> +#include "config-devices.h"
>> +
>> +/*
>> + * Use QEMU_VMALLOC_ALIGN, so no THP will have to be split when unplugging
>> + * memory (e.g., 2MB on x86_64).
>> + */
>> +#define VIRTIO_MEM_MIN_BLOCK_SIZE QEMU_VMALLOC_ALIGN
>> +/*
>> + * Size the usable region bigger than the requested size if possible. Esp.
>> + * Linux guests will only add (aligned) memory blocks in case they fully
>> + * fit into the usable region, but plug+online only a subset of the pages.
>> + * The memory block size corresponds mostly to the section size.
>> + *
>> + * This allows e.g., to add 20MB with a section size of 128MB on x86_64, and
>> + * a section size of 1GB on arm64 (as long as the start address is properly
>> + * aligned, similar to ordinary DIMMs).
>> + *
>> + * We can change this at any time and maybe even make it configurable if
>> + * necessary (as the section size can change). But it's more likely that the
>> + * section size will rather get smaller and not bigger over time.
>> + */
>> +#if defined(__x86_64__)
>> +#define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
> 
> I just did a cross-compile on s390x and noticed that this should be
> guarded by defined(TARGET_X86_64) (it's target dependent).

#if defined(TARGET_X86_64) || defined(TARGET_I386)

to be precise.


-- 
Thanks,

David / dhildenb


