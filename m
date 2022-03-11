Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041A84D5F77
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:27:59 +0100 (CET)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nScV3-0001kJ-HO
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:27:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nScT6-00010U-Hc
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:25:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nScT1-0002ev-PJ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646994349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qN4dYqo/bGTNhyTFczKzGDhYOaOlR8rPcTRGNVAmC7Q=;
 b=KNYapAZ2hpfBCKIE3qoqwYQQCxvlW49IP1iRsb6QQmsUKHIicW/XT3JdQM5UgkI3UDWy9A
 dnHZDfSusP5+M1+wQVsaZ5QJaG9k3/DgqGeCQcbSJBAWA3GuN5g/hfXVjr/sonnqA/17wS
 jqjJxdKWym//lwjPEsfNC15QIzE+AIE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-Yi9SO4BHOZmCj-_P0dntqA-1; Fri, 11 Mar 2022 05:25:46 -0500
X-MC-Unique: Yi9SO4BHOZmCj-_P0dntqA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l13-20020a7bcf0d000000b0038982c6bf8fso3311130wmg.7
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 02:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qN4dYqo/bGTNhyTFczKzGDhYOaOlR8rPcTRGNVAmC7Q=;
 b=lPen3QmTuKqExps3G0hJKT/pNFLZaqTnMHzp4RHmuFrXfNk610Wptx9GGGs6Q5dP0C
 /sdgl4l2Mx3JNHX3NQcU00sIbEQgfgh5JnZhfBrIgvqEbLiX1muvXhDfOSmjb2aWRd6T
 0WVJDsnD795orVWGTJ8+G889ayFEEdyuukmJNvDzUSDt6O9yfrUkmCFVygYnKZhDLnL2
 Wbzg/HRuZwVuqu7QZo1pd8NwivXAB1BQylT7vxji2g+fH/x2tosnhFHESc+HLvfWCWXr
 FKMLm8af5u6uBnKzr2U6gRgxicJ4wxaW0+HQMpE0agVmdUDnLY4DHzFRRx27JuKfnxk5
 2Gxg==
X-Gm-Message-State: AOAM530uFGXrMt+zpelobGY40L67e1LbYwdp3LKiBrYStXW+Jd7lT+BK
 9B3+NbHVk0DmM9AsaeNTz3Hc1n84+mtGSvyZ6egd8I/tqUHpN22ij7SZkojJeWiu+h4RX0H9zd8
 eMpsGPoWx9RFpemQ=
X-Received: by 2002:a05:600c:5118:b0:381:71f6:bb93 with SMTP id
 o24-20020a05600c511800b0038171f6bb93mr14761766wms.169.1646994345286; 
 Fri, 11 Mar 2022 02:25:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMPo/s15wUWX8FDXdYOodgnAFd63MxOu5fzcg/UUm4thJcJmGIZmMxYTL4MuTymzyre50+jg==
X-Received: by 2002:a05:600c:5118:b0:381:71f6:bb93 with SMTP id
 o24-20020a05600c511800b0038171f6bb93mr14761729wms.169.1646994344918; 
 Fri, 11 Mar 2022 02:25:44 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:8200:163d:7a08:6e61:87a5?
 (p200300cbc7078200163d7a086e6187a5.dip0.t-ipconnect.de.
 [2003:cb:c707:8200:163d:7a08:6e61:87a5])
 by smtp.gmail.com with ESMTPSA id
 d25-20020adfa419000000b001f04b3a4b46sm6286105wra.94.2022.03.11.02.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 02:25:44 -0800 (PST)
Message-ID: <085ef1b1-ea75-00e6-9cc3-ba6854aa6a32@redhat.com>
Date: Fri, 11 Mar 2022 11:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <20220303121534-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220303121534-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.22 18:21, Michael S. Tsirkin wrote:
> On Wed, Dec 22, 2021 at 11:05:15AM -0800, Steve Sistare wrote:
>> Allocate anonymous memory using memfd_create if the memfd-alloc machine
>> option is set.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  hw/core/machine.c   | 19 +++++++++++++++++++
>>  include/hw/boards.h |  1 +
>>  qemu-options.hx     |  6 ++++++
>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
>>  softmmu/vl.c        |  1 +
>>  trace-events        |  1 +
>>  util/qemu-config.c  |  4 ++++
>>  7 files changed, 70 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 53a99ab..7739d88 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
>>      ms->mem_merge = value;
>>  }
>>  
>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
>> +{
>> +    MachineState *ms = MACHINE(obj);
>> +
>> +    return ms->memfd_alloc;
>> +}
>> +
>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
>> +{
>> +    MachineState *ms = MACHINE(obj);
>> +
>> +    ms->memfd_alloc = value;
>> +}
>> +
>>  static bool machine_get_usb(Object *obj, Error **errp)
>>  {
>>      MachineState *ms = MACHINE(obj);
>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>      object_class_property_set_description(oc, "mem-merge",
>>          "Enable/disable memory merge support");
>>  
>> +    object_class_property_add_bool(oc, "memfd-alloc",
>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
>> +    object_class_property_set_description(oc, "memfd-alloc",
>> +        "Enable/disable allocating anonymous memory using memfd_create");
>> +
>>      object_class_property_add_bool(oc, "usb",
>>          machine_get_usb, machine_set_usb);
>>      object_class_property_set_description(oc, "usb",
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 9c1c190..a57d7a0 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -327,6 +327,7 @@ struct MachineState {
>>      char *dt_compatible;
>>      bool dump_guest_core;
>>      bool mem_merge;
>> +    bool memfd_alloc;
>>      bool usb;
>>      bool usb_disabled;
>>      char *firmware;
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 7d47510..33c8173 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>>      "                mem-merge=on|off controls memory merge support (default: on)\n"
>> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"
> 
> Question: are there any disadvantages associated with using
> memfd_create? I guess we are using up an fd, but that seems minor.  Any
> reason not to set to on by default? maybe with a fallback option to
> disable that?
> 
> I am concerned that it's actually a kind of memory backend, this flag
> seems to instead be closer to the deprecated mem-prealloc. E.g.
> it does not work with a mem path, does it?

We had a RH-internal discssuion some time ago, here is my writeup (note
the TMPFS/SHMEM discussion):

--- snip ---

In QEMU, we specify the type of guest RAM via
* -object memory-backend-ram,...
* -object memory-backend-file,...
* -object memory-backend-memfd,...

We can specify whether to share the memory (share=on -- MAP_SHARED),
or whether to keep modifications local to QEMU (share=off -- MAP_PRIVATE).

Using "share=off" (or using the default) with files/memfd can have some
serious side-effects.

ALERT: "share=off" is the default in QEMU for memory-backend-ram and
memory-backend-file. "share=on" is the default in QEMU only for
memory-backend-memfd.


I. MAP_SHARED vs. MAP_PRIVATE

MAP_SHARED: when reading, read file content; when writing, modify file
             content.
MAP_PRIVATE: when reading, read file content, except if there was a
              local/private change. When writing, keep change
              local/private and don't modify file content.


MAP_PRIVATE sounds like a snapshot, however, in some cases it really
behaves differently -- especially with tmpfs/shmem and when QEMU
discards memory (e.g., with virtio-balloon or during postcopy live
migration).

There is some connection between MAP_PRIVATE and NUMA bindings that I
have yet to fully explore. We could have issues with some MAP_SHARED
mappings and NUMA bindings (IOW: policy getting ignored).


II Impact on different memory backends/types

II.1. Anonymous memory:

Usage: -object memory-backend-ram,...

We really want "share=off" in 99.99% of all cases. Shared anonymous RAM
-- i.e., sharing RAM with your child processes -- does not really apply
to QEMU and there are some cases that are broken in QEMU [1]; there is
only a single use case in the context of RDMA -- whereby we only need
shared anonymous memory to make mremap() work, not for actually sharing
RAM with someone else.

II.2. TMPFS/SHMEM

Usage: -object memory-backend-memfd,...
        -object memory-backend-file,mem-path=/dev/shm/FILE,...

We really want "share=on" in 99.99999% of all cases. There is a serious
issue when using private mappings on an empty shmem file, whereby we can
get a double memory consumption. The issue is that even when reading
via a private mapping, we will allocate memory for the actual file (==
RAM for tmpfs) -- even if it's just allocating blocks filled with zero.

So doing a -object memory-backend-file,mem-path=/dev/shm/FILE will in
the worst case consume 4G, even though we have an anonymous file -- *we
have to use share=on*.

II.3. Hugetlb

Usage: -object memory-backend-memfd,hugetlb=on,hugetlbsize=2M,...
        -object memory-backend-file,mem-path=/dev/shm/FILE,...

We usually want "share=on". However, there seems to be nothing wrong
about using "memory-backend-memfd" -- IOW an anonymous file; it works as
expected in my tests (fallocate() behaves in weird ways, but that's a
different story).

II.4. "Ordinary" Files

Usage: -object memory-backend-file,mem-path=/some/file,...

We usually want "share=on" in 99.9% of all cases, to have
modifications go back to the file -- for example, for the "big file" use
case where we want to use the actual file storage as memory backend (for
example, when swapping is not desired), such that we can use the page
cache where possible, but writeback the file content to disk when under
memory pressure.

5. DAX/PMEM

Usage: -object memory-backend-file,mem-path=/dev/dax,...

We want "share=on" in 99.99999% of all cases when using dax/pmem in an
emulated NVDIMM for our guest. We want the changes to go back to
dax/pmem a.k.a. the actual NVDIMM (not some mixture of pmem and system RAM).


III. MAP_PRIVATE vs. virtio-balloon and postcopy live migration

Dave told me about a use case where we

a) Start a VM with a MAP_SHARED file as guest RAM until it is booted up
b) Save the VM state, *excluding guest RAM"
c) Start multiple VMs using the VM state and the MAP_PRIVATE file as
guest RAM

This is essentially a fast "guest snapshot". But beware if you end up
discarding memory in QEMU via ram_block_discard_range(), e.g., via
virtio-balloon or via postcopy live migration.

In QEMU, we always discard file content and modified pages in private
mappings.

Problem: If one VM discards memory, it will modify the snapshot. The
snapshot will be broken. New VMs and running VMs will be affected!

Note: We cannot easily teach QEMU to not modify file content when
discarding memory of private mappings. This would break postcopy live in
some cases completely.

--- snip ---

-- 
Thanks,

David / dhildenb


