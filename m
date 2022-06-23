Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC85580F1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:54:43 +0200 (CEST)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Q6M-0005AB-UX
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o4Q4N-0003WJ-4Z
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:52:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o4Q4I-0005qO-AS
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656003153;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQMx2lZYz4wVUJyi7WvmG8uhPGlTt5ebmE1AT1Z2sao=;
 b=DjxlUZlpQEGbxDoV4RXp8mCM4cIkK1Vnh8ImPx5Srw/K8dzOBOkKM/9CReeR3Sm1o+TJTX
 oTfpliH+rQ2iD6E3BCi4KaY7DTadKuvBdx0SMExt7vspoYPADgc1QlZhzc2RZOQe5DhE+i
 47aRftQdB7XZWQAl4bSUvcI2mnp57/M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-dp9pjEZbOGGnfsWuj8Y_xg-1; Thu, 23 Jun 2022 12:52:31 -0400
X-MC-Unique: dp9pjEZbOGGnfsWuj8Y_xg-1
Received: by mail-qv1-f70.google.com with SMTP id
 mr11-20020a056214348b00b004705c0cb439so83502qvb.19
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 09:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VQMx2lZYz4wVUJyi7WvmG8uhPGlTt5ebmE1AT1Z2sao=;
 b=1JQj/ovESdctQtB5Vk4mQ5cV4dikjsID/0YLjVIboJsKB0UGCLeCfyF1+OdWrEK5KD
 NkVzzcq09IWg4Fua9Zuos1++SI9X0hIiyVrHxVNyZY92eMl5cHxhliOKnr+ZB6Hfq4sA
 im7vWKXwYnZpag3LmUZskm1qp6csETJP69XfxvF28NiwVWWMFPwWHt9hjorvuSIfllPV
 KTy4yCFyMFcIuxB1+tNj5nWAI3GsVMojBadIKWpKK2RcgkCj2+C2ueOieXveWhLFCjXx
 BpLgP+5HjwvR+W4kEEVNeDkkksfAUqeu7mB8DWbvUZ4BXLhjhST9pFfXHy/nOIIskUsZ
 PMJA==
X-Gm-Message-State: AJIora+bEyUp8m17GpkvMhxC/3J5hX1q9xkr7lJlQBwtFTh4iUNLQoGC
 o5//xv2pKk4DLO+kSggV1+t2uv9rBF7qOmM2UXPIpaRTVy9T4qpB7l1QD5QsL4p2Iz5gAaemwtj
 FxWVeii4g1p6ZTyo=
X-Received: by 2002:a0c:a944:0:b0:470:85e2:dc1c with SMTP id
 z4-20020a0ca944000000b0047085e2dc1cmr2302110qva.8.1656003151162; 
 Thu, 23 Jun 2022 09:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uteY5yj8yQT/oeAM/KBJHZ2sKe+y/60o1wSJb4f/4yErfv8y5S3Ql+dM0dw1gFWvWBiHmsNw==
X-Received: by 2002:a0c:a944:0:b0:470:85e2:dc1c with SMTP id
 z4-20020a0ca944000000b0047085e2dc1cmr2302087qva.8.1656003150800; 
 Thu, 23 Jun 2022 09:52:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 bp38-20020a05620a45a600b006a67d257499sm41124qkb.56.2022.06.23.09.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 09:52:30 -0700 (PDT)
Message-ID: <3d1dd772-4470-bb20-73ac-eb302f3b0d38@redhat.com>
Date: Thu, 23 Jun 2022 18:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] virtio-iommu: Add bypass mode support to assigned
 device
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 pbonzini@redhat.com, yu.c.zhang@intel.com, chuanxiao.dong@intel.com,
 tina.zhang@intel.com
References: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
 <20220613061010.2674054-2-zhenzhong.duan@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220613061010.2674054-2-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
On 6/13/22 08:10, Zhenzhong Duan wrote:
> Currently assigned devices can not work in virtio-iommu bypass mode.
> Guest driver fails to probe the device due to DMA failure. And the
> reason is because of lacking GPA -> HPA mappings when VM is created.
>
> Add a root container memory region to hold both bypass memory region
> and iommu memory region, so the switch between them is supported
> just like the implementation in virtual VT-d.
>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  hw/virtio/trace-events           |   1 +
>  hw/virtio/virtio-iommu.c         | 115 ++++++++++++++++++++++++++++++-
>  include/hw/virtio/virtio-iommu.h |   2 +
>  3 files changed, 116 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index ab8e095b73fa..20af2e7ebd78 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -124,6 +124,7 @@ virtio_iommu_remap(const char *name, uint64_t virt_start, uint64_t virt_end, uin
>  virtio_iommu_set_page_size_mask(const char *name, uint64_t old, uint64_t new) "mr=%s old_mask=0x%"PRIx64" new_mask=0x%"PRIx64
>  virtio_iommu_notify_flag_add(const char *name) "add notifier to mr %s"
>  virtio_iommu_notify_flag_del(const char *name) "del notifier from mr %s"
> +virtio_iommu_switch_address_space(uint8_t bus, uint8_t slot, uint8_t fn, bool on) "Device %02x:%02x.%x switching address space (iommu enabled=%d)"
>  
>  # virtio-mem.c
>  virtio_mem_send_response(uint16_t type) "type=%" PRIu16
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 2597e166f939..ff718107ee02 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -69,6 +69,77 @@ static inline uint16_t virtio_iommu_get_bdf(IOMMUDevice *dev)
>      return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
>  }
>  
> +static bool virtio_iommu_device_bypassed(IOMMUDevice *sdev)
> +{
> +    uint32_t sid;
> +    bool bypassed;
> +    VirtIOIOMMU *s = sdev->viommu;
> +    VirtIOIOMMUEndpoint *ep;
> +
> +    sid = virtio_iommu_get_bdf(sdev);
> +
> +    qemu_mutex_lock(&s->mutex);
> +    /* need to check bypass before system reset */
> +    if (!s->endpoints) {
> +        bypassed = s->config.bypass;
> +        goto unlock;
> +    }
> +
> +    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
> +    if (!ep || !ep->domain) {
> +        bypassed = s->config.bypass;
> +    } else {
> +        bypassed = ep->domain->bypass;
> +    }
> +
> +unlock:
> +    qemu_mutex_unlock(&s->mutex);
> +    return bypassed;
> +}
> +
> +/* Return whether the device is using IOMMU translation. */
> +static bool virtio_iommu_switch_address_space(IOMMUDevice *sdev)
> +{
> +    bool use_remapping;
> +
> +    assert(sdev);
> +
> +    use_remapping = !virtio_iommu_device_bypassed(sdev);
> +
> +    trace_virtio_iommu_switch_address_space(pci_bus_num(sdev->bus),
> +                                            PCI_SLOT(sdev->devfn),
> +                                            PCI_FUNC(sdev->devfn),
> +                                            use_remapping);
> +
> +    /* Turn off first then on the other */
> +    if (use_remapping) {
> +        memory_region_set_enabled(&sdev->bypass_mr, false);
> +        memory_region_set_enabled(MEMORY_REGION(&sdev->iommu_mr), true);
> +    } else {
> +        memory_region_set_enabled(MEMORY_REGION(&sdev->iommu_mr), false);
> +        memory_region_set_enabled(&sdev->bypass_mr, true);
> +    }
> +
> +    return use_remapping;
> +}
> +
> +static void virtio_iommu_switch_address_space_all(VirtIOIOMMU *s)
> +{
> +    GHashTableIter iter;
> +    IOMMUPciBus *iommu_pci_bus;
> +    int i;
> +
> +    g_hash_table_iter_init(&iter, s->as_by_busptr);
> +    while (g_hash_table_iter_next(&iter, NULL, (void **)&iommu_pci_bus)) {
> +        for (i = 0; i < PCI_DEVFN_MAX; i++) {
> +            if (!iommu_pci_bus->pbdev[i]) {
> +                continue;
> +            }
> +            virtio_iommu_switch_address_space(iommu_pci_bus->pbdev[i]);
> +        }
> +    }
> +}
> +
>  /**
>   * The bus number is used for lookup when SID based operations occur.
>   * In that case we lazily populate the IOMMUPciBus array from the bus hash
> @@ -213,6 +284,7 @@ static gboolean virtio_iommu_notify_map_cb(gpointer key, gpointer value,
>  static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
>  {
>      VirtIOIOMMUDomain *domain = ep->domain;
> +    IOMMUDevice *sdev = container_of(ep->iommu_mr, IOMMUDevice, iommu_mr);
>  
>      if (!ep->domain) {
>          return;
> @@ -221,6 +293,7 @@ static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
>                     ep->iommu_mr);
>      QLIST_REMOVE(ep, next);
>      ep->domain = NULL;
> +    virtio_iommu_switch_address_space(sdev);
>  }
>  
>  static VirtIOIOMMUEndpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
> @@ -323,12 +396,39 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
>  
>          trace_virtio_iommu_init_iommu_mr(name);
>  
> +        memory_region_init(&sdev->root, OBJECT(s), name, UINT64_MAX);
> +        address_space_init(&sdev->as, &sdev->root, TYPE_VIRTIO_IOMMU);
> +
> +        /*
> +         * Build the IOMMU disabled container with aliases to the
> +         * shared MRs.  Note that aliasing to a shared memory region
What do you call the 'disabled container' and the shared MRs?

> +         * could help the memory API to detect same FlatViews so we
> +         * can have devices to share the same FlatView when in bypass
> +         * mode. (either by not configuring virtio-iommu driver or with
> +         * "iommu=pt").  It will greatly reduce the total number of
> +         * FlatViews of the system hence VM runs faster.

Do you mean that we could have used a shared bypass MR instead of
creatingone per device?
> +         */
> +        memory_region_init_alias(&sdev->bypass_mr, OBJECT(s),
> +                                 "system", get_system_memory(), 0,
> +                                 memory_region_size(get_system_memory()));
> +
>          memory_region_init_iommu(&sdev->iommu_mr, sizeof(sdev->iommu_mr),
>                                   TYPE_VIRTIO_IOMMU_MEMORY_REGION,
>                                   OBJECT(s), name,
>                                   UINT64_MAX);
> -        address_space_init(&sdev->as,
> -                           MEMORY_REGION(&sdev->iommu_mr), TYPE_VIRTIO_IOMMU);
> +
> +        /*
> +         * Hook both the containers under the root container, we
did you mean "hook both sub-regions to the root container"?
> +         * switch between iommu & bypass MRs by enable/disable
> +         * corresponding sub-containers
> +         */
> +        memory_region_add_subregion_overlap(&sdev->root, 0,
> +                                            MEMORY_REGION(&sdev->iommu_mr),
> +                                            0);
> +        memory_region_add_subregion_overlap(&sdev->root, 0,
> +                                            &sdev->bypass_mr, 0);
> +
> +        virtio_iommu_switch_address_space(sdev);
>          g_free(name);
>      }
>      return &sdev->as;
> @@ -342,6 +442,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>      uint32_t flags = le32_to_cpu(req->flags);
>      VirtIOIOMMUDomain *domain;
>      VirtIOIOMMUEndpoint *ep;
> +    IOMMUDevice *sdev;
>  
>      trace_virtio_iommu_attach(domain_id, ep_id);
>  
> @@ -375,6 +476,8 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>      QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
>  
>      ep->domain = domain;
> +    sdev = container_of(ep->iommu_mr, IOMMUDevice, iommu_mr);
> +    virtio_iommu_switch_address_space(sdev);
>  
>      /* Replay domain mappings on the associated memory region */
>      g_tree_foreach(domain->mappings, virtio_iommu_notify_map_cb,
> @@ -887,6 +990,7 @@ static void virtio_iommu_set_config(VirtIODevice *vdev,
>              return;
>          }
>          dev_config->bypass = in_config->bypass;
> +        virtio_iommu_switch_address_space_all(dev);
>      }
>  
>      trace_virtio_iommu_set_config(in_config->bypass);
> @@ -1026,6 +1130,8 @@ static void virtio_iommu_system_reset(void *opaque)
>       * system reset
>       */
>      s->config.bypass = s->boot_bypass;
> +    virtio_iommu_switch_address_space_all(s);
> +
>  }
>  
>  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> @@ -1041,6 +1147,11 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>                               virtio_iommu_handle_command);
>      s->event_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL);
>  
> +    /*
> +     * config.bypass is needed to get initial address space early, such as
> +     * in vfio realize
> +     */
I don't understand this comment, please can you elaborate?
> +    s->config.bypass = s->boot_bypass;
>      s->config.page_size_mask = TARGET_PAGE_MASK;
>      s->config.input_range.end = UINT64_MAX;
>      s->config.domain_range.end = UINT32_MAX;
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 84391f844826..102eeefa731d 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -37,6 +37,8 @@ typedef struct IOMMUDevice {
>      int           devfn;
>      IOMMUMemoryRegion  iommu_mr;
>      AddressSpace  as;
> +    MemoryRegion root;          /* The root container of the device */
> +    MemoryRegion bypass_mr;     /* The alias of shared memory MR */
>  } IOMMUDevice;
>  
>  typedef struct IOMMUPciBus {
Did you test migration? I wonder if we shouldn't call

virtio_iommu_switch_address_space_all(s)
after restoring the endpoints in iommu_post_load() as it is done in intel-iommu

Thanks

Eric


