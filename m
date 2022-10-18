Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B17460359B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 00:01:09 +0200 (CEST)
Received: from localhost ([::1]:43464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okue3-0001Jl-Uw
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 18:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1okuZJ-0005ZC-OD
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 17:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1okuZH-0003GQ-Ic
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 17:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666130170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPt3hhXk6zRWQQI98JSSk0AHm4CEiigDL8cwBpmFDjk=;
 b=ERY20t2l8Fa0clwgGdmpIfnmMTBK2G+8lwDxicDpVmuOU9kYKLTAth7FTKFueMbxPnAUbg
 aorOz3hv1ZyfX7Led8iLYZVKWaxaEJgQWGJkHiYCCSKwBTtc7Eq3H1no7TG+6aK+AHYARS
 Yqskk9T4Ke5FFtbpVA/EdMjDzdbsRzs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-0EYKfElcMRac-5Pxx6sQZQ-1; Tue, 18 Oct 2022 17:56:09 -0400
X-MC-Unique: 0EYKfElcMRac-5Pxx6sQZQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 c11-20020ac87dcb000000b0039cdb815f3bso8416571qte.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 14:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mPt3hhXk6zRWQQI98JSSk0AHm4CEiigDL8cwBpmFDjk=;
 b=mOyHU/1IOuSXdd4dBbBj9EEqUR5d3V8FCihFR1ow1uQCJ0mD4DpCau1ZS5wVzJVX3N
 /UB9t/nj+j4XwyUbRKHThpNAXKqAHEZY6FpXunILjI1tCo6tgJWlv0Rl5Cim6/1ZEWF+
 buXX6qM4ali5DU9r+FpndcJV2H77w4HBaotgLSqxRJVCncAwXaQs/4I/gzrughPUlBhf
 UxJOgUMTKCqzd2R1Yw4wJeZlqLOEAU8vIyeTuJ+/1UezKR4rdo2MQ57c4Yx9Wf7mW5qZ
 jiVbBZCtPZeKkQnWK7lwNIqL+S0WKr1iGX2HXcWbPeh6gALQKAl+RCYNBcTArYqZkTiE
 8Haw==
X-Gm-Message-State: ACrzQf1ow8zeczQPk0mFOLwEzTQUVLzBthETI1/xZnGqtSAGZGVHocqY
 IVGGLL1j8PG+EBjYcuVz0fjbFh1GIJtOZ20KuXRDh0ctZc11EC61wi9sFhO6QS2h5wdE8yRG4NQ
 aNT6lojmn61a1bac=
X-Received: by 2002:a05:620a:b87:b0:6ea:d354:49b9 with SMTP id
 k7-20020a05620a0b8700b006ead35449b9mr3393793qkh.384.1666130168446; 
 Tue, 18 Oct 2022 14:56:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4I7btUNHBMHhLgViI2FW0iA7ulqcVQ+Dqm1jJEHam7EKf8+5UQButDRmLfeXstZwOdUxrRXg==
X-Received: by 2002:a05:620a:b87:b0:6ea:d354:49b9 with SMTP id
 k7-20020a05620a0b8700b006ead35449b9mr3393777qkh.384.1666130168183; 
 Tue, 18 Oct 2022 14:56:08 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 bz12-20020a05622a1e8c00b0039a1146e0e1sm2729417qtb.33.2022.10.18.14.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 14:56:07 -0700 (PDT)
Date: Tue, 18 Oct 2022 17:56:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, eperezma@redhat.com, jasowang@redhat.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats
 is set
Message-ID: <Y08g9iaH5lZnPkte@x1n>
References: <20221018122852.1185395-1-eric.auger@redhat.com>
 <Y063RZ4SkYcRM+SP@x1n>
 <31b87958-3be6-49c2-f0d9-9bcb8ec3bc1c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31b87958-3be6-49c2-f0d9-9bcb8ec3bc1c@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Oct 18, 2022 at 05:08:19PM +0200, Eric Auger wrote:
> Hi Peter,
> 
> On 10/18/22 16:25, Peter Xu wrote:
> > Hi, Eric,
> >
> > On Tue, Oct 18, 2022 at 02:28:52PM +0200, Eric Auger wrote:
> >> Since b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> >> IOMMUTLBNotificationType"), vhost attempts to register DEVIOTLB_UNMAP
> >> notifier. This latter is supported by the intel-iommu which supports
> >> device-iotlb if the corresponding option is set. Then 958ec334bca3
> >> ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support") allowed
> >> silent fallback to the legacy UNMAP notifier if the viommu does not
> >> support device iotlb.
> >>
> >> Initially vhost/viommu integration was introduced with intel iommu
> >> assuming ats=on was set on virtio-pci device and device-iotlb was set
> >> on the intel iommu. vhost acts as an ATS capable device since it
> >> implements an IOTLB on kernel side. However translated transactions
> >> that hit the device IOTLB do not transit through the vIOMMU. So this
> >> requires a limited ATS support on viommu side.
> >>
> >> However, in theory, if ats=on is set on a pci device, the
> >> viommu should support ATS for that device to work.
> > Pure question: what will happen if one ATS supported PCI device got plugged
> > into a system whose physical IOMMU does not support ATS?  Will ATS just be
> > ignored and the device keep working simply without ATS?
> Yes that's my understanding: in that case the ATS capable device would
> work with ats disabled (baremetal case). In the iommu driver you can
> have a look at the pci_enable_ats() call which is guarded by
> info->ats_supported for instance on intel iommu.
> 
> Following that reasoning vhost modality should not be enabled without
> ATS support on vIOMMU side. But it is.
> 
> In that sense I may rename the ats_enabled helpers with ats_capable?

Sounds good to me.

> If I understand correctly setting ats=on exposes the ATS capability (
> 615c4ed205  virtio-pci: address space translation service (ATS) support)
> which is then enabled by the guest driver.

I think it won't, as long as vIOMMU doesn't have DT support declared?

> 
> > [1]
> >
> > [...]
> >
> >> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
> >>      iommu->iommu_offset = section->offset_within_address_space -
> >>                            section->offset_within_region;
> >>      iommu->hdev = dev;
> >> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> >> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
> >>      if (ret) {
> >> +        if (vhost_dev_ats_enabled(dev)) {
> >> +            error_reportf_err(err,
> >> +                              "vhost cannot register DEVIOTLB_UNMAP "
> >> +                              "although ATS is enabled, "
> >> +                              "fall back to legacy UNMAP notifier: ");
> > We want to use the warning message to either remind the user to (1) add the
> > dev-iotlb=on parameter for vIOMMU, or (2) drop the ats=on on device.  Am I
> > right?
> My focus is to warn the end user there is no support for device-iotlb
> support in virtio-iommu or vsmmuv3 but vhost does not really require
> it.Indeed current users of virtio-iommu/vsmmuv3 seem confused now wrt
> vhost integration and the lack of device-iotlb option on those viommus.
> 
> On intel I understand we would like to enforce that ats and dev-iotlb
> are both set or unset. But this is not really addressed in that series.
> Indeed vtd_iommu_notify_flag_changed does not reject any registration of
> IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier in case it does not support
> device-iotlb. I think it should.

Yes I agree, thanks for finding it.  Just posted a patch:

https://lore.kernel.org/r/20221018215407.363986-1-peterx@redhat.com

> The trouble is vhost_iommu_region_add
> is not meant to nicely fail.
> >
> > As we've discussed - I remember Jason used to test with/without dev-iotlb
> > on vhost on Intel and dev-iotlb is faster on vt-d guest driver than without
> It would be nice to have a clarification about this. Indeed
> 
> [PATCH v3 0/5] memory: Skip assertion in memory_region_unregister_iommu_notifier
> https://lore.kernel.org/all/20201116165506.31315-1-eperezma@redhat.com/
> mostly focussed on removing an assertion although one patch mentionned perf improvements. What does make the perf better (less device iotlb flushes than general iotlb flushes?)

I'll leave that to Jason.  Thanks.

> 
> > it.  So that can make sense to me for (1).  I don't know whether it helps
> > for (2) because fundamentally it's the same question as [1] above, and
> > whether that's a legal configuration.
> >
> > Thanks,
> >
> Adding jean in the loop too
> 
> Thanks
> 
> Eric
> 

-- 
Peter Xu


