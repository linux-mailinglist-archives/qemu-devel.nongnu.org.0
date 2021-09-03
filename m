Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6800400610
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:47:50 +0200 (CEST)
Received: from localhost ([::1]:47536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFAD-0006ct-SK
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMF0W-0005nH-23
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:37:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMF0R-0007YW-Lz
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fcKFR6sHn3aSvrwoAzPHTBZYr36z2qjZKAR/oOKIz4=;
 b=Os4j49wbguNp0kSpw+EZpck8gXbQ2gzHVzhhVqsf5HZiwJangvLA9bYJYlQryhS6ThT6it
 41aNln1+OkJq0qyXiYoLfq/vd0nJ+ZuEdgvhhR/0l3mli790uuKOMGzxSaGyk6TYMlcuU4
 /kQ2PgsUheI93hxWZiw7CqQfpjLgJE4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-Kv_SGcVvPemTw95Qt2p1Mw-1; Fri, 03 Sep 2021 15:37:41 -0400
X-MC-Unique: Kv_SGcVvPemTw95Qt2p1Mw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso44819wrw.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+fcKFR6sHn3aSvrwoAzPHTBZYr36z2qjZKAR/oOKIz4=;
 b=dFjwlzS7elDfT88coBJvBmR5A8k9YyLAS1gThibNksdzxOEkaT4iFp5kBBI4pDmrvW
 sBYos0TgZc+zOrfmMVDMoJ/GRE4WeQ46ffQixSPWRrapSYRntEXj0N1mXSiMPvs7Swfd
 nuWHTP53kVzA1M519UCsoLvJLwLzFshTT1WiqovxVwlRCVcRei4mm6pZvJdbdQ9e2BqC
 5DIUgr5hXeS15rmcZIhQVOCgaKcADI4mDsViNQybRdxAAUb/xqEMDSn97xcmEWp7izJh
 skKLgEigIOe+qislPDkRYM+M+WyYBJzYKfq3qhUNHedRYucj21wW6IZ4TP8dOJ6Ue33Y
 A3uw==
X-Gm-Message-State: AOAM532nt+blZLThuCHN3EdZgYfQeW434sMIpWkXpz8hUvAKj7dT6i3m
 FCdobAJagApkXTUkyCMM6SejU4yhjBfvZUzQ2kTIBMJDrhUoDXle4C1aAz1rJXJ2KAIEDJRFV1Y
 sLuvEdPLiBgEXOAg=
X-Received: by 2002:a1c:e919:: with SMTP id q25mr335715wmc.28.1630697860586;
 Fri, 03 Sep 2021 12:37:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMvzRGo5dF2DQ4la8e1mYi2ph/vNH+wa9hAYrXdLCtKCmZek/MCoLK3ZqH4wtCo0deJgQejA==
X-Received: by 2002:a1c:e919:: with SMTP id q25mr335702wmc.28.1630697860387;
 Fri, 03 Sep 2021 12:37:40 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23e05.dip0.t-ipconnect.de. [79.242.62.5])
 by smtp.gmail.com with ESMTPSA id
 l35sm192133wms.40.2021.09.03.12.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:37:40 -0700 (PDT)
Subject: Re: [PATCH v4 7/9] migration: Simplify alignment and alignment checks
To: Peter Xu <peterx@redhat.com>
References: <20210902131432.23103-1-david@redhat.com>
 <20210902131432.23103-8-david@redhat.com> <YTFQ6vzTCFTwK3tz@t490s>
 <8985fca4-e15c-95a7-2c45-74353a3a19fa@redhat.com>
 <2d04741d-94bd-9cd2-4d70-f6505bc8db16@redhat.com> <YTJ0IxZ1UYSYCzCU@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5da476a5-cf79-c9b5-1116-a96f5349680e@redhat.com>
Date: Fri, 3 Sep 2021 21:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTJ0IxZ1UYSYCzCU@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.888, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.09.21 21:14, Peter Xu wrote:
> On Fri, Sep 03, 2021 at 12:07:20PM +0200, David Hildenbrand wrote:
>> On 03.09.21 10:47, David Hildenbrand wrote:
>>> On 03.09.21 00:32, Peter Xu wrote:
>>>> On Thu, Sep 02, 2021 at 03:14:30PM +0200, David Hildenbrand wrote:
>>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>>> index bb909781b7..ae97c2c461 100644
>>>>> --- a/migration/migration.c
>>>>> +++ b/migration/migration.c
>>>>> @@ -391,7 +391,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
>>>>>     int migrate_send_rp_req_pages(MigrationIncomingState *mis,
>>>>>                                   RAMBlock *rb, ram_addr_t start, uint64_t haddr)
>>>>>     {
>>>>> -    void *aligned = (void *)(uintptr_t)(haddr & (-qemu_ram_pagesize(rb)));
>>>>> +    void *aligned = (void *)QEMU_ALIGN_DOWN(haddr, qemu_ram_pagesize(rb));
>>>>
>>>> Is uintptr_t still needed?  I thought it would generate a warning otherwise but
>>>> not sure.
>>>
>>> It doesn't in my setup, but maybe it will on 32bit archs ...
>>>
>>> I discussed this with Phil in
>>>
>>> https://lkml.kernel.org/r/2c8d80ad-f171-7d5f-3235-92f02fa174b3@redhat.com
>>>
>>> Maybe
>>>
>>> QEMU_ALIGN_PTR_DOWN((void *)haddr, qemu_ram_pagesize(rb)));
>>>
>>> Is really what we want.
>>
>> ... but it would suffer the same issue I think. I just ran it trough the
>> gitlab pipeline, including "i386-fedora-cross-compile" ... and it seems to
>> compile just fine, which is weird, because I'd also expect
>>
>> "warning: cast to pointer from integer of different size
>> [-Wint-to-pointer-cast]"
>>
>> We most certainly need the "(void *)(uintptr_t)" to convert from u64 to a
>> pointer.
>>
>> Let's just do it cleanly:
>>
>> void *unaligned = (void *)(uintptr_t)haddr;
>> void *aligned = QEMU_ALIGN_PTR_DOWN(unaligned, qemu_ram_pagesize(rb));
>>
>> Thoughts?
> 
> ---8<---
> $ cat a.c
> #include <stdio.h>
> #include <time.h>
> #include <assert.h>
> 
> #define ROUND_DOWN(n, d) ((n) & -(0 ? (n) : (d)))
> #define QEMU_ALIGN_DOWN(n, m) ((n) / (m) * (m))
> 
> unsigned long getns(void)
> {
>      struct timespec tp;
> 
>      clock_gettime(CLOCK_MONOTONIC, &tp);
>      return tp.tv_sec * 1000000000 + tp.tv_nsec;
> }
> 
> void main(void)
> {
>      int i;
>      unsigned long start, end, v1 = 0x1234567890, v2 = 0x1000;
> 
>      start = getns();
>      for (i = 0; i < 1000000; i++) {
>          v1 = ROUND_DOWN(v1, v2);
>      }
>      end = getns();
>      printf("ROUND_DOWN took: \t%ld (us)\n", (end - start) / 1000);
> 
>      start = getns();
>      for (i = 0; i < 1000000; i++) {
>          v1 = QEMU_ALIGN_DOWN(v1, v2);
>      }
>      end = getns();
>      printf("QEMU_ALIGN_DOWN took: \t%ld (us)\n", (end - start) / 1000);
> }
> $ make a
> $ ./a
> ROUND_DOWN took:        1445 (us)
> QEMU_ALIGN_DOWN took:   9684 (us)
> ---8<---
> 
> So it's ~5 times slower here on the laptop, even if not very stable.  Agree
> it's not a big deal. :)

Same results for me, especially even if I turn v1 and v2 into global volatiles,
make sure the results won't get optimized out and compile with -03.

> 
> It's just that since we know it's still faster, I then second:
> 
>    (uinptr_t)ROUND_DOWN(...);

Well okay then,

void *aligned = (void *)(uintptr_t)ROUND_DOWN(haddr, qemu_ram_pagesize(rb));

fits precisely into a single line :)

-- 
Thanks,

David / dhildenb


