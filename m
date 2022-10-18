Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4312D602FBB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 17:29:57 +0200 (CEST)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okoXT-0000wE-PE
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 11:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1okoCs-0006C4-Hv
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1okoCj-0004oa-4f
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666105706;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4UZAMN+G8w20iLkj6BfVptcgKmN+6B7LWyzcsG4WVY=;
 b=U7vVqOQreYjrVO1/oADCiwkFj6E8hWTQYgCW60B9W6CzZrpQsYxkJf2DugJZJfcddMmElA
 //Iu3kObvJcTZP7qa65RDpfyAke+8Bho+emaQPkqHoB3Urt8jPVGGgQbeZlA6seVdqkFAv
 P82Ok0pedr3wEPE7qr1LjCZ5jGoxBZc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-HEOoj0wUN_6V8JXvKN1u9g-1; Tue, 18 Oct 2022 11:08:25 -0400
X-MC-Unique: HEOoj0wUN_6V8JXvKN1u9g-1
Received: by mail-qt1-f197.google.com with SMTP id
 22-20020ac85756000000b0039cf0d41e2cso2872447qtx.13
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 08:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l4UZAMN+G8w20iLkj6BfVptcgKmN+6B7LWyzcsG4WVY=;
 b=npZ32o0J+cMqk9zV4nGrlwWWy5XmFZKXmZdevjMHG7GJQCW8mkv4onBG/eMiQfu9wy
 51YbNm1YffpvpQhWKIQjH08hCJpGKhY8L5kTaiq3ONJvM5AGYAl2RlvxRw0OIJ7tf6in
 ro6Qjr5iH0ZuX47F9B0nRYTvpac/Yanid8Gl8Gibcn5bqYxM/c4yik6gi0Kl1M/2Egk6
 CWV12z1mRYmgP1fvb5R1bTOJnjSpjaGVS0sN3GNqpfb7V6bpjtEGFjaS9En03+M9V+D5
 dRyAElOUFvL3C1uGWSQON4E8BYbd753u4AzQAXr22OPW9S4YH/fTpAW1Kn9XnfsQ+oIj
 P61A==
X-Gm-Message-State: ACrzQf1VKHwAYEXFyyzJ2NRDhhldbdqIZg6VampIV9VUL68z/O53p30Z
 oEy5ZF6G+9hozvinjuGnQ4VSe8bDjKMpdvfte9LvKkb/KbZ65VmhpJAzgpwQqiuQTk8fyHOgsjW
 u2wxso74aQ3XjHG4=
X-Received: by 2002:a05:620a:1465:b0:6ee:95e9:d1ec with SMTP id
 j5-20020a05620a146500b006ee95e9d1ecmr2166925qkl.174.1666105704749; 
 Tue, 18 Oct 2022 08:08:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5CcBi5AYDIGK03B3FqQLI0sDEVqKbc566NFg2Jp4O4ACaHnZVdvGT8nB6HlKQgUVDmimb1gg==
X-Received: by 2002:a05:620a:1465:b0:6ee:95e9:d1ec with SMTP id
 j5-20020a05620a146500b006ee95e9d1ecmr2166904qkl.174.1666105704473; 
 Tue, 18 Oct 2022 08:08:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a05620a0c5500b006b5bf5d45casm2684447qki.27.2022.10.18.08.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 08:08:22 -0700 (PDT)
Message-ID: <31b87958-3be6-49c2-f0d9-9bcb8ec3bc1c@redhat.com>
Date: Tue, 18 Oct 2022 17:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats is
 set
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, eperezma@redhat.com, jasowang@redhat.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20221018122852.1185395-1-eric.auger@redhat.com>
 <Y063RZ4SkYcRM+SP@x1n>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y063RZ4SkYcRM+SP@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Peter,

On 10/18/22 16:25, Peter Xu wrote:
> Hi, Eric,
>
> On Tue, Oct 18, 2022 at 02:28:52PM +0200, Eric Auger wrote:
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
>> requires a limited ATS support on viommu side.
>>
>> However, in theory, if ats=on is set on a pci device, the
>> viommu should support ATS for that device to work.
> Pure question: what will happen if one ATS supported PCI device got plugged
> into a system whose physical IOMMU does not support ATS?  Will ATS just be
> ignored and the device keep working simply without ATS?
Yes that's my understanding: in that case the ATS capable device would
work with ats disabled (baremetal case). In the iommu driver you can
have a look at the pci_enable_ats() call which is guarded by
info->ats_supported for instance on intel iommu.

Following that reasoning vhost modality should not be enabled without
ATS support on vIOMMU side. But it is.

In that sense I may rename the ats_enabled helpers with ats_capable? If
I understand correctly setting ats=on exposes the ATS capability (
615c4ed205  virtio-pci: address space translation service (ATS) support)
which is then enabled by the guest driver.

> [1]
>
> [...]
>
>> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>>      iommu->iommu_offset = section->offset_within_address_space -
>>                            section->offset_within_region;
>>      iommu->hdev = dev;
>> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
>> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
>>      if (ret) {
>> +        if (vhost_dev_ats_enabled(dev)) {
>> +            error_reportf_err(err,
>> +                              "vhost cannot register DEVIOTLB_UNMAP "
>> +                              "although ATS is enabled, "
>> +                              "fall back to legacy UNMAP notifier: ");
> We want to use the warning message to either remind the user to (1) add the
> dev-iotlb=on parameter for vIOMMU, or (2) drop the ats=on on device.  Am I
> right?
My focus is to warn the end user there is no support for device-iotlb
support in virtio-iommu or vsmmuv3 but vhost does not really require
it.Indeed current users of virtio-iommu/vsmmuv3 seem confused now wrt
vhost integration and the lack of device-iotlb option on those viommus.

On intel I understand we would like to enforce that ats and dev-iotlb
are both set or unset. But this is not really addressed in that series.
Indeed vtd_iommu_notify_flag_changed does not reject any registration of
IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier in case it does not support
device-iotlb. I think it should. The trouble is vhost_iommu_region_add
is not meant to nicely fail.
>
> As we've discussed - I remember Jason used to test with/without dev-iotlb
> on vhost on Intel and dev-iotlb is faster on vt-d guest driver than without
It would be nice to have a clarification about this. Indeed

[PATCH v3 0/5] memory: Skip assertion in memory_region_unregister_iommu_notifier
https://lore.kernel.org/all/20201116165506.31315-1-eperezma@redhat.com/
mostly focussed on removing an assertion although one patch mentionned perf improvements. What does make the perf better (less device iotlb flushes than general iotlb flushes?)

> it.  So that can make sense to me for (1).  I don't know whether it helps
> for (2) because fundamentally it's the same question as [1] above, and
> whether that's a legal configuration.
>
> Thanks,
>
Adding jean in the loop too

Thanks

Eric


