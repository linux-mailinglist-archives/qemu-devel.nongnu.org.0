Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EBF42D4D5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 10:27:19 +0200 (CEST)
Received: from localhost ([::1]:53986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maw58-0002cj-BH
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 04:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1maw2W-00082i-SD
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:24:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1maw2T-0008SM-FA
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:24:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i12so16798553wrb.7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4V+SufKl8asIEgy49tSiPlKL6nxyP7MkUhygoewotm4=;
 b=ZuHyfn1TNHljiPNK5hejtohuTq9iMcij6YHkFIxzHWIUUCpLgh1wEl3dGndYS5f8/2
 /8yiY+O0kYcSG1GxEcFVxsRIv/0pTyZsonXeuX/bzUjBHg00DVebbTNtDA+3dziz807M
 fgHeGR4ErLnhuTmHgNGrpqQRY+lf8o9J/CInXR02Nyk8hmza8UCapwYGowWIu1F2xAJg
 XGIhvQ4SIamNnOiNHA45zStZ9QGCpwol8zi1qFkf4ibODFZ3keJhdIV4Q/ywe+NnhI21
 egSnn7hjV6Y4jh4qxxEhYrft1LhQ040KDgf+UE+eviYUzbt0G8CsDThp/Q7x06HoqTy1
 Exjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4V+SufKl8asIEgy49tSiPlKL6nxyP7MkUhygoewotm4=;
 b=Lz7PMDCEEpxltWyR2V8dfLZ7gH0bwkmkhvII51tpMtPbs8mgHoYLNPLmKoIjSYxyJh
 elEoTmtPskfZE9AywkFc16y2Xs7FaV8i12qdoed7PnvRVRPhDHwaR46TfauBwhBatFKO
 fCjZzcttSGoPj/XEyVitP0s8RTVgDgK1I3UoH18YQt1V4furkA4j/injTbnuF0X7Y1Ji
 OZuPUZWbEmTFdIG8kEiRvVUox7cX8fibb3abmTy/W/Iuuy9O3Sm7ohbAHwhqhzBIn/eZ
 zjH1IZ4hxPddflCY9XXUFH8BszKz09nSyX2w+HA8QQplhRoqT0eWNugLS8slQbqMQvdL
 N+Gw==
X-Gm-Message-State: AOAM532KbPO2drDiEvigbTjvx1WFYo3xaXackw540cIZsNyousE5JeRR
 kZVv1TMf7841n4QH9hpsUybQng==
X-Google-Smtp-Source: ABdhPJxcnAiZktFBZBK3bUmYdXGltsLBFAUbWZFhopLAFntK/lD5wGriDujrVW1eLKSs79WKU+0whQ==
X-Received: by 2002:a5d:42c2:: with SMTP id t2mr4892086wrr.409.1634199871721; 
 Thu, 14 Oct 2021 01:24:31 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id f6sm1462202wmj.28.2021.10.14.01.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 01:24:31 -0700 (PDT)
Date: Thu, 14 Oct 2021 09:24:10 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/2] virtio-iommu: Drop base_name and change
 generic_name
Message-ID: <YWfpKvS4HII26bY5@myrica>
References: <20211013191755.767468-1-eric.auger@redhat.com>
 <20211013191755.767468-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013191755.767468-3-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 03:17:55PM -0400, Eric Auger wrote:
> Drop base_name and turn generic_name into
> "virtio-iommu-pci". This is more in line with
> other modern-only devices.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/virtio/virtio-iommu-pci.c     | 3 +--
>  include/hw/virtio/virtio-iommu.h | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 86fa4e6c28..a160ae6b41 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -98,8 +98,7 @@ static void virtio_iommu_pci_instance_init(Object *obj)
>  }
>  
>  static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
> -    .base_name             = TYPE_VIRTIO_IOMMU_PCI,
> -    .generic_name          = "virtio-iommu-pci",
> +    .generic_name          = TYPE_VIRTIO_IOMMU_PCI,
>      .instance_size = sizeof(VirtIOIOMMUPCI),
>      .instance_init = virtio_iommu_pci_instance_init,
>      .class_init    = virtio_iommu_pci_class_init,
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 273e35c04b..e2339e5b72 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -26,7 +26,7 @@
>  #include "qom/object.h"
>  
>  #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
> -#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
> +#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-pci"
>  OBJECT_DECLARE_SIMPLE_TYPE(VirtIOIOMMU, VIRTIO_IOMMU)
>  
>  #define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
> -- 
> 2.27.0
> 

