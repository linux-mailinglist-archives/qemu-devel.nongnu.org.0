Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36015A2909
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:05:28 +0200 (CEST)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZxf-0008IA-GK
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZm3-0006wN-Fb
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZlt-0000ge-3v
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661521995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLq1XXsmS6w4iNG3UsahysBIpHCw6tAbQbv9UDMh8EI=;
 b=KexysNARv8y9+65U1ogpObtDaZCAJRCG2hSbgOQE67EqoaUP80Gg9JQ9Acrj0owXAIKGe0
 6aisRaAMMBbKtoHqt5NwqgaQcaV5yFsi22TI44zUfXSSEZXcs8hjVZ4qdlkSo6IKlZwkqv
 cntVlJjjEC2A0Z4m7XRJYiaC3HE0fIU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-_lvnG-d3OvagkF_aj9J-Xg-1; Fri, 26 Aug 2022 09:53:14 -0400
X-MC-Unique: _lvnG-d3OvagkF_aj9J-Xg-1
Received: by mail-qv1-f70.google.com with SMTP id
 f11-20020a056214164b00b00496a9423091so1002291qvw.14
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 06:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kLq1XXsmS6w4iNG3UsahysBIpHCw6tAbQbv9UDMh8EI=;
 b=tOnWFyxueglNO4+3XfLyCT+4992uZqJe+mHKoF+eyr/3LcgPIkZiAMeDdmjMXKiHFx
 eB6WB3n3jiNPD/KwGQJMM53/KPkrFmhndyXcmHCUlaFWayxYMpkewEgQU7rvtJCyHlWw
 C0z+D1R+dVXXV+fBpvjPh+7ofh/VefNYrYR2+Wcp2NkiySBRSHRtUZ141G0XvOqDBo7Z
 WSDSPL7nPaVJyVaR1U5kkQ1AbtwFms24o9xDRkOPZj1AZa65eVQJ9aiCUNgADfDBHhHF
 RAcTAqZJpBkbEpv6cSD7cZDYMsL0kdBFiiHvqV6w0DVpaJrTtREbmDT/ZSewQe+mit2X
 1eOw==
X-Gm-Message-State: ACgBeo23j/FyuOMLNaalOr+dyKMtmcjxta6uwYQlOBKxgEanRSgnur8R
 ngg8CftrhRZLLvhzuHXj4pOE7NObGs4bNt9Y4fzQD0jv5mWAI5nq969MAE/ijUZ2jK0oBHzUTkL
 UH9QvQN2Sf1MnylY=
X-Received: by 2002:a0c:9c87:0:b0:479:606d:670e with SMTP id
 i7-20020a0c9c87000000b00479606d670emr8149128qvf.127.1661521994326; 
 Fri, 26 Aug 2022 06:53:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5mIHJ5DY9bd9E9EydQNVN1qd9+4yK82F8LkucHhh+OG6m5uIoTWomyMHurDR+btja+mpR1/Q==
X-Received: by 2002:a0c:9c87:0:b0:479:606d:670e with SMTP id
 i7-20020a0c9c87000000b00479606d670emr8149111qvf.127.1661521994148; 
 Fri, 26 Aug 2022 06:53:14 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05620a0f1500b006bbdcb3fff7sm1836496qkl.69.2022.08.26.06.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 06:53:13 -0700 (PDT)
Message-ID: <e5935ba7-dd60-b914-3b1d-fff4f8c01da3@redhat.com>
Date: Fri, 26 Aug 2022 15:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 1/2] softmmu/memory: add missing begin/commit callback
 calls
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-2-eesposit@redhat.com> <Yv6UVMMX/hHFkGoM@xz-m1.local>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yv6UVMMX/hHFkGoM@xz-m1.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 18/08/2022 um 21:34 schrieb Peter Xu:
> On Tue, Aug 16, 2022 at 06:12:49AM -0400, Emanuele Giuseppe Esposito wrote:
>> kvm listeners now need ->commit callback in order to actually send
>> the ioctl to the hypervisor. Therefore, add missing callers around
>> address_space_set_flatview(), which in turn calls
>> address_space_update_topology_pass() which calls ->region_* and
>> ->log_* callbacks.
>>
>> Using MEMORY_LISTENER_CALL_GLOBAL is a little bit an overkill,
>> but it is harmless, considering that other listeners that are not
>> invoked in address_space_update_topology_pass() won't do anything,
>> since they won't have anything to commit.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  softmmu/memory.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 7ba2048836..1afd3f9703 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1076,7 +1076,9 @@ static void address_space_update_topology(AddressSpace *as)
>>      if (!g_hash_table_lookup(flat_views, physmr)) {
>>          generate_memory_topology(physmr);
>>      }
>> +    MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
>>      address_space_set_flatview(as);
>> +    MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
> 
> Should the pair be with MEMORY_LISTENER_CALL() rather than the global
> version?  Since it's only updating one address space.

Ideally yes, we want to call the memory listener only for this address
space. Practically I don't know how to do it, as MEMORY_LISTENER_CALL 1)
takes additional parameters like memory region section, and 2) calls
_listener->_callback(_listener, _section, ##_args)
whereas begin and commit need (_listener, ##args) only, which is what
MEMORY_LISTENER_CALL_GLOBAL does.

> 
> Besides the perf implication (walking per-as list should be faster than
> walking global memory listener list?), I think it feels broken too since
> we'll call begin() then commit() (with no region_add()/region_del()/..) for
> all the listeners that are not registered against this AS.  IIUC it will
> empty all regions with those listeners?

What do you mean "will empty all regions with those listeners"?
But yes theoretically vhost-vdpa and physmem have commit callbacks that
are independent from whether region_add or other callbacks have been called.
For kvm and probably vhost it would be no problem, since there won't be
any list to iterate on.

I'll implement a new macro to handle this.

Emanuele
> 
> Thanks,
> 


