Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD91A400648
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:01:44 +0200 (CEST)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFNf-0002l6-SM
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMF7t-0004Jb-1d
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:45:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMF7r-0005V0-5M
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630698322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omMmFIbl6wnucGjS6sAPMfziI0k/a0A/b+VmCHr2rnM=;
 b=cDKGXZf4B8Rg+zvlfYWO99Xgv3z6bZ89Xegf21ElZx0K4PQEiWHGtAFLyuNpJGzXJiE8+D
 OH8oAMgq3ul67N9eHksfHHjrlFfvdiBCFHCPuE9iTHjG0OvhnPwOqxSewlbaaRUcYR5dre
 bMHdGeURrMfAJZjTbyshjdBMjRE90yg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-Z9Hqy2wqPRek0dX6gtEx6Q-1; Fri, 03 Sep 2021 15:45:21 -0400
X-MC-Unique: Z9Hqy2wqPRek0dX6gtEx6Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 x125-20020a1c3183000000b002e73f079eefso206593wmx.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=omMmFIbl6wnucGjS6sAPMfziI0k/a0A/b+VmCHr2rnM=;
 b=Oya4QbXljaqAdj/I3barZhsndAFl/1jadTyBchddLsUKF7Cq2msCkZ24fA1wNz7yLq
 G9AESv5sFZ8e2HJTDBnAAbYatTQug7twnuakjgfhFi8lCRPcbLZiMfZXAMc9kINTAgeM
 MLRWjDXHr9GFz9hlWFYsaMU23LH4fhG79BnN1fDXY6gFSIgeCKe+UA2MCDUFZdmf2J3X
 8NcZau18VMwbsfaW+uqRi3m40KYk3RtlKFjF0Qwslpr057pi+Sb0PKvzU9VNivLEWXWr
 3OLMa9tyjCjCnhWslPjn7AFoc7T787xb2C2fyEm0PwSDBhhOgH6L3TMndvrLkAumtQ7Q
 3XSg==
X-Gm-Message-State: AOAM532m3Osiie+L8iBgXBGKhEiIVOee4tJoKvpMx7z6uImfPJzKkcKY
 BeU83kT5LmdgZRRMNa2/W+e/sLRLAGcEhhMLDviFVuTGxPh2EGD3xAcSNetZnMWlQ4yUbFv3yWX
 H4jR27D0nOUT56bg=
X-Received: by 2002:adf:9e08:: with SMTP id u8mr662864wre.383.1630698319938;
 Fri, 03 Sep 2021 12:45:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2fkJN+QwE1YyzjLU6nb0HLuXjvMIHrBA97PqX0LDdszfRY1sapomqOzpRshqEYQ29OCPQ7w==
X-Received: by 2002:adf:9e08:: with SMTP id u8mr662843wre.383.1630698319690;
 Fri, 03 Sep 2021 12:45:19 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23e05.dip0.t-ipconnect.de. [79.242.62.5])
 by smtp.gmail.com with ESMTPSA id
 l35sm205751wms.40.2021.09.03.12.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:45:19 -0700 (PDT)
Subject: Re: [PATCH v4 8/9] migration/ram: Factor out populating pages
 readable in ram_block_populate_pages()
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <20210902131432.23103-1-david@redhat.com>
 <20210902131432.23103-9-david@redhat.com> <YTFQKKPK3evHAMWN@t490s>
 <bcdb8e57-7032-f5c4-469c-f423cce923ab@redhat.com>
 <4ed5a784-986b-67a7-f8e6-0245ef10c301@redhat.com> <YTJ1bBVvsyHhIHsk@t490s>
 <481b9502-915e-fcb3-005f-36760cf3764d@redhat.com>
Organization: Red Hat
Message-ID: <639c6022-0502-b484-1790-25e398924f55@redhat.com>
Date: Fri, 3 Sep 2021 21:45:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <481b9502-915e-fcb3-005f-36760cf3764d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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

On 03.09.21 21:40, David Hildenbrand wrote:
> On 03.09.21 21:20, Peter Xu wrote:
>> On Fri, Sep 03, 2021 at 09:58:06AM +0200, David Hildenbrand wrote:
>>>>> That'll be good enough for live snapshot as uffd-wp works for zero pages,
>>>>> however I'm just afraid it may stop working for some new users of it when zero
>>>>> pages won't suffice.
>>>>
>>>> I thought about that as well. But snapshots/migration will read all
>>>> memory either way and consume real memory when there is no shared zero
>>>> page. So it's just shifting the point in time when we allocate all these
>>>> pages I guess.
>>>
>>> ... thinking again, even when populating on shmem and friends there is
>>> nothing stopping pages from getting mapped out again.
>>>
>>> What would happen when trying uffd-wp protection on a pte_none() in your
>>> current shmem implementation? Will it lookup if there is something in the
>>> page cache (not a hole) and set a PTE marker? Or will it simply skip as
>>> there is currently nothing in the page table? Or will it simply
>>> unconditionally install a PTE marker, even if there is a hole?
>>
>> It (will - I haven't rebased and posted) sets a pte marker.  So uffd-wp will
>> always work on read prefault irrelevant of memory type in the future.
>>
>>>
>>> Having an uffd-wp mode that doesn't require pre-population would really be
>>> great. I remember you shared prototypes.
>>
>> Yes, I planned to do that after the shmem bits, because they have some
>> conflict. I don't want to mess up more with the current series either, which is
>> already hard to push, which is very unfortunate.
>>
> 
> Yeah ... alternatively, we could simply populate the shared zeropage on
> private anonymous memory when trying protecting a pte_none(). That might
> actually be a very elegant solution.
> 

Oh well, it's late in Germany ... doing it properly avoids having to 
modify/allocate page tables completely. So that is certainly the better 
approach.

-- 
Thanks,

David / dhildenb


