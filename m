Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD605F0DBE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:41:29 +0200 (CEST)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHCh-00020V-Ll
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeH9B-0007Hm-Vx
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:37:52 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeH9A-0000sw-7K
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:37:49 -0400
Received: by mail-ej1-x62f.google.com with SMTP id lh5so9424286ejb.10
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=E/X4jYFiDCLde8wfiWkDXlXN9Yv0RJgvsHYO1nwaFzM=;
 b=hZwAOuI36F2nvEfvFpFj1btwvVHntj2Oj3GKcUQP7HBLWPr/PQABaLRUPALYyxNWpg
 R/j779nm/MmGIliSTBgfBDSVS4vxqQx9iq+nF/rEbH9iaBgNtE8n6YoV0MgVe/lg5sTZ
 UdzwqFO6830uptf+wJ1u4L1QgqJcWrhw4QfWpsHGZ+HG+Cv6IQ4qLMMeOwZoACWfCEL0
 caxu88jcMLep4G7zTT54+YlXx0zIq1KNuDUMZCPH0O+XfdVAL+FdznUOG2kY5N/T3O5v
 zudkI1/xbyw7Bb8AaxcbaWey+vs1dneGyVhk2DPT7dJEG3QE0nIkpe58x6Wc86XtLN4p
 Q9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=E/X4jYFiDCLde8wfiWkDXlXN9Yv0RJgvsHYO1nwaFzM=;
 b=eoGjjeyCo0R5fGwxVqhsB1qh/oo9vUCJCaSmRqBdfqOfE9RPMPwaepefKJvnb9cbh5
 9nckeWYKgBPkXxeB8FuSrlq/Bk4WOPdmaR8G77bxY+ici2uVI7PA7+Y9c9D1bYSGbI2n
 cMT3QCAPqsvXfri6fY+Hg2ewOVKJagKLzb9sYmDVF30UyY5hmfXVoBpuOuSzUomAYA3z
 3/kizZlwSE6C8VpUJa2G40401Ke4ZWvGktwKaHTdFdLr4HJneHvnYFyfyQYUkQ1wGf2i
 YRPhVSdGAgbIEHzRZRgYA5n/+XAvqffJ0OpIa0qk76XHwHyPWFFtqL0e6gejBx8wZsR4
 1l0w==
X-Gm-Message-State: ACrzQf0uTf7D+HMC+5ZJ8EKS/97WMPVRbqnURTe6lp9IIEbTb5gzLhCg
 filJNT7exlgl1elhL35nu2JdsZQJzYkBWMaIrtP0SQ==
X-Google-Smtp-Source: AMsMyM7jSEww2Nlaoe6yjlEzuFhbC1XPSqLjYnRhrWg1OwDnPPpFPuzc4xyOOAb0U/PLAsAIojUYLz0KBIV39/dnxqY=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr6845550ejc.365.1664548666465; Fri, 30
 Sep 2022 07:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <20220930135810.1892149-2-kraxel@redhat.com>
In-Reply-To: <20220930135810.1892149-2-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Sep 2022 15:37:35 +0100
Message-ID: <CAFEAcA9P7D9iDhyOzjs0c7sGyAAJA8=dj=e2kR+71uwWz+C=8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_IOMMU
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 30 Sept 2022 at 14:58, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Not needed for a virtio 1.0 device.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/pci/pci.h         | 1 -
>  hw/virtio/virtio-iommu-pci.c | 4 +---
>  2 files changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index b54b6ef88fc3..89eaca429389 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -85,7 +85,6 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
>  #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
>  #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
> -#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
>  #define PCI_DEVICE_ID_VIRTIO_MEM         0x1015
>
>  #define PCI_VENDOR_ID_REDHAT             0x1b36
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 844d64770406..79ea8334f04e 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -74,8 +74,6 @@ static void virtio_iommu_pci_class_init(ObjectClass *klass, void *data)
>      k->realize = virtio_iommu_pci_realize;
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>      device_class_set_props(dc, virtio_iommu_pci_properties);
> -    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> -    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_IOMMU;
>      pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
>      pcidev_k->class_id = PCI_CLASS_OTHERS;
>      dc->hotpluggable = false;

So does this mean:
 * these ID values on the device were never used, because some
   other code always overwrites them with the 'modern' ID values?
   If so, what is that other code?
 * this is a change in behaviour? If so, what does the PCI
   device show up as if you don't set these fields at all?
   Do we need to make this only-in-new-machine-versions?

thanks
-- PMM

