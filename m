Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BACA486246
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 10:43:25 +0100 (CET)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5PIq-0000sZ-7N
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 04:43:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5PGj-00077W-LY
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:41:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5PGf-0003Fc-KC
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641462068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ct25VWke8niF1od2fL6v6PPtwxFWW0SPYS9d0vceNmk=;
 b=bjqqesS0CbIwoYw+h8r2eaCVzc5VFWlQguetKkVBlz57BYXeoUhl+7Un5Eu8jsO9BY61bX
 8gUCQCCWBWfikgEVf2AkTJIw9qz9RmECZrJxOt1zPonugnDQfVWbSmjWc5VsU9pfcrNMhO
 jPKS6/jrc7h0z2TKyYvhO1Qfkq/6mLs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-ZCfEbYklPfWPSEVqvoX-Fw-1; Thu, 06 Jan 2022 04:41:06 -0500
X-MC-Unique: ZCfEbYklPfWPSEVqvoX-Fw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y10-20020a056402358a00b003f88b132849so1589028edc.0
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 01:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ct25VWke8niF1od2fL6v6PPtwxFWW0SPYS9d0vceNmk=;
 b=x9df1rlkzzWxp0TdCFYTmbsfw0MSN05uug0UMZ6Xt1UoJrS+q8C9Jfxar5Oq+H5v2+
 VSOwHbjSEX2hwUDfnDNrzFmHjLQVKw9LD7Aop2j3ePL5N/fkMUkLnY6uWyqijr4EBh0/
 hyc4uRJOBLIP/45RNRtuLuHD9mVgOolu+a2lp/qf6CeIPXH3BfMKYARzmge5dZxa7e3D
 8gcB8FUQVwXO8UquYbWYLcBYzG+v6Poao7qpbklK2FluVKe6IPFEBg/JAVo59fOIq7h0
 gvvQD9GXhYw96DWkqpR/Jsk7mYkHWpyEecjBbmI0di+YtkDo0xdLvIuUjjR+RfdLjTBT
 toxQ==
X-Gm-Message-State: AOAM5300bCevN5U5R9mg6QQOu87tRM3DW1cClc4zgjNVUHsIYWA5W2QQ
 JdVUXFQgBIJCbV0ePEDoiGc9rQnGYdPJEjzZsVKhR0OskBnPMwzSZvGEiq0uVL8Xd5rrZFNRg9u
 RHP0M1d2T3gAm0BU=
X-Received: by 2002:a17:906:4918:: with SMTP id
 b24mr44723467ejq.466.1641462065749; 
 Thu, 06 Jan 2022 01:41:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcrYmJBueeAKgCCvZZ2hepk6woU5H5oow21aZJO1stHWJV6J0SScyuo2KmJqvw5QEtitCKyA==
X-Received: by 2002:a17:906:4918:: with SMTP id
 b24mr44723456ejq.466.1641462065521; 
 Thu, 06 Jan 2022 01:41:05 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id l10sm364044ejh.102.2022.01.06.01.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 01:41:04 -0800 (PST)
Date: Thu, 6 Jan 2022 04:41:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH 1/2] virtio-gpu: hostmem
Message-ID: <20220106043549-mutt-send-email-mst@kernel.org>
References: <20211110164220.273641-1-antonio.caggiano@collabora.com>
 <20211110164220.273641-2-antonio.caggiano@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20211110164220.273641-2-antonio.caggiano@collabora.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 05:42:19PM +0100, Antonio Caggiano wrote:
> From: Gerd Hoffmann <kraxel@redhat.com>
> 
> Use VIRTIO_GPU_SHM_ID_HOST_VISIBLE as id for virtio-gpu.
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>

I guess Gerd can apply this as appropriate.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/display/virtio-gpu-pci.c    | 14 ++++++++++++++
>  hw/display/virtio-gpu.c        |  1 +
>  hw/display/virtio-vga.c        | 32 +++++++++++++++++++++++---------
>  include/hw/virtio/virtio-gpu.h |  5 +++++
>  4 files changed, 43 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
> index e36eee0c40..a79bd751b2 100644
> --- a/hw/display/virtio-gpu-pci.c
> +++ b/hw/display/virtio-gpu-pci.c
> @@ -33,6 +33,20 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      DeviceState *vdev = DEVICE(g);
>      int i;
>  
> +    if (virtio_gpu_hostmem_enabled(g->conf)) {
> +        vpci_dev->msix_bar_idx = 1;
> +        vpci_dev->modern_mem_bar_idx = 2;
> +        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
> +                           g->conf.hostmem);
> +        pci_register_bar(&vpci_dev->pci_dev, 4,
> +                         PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                         PCI_BASE_ADDRESS_MEM_PREFETCH |
> +                         PCI_BASE_ADDRESS_MEM_TYPE_64,
> +                         &g->hostmem);
> +        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
> +    }
> +
> +    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus), errp);
>      virtio_pci_force_virtio_1(vpci_dev);
>      if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
>          return;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index d78b9700c7..1cfcb81c1b 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1418,6 +1418,7 @@ static Property virtio_gpu_properties[] = {
>                       256 * MiB),
>      DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>                      VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
> +    DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
> index 9e57f61e9e..ca841a0799 100644
> --- a/hw/display/virtio-vga.c
> +++ b/hw/display/virtio-vga.c
> @@ -125,16 +125,30 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      pci_register_bar(&vpci_dev->pci_dev, 0,
>                       PCI_BASE_ADDRESS_MEM_PREFETCH, &vga->vram);
>  
> -    /*
> -     * Configure virtio bar and regions
> -     *
> -     * We use bar #2 for the mmio regions, to be compatible with stdvga.
> -     * virtio regions are moved to the end of bar #2, to make room for
> -     * the stdvga mmio registers at the start of bar #2.
> -     */
> -    vpci_dev->modern_mem_bar_idx = 2;
> -    vpci_dev->msix_bar_idx = 4;
>      vpci_dev->modern_io_bar_idx = 5;
> +  
> +    if (!virtio_gpu_hostmem_enabled(g->conf)) {
> +        /*
> +        * Configure virtio bar and regions
> +        *
> +        * We use bar #2 for the mmio regions, to be compatible with stdvga.
> +        * virtio regions are moved to the end of bar #2, to make room for
> +        * the stdvga mmio registers at the start of bar #2.
> +        */
> +        vpci_dev->modern_mem_bar_idx = 2;
> +        vpci_dev->msix_bar_idx = 4;
> +    } else {
> +        vpci_dev->msix_bar_idx = 1;
> +        vpci_dev->modern_mem_bar_idx = 2;
> +        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
> +                           g->conf.hostmem);
> +        pci_register_bar(&vpci_dev->pci_dev, 4,
> +                         PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                         PCI_BASE_ADDRESS_MEM_PREFETCH |
> +                         PCI_BASE_ADDRESS_MEM_TYPE_64,
> +                         &g->hostmem);
> +        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
> +    }
>  
>      if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
>          /*
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index acfba7c76c..3963cb4f86 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -102,12 +102,15 @@ enum virtio_gpu_base_conf_flags {
>      (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
>  #define virtio_gpu_blob_enabled(_cfg) \
>      (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
> +#define virtio_gpu_hostmem_enabled(_cfg) \
> +    (_cfg.hostmem > 0)
>  

Don't much like the lower-case macro here, but I guess it's
consistent with rest of the code.

>  struct virtio_gpu_base_conf {
>      uint32_t max_outputs;
>      uint32_t flags;
>      uint32_t xres;
>      uint32_t yres;
> +    uint64_t hostmem;
>  };
>  
>  struct virtio_gpu_ctrl_command {
> @@ -131,6 +134,8 @@ struct VirtIOGPUBase {
>      int renderer_blocked;
>      int enable;
>  
> +    MemoryRegion hostmem;
> +
>      struct virtio_gpu_scanout scanout[VIRTIO_GPU_MAX_SCANOUTS];
>  
>      int enabled_output_bitmask;
> -- 
> 2.32.0


