Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517B58E77A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 08:58:39 +0200 (CEST)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLffp-00057k-QO
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 02:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oLfcj-00035M-Sf
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 02:55:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oLfch-0005Jz-3v
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 02:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660114520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mk5D9gO+zFF/2WOmfpYLFVS84Gq3MUTiR/YaYerEDCw=;
 b=iBiwU1kJ5ZUfefRjOCqJ2BsSrz7keIpoW+KFYjck4BYrLRkPxJZl57PwTa4+8hCCpog4y2
 cNoarnIGFnN2UTybuPd09EA0BaAsi+Zk8VsyG1D8sDL/T2JLiuBFMnG8Vh9SI9U405q64X
 CV42hlIGG8ADKs1nwkm2alZzL/8PFig=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-U7o3JlNfMyKyOW9QK9DFqA-1; Wed, 10 Aug 2022 02:55:19 -0400
X-MC-Unique: U7o3JlNfMyKyOW9QK9DFqA-1
Received: by mail-ed1-f69.google.com with SMTP id
 r12-20020a05640251cc00b00440647ec649so6305486edd.21
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 23:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Mk5D9gO+zFF/2WOmfpYLFVS84Gq3MUTiR/YaYerEDCw=;
 b=q4KLUm44PqLhzJ3/aQ8KqahiYEe9CpBxx6ImwvMQ+FrSDNqSKDzYRrzIsujxLSItpr
 hGUe6CYs97HUrifO1DCb68cSrgtpDolTaOu8HniWQzDOENbfmsn8KhcGNQ9Rh2VP12PH
 t77CqbzcvXnGXIDJCTqIbXdSuquzIrQ4VFNwN7oTUsShQ+vzkcF52ViwAS9hwVaTp6KR
 DEY4IRglfyZSNXygwAhYkDakYlkASjEhVy1RSl3YMQwGtFTTJWDt41wegFe3iEmVWRhc
 IC/xXTw5wCLo4lBQPL4m2q2n4kf4nmGmjwV38aELBHC8U/awMcCIXWcHeY3/q/7eJmfp
 L7xQ==
X-Gm-Message-State: ACgBeo1d7hyxLHzhzIlOAjl3PVW5QhejHf8xuRHW6zjHZY2ZSBiyQFaQ
 DALuBlN9E7kTEm3U6cNNxnalOP5txXKqLv+jfz2YSOI63WwBIy96xf7tuvG156coXfAnwwL7OtX
 ox35DORihly4yl20=
X-Received: by 2002:a05:6402:a47:b0:43d:17a0:fdc9 with SMTP id
 bt7-20020a0564020a4700b0043d17a0fdc9mr25147634edb.41.1660114518057; 
 Tue, 09 Aug 2022 23:55:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7uPVC86Akm9PMzEowTBJ5orB5ofP+tzr8zOOmMRYus6LzZRexaLFMaGx6MtE33fPCnUnHGMw==
X-Received: by 2002:a05:6402:a47:b0:43d:17a0:fdc9 with SMTP id
 bt7-20020a0564020a4700b0043d17a0fdc9mr25147605edb.41.1660114517836; 
 Tue, 09 Aug 2022 23:55:17 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 fs33-20020a170907602100b00730a1c73288sm1947853ejc.49.2022.08.09.23.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 23:55:17 -0700 (PDT)
Message-ID: <bafece2b-4121-a051-1b77-9ec26f57d853@redhat.com>
Date: Wed, 10 Aug 2022 08:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RFC 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Kanda <mark.kanda@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20220721120732.118133-1-david@redhat.com>
 <f8ab5723-07ba-f418-3011-e7850324adc1@oracle.com>
 <31107841-f033-5e40-2333-9c258a631027@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <31107841-f033-5e40-2333-9c258a631027@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 8/9/22 20:06, David Hildenbrand wrote:
> On 09.08.22 12:56, Joao Martins wrote:
>> On 7/21/22 13:07, David Hildenbrand wrote:
>>> This is a follow-up on "util: NUMA aware memory preallocation" [1] by
>>> Michal.
>>>
>>> Setting the CPU affinity of threads from inside QEMU usually isn't
>>> easily possible, because we don't want QEMU -- once started and running
>>> guest code -- to be able to mess up the system. QEMU disallows relevant
>>> syscalls using seccomp, such that any such invocation will fail.
>>>
>>> Especially for memory preallocation in memory backends, the CPU affinity
>>> can significantly increase guest startup time, for example, when running
>>> large VMs backed by huge/gigantic pages, because of NUMA effects. For
>>> NUMA-aware preallocation, we have to set the CPU affinity, however:
>>>
>>> (1) Once preallocation threads are created during preallocation, management
>>>     tools cannot intercept anymore to change the affinity. These threads
>>>     are created automatically on demand.
>>> (2) QEMU cannot easily set the CPU affinity itself.
>>> (3) The CPU affinity derived from the NUMA bindings of the memory backend
>>>     might not necessarily be exactly the CPUs we actually want to use
>>>     (e.g., CPU-less NUMA nodes, CPUs that are pinned/used for other VMs).
>>>
>>> There is an easy "workaround". If we have a thread with the right CPU
>>> affinity, we can simply create new threads on demand via that prepared
>>> context. So, all we have to do is setup and create such a context ahead
>>> of time, to then configure preallocation to create new threads via that
>>> environment.
>>>
>>> So, let's introduce a user-creatable "thread-context" object that
>>> essentially consists of a context thread used to create new threads.
>>> QEMU can either try setting the CPU affinity itself ("cpu-affinity",
>>> "node-affinity" property), or upper layers can extract the thread id
>>> ("thread-id" property) to configure it externally.
>>>
>>> Make memory-backends consume a thread-context object
>>> (via the "prealloc-context" property) and use it when preallocating to
>>> create new threads with the desired CPU affinity. Further, to make it
>>> easier to use, allow creation of "thread-context" objects, including
>>> setting the CPU affinity directly from QEMU, *before* enabling the
>>> sandbox option.
>>>
>>>
>>> Quick test on a system with 2 NUMA nodes:
>>>
>>> Without CPU affinity:
>>>     time qemu-system-x86_64 \
>>>         -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind \
>>>         -nographic -monitor stdio
>>>
>>>     real    0m5.383s
>>>     real    0m3.499s
>>>     real    0m5.129s
>>>     real    0m4.232s
>>>     real    0m5.220s
>>>     real    0m4.288s
>>>     real    0m3.582s
>>>     real    0m4.305s
>>>     real    0m5.421s
>>>     real    0m4.502s
>>>
>>>     -> It heavily depends on the scheduler CPU selection
>>>
>>> With CPU affinity:
>>>     time qemu-system-x86_64 \
>>>         -object thread-context,id=tc1,node-affinity=0 \
>>>         -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind,prealloc-context=tc1 \
>>>         -sandbox enable=on,resourcecontrol=deny \
>>>         -nographic -monitor stdio
>>>
>>>     real    0m1.959s
>>>     real    0m1.942s
>>>     real    0m1.943s
>>>     real    0m1.941s
>>>     real    0m1.948s
>>>     real    0m1.964s
>>>     real    0m1.949s
>>>     real    0m1.948s
>>>     real    0m1.941s
>>>     real    0m1.937s
>>>
>>> On reasonably large VMs, the speedup can be quite significant.
>>>
>> Really awesome work!
> 
> Thanks!
> 
>>
>> I am not sure I picked up this well while reading the series, but it seems to me that
>> prealloc is still serialized on per memory-backend when solely configured by command-line
>> right?
> 
> I think it's serialized in any case, even when preallocation is
> triggered manually using prealloc=on. I might be wrong, but any kind of
> object creation or property changes should be serialized by the BQL.
> 
> In theory, we can "easily" preallocate in our helper --
> qemu_prealloc_mem() -- concurrently when we don't have to bother about
> handling SIGBUS -- that is, when the kernel supports
> MADV_POPULATE_WRITE. Without MADV_POPULATE_WRITE on older kernels, we'll
> serialize in there as well.
> 
>>
>> Meaning when we start prealloc we wait until the memory-backend thread-context action is
>> completed (per-memory-backend) even if other to-be-configured memory-backends will use a
>> thread-context on a separate set of pinned CPUs on another node ... and wouldn't in theory
>> "need" to wait until the former prealloc finishes?
> 
> Yes. This series only takes care of NUMA-aware preallocation, but
> doesn't preallocate multiple memory backends in parallel.
> 
> In theory, it would be quite easy to preallocate concurrently: simply
> create the memory backend objects passed on the QEMU cmdline
> concurrently from multiple threads.
> 
> In practice, we have to be careful I think with the BQL. But it doesn't
> sound horribly complicated to achieve that. We can perform all
> synchronized under the BQL and only trigger actual expensive
> preallocation (-> qemu_prealloc_mem()) , which we know is MT-safe, with
> released BQL.
> 
>>
>> Unless as you alluded in one of the last patches: we can pass these thread-contexts with
>> prealloc=off (and prealloc-context=NNN) while qemu is paused (-S) and have different QMP
>> clients set prealloc=on, and thus prealloc would happen concurrently per node?
> 
> I think we will serialize in any case when modifying properties. Can you
> give it a shot and see if it would work as of now? I doubt it, but I
> might be wrong.

Disclaimer, I don't know QEMU internals that much so I might be wrong,
but even if libvirt went with -preconfig, wouldn't the monitor be stuck
for every 'set prealloc=on' call? I mean, in the end, the same set of
functions is called (e.g. touch_all_pages()) as if the configuration was
provided via cmd line. So I don't see why there should be any difference
between cmd line and -preconfig.



<offtopic>
In near future, as the number of cmd line arguments that libvirt
generates grows, libvirt might need to switch to -preconfig. Or, if it
needs to query some values first and generate configuration based on
that. But for now, there are no plans.
</offtopic>

Michal


