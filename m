Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299486045A4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 14:45:10 +0200 (CEST)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8RY-00020h-Gq
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 08:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ol8JP-0004HU-I8
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:36:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ol8JN-0007Yj-B1
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666182997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2Ey8ip9wNoWRULHX26NbUFGWzNlkRScTnCWK+S4h7A=;
 b=fIYJkfMNxLJUfeCXO3tQ6XZZaoJ6mYIVR69UfZBGluIo9Ex1sTMbBCsCFx5QhU7Rm3VXyi
 2FGHTK8lhUSlCB/nfLVkYb0tkS7tempujRgrBfmd5Xe1RBwluGhZyaLgTQ++MkIJ5vlu27
 9vGHHdb8k5CV9Yg87a2ZSohKS8RJZOY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-cwh2CkviMViOV5EKKldNWw-1; Wed, 19 Oct 2022 08:36:36 -0400
X-MC-Unique: cwh2CkviMViOV5EKKldNWw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so588716wmb.0
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 05:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t2Ey8ip9wNoWRULHX26NbUFGWzNlkRScTnCWK+S4h7A=;
 b=HZYNRS87z3YjqWTw6zPhcXlxEz75hmsfEQPk6cXsfvxXHmeZu0qDTqt08F63QcmP3I
 9b7R82dqSsZVDIbVEovyt8rZnjgAoiCMGYZw3JDwCf/vtMLptomVZ4MxC0eKLSbhRFOp
 UrAgggR7pAZkdngkYFwNEFA0BPDhZI68wniHfGZHJcjpzSjb7S/9mNq24jnv/1jdzmhU
 tKWI1lMEylGCtC4On1eHvLfzm/5gqk1yBtxrRhGlI7M4PMSM+4LGw+v0qXslDwcO1tad
 D6pyKiS/khb0DlxslOY1ubM/rvU1RsKxqROSgHRabVdeAUzd7eTLJW0owwPsnywZn2HY
 NwJg==
X-Gm-Message-State: ACrzQf3O3KjnrwOaAtUW/2mWCER9RlsNCe40yEMdogJEotzANDcbhU+1
 46FTcNBJC46IblldENRoKjJS4GAM9O2SbPxWgP54H5kvhpABD0KVQaJ+uGey+CG2ebK0qg8m4vJ
 Mc6rRWBQhjtui9uOqctMCInWqLtR0E7lmSZcmTigoxjB9g8IpTKIddB84R5AlZZ0=
X-Received: by 2002:a05:6000:144b:b0:22f:2b48:e23 with SMTP id
 v11-20020a056000144b00b0022f2b480e23mr4933620wrx.281.1666182995463; 
 Wed, 19 Oct 2022 05:36:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6g8BApbt/aZyv7IRxJeOjyhVI85+TLauuIVT9/HVYdyW+Uk1gdqdlLfj/IWJiHFzHeEZEZlw==
X-Received: by 2002:a05:6000:144b:b0:22f:2b48:e23 with SMTP id
 v11-20020a056000144b00b0022f2b480e23mr4933588wrx.281.1666182995081; 
 Wed, 19 Oct 2022 05:36:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:2c00:d4ac:d2c:4aee:dac1?
 (p200300cbc7072c00d4ac0d2c4aeedac1.dip0.t-ipconnect.de.
 [2003:cb:c707:2c00:d4ac:d2c:4aee:dac1])
 by smtp.gmail.com with ESMTPSA id
 bv16-20020a0560001f1000b0022e6f0d0d7csm16223245wrb.18.2022.10.19.05.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 05:36:34 -0700 (PDT)
Message-ID: <85d09f43-127b-0111-177e-38baf8c54c73@redhat.com>
Date: Wed, 19 Oct 2022 14:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20221014134720.168738-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221014134720.168738-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 14.10.22 15:47, David Hildenbrand wrote:
> This is a follow-up on "util: NUMA aware memory preallocation" [1] by
> Michal.
> 
> Setting the CPU affinity of threads from inside QEMU usually isn't
> easily possible, because we don't want QEMU -- once started and running
> guest code -- to be able to mess up the system. QEMU disallows relevant
> syscalls using seccomp, such that any such invocation will fail.
> 
> Especially for memory preallocation in memory backends, the CPU affinity
> can significantly increase guest startup time, for example, when running
> large VMs backed by huge/gigantic pages, because of NUMA effects. For
> NUMA-aware preallocation, we have to set the CPU affinity, however:
> 
> (1) Once preallocation threads are created during preallocation, management
>      tools cannot intercept anymore to change the affinity. These threads
>      are created automatically on demand.
> (2) QEMU cannot easily set the CPU affinity itself.
> (3) The CPU affinity derived from the NUMA bindings of the memory backend
>      might not necessarily be exactly the CPUs we actually want to use
>      (e.g., CPU-less NUMA nodes, CPUs that are pinned/used for other VMs).
> 
> There is an easy "workaround". If we have a thread with the right CPU
> affinity, we can simply create new threads on demand via that prepared
> context. So, all we have to do is setup and create such a context ahead
> of time, to then configure preallocation to create new threads via that
> environment.
> 
> So, let's introduce a user-creatable "thread-context" object that
> essentially consists of a context thread used to create new threads.
> QEMU can either try setting the CPU affinity itself ("cpu-affinity",
> "node-affinity" property), or upper layers can extract the thread id
> ("thread-id" property) to configure it externally.
> 
> Make memory-backends consume a thread-context object
> (via the "prealloc-context" property) and use it when preallocating to
> create new threads with the desired CPU affinity. Further, to make it
> easier to use, allow creation of "thread-context" objects, including
> setting the CPU affinity directly from QEMU, before enabling the
> sandbox option.
> 
> 
> Quick test on a system with 2 NUMA nodes:
> 
> Without CPU affinity:
>      time qemu-system-x86_64 \
>          -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind \
>          -nographic -monitor stdio
> 
>      real    0m5.383s
>      real    0m3.499s
>      real    0m5.129s
>      real    0m4.232s
>      real    0m5.220s
>      real    0m4.288s
>      real    0m3.582s
>      real    0m4.305s
>      real    0m5.421s
>      real    0m4.502s
> 
>      -> It heavily depends on the scheduler CPU selection
> 
> With CPU affinity:
>      time qemu-system-x86_64 \
>          -object thread-context,id=tc1,node-affinity=0 \
>          -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind,prealloc-context=tc1 \
>          -sandbox enable=on,resourcecontrol=deny \
>          -nographic -monitor stdio
> 
>      real    0m1.959s
>      real    0m1.942s
>      real    0m1.943s
>      real    0m1.941s
>      real    0m1.948s
>      real    0m1.964s
>      real    0m1.949s
>      real    0m1.948s
>      real    0m1.941s
>      real    0m1.937s
> 
> On reasonably large VMs, the speedup can be quite significant.
> 
> While this concept is currently only used for short-lived preallocation
> threads, nothing major speaks against reusing the concept for other
> threads that are harder to identify/configure -- except that
> we need additional (idle) context threads that are otherwise left unused.
> 
> This series does not yet tackle concurrent preallocation of memory
> backends. Memory backend objects are created and memory is preallocated one
> memory backend at a time -- and there is currently no way to do
> preallocation asynchronously.
> 
> [1] https://lkml.kernel.org/r/ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com
> 


I'm happy for more feedback and will wait some more. But if there is 
none, I'll most probably merge this myself by the end of next week.

Cheers!

-- 
Thanks,

David / dhildenb


