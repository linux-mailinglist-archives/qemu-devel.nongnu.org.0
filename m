Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2218C3CB41B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:27:09 +0200 (CEST)
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4JBc-0006qt-6X
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m4JAn-00064o-Ac
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:26:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m4JAj-0003U8-7f
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626423971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXUBzon4txDeOHkVm/5EakXHw6MQ74zVE8BA345AO9c=;
 b=QFYqTHLaL51Afw95Gf6y+rmO48yopahW6ve5kwZqA7zFrwswsPsFNW+xygLzXmiKV9zkKk
 zv7xsa71DbEYlEfJqdDym7rb42z1j8bLPdAEUUOhcrcYXE9UiqJvDAxW5zjTC9fms/e0oH
 SJgRlM36djD0ShE8XXYvAqAFFMbmENk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-Wz-V2c68O8u5SILvxfa6pA-1; Fri, 16 Jul 2021 04:26:09 -0400
X-MC-Unique: Wz-V2c68O8u5SILvxfa6pA-1
Received: by mail-wr1-f72.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so4561958wru.6
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UXUBzon4txDeOHkVm/5EakXHw6MQ74zVE8BA345AO9c=;
 b=KhphA47Jeaw2HdfJpCYb6kg3XXLP4T4kmyGqeZdm260riEPS//u4GEZi7n8OQHgfU9
 NjTK5N3a/7VRI+gAhgVpHIKzXvfaIzacLgMnRBXfcIevLK1CG0toKy71MwRR/5xYEJon
 JeOYk48WYA3XxYv2LFAQc0xKMdoNRjp9907Fboo4bybQH9feZmkMJdMtt7p/TXH6QrF4
 RfNiW6skvF5rlh+37+TaCakM0execqwU3biwggNQeqkvOCF7NGLYxNovcfqUAQj7D4XF
 8SJDR4qSbZMXAFE6S9/AbMDoi51HSmoctXUgUGCHxjUanJsG0763TU1A8gf+uO9PBBhN
 rxRg==
X-Gm-Message-State: AOAM530dgxCCOyasTh9CQ6Op0fBm3XgKEbvup/7l8xuM4llzqqg/V6QK
 z/AiemdA+ZBV3oXrlfuLxJPVE4okTcacv7yMml2tjS6t5ikpBR8dQlPXc+3mw1zS4bzuvE1cUja
 k6gKS8KMufE3ClCw=
X-Received: by 2002:a5d:6489:: with SMTP id o9mr10517309wri.397.1626423968579; 
 Fri, 16 Jul 2021 01:26:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrieAotN5O5ieWsrR8WOn7ei9t0+9G57OlQFvRISmqDP1/F0hhJBzLSpC1Y9b9+7NKYuCPRg==
X-Received: by 2002:a5d:6489:: with SMTP id o9mr10517288wri.397.1626423968376; 
 Fri, 16 Jul 2021 01:26:08 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c621f.dip0.t-ipconnect.de. [91.12.98.31])
 by smtp.gmail.com with ESMTPSA id
 n5sm9003659wri.31.2021.07.16.01.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 01:26:07 -0700 (PDT)
To: "Wang, Wei W" <wei.w.wang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210715075326.421977-1-wei.w.wang@intel.com>
 <2581d2a2-de9d-7937-4d71-25a33cfbce3e@redhat.com>
 <83c6af0d803b436aab62d1495375ae3c@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2] migration: clear the memory region dirty bitmap when
 skipping free pages
Message-ID: <3c3a44c8-c819-5946-e1f6-a0d69215e2fe@redhat.com>
Date: Fri, 16 Jul 2021 10:26:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <83c6af0d803b436aab62d1495375ae3c@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> +    /*
>>> +     * CLEAR_BITMAP_SHIFT_MIN should always guarantee this... this
>>> +     * can make things easier sometimes since then start address
>>> +     * of the small chunk will always be 64 pages aligned so the
>>> +     * bitmap will always be aligned to unsigned long. We should
>>> +     * even be able to remove this restriction but I'm simply
>>> +     * keeping it.
>>> +     */
>>> +    assert(shift >= 6);
>>> +
>>> +    size = 1ULL << (TARGET_PAGE_BITS + shift);
>>> +    start = (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size);
>>
>> these as well as.
> 
> Is there any coding style requirement for this?

Don't think so. It simply results in less LOC and less occurrences of 
variables.

> My thought was that those operations could mostly be avoided if they don't pass the
> above if condition (e.g. just once per 1GB chunk).

Usually the compiler will reshuffle as possible to optimize. But in this 
case, due to clear_bmap_test_and_clear(), it might not be able to move 
the computations behind that call. So the final code might actually differ.

Not that we really care about this micro-optimization, though.

> 
>>
>>> +    trace_migration_bitmap_clear_dirty(rb->idstr, start, size, page);
>>> +    memory_region_clear_dirty_bitmap(rb->mr, start, size); }
>>> +
>>> +static void
>>> +migration_clear_memory_region_dirty_bitmap_range(RAMState *rs,
>>> +                                                 RAMBlock *rb,
>>> +                                                 unsigned long
>> start,
>>> +                                                 unsigned long
>>> +npages) {
>>> +    unsigned long page_to_clear, i, nchunks;
>>> +    unsigned long chunk_pages = 1UL << rb->clear_bmap_shift;
>>> +
>>> +    nchunks = (start + npages) / chunk_pages - start / chunk_pages +
>>> + 1;
>>
>> Wouldn't you have to align the start and the end range up/down to properly
>> calculate the number of chunks?
> 
> No, divide will round it to the integer (beginning of the chunk to clear).


nchunks = (start + npages) / chunk_pages - start / chunk_pages + 1;

For simplicity:

nchunks = (addr + size) / chunk_size - addr / chunk_size + 1;

addr=1GB
size=3GB
chunk_size=2GB

So for that range [1GB, 3GB), we'd have to clear [0GB,2GB), [2GB,4GB)

Range:    [      ]
Chunks: [ - ][ - ][ - ][ - ] ...
         ^0   ^2   ^4   ^6

nchunks = (1 + 3) / 2 - 1 / 2 + 1
	= 4 / 2 - 0 + 1
	= 2 + 1
	= 3

Which is wrong.

While my variant will give you

aligned_start = 0GB
aligned_end = 4GB

And consequently clear [0GB,2GB) and [2GB,4GB).


Am I making a stupid mistake and should rather get another cup of coffee? :)


> 
>>
>> The following might be better and a little easier to grasp:
>>
>> unsigned long chunk_pages = 1ULL << rb->clear_bmap_shift; unsigned long
>> aligned_start = QEMU_ALIGN_DOWN(start, chunk_pages); unsigned long
>> aligned_end = QEMU_ALIGN_UP(start + npages, chunk_pages)
>>
>> /*
>>    * Clear the clar_bmap of all covered chunks. It's sufficient to call it for
>>    * one page within a chunk.
>>    */
>> for (start = aligned_start, start != aligned_end, start += chunk_pages) {
> 
> What if "aligned_end == start + npages"?
> i.e the above start + npages is aligned by itself without QEMU_ALIGN_UP().
> For example, chunk size is 1GB, and start+npages=2GB, which is right at the beginning of [2GB,3GB) chunk.
> Then aligned_end is also 2GB, but we need to clear the [2GB, 3GB) chunk, right?

Again, let's work with sizes instead of PFNs:

addr=1GB
size=1GB
chunk_size=1GB

Range:       [   ]
Chunks: [ - ][ - ][ - ][ - ] ...
         ^0   ^1   ^2   ^3

aligned_start = 1GB
aligned_end = 2GB

As you say, we'd clear the [1GB,2GB) chunk, but not the [2GB,3GB) chunk. 
But that's correct, as our range to hint is actually [start, 
start+npages) == [1GB,2GB).

> 
> Best,
> Wei
> 


-- 
Thanks,

David / dhildenb


