Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67856484D28
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 05:41:01 +0100 (CET)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4y6e-0002Ai-8g
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 23:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4y3a-0000QT-5k
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4y3W-0007IF-C8
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641357465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RjYubX0v3m9+WTvP26ppwuxD5XvtZuFEiZj3+7tfiq0=;
 b=V3uD6Vwr712r33IJmG83VCJM2mzsn1pE4a/hEctx0ULfWq2mfwMumaD+tkK1+Rwl5RzrlX
 ZKkd8mnbQnvHqis7oa1gYW8z5hWjlrrPFH2HlcyNMyuWCTkTOuSxqqQYQskL5XYynmhPHy
 S5Nxm7c3LNR8cR3CoPwuxzB/mRvpYnY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-j_zZx2QMP0C6eIhuvVwq7g-1; Tue, 04 Jan 2022 23:37:44 -0500
X-MC-Unique: j_zZx2QMP0C6eIhuvVwq7g-1
Received: by mail-lf1-f71.google.com with SMTP id
 g2-20020a19e042000000b00425cfac0e67so8880567lfj.10
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 20:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RjYubX0v3m9+WTvP26ppwuxD5XvtZuFEiZj3+7tfiq0=;
 b=QCZSaDiI6U0hQ/2Mr+l/thnDj7XPZVn116XQlprs4Vvg/pJgJiJ/7SaRxlxuN6Z4BX
 i6TNoGh6YgrB0QSNPtm7++p8aDh9x1sqskrXUxOHT4qKHKAw38/vvgVRCfUlETeAtctx
 EE4bSP7uXx3ah7K4mORKWyyWV7RiflkqeE4Jp3jIhznjtVgHonwIFWddpskVow2zNxoI
 NuuZWgIY1HjIp2ptTNycDFljXhjlnwwOhOdd9t6memDb7/nn23OrgRgbn+5pnweQ32hi
 UmSbd64rORKzPm1SjrnNXOFo+c4vWYYArpX9G7t2zPIVI4in+GFZGnSyKnLP9f5ef3kt
 VgUw==
X-Gm-Message-State: AOAM532WX0FGwBqYAx1K0kIXu1GLfFBHhUq7BdgXM9wNGZKZdcEMFxEM
 Q8h060bjty/doqb8oCusrLnXDiOMCW2AAnGnwsvCzzLSbpQOMP6FNpZCE3/t18jaGATjaH987XC
 53OazFsIjTqEDu9XpRi/L6ClJBbH4Fp8=
X-Received: by 2002:a05:6512:3d21:: with SMTP id
 d33mr46434847lfv.481.1641357462977; 
 Tue, 04 Jan 2022 20:37:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAqRTAHFV/dWshmDXKjm1NY34BdM3IjhMoGEWKYt1czS6nfq7Q4X7RVyRWKWl+d4+ZwohWgNbew3rfCKEZdM8=
X-Received: by 2002:a05:6512:3d21:: with SMTP id
 d33mr46434833lfv.481.1641357462800; 
 Tue, 04 Jan 2022 20:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-2-longpeng2@huawei.com>
In-Reply-To: <20220105005900.860-2-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 5 Jan 2022 12:37:32 +0800
Message-ID: <CACGkMEtAJCRvROegCECMkWTgopf30rh4P_sw6gzpF-7Eu32Jzw@mail.gmail.com>
Subject: Re: [RFC 01/10] virtio: get class_id and pci device id by the virtio
 id
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: mst <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, huangzhichao@huawei.com,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 5, 2022 at 8:59 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> Add helpers to get the "Transitional PCI Device ID" and "class_id" of the
> deivce which is specificed by the "Virtio Device ID".
>
> These helpers will be used to build the generic vDPA device later.
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  hw/virtio/virtio-pci.c | 93 ++++++++++++++++++++++++++++++++++++++++++
>  hw/virtio/virtio-pci.h |  4 ++
>  2 files changed, 97 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 750aa47ec1..843085c4ea 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -19,6 +19,7 @@
>
>  #include "exec/memop.h"
>  #include "standard-headers/linux/virtio_pci.h"
> +#include "standard-headers/linux/virtio_ids.h"
>  #include "hw/boards.h"
>  #include "hw/virtio/virtio.h"
>  #include "migration/qemu-file-types.h"
> @@ -213,6 +214,95 @@ static int virtio_pci_load_queue(DeviceState *d, int n, QEMUFile *f)
>      return 0;
>  }
>
> +typedef struct VirtIOPCIIDInfo {
> +    uint16_t vdev_id; /* virtio id */
> +    uint16_t pdev_id; /* pci device id */
> +    uint16_t class_id;
> +} VirtIOPCIIDInfo;
> +
> +static const VirtIOPCIIDInfo virtio_pci_id_info[] = {
> +    {

Any way to get rid of this array? E.g using the algorithm that is used
by the kernel virtio driver.

Thanks

> +        .vdev_id = VIRTIO_ID_NET,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_NET,
> +        .class_id = PCI_CLASS_NETWORK_ETHERNET,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_BLOCK,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_BLOCK,
> +        .class_id = PCI_CLASS_STORAGE_SCSI,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_CONSOLE,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_CONSOLE,
> +        .class_id = PCI_CLASS_COMMUNICATION_OTHER,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_SCSI,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_SCSI,
> +        .class_id = PCI_CLASS_STORAGE_SCSI,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_9P,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_9P,
> +        .class_id = PCI_BASE_CLASS_NETWORK,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_VSOCK,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_VSOCK,
> +        .class_id = PCI_CLASS_COMMUNICATION_OTHER,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_IOMMU,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_IOMMU,
> +        .class_id = PCI_CLASS_OTHERS,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_MEM,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_MEM,
> +        .class_id = PCI_CLASS_OTHERS,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_PMEM,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_PMEM,
> +        .class_id = PCI_CLASS_OTHERS,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_RNG,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_RNG,
> +        .class_id = PCI_CLASS_OTHERS,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_BALLOON,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_BALLOON,
> +        .class_id = PCI_CLASS_OTHERS,
> +    },
> +};
> +
> +static VirtIOPCIIDInfo virtio_pci_get_id_info(uint16_t vdev_id)
> +{
> +    VirtIOPCIIDInfo info = {};
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(virtio_pci_id_info); i++) {
> +        if (virtio_pci_id_info[i].vdev_id == vdev_id) {
> +            info = virtio_pci_id_info[i];
> +            break;
> +        }
> +    }
> +
> +    return info;
> +}
> +
> +uint16_t virtio_pci_get_pci_devid(uint16_t device_id)
> +{
> +    return virtio_pci_get_id_info(device_id).pdev_id;
> +}
> +
> +uint16_t virtio_pci_get_class_id(uint16_t device_id)
> +{
> +    return virtio_pci_get_id_info(device_id).class_id;
> +}
> +
>  static bool virtio_pci_ioeventfd_enabled(DeviceState *d)
>  {
>      VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
> @@ -1674,6 +1764,9 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
>           * is set to PCI_SUBVENDOR_ID_REDHAT_QUMRANET by default.
>           */
>          pci_set_word(config + PCI_SUBSYSTEM_ID, virtio_bus_get_vdev_id(bus));
> +        if (proxy->pdev_id) {
> +            pci_config_set_device_id(config, proxy->pdev_id);
> +        }
>      } else {
>          /* pure virtio-1.0 */
>          pci_set_word(config + PCI_VENDOR_ID,
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index 2446dcd9ae..06aa59436e 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -146,6 +146,7 @@ struct VirtIOPCIProxy {
>      bool disable_modern;
>      bool ignore_backend_features;
>      OnOffAuto disable_legacy;
> +    uint16_t pdev_id;
>      uint32_t class_code;
>      uint32_t nvectors;
>      uint32_t dfselect;
> @@ -158,6 +159,9 @@ struct VirtIOPCIProxy {
>      VirtioBusState bus;
>  };
>
> +uint16_t virtio_pci_get_pci_devid(uint16_t device_id);
> +uint16_t virtio_pci_get_class_id(uint16_t device_id);
> +
>  static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
>  {
>      return !proxy->disable_modern;
> --
> 2.23.0
>


