Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BEAA7DF5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 10:35:40 +0200 (CEST)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5QlP-000835-MO
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 04:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1i5Qim-0006yR-Db
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:32:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1i5Qik-0005uP-K0
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:32:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1i5Qik-0005ts-BN
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:32:54 -0400
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35A35C05686D
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 08:32:53 +0000 (UTC)
Received: by mail-pf1-f199.google.com with SMTP id r17so14894572pfr.19
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 01:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0ptA+kKm/dj2CUxK+n6Ih9FrB6Z2Eg7sZG2KmhKzrkw=;
 b=aqh94Pmq0CrWqKlNemU1IsMoHWfUCvmgsBlLGg4Fb8CEXIVajZVMVlISADyVCdYR3a
 m/mJcEGKrXTMtEXZQSXJL/HcECJmqh4rAqEHcQ2bZaRQBIPKt5X3oUPb5FajqWmG4CVa
 Av2v6+VdL/ah3Zdeham5YTKrEguWmwbyOJYB7ONpHTRGRSZ8C7RewnBCt/KmvLy5WLm/
 1Eg7Z+AdyX0EQlz4zleD8tyuJAfzMvf2yHk+31VKtGNH22cMY3ujZ9COuJppGFsGd98E
 U88Dow7sBnqXYtGBbZyRnlkCN/EOxIZLnlglUBXzLTNnx0EuHoi4BmUt4m/dFbg/VNMB
 SVzQ==
X-Gm-Message-State: APjAAAV2s5GWNptf8pN1IYgvRNVtLVAkaNRMNNqYhHAr2lQAIPH7PWyY
 lo+609bVX/R3KyoHY+cgvjL3QVcAvA9Xlcm1LgUn8rZdyRczu8Yhb/Af83I4e3AZlP7rlM5D5x2
 FgCzhfOyvnmTsgoI=
X-Received: by 2002:a62:3145:: with SMTP id x66mr45521050pfx.186.1567585972685; 
 Wed, 04 Sep 2019 01:32:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxe+xil+6SwIqlRI0uWW+0bG+HlgpcPeML33PztRqMhvVe15nhxo7ydZXaP3rTX9N2Kt/TvQA==
X-Received: by 2002:a62:3145:: with SMTP id x66mr45521017pfx.186.1567585972384; 
 Wed, 04 Sep 2019 01:32:52 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q20sm22311269pfg.85.2019.09.04.01.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 01:32:51 -0700 (PDT)
Date: Wed, 4 Sep 2019 16:32:39 +0800
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190904083239.GI30402@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-9-eric.auger@redhat.com>
 <20190819081143.GA13560@xz-x1>
 <b5e2ff32-eed8-829e-ffd4-2b62ed6b2fda@redhat.com>
 <20190904014416.GB30402@xz-x1>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D561F28@SHSMSX104.ccr.corp.intel.com>
 <20190904053720.GG30402@xz-x1>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D562270@SHSMSX104.ccr.corp.intel.com>
 <c8b8e80d-0b66-1a7c-28b8-0bd3b013a9e8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8b8e80d-0b66-1a7c-28b8-0bd3b013a9e8@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.2 v10 08/15] virtio-iommu: Implement
 map/unmap
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "mst@redhat.com" <mst@redhat.com>,
 "tn@semihalf.com" <tn@semihalf.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 04, 2019 at 09:54:12AM +0200, Auger Eric wrote:
> Hi,
> 
> On 9/4/19 7:46 AM, Tian, Kevin wrote:
> >> From: Peter Xu [mailto:peterx@redhat.com]
> >> Sent: Wednesday, September 4, 2019 1:37 PM
> >>
> >> On Wed, Sep 04, 2019 at 04:23:50AM +0000, Tian, Kevin wrote:
> >>>> From: Peter Xu [mailto:peterx@redhat.com]
> >>>> Sent: Wednesday, September 4, 2019 9:44 AM
> >>>>
> >>>> On Tue, Sep 03, 2019 at 01:37:11PM +0200, Auger Eric wrote:
> >>>>> Hi Peter,
> >>>>>
> >>>>> On 8/19/19 10:11 AM, Peter Xu wrote:
> >>>>>> On Tue, Jul 30, 2019 at 07:21:30PM +0200, Eric Auger wrote:
> >>>>>>
> >>>>>> [...]
> >>>>>>
> >>>>>>> +    mapping = g_tree_lookup(domain->mappings,
> >> (gpointer)(&interval));
> >>>>>>> +
> >>>>>>> +    while (mapping) {
> >>>>>>> +        viommu_interval current;
> >>>>>>> +        uint64_t low  = mapping->virt_addr;
> >>>>>>> +        uint64_t high = mapping->virt_addr + mapping->size - 1;
> >>>>>>> +
> >>>>>>> +        current.low = low;
> >>>>>>> +        current.high = high;
> >>>>>>> +
> >>>>>>> +        if (low == interval.low && size >= mapping->size) {
> >>>>>>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> >>>>>>> +            interval.low = high + 1;
> >>>>>>> +            trace_virtio_iommu_unmap_left_interval(current.low,
> >>>> current.high,
> >>>>>>> +                interval.low, interval.high);
> >>>>>>> +        } else if (high == interval.high && size >= mapping->size) {
> >>>>>>> +            trace_virtio_iommu_unmap_right_interval(current.low,
> >>>> current.high,
> >>>>>>> +                interval.low, interval.high);
> >>>>>>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> >>>>>>> +            interval.high = low - 1;
> >>>>>>> +        } else if (low > interval.low && high < interval.high) {
> >>>>>>> +            trace_virtio_iommu_unmap_inc_interval(current.low,
> >>>> current.high);
> >>>>>>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> >>>>>>> +        } else {
> >>>>>>> +            break;
> >>>>>>> +        }
> >>>>>>> +        if (interval.low >= interval.high) {
> >>>>>>> +            return VIRTIO_IOMMU_S_OK;
> >>>>>>> +        } else {
> >>>>>>> +            mapping = g_tree_lookup(domain->mappings,
> >>>> (gpointer)(&interval));
> >>>>>>> +        }
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    if (mapping) {
> >>>>>>> +        qemu_log_mask(LOG_GUEST_ERROR,
> >>>>>>> +                      "****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
> >>>>>>> +                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported\n",
> >>>>>>> +                     __func__, interval.low, size,
> >>>>>>> +                     mapping->virt_addr, mapping->size);
> >>>>>>> +    } else {
> >>>>>>> +        return VIRTIO_IOMMU_S_OK;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    return VIRTIO_IOMMU_S_INVAL;
> >>>>>>
> >>>>>> Could the above chunk be simplified as something like below?
> >>>>>>
> >>>>>>   while ((mapping = g_tree_lookup(domain->mappings, &interval))) {
> >>>>>>     g_tree_remove(domain->mappings, mapping);
> >>>>>>   }
> >>>>> Indeed the code could be simplified. I only need to make sure I don't
> >>>>> split an existing mapping.
> >>>>
> >>>> Hmm... Do we need to still split an existing mapping if necessary?
> >>>> For example when with this mapping:
> >>>>
> >>>>   iova=0x1000, size=0x2000, phys=ADDR1, flags=FLAGS1
> >>>>
> >>>> And if we want to unmap the range (iova=0, size=0x2000), then we
> >>>> should split the existing mappping and leave this one:
> >>>>
> >>>>   iova=0x2000, size=0x1000, phys=(ADDR1+0x1000), flags=FLAGS1
> >>>>
> >>>> Right?
> >>>>
> >>>
> >>> virtio-iommu spec explicitly disallows partial unmap.
> >>>
> >>> 5.11.6.6.1 Driver Requirements: UNMAP request
> >>>
> >>> The first address of a range MUST either be the first address of a
> >>> mapping or be outside any mapping. The last address of a range
> >>> MUST either be the last address of a mapping or be outside any
> >>> mapping.
> >>>
> >>> 5.11.6.6.2 Device Requirements: UNMAP request
> >>>
> >>> If a mapping affected by the range is not covered in its entirety
> >>> by the range (the UNMAP request would split the mapping),
> >>> then the device SHOULD set the request status to VIRTIO_IOMMU
> >>> _S_RANGE, and SHOULD NOT remove any mapping.
> >>
> >> I see, thanks Kevin.
> >>
> >> Though why so strict?  (Sorry if I missed some discussions
> >> ... pointers welcomed...)
> >>
> >> What I'm thinking is when we want to allocate a bunch of buffers
> >> (e.g., 1M) while we will also need to be able to free them with
> >> smaller chunks (e.g., 4K), then it would be even better that we allow
> >> to allocate a whole 1M buffer within the guest and map it as a whole,
> >> then we can selectively unmap the pages after used.  If with the
> >> strict rule, we'll need to map one by one, that can be a total of
> >> 1M/4K roundtrips.
> >>
> > 
> > Sorry I forgot the original discussion. Need Jean to respond. :-)
> > 
> > A possible reason is that no such usage exists today, thus simplification
> > was made? 
> 
> In
> https://virtualization.linux-foundation.narkive.com/q6XOkO76/rfc-0-3-virtio-iommu-a-paravirtualized-iommu
> 
> I found
> 
> "
> (Note: the semantics of unmap are chosen to be compatible with VFIO's
> type1 v2 IOMMU API. This way a device serving as intermediary between
> guest and VFIO doesn't have to keep an internal tree of mappings. They are
> a bit tighter than VFIO, in that they don't allow unmap spilling outside
> mapped regions. Spilling is 'undefined' at the moment, because it should
> work in most cases but I don't know if it's worth the added complexity in
> devices that are not simply transmitting requests to VFIO. Splitting
> mappings won't ever be allowed, but see the relaxed proposal in 3/3 for
> more lenient semantics)
> "

Yes it makes sense to follow vfio type1v2 here.  Though I'm not sure
whether the maintainance of "an internal tree of mappings" could be
avoided by this, at least if using current QEMU IOMMU notifier
framework.  The problem is currently the IOMMU notifiers cannot fail
(e.g., the VFIO_IOMMU_MAP_DMA ioctl from vfio-pci device will assume
the messages delivered from vIOMMUs are always valid), so AFAICT the
vIOMMU needs to tell which mapping request from the guest driver is
valid before delivering the request to vfio.  It seems impossible to
do that if without the internal tree of mapping.  But that seems to be
another story.

In all cases, I think I'm fine with the approach for this patch.

Thanks!

-- 
Peter Xu

