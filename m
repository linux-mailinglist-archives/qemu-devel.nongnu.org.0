Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF565463A33
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 16:36:23 +0100 (CET)
Received: from localhost ([::1]:50200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms5B8-0003NC-83
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 10:36:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1ms59D-0001JZ-T3
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1ms59B-0003T3-Og
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638286460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rU80j+4jdb7UbObSlakL6+UkhL7lYSBDYCHmrbHGaDs=;
 b=cdh2ol7mPwtRtT9tfl/SKWHPgV9T0Pbr1M/9gRFwfSBXjHSQw6qg3T8zhSUleedC727RVJ
 6Ug5skqLnQEb0tQS6WJWBHvnNiFvULJDosIWxYitkD82Yfk0Qcc8rOhIC2+e6DKfBQvuzq
 dgrJbDXuH84UXmYYVdECraADUaNpL3o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-U-3LBu9ENDGjpNIwhC8HlQ-1; Tue, 30 Nov 2021 10:34:18 -0500
X-MC-Unique: U-3LBu9ENDGjpNIwhC8HlQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 s12-20020a50ab0c000000b003efdf5a226fso11120168edc.10
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 07:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rU80j+4jdb7UbObSlakL6+UkhL7lYSBDYCHmrbHGaDs=;
 b=bOrSufDbp27CQeDWlrNWyGaub+vQcM03Y7FON+I3MCPy9UTOv9yopYDjM+q9znGUQA
 v4sgg6E89izkqjjEfhuxUOqzqV7ClTY0SPZeIQiKug24LPDe//fN6ehoUaeAC7dNNBy5
 XrRmDC3X0xp5Aps2Owv6zyfA7WFF77xsfACukVHcUH0/Fj8ru+1vsNUar6P39Idf/EPf
 R7U0sZlOY23VSg53+rGbJlfEQEFu9EVZwmO2Q3g++he5WI1UBIkovbdfIMIjG4PqeVhK
 /nyjImjQs8a9Ga2qp1RCSqKS+OrOAwyoomx/OTjX/KeCHYD6uubND1oVhU9b8GkuVY9u
 gQsg==
X-Gm-Message-State: AOAM532S9eOnsjR4hEtshLinm2JZvLZCf3P5ui2Wzei59TweeCfvHAgK
 ltZlmOrKY3jOT/obPbH9pMsvb3bS3ifXzsUA9XoPjga43VYH0TgPZdg36Ie+x2vMt0xJZ4E+Zpy
 R7Nz77cV0O249ln4=
X-Received: by 2002:a05:6402:4c4:: with SMTP id
 n4mr85494709edw.30.1638286453494; 
 Tue, 30 Nov 2021 07:34:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhWe0MX9nRh0UEkpjS7DWUYlffX/AC22flxLzAeOK8tl8DfI0HZYITkBY4+aWNr185DVe2yw==
X-Received: by 2002:a05:6402:4c4:: with SMTP id
 n4mr85494652edw.30.1638286453192; 
 Tue, 30 Nov 2021 07:34:13 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id c7sm9622407ejd.91.2021.11.30.07.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 07:34:12 -0800 (PST)
Message-ID: <ebafe902-b345-1b07-e77f-56289816a542@redhat.com>
Date: Tue, 30 Nov 2021 16:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v1 2/3] virtio-mem: Support
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211130092838.24224-1-david@redhat.com>
 <20211130092838.24224-3-david@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20211130092838.24224-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 10:28, David Hildenbrand wrote:
> With VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, we signal the VM that reading
> unplugged memory is not supported. We have to fail feature negotiation
> in case the guest does not support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.
> 
> First, VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE is required to properly handle
> memory backends (or architectures) without support for the shared zeropage
> in the hypervisor cleanly. Without the shared zeropage, even reading an
> unpopulated virtual memory location can populate real memory and
> consequently consume memory in the hypervisor. We have a guaranteed shared
> zeropage only on MAP_PRIVATE anonymous memory.
> 
> Second, we want VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE to be the default
> long-term as even populating the shared zeropage can be problematic: for
> example, without THP support (possible) or without support for the shared
> huge zeropage with THP (unlikely), the PTE page tables to hold the shared
> zeropage entries can consume quite some memory that cannot be reclaimed
> easily.
> 
> Third, there are other optimizations+features (e.g., protection of
> unplugged memory, reducing the total memory slot size and bitmap sizes)
> that will require VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.
> 
> We really only support x86 targets with virtio-mem for now (and
> Linux similarly only support x86), but that might change soon, so prepare
> for different targets already.
> 
> Add a new "unplugged-inaccessible" tristate property for x86 targets:
> - "off" will keep VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE unset and legacy
>   guests working.
> - "on" will set VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE and stop legacy guests
>   from using the device.
> - "auto" selects the default based on support for the shared zeropage.
> 
> Warn in case the property is set to "off" and we don't have support for the
> shared zeropage.
> 
> For existing compat machines, the property will default to "off", to
> not change the behavior but eventually warn about a problematic setup.
> Short-term, we'll set the property default to "auto" for new QEMU machines.
> Mid-term, we'll set the property default to "on" for new QEMU machines.
> Long-term, we'll deprecate the parameter and disallow legacy
> guests completely.
> 
> The property has to match on the migration source and destination. "auto"
> will result in the same VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE setting as long
> as the qemu command line (esp. memdev) match -- so "auto" is good enough
> for migration purposes and the parameter doesn't have to be migrated
> explicitly.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/virtio/virtio-mem.c         | 63 ++++++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-mem.h |  8 +++++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index d5a578142b..1e57156e81 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -32,6 +32,14 @@
>  #include CONFIG_DEVICES
>  #include "trace.h"
>  
> +/*
> + * We only had legacy x86 guests that did not support
> + * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE. Other targets don't have legacy guests.
> + */
> +#if defined(TARGET_X86_64) || defined(TARGET_I386)
> +#define VIRTIO_MEM_HAS_LEGACY_GUESTS
> +#endif
> +
>  /*
>   * Let's not allow blocks smaller than 1 MiB, for example, to keep the tracking
>   * bitmap small.
> @@ -110,6 +118,19 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
>      return MAX(page_size, VIRTIO_MEM_MIN_BLOCK_SIZE);
>  }
>  
> +#if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
> +static bool virtio_mem_has_shared_zeropage(RAMBlock *rb)
> +{
> +    /*
> +     * We only have a guaranteed shared zeropage on ordinary MAP_PRIVATE
> +     * anonymous RAM. In any other case, reading unplugged *can* populate a
> +     * fresh page, consuming actual memory.
> +     */
> +    return !qemu_ram_is_shared(rb) && rb->fd < 0 &&
> +           qemu_ram_pagesize(rb) == qemu_real_host_page_size;
> +}
> +#endif /* VIRTIO_MEM_HAS_LEGACY_GUESTS */
> +
>  /*
>   * Size the usable region bigger than the requested size if possible. Esp.
>   * Linux guests will only add (aligned) memory blocks in case they fully
> @@ -653,15 +674,29 @@ static uint64_t virtio_mem_get_features(VirtIODevice *vdev, uint64_t features,
>                                          Error **errp)
>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
> +    VirtIOMEM *vmem = VIRTIO_MEM(vdev);
>  
>      if (ms->numa_state) {
>  #if defined(CONFIG_ACPI)
>          virtio_add_feature(&features, VIRTIO_MEM_F_ACPI_PXM);
>  #endif
>      }
> +    assert(vmem->unplugged_inaccessible != ON_OFF_AUTO_AUTO);
> +    if (vmem->unplugged_inaccessible == ON_OFF_AUTO_ON) {
> +        virtio_add_feature(&features, VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE);
> +    }
>      return features;
>  }
>  
> +static int virtio_mem_validate_features(VirtIODevice *vdev)
> +{
> +    if (virtio_host_has_feature(vdev, VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE) &&
> +        !virtio_vdev_has_feature(vdev, VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE)) {
> +        return -EFAULT;
> +    }
> +    return 0;
> +}
> +
>  static void virtio_mem_system_reset(void *opaque)
>  {
>      VirtIOMEM *vmem = VIRTIO_MEM(opaque);
> @@ -716,6 +751,29 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>      rb = vmem->memdev->mr.ram_block;
>      page_size = qemu_ram_pagesize(rb);
>  
> +#if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
> +    switch (vmem->unplugged_inaccessible) {
> +    case ON_OFF_AUTO_AUTO:
> +        if (virtio_mem_has_shared_zeropage(rb)) {
> +            vmem->unplugged_inaccessible = ON_OFF_AUTO_OFF;
> +        } else {
> +            vmem->unplugged_inaccessible = ON_OFF_AUTO_ON;
> +        }
> +        break;
> +    case ON_OFF_AUTO_OFF:
> +        if (!virtio_mem_has_shared_zeropage(rb)) {
> +            warn_report("'%s' property set to 'off' with a memdev that does"
> +                        " not support the shared zeropage.",
> +                        VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP);
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +#else /* VIRTIO_MEM_HAS_LEGACY_GUESTS */
> +    vmem->unplugged_inaccessible = ON_OFF_AUTO_ON;
> +#endif /* VIRTIO_MEM_HAS_LEGACY_GUESTS */
> +
>      /*
>       * If the block size wasn't configured by the user, use a sane default. This
>       * allows using hugetlbfs backends of any page size without manual
> @@ -1109,6 +1167,10 @@ static Property virtio_mem_properties[] = {
>      DEFINE_PROP_UINT32(VIRTIO_MEM_NODE_PROP, VirtIOMEM, node, 0),
>      DEFINE_PROP_LINK(VIRTIO_MEM_MEMDEV_PROP, VirtIOMEM, memdev,
>                       TYPE_MEMORY_BACKEND, HostMemoryBackend *),
> +#if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
> +    DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
> +                            unplugged_inaccessible, ON_OFF_AUTO_OFF),

In theory, libvirt likes properties to be arch agnostic, but that boat
sailed away already. And honestly, the default is reasonable so I don't
think we will need to query for this capability.

> +#endif
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


