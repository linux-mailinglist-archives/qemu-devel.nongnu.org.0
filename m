Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066C3DE5A6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:45:40 +0200 (CEST)
Received: from localhost ([::1]:58026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmJA-0003IP-12
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAmHm-0001Ax-3w
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:44:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAmHj-0000p1-1p
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627965848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EnAzh0PoHmFrvviQOwK94t26WuoARN/ePbw2Am6+C78=;
 b=dwjTf1Hq/KUDUdfniF4sOlQK/5P7+uWFOytsw+gVxLEZQZFeLW9iE63yzP8zdcvm27wkh9
 J2r9RGvgbAPEFcxwKKNfJiohxH46Ojn6b+2SnnRV+Towz6xlsg/2Bz5jlc4pH+lxasn8G+
 PGavshO+w45+Wxv2q+aCbhnO163K1JQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-HnUas5lWN5qInVOpthEPwA-1; Tue, 03 Aug 2021 00:44:07 -0400
X-MC-Unique: HnUas5lWN5qInVOpthEPwA-1
Received: by mail-pj1-f69.google.com with SMTP id
 s4-20020a17090aba04b0290173b4d6dd74so18611254pjr.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=EnAzh0PoHmFrvviQOwK94t26WuoARN/ePbw2Am6+C78=;
 b=WyusKZB6BFFxiUHSCrrUB2FQmaxbiz4g1kdy5YSDWs+0FQHKHfgGc1NXp6Y2aob/sO
 PX0PqKPHv11ROy/MTdXwoOhC37LBJqXgHajpqjwCLIriVi7z0FQV5MGZ1hDrQWe/aHFi
 175tEmXgWB/H3491hqwdCx55EA99pqan1Ksp0ml0pSu24gTTMT9rm8VX7Bih/YnX+8HA
 Z3GzSb8uf61s9baG57+Xp7wVm0WHcjnJf88ysICipwiVIerX5Fsc6CpxHYSUEosjLD9j
 O5SYdK8E8wZdQrkgXJvkXMkH02T4Es4kkh1kQoJTd4sXiEjVJ58wkqoYc08tfUlj0LWd
 V/Kg==
X-Gm-Message-State: AOAM531dhruzqVj5BKTEfZK5c3939Qu33SFpTGihTyROnoH/eRZklC2q
 IgqC+eKn9MvQ2RY22SKkccm8GCGyl1Rfw6fl9s4x3m7uXAJwyQ1SGJziTvbtVJR8dvKeCdf7/3K
 OriswSpk7g78AMTb3DOWsboA7YP9PJRy7BKBHfWhaWAUw/Ucm/v3rJEPUv1zzdFXdnpU=
X-Received: by 2002:a05:6a00:8c7:b029:3a1:119b:736 with SMTP id
 s7-20020a056a0008c7b02903a1119b0736mr20391587pfu.52.1627965846599; 
 Mon, 02 Aug 2021 21:44:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4tRBFt1mZm1XrIZSyVM1ihqVbjk0CcJNp8jHc9IsqivuBxsXeHIQ+mVIfCB8RUsv8cQ94pA==
X-Received: by 2002:a05:6a00:8c7:b029:3a1:119b:736 with SMTP id
 s7-20020a056a0008c7b02903a1119b0736mr20391567pfu.52.1627965846213; 
 Mon, 02 Aug 2021 21:44:06 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s195sm13943124pfs.119.2021.08.02.21.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 21:44:05 -0700 (PDT)
Subject: Re: [PATCH] vhost: use large iotlb entry if no IOMMU translation is
 needed
To: Chao Gao <chao.gao@intel.com>, mst@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com
References: <20210721075402.203711-1-chao.gao@intel.com>
 <20210803042927.GA30466@gao-cwp>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5321eefb-7177-2009-6aae-f8c398731eac@redhat.com>
Date: Tue, 3 Aug 2021 12:43:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803042927.GA30466@gao-cwp>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/8/3 下午12:29, Chao Gao 写道:
> Ping. Could someone help to review this patch?
>
> Thanks
> Chao
>
> On Wed, Jul 21, 2021 at 03:54:02PM +0800, Chao Gao wrote:
>> If guest enables IOMMU_PLATFORM for virtio-net, severe network
>> performance drop is observed even if there is no IOMMU.


We see such reports internally and we're testing a patch series to 
disable vhost IOTLB in this case.

Will post a patch soon.



>>   And disabling
>> vhost can mitigate the perf issue. Finally, we found the culprit is
>> frequent iotlb misses: kernel vhost-net has 2048 entries and each
>> entry is 4K (qemu uses 4K for i386 if no IOMMU); vhost-net can cache
>> translations for up to 8M (i.e. 4K*2048) IOVAs. If guest uses >8M
>> memory for DMA, there are some iotlb misses.
>>
>> If there is no IOMMU or IOMMU is disabled or IOMMU works in pass-thru
>> mode, we can optimistically use large, unaligned iotlb entries instead
>> of 4K-aligned entries to reduce iotlb pressure.


Instead of introducing new general facilities like unaligned IOTLB 
entry. I wonder if we optimize the vtd_iommu_translate() to use e.g 1G 
instead?

     } else {
         /* DMAR disabled, passthrough, use 4k-page*/
         iotlb.iova = addr & VTD_PAGE_MASK_4K;
         iotlb.translated_addr = addr & VTD_PAGE_MASK_4K;
         iotlb.addr_mask = ~VTD_PAGE_MASK_4K;
         iotlb.perm = IOMMU_RW;
         success = true;
     }


>>   Actually, vhost-net
>> in kernel supports unaligned iotlb entry. The alignment requirement is
>> imposed by address_space_get_iotlb_entry() and flatview_do_translate().


For the passthrough case, is there anyway to detect them and then 
disable device IOTLB in those case?

Thanks


>>
>> Introduce IOMMUTLBEntryUnaligned which has a @len field to specify the
>> iotlb size to abstract a generic iotlb entry: aligned (original
>> IOMMUTLBEntry) and unaligned entry. flatview_do_translate() now
>> returns a magic value in @page_mask_out if no IOMMU translation is
>> needed. Then, address_space_get_iotbl_entry() can accordingly return a
>> page-aligned iotlb entry or the whole memory region section where the
>> iova resides as a large iotlb entry.
>>
>> Signed-off-by: Chao Gao <chao.gao@intel.com>
>> ---
>> hw/virtio/vhost.c     |  6 +++---
>> include/exec/memory.h | 16 ++++++++++++++--
>> softmmu/physmem.c     | 37 +++++++++++++++++++++++++++++--------
>> 3 files changed, 46 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index e8f85a5d2d..6745caa129 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1010,7 +1010,7 @@ static int vhost_memory_region_lookup(struct vhost_dev *hdev,
>>
>> int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write)
>> {
>> -    IOMMUTLBEntry iotlb;
>> +    IOMMUTLBEntryUnaligned iotlb;
>>      uint64_t uaddr, len;
>>      int ret = -EFAULT;
>>
>> @@ -1031,8 +1031,8 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write)
>>              goto out;
>>          }
>>
>> -        len = MIN(iotlb.addr_mask + 1, len);
>> -        iova = iova & ~iotlb.addr_mask;
>> +        len = MIN(iotlb.len, len);
>> +        iova = iotlb.iova;
>>
>>          ret = vhost_backend_update_device_iotlb(dev, iova, uaddr,
>>                                                  len, iotlb.perm);
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index c3d417d317..3f04e8fe88 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -94,6 +94,7 @@ struct MemoryRegionSection {
>> };
>>
>> typedef struct IOMMUTLBEntry IOMMUTLBEntry;
>> +typedef struct IOMMUTLBEntryUnaligned IOMMUTLBEntryUnaligned;
>>
>> /* See address_space_translate: bit 0 is read, bit 1 is write.  */
>> typedef enum {
>> @@ -113,6 +114,15 @@ struct IOMMUTLBEntry {
>>      IOMMUAccessFlags perm;
>> };
>>
>> +/* IOMMUTLBEntryUnaligned may be not page-aligned */
>> +struct IOMMUTLBEntryUnaligned {
>> +    AddressSpace    *target_as;
>> +    hwaddr           iova;
>> +    hwaddr           translated_addr;
>> +    hwaddr           len;
>> +    IOMMUAccessFlags perm;
>> +};
>> +
>> /*
>>   * Bitmap for different IOMMUNotifier capabilities. Each notifier can
>>   * register with one or multiple IOMMU Notifier capability bit(s).
>> @@ -2653,8 +2663,10 @@ void address_space_cache_destroy(MemoryRegionCache *cache);
>> /* address_space_get_iotlb_entry: translate an address into an IOTLB
>>   * entry. Should be called from an RCU critical section.
>>   */
>> -IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
>> -                                            bool is_write, MemTxAttrs attrs);
>> +IOMMUTLBEntryUnaligned address_space_get_iotlb_entry(AddressSpace *as,
>> +                                                     hwaddr addr,
>> +                                                     bool is_write,
>> +                                                     MemTxAttrs attrs);
>>
>> /* address_space_translate: translate an address range into an address space
>>   * into a MemoryRegion and an address range into that section.  Should be
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 3c1912a1a0..469963f754 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -143,6 +143,8 @@ typedef struct subpage_t {
>>
>> #define PHYS_SECTION_UNASSIGNED 0
>>
>> +#define PAGE_MASK_NOT_BEHIND_IOMMU ((hwaddr)-1)
>> +
>> static void io_mem_init(void);
>> static void memory_map_init(void);
>> static void tcg_log_global_after_sync(MemoryListener *listener);
>> @@ -470,7 +472,9 @@ unassigned:
>>   * @page_mask_out: page mask for the translated address. This
>>   *            should only be meaningful for IOMMU translated
>>   *            addresses, since there may be huge pages that this bit
>> - *            would tell. It can be @NULL if we don't care about it.
>> + *            would tell. If the returned memory region section isn't
>> + *            behind an IOMMU, PAGE_MASK_NOT_BEHIND_IOMMU is return.
>> + *            It can be @NULL if we don't care about it.
>>   * @is_write: whether the translation operation is for write
>>   * @is_mmio: whether this can be MMIO, set true if it can
>>   * @target_as: the address space targeted by the IOMMU
>> @@ -508,16 +512,18 @@ static MemoryRegionSection flatview_do_translate(FlatView *fv,
>>                                               target_as, attrs);
>>      }
>>      if (page_mask_out) {
>> -        /* Not behind an IOMMU, use default page size. */
>> -        *page_mask_out = ~TARGET_PAGE_MASK;
>> +        /* return a magic value if not behind an IOMMU */
>> +        *page_mask_out = PAGE_MASK_NOT_BEHIND_IOMMU;
>>      }
>>
>>      return *section;
>> }
>>
>> /* Called from RCU critical section */
>> -IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
>> -                                            bool is_write, MemTxAttrs attrs)
>> +IOMMUTLBEntryUnaligned address_space_get_iotlb_entry(AddressSpace *as,
>> +                                                     hwaddr addr,
>> +                                                     bool is_write,
>> +                                                     MemTxAttrs attrs)
>> {
>>      MemoryRegionSection section;
>>      hwaddr xlat, page_mask;
>> @@ -535,21 +541,36 @@ IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
>>          goto iotlb_fail;
>>      }
>>
>> +    /*
>> +     * If the section isn't behind an IOMMU, return the whole section as an
>> +     * IOMMU TLB entry.
>> +     */
>> +    if (page_mask == PAGE_MASK_NOT_BEHIND_IOMMU) {
>> +        return (IOMMUTLBEntryUnaligned) {
>> +            .target_as = as,
>> +            .iova = section.offset_within_address_space,
>> +            .translated_addr = section.offset_within_address_space,
>> +            .len = section.size,
>> +            /* IOTLBs are for DMAs, and DMA only allows on RAMs. */
>> +            .perm = IOMMU_RW,
>> +        };
>> +    }
>> +
>>      /* Convert memory region offset into address space offset */
>>      xlat += section.offset_within_address_space -
>>          section.offset_within_region;
>>
>> -    return (IOMMUTLBEntry) {
>> +    return (IOMMUTLBEntryUnaligned) {
>>          .target_as = as,
>>          .iova = addr & ~page_mask,
>>          .translated_addr = xlat & ~page_mask,
>> -        .addr_mask = page_mask,
>> +        .len = page_mask + 1,
>>          /* IOTLBs are for DMAs, and DMA only allows on RAMs. */
>>          .perm = IOMMU_RW,
>>      };
>>
>> iotlb_fail:
>> -    return (IOMMUTLBEntry) {0};
>> +    return (IOMMUTLBEntryUnaligned) {0};
>> }
>>
>> /* Called from RCU critical section */
>> -- 
>> 2.25.1
>>


