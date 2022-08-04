Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0D58971A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 06:38:27 +0200 (CEST)
Received: from localhost ([::1]:39556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJScs-0003rc-CN
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 00:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJSad-0002OS-TR
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJSaa-00046F-Ho
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659587763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pusb/gArFFwJGvdatRkIk+S/33mt+/MIat6GqC/G1Q=;
 b=bhTnU2aiaWEiub9bfxG4BJcccIn1SYZeQ1dqZVFxBm8djQMhUmQvjC6oNAQAP76LTF3ZyW
 tdZgKLm5evRf7O0cIuEsdiqgHct6TrJUBFlY3P6exT511zsSsYC930ekCLTaBheCFruAvr
 vI8TkuOn7ZTvFdby53p6SqSQ/au/lqE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-kRhI6qIVMwuGefJJLxGQyw-1; Thu, 04 Aug 2022 00:36:01 -0400
X-MC-Unique: kRhI6qIVMwuGefJJLxGQyw-1
Received: by mail-pj1-f70.google.com with SMTP id
 s4-20020a17090a760400b001f3120342daso8200359pjk.4
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 21:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3pusb/gArFFwJGvdatRkIk+S/33mt+/MIat6GqC/G1Q=;
 b=OZrHI693r/6CiAKdp/JqG9lx5C3o4kkPKgGcPTJho3GzhSbxl8BduqByA4lAcOeuPy
 AKa/Z8jbCHBJivZ965/8fLkHhoSX3VaA6ce7wrKKnNLo12Z/tQm0yD9xPEDOeawdHcvX
 058NPSMfWdTowL8Ik2UKLoonVOmfS+Ozy2NA9fGcbA1Ey898g/7vd1iz++o6hkFfgxOx
 EnHCiRTL9O2chx3W33PCUTRzTkbafXhqmqj1NNDEzgb+4XZ7xoVa1p0ZcPL8ca2uUycA
 S4UZ3Fr3Ku1suBC4b/4cmszG8J5Qs+JeX6dYxUjzQmH/MLJ9V4gZgQXL+gHIdlnAcNZI
 OTiQ==
X-Gm-Message-State: ACgBeo1p+NaU1DucFMNDnc8m+oqqClSNEhIXUsj/v/xeKv9k0H+6GwFF
 oo7WAqQBGf5hKj5Sn/uMgVXRitwwCS/ic7x9Ax/ucC2PNsOF9f31JUlK8qmTjTttdkSUHk9Jn44
 U/gi/Rf7PPe40KB4=
X-Received: by 2002:a63:688a:0:b0:412:6728:4bf3 with SMTP id
 d132-20020a63688a000000b0041267284bf3mr129817pgc.339.1659587760494; 
 Wed, 03 Aug 2022 21:36:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR48+uv2EDVbrKWm5/8sZOq5h+c4brLjiVHqiPOE++XMa6GPhG1Nt2KEPsW41VUaRCkmfzgRAg==
X-Received: by 2002:a63:688a:0:b0:412:6728:4bf3 with SMTP id
 d132-20020a63688a000000b0041267284bf3mr129785pgc.339.1659587760107; 
 Wed, 03 Aug 2022 21:36:00 -0700 (PDT)
Received: from [10.72.12.192] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a170903244700b0016cd74dae66sm2920856pls.28.2022.08.03.21.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 21:35:59 -0700 (PDT)
Message-ID: <a0b976bd-112b-1c0c-34f2-a9de38241fb8@redhat.com>
Date: Thu, 4 Aug 2022 12:35:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/7] vdpa: Add asid parameter to
 vhost_vdpa_dma_map/unmap
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong
 <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20220803171821.481336-1-eperezma@redhat.com>
 <20220803171821.481336-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220803171821.481336-5-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/8/4 01:18, Eugenio Pérez 写道:
> So the caller can choose which ASID is destined.
>
> No need to update the batch functions as they will always be called from
> memory listener updates at the moment. Memory listener updates will
> always update ASID 0, as it's the passthrough ASID.
>
> All vhost devices's ASID are 0 at this moment.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
> v3: Deleted unneeded space
> ---
>   include/hw/virtio/vhost-vdpa.h |  8 +++++---
>   hw/virtio/vhost-vdpa.c         | 25 +++++++++++++++----------
>   net/vhost-vdpa.c               |  6 +++---
>   hw/virtio/trace-events         |  4 ++--
>   4 files changed, 25 insertions(+), 18 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 1111d85643..6560bb9d78 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -29,6 +29,7 @@ typedef struct vhost_vdpa {
>       int index;
>       uint32_t msg_type;
>       bool iotlb_batch_begin_sent;
> +    uint32_t address_space_id;
>       MemoryListener listener;
>       struct vhost_vdpa_iova_range iova_range;
>       uint64_t acked_features;
> @@ -42,8 +43,9 @@ typedef struct vhost_vdpa {
>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>   } VhostVDPA;
>   
> -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> -                       void *vaddr, bool readonly);
> -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
> +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
> +                       hwaddr size, void *vaddr, bool readonly);
> +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
> +                         hwaddr size);
>   
>   #endif
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 2fefcc66ad..131100841c 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -72,22 +72,24 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
>       return false;
>   }
>   
> -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> -                       void *vaddr, bool readonly)
> +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
> +                       hwaddr size, void *vaddr, bool readonly)
>   {
>       struct vhost_msg_v2 msg = {};
>       int fd = v->device_fd;
>       int ret = 0;
>   
>       msg.type = v->msg_type;
> +    msg.asid = asid;


I wonder what happens if we're running is a kernel without ASID support.

Does it work since asid will be simply ignored? Can we have a case that 
we want asid!=0 on old kernel?

Thanks


>       msg.iotlb.iova = iova;
>       msg.iotlb.size = size;
>       msg.iotlb.uaddr = (uint64_t)(uintptr_t)vaddr;
>       msg.iotlb.perm = readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW;
>       msg.iotlb.type = VHOST_IOTLB_UPDATE;
>   
> -   trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iotlb.size,
> -                            msg.iotlb.uaddr, msg.iotlb.perm, msg.iotlb.type);
> +    trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.asid, msg.iotlb.iova,
> +                             msg.iotlb.size, msg.iotlb.uaddr, msg.iotlb.perm,
> +                             msg.iotlb.type);
>   
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
> @@ -98,18 +100,20 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
>       return ret;
>   }
>   
> -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size)
> +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
> +                         hwaddr size)
>   {
>       struct vhost_msg_v2 msg = {};
>       int fd = v->device_fd;
>       int ret = 0;
>   
>       msg.type = v->msg_type;
> +    msg.asid = asid;
>       msg.iotlb.iova = iova;
>       msg.iotlb.size = size;
>       msg.iotlb.type = VHOST_IOTLB_INVALIDATE;
>   
> -    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
> +    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.asid, msg.iotlb.iova,
>                                  msg.iotlb.size, msg.iotlb.type);
>   
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
> @@ -229,7 +233,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>       }
>   
>       vhost_vdpa_iotlb_batch_begin_once(v);
> -    ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> +    ret = vhost_vdpa_dma_map(v, 0, iova, int128_get64(llsize),
>                                vaddr, section->readonly);
>       if (ret) {
>           error_report("vhost vdpa map fail!");
> @@ -299,7 +303,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>           vhost_iova_tree_remove(v->iova_tree, result);
>       }
>       vhost_vdpa_iotlb_batch_begin_once(v);
> -    ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> +    ret = vhost_vdpa_dma_unmap(v, 0, iova, int128_get64(llsize));
>       if (ret) {
>           error_report("vhost_vdpa dma unmap error!");
>       }
> @@ -890,7 +894,7 @@ static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
>       }
>   
>       size = ROUND_UP(result->size, qemu_real_host_page_size());
> -    r = vhost_vdpa_dma_unmap(v, result->iova, size);
> +    r = vhost_vdpa_dma_unmap(v, v->address_space_id, result->iova, size);
>       return r == 0;
>   }
>   
> @@ -932,7 +936,8 @@ static bool vhost_vdpa_svq_map_ring(struct vhost_vdpa *v, DMAMap *needle,
>           return false;
>       }
>   
> -    r = vhost_vdpa_dma_map(v, needle->iova, needle->size + 1,
> +    r = vhost_vdpa_dma_map(v, v->address_space_id, needle->iova,
> +                           needle->size + 1,
>                              (void *)(uintptr_t)needle->translated_addr,
>                              needle->perm == IOMMU_RO);
>       if (unlikely(r != 0)) {
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index f933ba53a3..f96c3cb1da 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -239,7 +239,7 @@ static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
>           return;
>       }
>   
> -    r = vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
> +    r = vhost_vdpa_dma_unmap(v, v->address_space_id, map->iova, map->size + 1);
>       if (unlikely(r != 0)) {
>           error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
>       }
> @@ -288,8 +288,8 @@ static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
>           return false;
>       }
>   
> -    r = vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_page_len(), buf,
> -                           !write);
> +    r = vhost_vdpa_dma_map(v, v->address_space_id, map.iova,
> +                           vhost_vdpa_net_cvq_cmd_page_len(), buf, !write);
>       if (unlikely(r < 0)) {
>           goto dma_map_err;
>       }
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 20af2e7ebd..36e5ae75f6 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -26,8 +26,8 @@ vhost_user_write(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
>   vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
>   
>   # vhost-vdpa.c
> -vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> -vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> +vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32_t asid, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> +vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint32_t asid, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
>   vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
>   vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
>   vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"


