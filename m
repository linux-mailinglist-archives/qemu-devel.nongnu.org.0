Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1268D48E2AA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 03:50:05 +0100 (CET)
Received: from localhost ([::1]:47150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8CfD-0006zG-L0
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 21:50:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8CdB-0004zz-Fg
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 21:47:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Cd8-00081j-Ru
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 21:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642128474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgXgrxLxcg/cOWCR3LtUP/kcCzN6NmM54hQQBKXLf3k=;
 b=PSSi5NrYTpai8tm3/1U1wcyAbTBZmuG9vsyW+SIATBmXyXFFX5iyzRLch5VqNlCQNugtLp
 /wQdom3hFLAUguyHHi2hLx3Jd7Lf8q9dRnIGnyMjtPuxmsfEhxMY2bU5dlHEO1yyDxTVzY
 jQssSiIUtMgejZekj/ECfW05kgPfIUA=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-awgb3y8kP3GqyB1UJa8-5Q-1; Thu, 13 Jan 2022 21:47:50 -0500
X-MC-Unique: awgb3y8kP3GqyB1UJa8-5Q-1
Received: by mail-pf1-f200.google.com with SMTP id
 b136-20020a621b8e000000b004bfc3cd755cso934524pfb.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 18:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cgXgrxLxcg/cOWCR3LtUP/kcCzN6NmM54hQQBKXLf3k=;
 b=QGeiLqT5/bXuiZW950kD1amevZw2C99n33OOTmVuYewnxMz++h8NzdDKVwfqK48/Kf
 mmuUzayet1xKlTNo/pjFokjEuyacAdyGeTNH5gp3qoykx/G19WnUgopYbiYgURrgpDsV
 v1oidEIqRiQOn4Y4DWsL+O+w5Ajse08J1Pp5mNXCHo6ygaAx04RWbWE4/GIVf/a5J32V
 XbUeOvGjgMFvfM6vs4K5iAe0HfNaa9NeE2/Yo3xWG0hDfFbAHE88sfPq+jadswqVQM2q
 HG8Ys+cvmFknz5EjSbE+UFK2Ywt5ueA5aOQZWNXQyheSlkvoesTDllEa4MKN3mJaCysM
 7z6w==
X-Gm-Message-State: AOAM530htzZbPtLOw/qdiR9XJmjDqToDX9chN070t0qMaSLUK0Hj4qXK
 wvxShAn5R9rQFktAxWTXmdooGB6KturMo+wkaDEGzNkzI7oaVy006h2zn4KWoAfPP9ud0pJc2fu
 dHdpZy9e3oocJHWE=
X-Received: by 2002:a17:90a:f2ce:: with SMTP id
 gt14mr8076327pjb.160.1642128469873; 
 Thu, 13 Jan 2022 18:47:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj6s3S/lQyEn77o/unLmxOw3SJqcwgdKyIBSTAKPreHlt7HKkGj6yhM4kBYeUNjWcBpQPYKQ==
X-Received: by 2002:a17:90a:f2ce:: with SMTP id
 gt14mr8076305pjb.160.1642128469561; 
 Thu, 13 Jan 2022 18:47:49 -0800 (PST)
Received: from [10.72.13.172] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id pi7sm1243757pjb.23.2022.01.13.18.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 18:47:49 -0800 (PST)
Message-ID: <8beffd3d-5eff-6462-ce23-faf44c6653f1@redhat.com>
Date: Fri, 14 Jan 2022 10:47:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
To: Peter Xu <peterx@redhat.com>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com> <Yd+zQRouwsB/jnV3@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <Yd+zQRouwsB/jnV3@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yi.l.liu@intel.com, yi.y.sun@linux.intel.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/13 下午1:06, Peter Xu 写道:
> On Wed, Jan 05, 2022 at 12:19:45PM +0800, Jason Wang wrote:
>> @@ -1725,11 +1780,16 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>>           cc_entry->context_cache_gen = s->context_cache_gen;
>>       }
>>   
>> +    /* Try to fetch slpte form IOTLB */
>> +    if ((pasid == PCI_NO_PASID) && s->root_scalable) {
>> +        pasid = VTD_CE_GET_RID2PASID(&ce);
>> +    }
>> +
>>       /*
>>        * We don't need to translate for pass-through context entries.
>>        * Also, let's ignore IOTLB caching as well for PT devices.
>>        */
>> -    if (vtd_dev_pt_enabled(s, &ce)) {
>> +    if (vtd_dev_pt_enabled(s, &ce, pasid)) {
>>           entry->iova = addr & VTD_PAGE_MASK_4K;
>>           entry->translated_addr = entry->iova;
>>           entry->addr_mask = ~VTD_PAGE_MASK_4K;
>> @@ -1750,14 +1810,24 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>>           return true;
>>       }
>>   
>> +    iotlb_entry = vtd_lookup_iotlb(s, source_id, addr, pasid);
>> +    if (iotlb_entry) {
>> +        trace_vtd_iotlb_page_hit(source_id, addr, iotlb_entry->slpte,
>> +                                 iotlb_entry->domain_id);
>> +        slpte = iotlb_entry->slpte;
>> +        access_flags = iotlb_entry->access_flags;
>> +        page_mask = iotlb_entry->mask;
>> +        goto out;
>> +    }
> IIUC the iotlb lookup moved down just because the pasid==NO_PASID case then
> we'll need to fetch the default pasid from the context entry.  That looks
> reasonable.
>
> It's just a bit of pity because logically it'll slow down iotlb hits due to
> context entry operations.  When NO_PASID we could have looked up iotlb without
> checking pasid at all, assuming that "default pasid" will always match.  But
> that is a little bit hacky.


Right, but I think you meant to do this only when scalable mode is disabled.


>
> vIOMMU seems to be mostly used for assigned devices and dpdk in production in
> the future due to its slowness otherwise.. so maybe not a big deal at all.
>
> [...]
>
>> @@ -2011,7 +2083,52 @@ static void vtd_iotlb_page_invalidate(IntelIOMMUState *s, uint16_t domain_id,
>>       vtd_iommu_lock(s);
>>       g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page, &info);
>>       vtd_iommu_unlock(s);
>> -    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am);
>> +    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, PCI_NO_PASID);
>> +}
>> +
>> +static void vtd_iotlb_page_pasid_invalidate(IntelIOMMUState *s,
>> +                                            uint16_t domain_id,
>> +                                            hwaddr addr, uint8_t am,
>> +                                            uint32_t pasid)
>> +{
>> +    VTDIOTLBPageInvInfo info;
>> +
>> +    trace_vtd_inv_desc_iotlb_pasid_pages(domain_id, addr, am, pasid);
>> +
>> +    assert(am <= VTD_MAMV);
>> +    info.domain_id = domain_id;
>> +    info.addr = addr;
>> +    info.mask = ~((1 << am) - 1);
>> +    info.pasid = pasid;
>> +    vtd_iommu_lock(s);
>> +    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page_pasid, &info);
>> +    vtd_iommu_unlock(s);
>> +    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, pasid);
> Hmm, I think indeed we need a notification, but it'll be unnecessary for
> e.g. vfio map notifiers, because this is 1st level invalidation and at least so
> far vfio map notifiers are rewalking only the 2nd level page table, so it'll be
> destined to be a no-op and pure overhead.


Right, consider we don't implement l1 and we don't have a 1st level 
abstraction in neither vhost nor vfio, we can simply remove this.


>
>> +}
>> +
>> +static void vtd_iotlb_pasid_invalidate(IntelIOMMUState *s, uint16_t domain_id,
>> +                                       uint32_t pasid)
>> +{
>> +    VTDIOTLBPageInvInfo info;
>> +    VTDAddressSpace *vtd_as;
>> +    VTDContextEntry ce;
>> +
>> +    trace_vtd_inv_desc_iotlb_pasid(domain_id, pasid);
>> +
>> +    info.domain_id = domain_id;
>> +    info.pasid = pasid;
>> +    vtd_iommu_lock(s);
>> +    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_pasid, &info);
>> +    vtd_iommu_unlock(s);
>> +
>> +    QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
>> +        if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
>> +                                      vtd_as->devfn, &ce) &&
>> +            domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid) &&
>> +            pasid == vtd_as->pasid) {
>> +            vtd_sync_shadow_page_table(vtd_as);
> Do we need to rewalk the shadow pgtable (which is the 2nd level, afaict) even
> if we got the 1st level pgtable invalidated?


Seems not and this makes me think to remove the whole PASID based 
invalidation logic since they are for L1 which is not implemented in 
this series.


>
>> +        }
>> +    }
>>   }
> The rest looks mostly good to me; thanks.


Thanks


>


