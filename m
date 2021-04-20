Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F053656EB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:53:31 +0200 (CEST)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYo0Y-0000oC-T0
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnoY-0007Vf-U0
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:41:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnoU-0006iR-Lr
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618915261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUOEYxp3D7AajGd2RmV1614DyyF+50BJqUT675+p+FI=;
 b=Lkjk1YTrWy2/XFM86qPRQH3BXbPmB3G4k1Ej2xauCVS9i83TN8N5w5VPGPdbNF1tvBBS6X
 kv6V9swZGxXMBpHeQ/nV0T2v1Q6ePiC62wWbTu+IlvfIsuUlpdcgq7AasI3R+OOsKavJPA
 hdjW3K6ZgaxaJuwXQtzrr1pY4FWNMVw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-eXb_UU0fNLKvlb0C-H593w-1; Tue, 20 Apr 2021 06:41:00 -0400
X-MC-Unique: eXb_UU0fNLKvlb0C-H593w-1
Received: by mail-wr1-f70.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so8063393wrb.9
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YUOEYxp3D7AajGd2RmV1614DyyF+50BJqUT675+p+FI=;
 b=efhDTBuwAJ8+acnWApAh0kSslh1DCCxW9/eDzv7GDLQ335vTEKu/XUVHNG3YZjrz04
 r4TeD4W0jNsyrlS7/VZEe+/muVz+JIalVUqqh+PRv4V0xf30TQLAyfo/o3WLMGyFRCHW
 uXP9Wiqw6V6mj2EDViSgRVjWpO8bCAR345/71w3vtnXT24pnNZcUwgSsKVXsorqfQOkB
 5IEQ41O4Nrvi9RewuuJh+x5W5AOhfZhifhsSDp0Q+YWUQBrxOC4Ga0pCwps/SHPzrwMu
 ULM45CVt2KY0bj0frfcm/E221+q0pcW1AbJioXulq+G8YR3sCnh3znCXa0GyS99OuBzl
 fNwA==
X-Gm-Message-State: AOAM531ywvHqZZ8dg/B1uitsxFF+YSNqpRFTtGgT1b4D7IbzQZoU20mt
 3VJ5x4HhHwfq3f86UYDDrM/AqJYs2JJWKyvalQ1T0Yzoy5cRNwcfgGwGQvUSU9SheHvr3M7Jq2C
 jEWx3wPYQX6H8PD0=
X-Received: by 2002:a1c:2786:: with SMTP id n128mr3864368wmn.82.1618915259242; 
 Tue, 20 Apr 2021 03:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtihl2IVF1QYfoFmRNWnbLqI4VjTkTW8kpPlslWQ/R9AJ53uSwrkr53BmWYt4OExZy8S5MVg==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr3864342wmn.82.1618915258977; 
 Tue, 20 Apr 2021 03:40:58 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u3sm2895261wmg.48.2021.04.20.03.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:40:58 -0700 (PDT)
Subject: Re: [PATCH v5 05/14] softmmu/memory: Pass ram_flags to
 memory_region_init_ram_shared_nomigrate()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-6-david@redhat.com>
 <34931ee0-1bde-16f5-d929-1c9d9157f45a@redhat.com>
 <ce266bac-0bfa-4b45-0159-af3e7b17a234@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f298a62c-59e5-b562-63d1-8bdd2a44f7fe@redhat.com>
Date: Tue, 20 Apr 2021 12:40:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ce266bac-0bfa-4b45-0159-af3e7b17a234@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 12:27 PM, David Hildenbrand wrote:
> On 20.04.21 12:20, Philippe Mathieu-Daudé wrote:
>> Hi David,
>>
>> On 4/13/21 11:14 AM, David Hildenbrand wrote:
>>> Let's forward ram_flags instead, renaming
>>> memory_region_init_ram_shared_nomigrate() into
>>> memory_region_init_ram_flags_nomigrate(). Forward flags to
>>> qemu_ram_alloc() and qemu_ram_alloc_internal().
>>>
>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>   backends/hostmem-ram.c                        |  6 +++--
>>>   hw/m68k/next-cube.c                           |  4 ++--
>>>   include/exec/memory.h                         | 24 +++++++++----------
>>>   include/exec/ram_addr.h                       |  2 +-
>>>   .../memory-region-housekeeping.cocci          |  8 +++----
>>>   softmmu/memory.c                              | 20 ++++++++--------
>>
>> OK up to here, but the qemu_ram_alloc_internal() changes
>> in softmmu/physmem.c belong to a different patch (except
>> the line adding "new_block->flags = ram_flags").
>> Do you mind splitting it?
>>
> 
> Can you elaborate? Temporarily passing both "ram_flags" and "bool
> resizeable, bool share" to qemu_ram_alloc_internal()?
> 
> I don't see a big benefit in doing that besides even more effective
> changes in two individual patches. But maybe if you elaborate, i can see
> what you would like to see :)

In this patch I see

1/ change a parameter and propagate it
2/ adapt assertions

I'd rather review the assertions modified / cleaned in another patch,
simply because it required me 2 different mental efforts to review the
first part and the second part. But maybe it is not possible, so I'll
review the 2nd part here.

> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index cc59f05593..fdcd38ba61 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2108,12 +2108,14 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t
size, ram_addr_t max_size,
>                                    void (*resized)(const char*,
>                                                    uint64_t length,
>                                                    void *host),
> -                                  void *host, bool resizeable, bool
share,
> +                                  void *host, uint32_t ram_flags,
>                                    MemoryRegion *mr, Error **errp)
>  {
>      RAMBlock *new_block;
>      Error *local_err = NULL;
>

Maybe also:

       assert(!host || (ram_flags & RAM_PREALLOC));

> +    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE)) == 0);
> +
>      size = HOST_PAGE_ALIGN(size);
>      max_size = HOST_PAGE_ALIGN(max_size);
>      new_block = g_malloc0(sizeof(*new_block));
> @@ -2125,15 +2127,10 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t
size, ram_addr_t max_size,
>      new_block->fd = -1;
>      new_block->page_size = qemu_real_host_page_size;
>      new_block->host = host;
> +    new_block->flags = ram_flags;
>      if (host) {
>          new_block->flags |= RAM_PREALLOC;
>      }

We could also remove this statement ...

> -    if (share) {
> -        new_block->flags |= RAM_SHARED;
> -    }
> -    if (resizeable) {
> -        new_block->flags |= RAM_RESIZEABLE;
> -    }
>      ram_block_add(new_block, &local_err);
>      if (local_err) {
>          g_free(new_block);
> @@ -2146,15 +2143,14 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t
size, ram_addr_t max_size,
>  RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
>                                     MemoryRegion *mr, Error **errp)
>  {
> -    return qemu_ram_alloc_internal(size, size, NULL, host, false,
> -                                   false, mr, errp);

... by passing RAM_PREALLOC here.

> +    return qemu_ram_alloc_internal(size, size, NULL, host, 0, mr, errp);
>  }
>
> -RAMBlock *qemu_ram_alloc(ram_addr_t size, bool share,
> +RAMBlock *qemu_ram_alloc(ram_addr_t size, uint32_t ram_flags,
>                           MemoryRegion *mr, Error **errp)
>  {
> -    return qemu_ram_alloc_internal(size, size, NULL, NULL, false,
> -                                   share, mr, errp);
> +    assert((ram_flags & ~RAM_SHARED) == 0);
> +    return qemu_ram_alloc_internal(size, size, NULL, NULL, ram_flags,
mr, errp);
>  }
>
>  RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t size, ram_addr_t maxsz,
> @@ -2163,8 +2159,8 @@ RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t
size, ram_addr_t maxsz,
>                                                       void *host),
>                                       MemoryRegion *mr, Error **errp)
>  {
> -    return qemu_ram_alloc_internal(size, maxsz, resized, NULL, true,
> -                                   false, mr, errp);
> +    return qemu_ram_alloc_internal(size, maxsz, resized, NULL,
> +                                   RAM_RESIZEABLE, mr, errp);
>  }
>
>  static void reclaim_ramblock(RAMBlock *block)
>


