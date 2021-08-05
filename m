Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0923E1009
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:14:48 +0200 (CEST)
Received: from localhost ([::1]:38934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYWd-000369-W5
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBYTE-0006VP-6q
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:11:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBYTC-0004xr-Mt
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628151074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cvw1QZgodAwT+cm+Zy4DJDP3NyuvIHhmWVQqdnkHekU=;
 b=YaDr1TEuIdNlMrLpFVg72tbEPByR3Baf93SGkgIxkeOLO/sakHdmWM5eB97+I6hsNbtCSj
 hHHhfUbG0rFdxqZiR3qe1oluf7KETAqQROUkk97U58uiRK1JXxVjbPMR5FDOvwcsyqYDOE
 Wt/jKDLj5q+2llGAQUwRZjN99N+Jjfs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-TYSX0RO3NBOxnVXFauSzXg-1; Thu, 05 Aug 2021 04:11:13 -0400
X-MC-Unique: TYSX0RO3NBOxnVXFauSzXg-1
Received: by mail-wm1-f70.google.com with SMTP id
 f25-20020a1c6a190000b029024fa863f6b0so2743902wmc.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 01:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Cvw1QZgodAwT+cm+Zy4DJDP3NyuvIHhmWVQqdnkHekU=;
 b=qQW5mNqeCYQXMRVPl9rDoSJj8qnENEajNNn0BzAofMqeXwCGiYBQwtnDSKNOQllwT4
 Zdy9kYMUlgVmBUHfPFMTUscqck0IDSeO1UaaMC6EPjtLhM/Preh7PZIrEifmkYb9tXc/
 h3r8ogo2wQkJOnbLcgnCAzR8i0fNVXGmHHE8i5PE5EZHQRUk4LL5JEqITcZQKwhR+IMI
 QxaDacbUloSowLDoUVbhJ/MqA7NgA1OqJLkt9qyrERznD4kI6BlV4NAVJwQUDFXJJX+0
 GQYaO7rjwJIGVvD1kjXpJe9oE5M5N0ousXMXoRP8ZYcDgqiV/I/mQBK50lNg4xea8pEf
 894A==
X-Gm-Message-State: AOAM531009Qa6aUPBP7IL+9Gcjeulei3GNhBlW4bNokhYaQsH4/MnANA
 w8UA8LfrPZFi1XYPJ8CnlRZDNtF3QHRtFFpah+zTKRSYfF9kXNeJwDJv4e3pDpiibI0kEOiDyPa
 Xd4TU16yZoifgPW0=
X-Received: by 2002:a1c:46c4:: with SMTP id t187mr14130059wma.64.1628151071798; 
 Thu, 05 Aug 2021 01:11:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypjLY47BH7p7pRCpN8eRQeW4QDHlktoKiu/9lCDPAjc1NHc33t2r4y2a5IVWquv0sERn0y+g==
X-Received: by 2002:a1c:46c4:: with SMTP id t187mr14130041wma.64.1628151071647; 
 Thu, 05 Aug 2021 01:11:11 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c630b.dip0.t-ipconnect.de. [91.12.99.11])
 by smtp.gmail.com with ESMTPSA id
 t23sm8589726wmi.32.2021.08.05.01.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:11:11 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-8-david@redhat.com>
 <fd43555b-5661-33a5-a4da-2a38939704f7@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 7/7] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on background snapshots
Message-ID: <265427ef-ea74-e352-8148-7e4353af6ceb@redhat.com>
Date: Thu, 5 Aug 2021 10:11:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fd43555b-5661-33a5-a4da-2a38939704f7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.08.21 10:04, Philippe Mathieu-Daudé wrote:
> On 7/30/21 10:52 AM, David Hildenbrand wrote:
>> We already don't ever migrate memory that corresponds to discarded ranges
>> as managed by a RamDiscardManager responsible for the mapped memory region
>> of the RAMBlock.
>>
>> virtio-mem uses this mechanism to logically unplug parts of a RAMBlock.
>> Right now, we still populate zeropages for the whole usable part of the
>> RAMBlock, which is undesired because:
>>
>> 1. Even populating the shared zeropage will result in memory getting
>>     consumed for page tables.
>> 2. Memory backends without a shared zeropage (like hugetlbfs and shmem)
>>     will populate an actual, fresh page, resulting in an unintended
>>     memory consumption.
>>
>> Discarded ("logically unplugged") parts have to remain discarded. As
>> these pages are never part of the migration stream, there is no need to
>> track modifications via userfaultfd WP reliably for these parts.
>>
>> Further, any writes to these ranges by the VM are invalid and the
>> behavior is undefined.
>>
>> Note that Linux only supports userfaultfd WP on private anonymous memory
>> for now, which usually results in the shared zeropage getting populated.
>> The issue will become more relevant once userfaultfd WP supports shmem
>> and hugetlb.
>>
>> Acked-by: Peter Xu <peterx@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   migration/ram.c | 53 +++++++++++++++++++++++++++++++++++++++++--------
>>   1 file changed, 45 insertions(+), 8 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 01cea01774..fd5949734e 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1639,6 +1639,28 @@ out:
>>       return ret;
>>   }
>>   
>> +static inline void populate_range(RAMBlock *block, hwaddr offset, hwaddr size)
>> +{
>> +    char *ptr = (char *) block->host;
>> +
>> +    for (; offset < size; offset += qemu_real_host_page_size) {
>> +        char tmp = *(ptr + offset);
>> +
>> +        /* Don't optimize the read out */
>> +        asm volatile("" : "+r" (tmp));
>> +    }
> 
> This template is now used 3 times, a good opportunity to extract it as
> an (inline?) helper.
> 

Can you point me at the other users?

Isn't populate_range() the inline helper you are looking for? :)

-- 
Thanks,

David / dhildenb


