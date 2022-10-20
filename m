Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848F6063D2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:07:58 +0200 (CEST)
Received: from localhost ([::1]:37682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olX9H-0007rm-PM
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:07:56 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWzx-0002Cg-3O
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1olVCx-0006Pv-2F
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:03:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1olVCl-0002c4-Ht
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666270996;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cyl+o62SFZYsLOvk/3QY6RI3DG56bodBJVRNOudgd+8=;
 b=K9xKKg2yI+MsULlyBZQ3sSpI2duAuAQ0+uKYAVs6UU1mdpbsxBY9gy/qQGXWTOOtsmAEsT
 YA1h6feCFDDrS25Oz0HtU+N7awJcI+UMGKTffsTZwaQAdK48IMPQZ2eYnpcAmaJJmgOaZK
 VZm/mHWcY+nSStnmzzmW8Gj3Ai4dQTQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-czvwSa3fPRyrbg9LBrLRRw-1; Thu, 20 Oct 2022 09:03:15 -0400
X-MC-Unique: czvwSa3fPRyrbg9LBrLRRw-1
Received: by mail-qt1-f199.google.com with SMTP id
 17-20020ac85711000000b0039ccd4c9a37so15029695qtw.20
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 06:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cyl+o62SFZYsLOvk/3QY6RI3DG56bodBJVRNOudgd+8=;
 b=3bMaNdvJN+g6d9D40GyjYJXtaeAp/J4yN0EyRFer98fT3Kn7MPqEMnGuDS0Yu14R6/
 2Dx+hEB3GPmtEiLSq9/lzRDAKI+iiY3DRtgHMxtrXC1J//W4BIEMH2z78SR9utSeuIqn
 PEzvzYUDGN9YeOXs5vzrgujvtbQFahT768/i442nn7pS0ir/7/ZN+/GX1eE99153WV0O
 l19djf5g/VJtHP/ht2KkZP5NIOaJrhD+CfMeobX9h7FetD1u/umI7QHWeGTd8PpQVGMt
 kNJf4Cv5moiyi00lj+mnSz6cGqQVsV+UOlbokeF/iDCeHpjccXy7xKoZFbBZ6h+JttEO
 jCOA==
X-Gm-Message-State: ACrzQf38stnZvB51JNAkLAP6tG7oMcW5l0Qm/OJnR009hKfi8Sc1Y+6w
 DKsOOPH/4DI+TgkiyEmh5SffSgp9zfBKvQT/fcCoQ8IWddjkQBuqnVFLM0Hm6rHRtnRNRb1sYdV
 8lDs2oDrQnlDRcHE=
X-Received: by 2002:ae9:c103:0:b0:6ee:9684:1615 with SMTP id
 z3-20020ae9c103000000b006ee96841615mr9097499qki.435.1666270994580; 
 Thu, 20 Oct 2022 06:03:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM693j91iOblonr+bkC3SK7CX9LEka50btkyjLrnyHpoVDDnwMGHHi5jF+M54a4rWBfxBXE7eg==
X-Received: by 2002:ae9:c103:0:b0:6ee:9684:1615 with SMTP id
 z3-20020ae9c103000000b006ee96841615mr9097474qki.435.1666270994245; 
 Thu, 20 Oct 2022 06:03:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ac8100f000000b00399edda03dfsm5980541qti.67.2022.10.20.06.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:03:13 -0700 (PDT)
Message-ID: <5d4d1994-8560-80da-dbc7-babb5cd4ee0b@redhat.com>
Date: Thu, 20 Oct 2022 15:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats
 is set
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, peterx@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, eperezma@redhat.com,
 jean-philippe@linaro.org
References: <20221019122717.1259803-1-eric.auger@redhat.com>
 <CACGkMEtL9Rf6YkHBJpNm2LXfvX51s2KDCgvBNH6cJWfp7PdfVA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CACGkMEtL9Rf6YkHBJpNm2LXfvX51s2KDCgvBNH6cJWfp7PdfVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On 10/20/22 05:58, Jason Wang wrote:
> On Wed, Oct 19, 2022 at 8:27 PM Eric Auger <eric.auger@redhat.com> wrote:
>> Since b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
>> IOMMUTLBNotificationType"), vhost attempts to register DEVIOTLB_UNMAP
>> notifier. This latter is supported by the intel-iommu which supports
>> device-iotlb if the corresponding option is set. Then 958ec334bca3
>> ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support") allowed
>> silent fallback to the legacy UNMAP notifier if the viommu does not
>> support device iotlb.
>>
>> Initially vhost/viommu integration was introduced with intel iommu
>> assuming ats=on was set on virtio-pci device and device-iotlb was set
>> on the intel iommu. vhost acts as an ATS capable device since it
>> implements an IOTLB on kernel side. However translated transactions
>> that hit the device IOTLB do not transit through the vIOMMU. So this
>> requires a limited ATS support on viommu side. Anyway this assumed
>> ATS was eventually enabled .
>>
>> But neither SMMUv3 nor virtio-iommu do support ATS and the integration
>> with vhost just relies on the fact those vIOMMU send UNMAP notifications
>> whenever the guest trigger them. This works without ATS being enabled.
>>
>> This patch makes sure we get a warning if ATS is set on a device
>> protected by virtio-iommu or vsmmuv3, reminding that we don't have
>> full support of ATS on those vIOMMUs and setting ats=on on the
>> virtio-pci end-point is not a requirement.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - s/enabled/capable
>> - tweak the error message on vhost side
>> ---
>>  include/hw/virtio/virtio-bus.h |  3 +++
>>  hw/virtio/vhost.c              | 21 ++++++++++++++++++++-
>>  hw/virtio/virtio-bus.c         | 14 ++++++++++++++
>>  hw/virtio/virtio-pci.c         | 11 +++++++++++
>>  4 files changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
>> index 7ab8c9dab0..23360a1daa 100644
>> --- a/include/hw/virtio/virtio-bus.h
>> +++ b/include/hw/virtio/virtio-bus.h
>> @@ -94,6 +94,7 @@ struct VirtioBusClass {
>>      bool has_variable_vring_alignment;
>>      AddressSpace *(*get_dma_as)(DeviceState *d);
>>      bool (*iommu_enabled)(DeviceState *d);
>> +    bool (*ats_capable)(DeviceState *d);
>>  };
>>
>>  struct VirtioBusState {
>> @@ -157,4 +158,6 @@ int virtio_bus_set_host_notifier(VirtioBusState *bus, int n, bool assign);
>>  void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n);
>>  /* Whether the IOMMU is enabled for this device */
>>  bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev);
>> +/* Whether ATS is enabled for this device */
>> +bool virtio_bus_device_ats_capable(VirtIODevice *vdev);
>>  #endif /* VIRTIO_BUS_H */
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index 5185c15295..3cf9efce5e 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -324,6 +324,16 @@ static bool vhost_dev_has_iommu(struct vhost_dev *dev)
>>      }
>>  }
>>
>> +static bool vhost_dev_ats_capable(struct vhost_dev *dev)
> I suggest to rename this as pf_capable() since ATS is PCI specific but
> vhost isn't.
Does pf sound for page fault?
>
>> +{
>> +    VirtIODevice *vdev = dev->vdev;
>> +
>> +    if (vdev && virtio_bus_device_ats_capable(vdev)) {
>> +        return true;
>> +    }
>> +    return false;
>> +}
>> +
>>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
>>                                hwaddr *plen, bool is_write)
>>  {
>> @@ -737,6 +747,7 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>>      Int128 end;
>>      int iommu_idx;
>>      IOMMUMemoryRegion *iommu_mr;
>> +    Error *err = NULL;
>>      int ret;
>>
>>      if (!memory_region_is_iommu(section->mr)) {
>> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>>      iommu->iommu_offset = section->offset_within_address_space -
>>                            section->offset_within_region;
>>      iommu->hdev = dev;
>> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
>> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
>>      if (ret) {
>> +        if (vhost_dev_ats_capable(dev)) {
>> +            error_reportf_err(err,
>> +                              "%s: Although the device exposes ATS capability, "
>> +                              "fallback to legacy IOMMU UNMAP notifier: ",
>> +                              iommu_mr->parent_obj.name);
> I'm not sure if it's a real error, or I wonder what we need to do is
>
> 1) check is ATS is enabled
> 2) fallback to UNMAP is ATS is not enabled
Isn't the problem due to the fact that vhost, by construction, requires
"pf" (would it be though DEVIOTLB_UNMAP or UNMAP). Don't UNMAP
notifications also implement part of ATS protocol? I guess this is the
reason why you mandated ats in the first place.

So if ATS is not enabled, shouldn't we fallback to virtio instead of vhost?

Thanks

Eric
>
>> +        } else {
>> +            error_free(err);
>> +        }
>>          /*
>>           * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
>>           * UNMAP legacy message
>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>> index 896feb37a1..d46c3f8ec4 100644
>> --- a/hw/virtio/virtio-bus.c
>> +++ b/hw/virtio/virtio-bus.c
>> @@ -348,6 +348,20 @@ bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev)
>>      return klass->iommu_enabled(qbus->parent);
>>  }
>>
>> +bool virtio_bus_device_ats_capable(VirtIODevice *vdev)
>> +{
>> +    DeviceState *qdev = DEVICE(vdev);
>> +    BusState *qbus = BUS(qdev_get_parent_bus(qdev));
>> +    VirtioBusState *bus = VIRTIO_BUS(qbus);
>> +    VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
>> +
>> +    if (!klass->ats_capable) {
>> +        return false;
> I think it's better to check whether or not ATS is enabled. Guest may
> choose to not enable ATS for various reasons.
>
> Thanks
>
>> +    }
>> +
>> +    return klass->ats_capable(qbus->parent);
>> +}
>> +
>>  static void virtio_bus_class_init(ObjectClass *klass, void *data)
>>  {
>>      BusClass *bus_class = BUS_CLASS(klass);
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index e7d80242b7..c2ceba98a6 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -1141,6 +1141,16 @@ static bool virtio_pci_iommu_enabled(DeviceState *d)
>>      return true;
>>  }
>>
>> +static bool virtio_pci_ats_capable(DeviceState *d)
>> +{
>> +    VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
>> +
>> +    if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
>> +        return true;
>> +    }
>> +    return false;
>> +}
>> +
>>  static bool virtio_pci_queue_enabled(DeviceState *d, int n)
>>  {
>>      VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
>> @@ -2229,6 +2239,7 @@ static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
>>      k->ioeventfd_assign = virtio_pci_ioeventfd_assign;
>>      k->get_dma_as = virtio_pci_get_dma_as;
>>      k->iommu_enabled = virtio_pci_iommu_enabled;
>> +    k->ats_capable = virtio_pci_ats_capable;
>>      k->queue_enabled = virtio_pci_queue_enabled;
>>  }
>>
>> --
>> 2.35.3
>>


