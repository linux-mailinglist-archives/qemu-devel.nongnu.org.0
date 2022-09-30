Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A085F0DFB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:49:51 +0200 (CEST)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHKo-0000nY-4k
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oeHGF-0005wW-9j
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:45:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oeHGB-0001rM-8y
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664549098;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATIKjA46m/M7iT/gttSCu0lRizp5SMaYOExXoAQbkZQ=;
 b=hOYGvW3Qtp7j1MrvAoU6km6u5nFlT5gncnSuo1FhKmnOId1D8oPlNtvBYF0XCeAbHIbo0i
 ee4T7GYSTwahhGF9+7AAV/uKfoVCJCuQVHBnG0xOnBr/hkbq1jRaJsrsEJhFSDJYoDVfoo
 hFbvI2WRWvVwxgdhSO2Yfwi7plUQtH8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-vT-FWqJuM0Ci15nmQw07wg-1; Fri, 30 Sep 2022 10:44:57 -0400
X-MC-Unique: vT-FWqJuM0Ci15nmQw07wg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l15-20020a05600c4f0f00b003b4bec80edbso2164863wmq.9
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=ATIKjA46m/M7iT/gttSCu0lRizp5SMaYOExXoAQbkZQ=;
 b=W7AIbSBSXJfozGwUK6RvaJdwgKGNzzeVGxylpJfVjkHmCx1j8OOinPnHOQ2hoNdg/7
 jo5lKv+KabeaC96H+92NqmOr/kuntOQ794uX76RePOIvgQmkDByq98z/F4ePAPZIQUmU
 rvreYBaZVoKmrcj3tt6X/bwOl4uquIamqFhTP0B25cHSV+fxZBbNga7V42Cbm0a12jYr
 3OLFCFyJ1GQ/7Ce+nxbO7yAZOKS1iKOvEJHaFwOO3dAtd7/+sy2JZMJHhvmUijDrgzH3
 EgTZ6OlryESUOXFzsJtRNG9ekum0BvJYV9TRBcxFiVmCEz17UNpoHD2xRBNpBa+iotoo
 ZFfw==
X-Gm-Message-State: ACrzQf1heMKJeiryIBBEhHqQXjM4ImOAOBDxcRG8P3eNm4HsQB5dFtJe
 n8ggpYkqOp3dX7wvAvvSRAVvPWCZBtGWuxZ1fDJMV9MJqPqwH0jb4bDf7Ys4hQu6lyjBnDCe7Ri
 vAg3h13OhbOLHMyQ=
X-Received: by 2002:a05:600c:6d2:b0:3b4:8361:6154 with SMTP id
 b18-20020a05600c06d200b003b483616154mr6313294wmn.89.1664549093205; 
 Fri, 30 Sep 2022 07:44:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5UlYq0g0PgGQCN7bIO0WG3jAG1fEIF4KuZ7kkvXuuHTr9qj0hqd9ouhsSHojXImarOcdVfkg==
X-Received: by 2002:a05:600c:6d2:b0:3b4:8361:6154 with SMTP id
 b18-20020a05600c06d200b003b483616154mr6313274wmn.89.1664549092943; 
 Fri, 30 Sep 2022 07:44:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a5d5273000000b00228dbf15072sm2164232wrc.62.2022.09.30.07.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:44:52 -0700 (PDT)
Message-ID: <ba060bd2-87cc-d01a-5453-fec630cf9d2e@redhat.com>
Date: Fri, 30 Sep 2022 16:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_IOMMU
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, peter.maydell@linaro.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <20220930135810.1892149-2-kraxel@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220930135810.1892149-2-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

On 9/30/22 15:58, Gerd Hoffmann wrote:
> Not needed for a virtio 1.0 device.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Eric
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
> @@ -90,7 +88,7 @@ static void virtio_iommu_pci_instance_init(Object *obj)
>  }
>  
>  static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
> -    .generic_name          = TYPE_VIRTIO_IOMMU_PCI,
> +    .generic_name  = TYPE_VIRTIO_IOMMU_PCI,
>      .instance_size = sizeof(VirtIOIOMMUPCI),
>      .instance_init = virtio_iommu_pci_instance_init,
>      .class_init    = virtio_iommu_pci_class_init,


