Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A51A523A85
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 18:42:50 +0200 (CEST)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nopQE-0004tn-VE
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 12:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nopOt-00047r-Hf
 for qemu-devel@nongnu.org; Wed, 11 May 2022 12:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nopOq-0002UI-PU
 for qemu-devel@nongnu.org; Wed, 11 May 2022 12:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652287279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2tDqoUME8qW5+FOu9wSbSBJBIazpY3CHHVNdv7wWHA=;
 b=BlROfPqq8bMzJRj/09OkxSxQLR3C9LdIbTGySgIySa2IthNvmqwBge3cpWDobCNkKQLxT/
 /jlJ8TvYDSq43fcv0DmLqybP4Y83toX0bkX5RakHrHe9zydC0xThBH6PpD4MrSPQFhNq8S
 dQcDzd/HlkXcgVwmr8jIr1/ARwrk07s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-e4g1-JscNXSHfpj_PhQiYA-1; Wed, 11 May 2022 12:41:18 -0400
X-MC-Unique: e4g1-JscNXSHfpj_PhQiYA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m124-20020a1c2682000000b00393fcd2722dso880021wmm.4
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 09:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q2tDqoUME8qW5+FOu9wSbSBJBIazpY3CHHVNdv7wWHA=;
 b=d6TKhwFnhuccJ1U+OF17r39FqZTBTxw34ZvfzYPPbgX95TruRAdy+zw4cYIc1clwIc
 /7dIwszYSd+23q2Y33k37Wo7aH/Got3aMrIWb3XUVjPSUh9KPfAxn/VwQsClipioMRAD
 Rjfbh28/p+dQEVZ0kkRkXwLtNJlSUOuKBsZg6yj3d6UPNXC32y5fmJYl611YwhPaF/8N
 Z8g0UuRCADpqFPfO+yaQ+5kPm71FWvuI6VI5SFWdj5seDbot2OgKO65VUq91a+OebjY/
 KvnTn8py4GX+PPZb67KldawGKrFHLLkNjf20Hy2P7xrUmzCRcTZhFTtlwkxXf7W8sUfo
 fyUQ==
X-Gm-Message-State: AOAM5308dQDdcxAT+k75NM/pRDMwEGTNc1i3r9SOEzFf5ji7CKPPMJcY
 T4qCG1R0O2ECYk29rcOZqHZxaB2qBjvNF82RVVerK6UVHCh5LnO2bIH9Blm3KbHhZ0dHNkOxLOW
 2pmAPGBOU24K5Jlc=
X-Received: by 2002:a05:6000:1acc:b0:20c:67ff:e8b7 with SMTP id
 i12-20020a0560001acc00b0020c67ffe8b7mr23769394wry.646.1652287276965; 
 Wed, 11 May 2022 09:41:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9EUXhR5hRQF3DJoXT2fdvSGpCVta6rnbnGEQhnTb3xi/HbBcxTmnc+GtZPkNYiQDScYCnlw==
X-Received: by 2002:a05:6000:1acc:b0:20c:67ff:e8b7 with SMTP id
 i12-20020a0560001acc00b0020c67ffe8b7mr23769376wry.646.1652287276587; 
 Wed, 11 May 2022 09:41:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:700:2393:b0f4:ef08:bd51?
 (p200300cbc70107002393b0f4ef08bd51.dip0.t-ipconnect.de.
 [2003:cb:c701:700:2393:b0f4:ef08:bd51])
 by smtp.gmail.com with ESMTPSA id
 x6-20020adff646000000b0020cd2e8d3b1sm2145506wrp.5.2022.05.11.09.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 09:41:16 -0700 (PDT)
Message-ID: <1abc1955-4b41-6d2e-ca36-dc9dbeb34cdc@redhat.com>
Date: Wed, 11 May 2022 18:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <YnoshVqLNjGFpfEl@redhat.com>
 <c8d84b1f-2a64-fdb4-35f3-875da0575c4d@redhat.com>
 <YnvRiAfFbDQIjfgY@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YnvRiAfFbDQIjfgY@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 11.05.22 17:08, Daniel P. Berrangé wrote:
> On Wed, May 11, 2022 at 03:16:55PM +0200, Michal Prívozník wrote:
>> On 5/10/22 11:12, Daniel P. Berrangé wrote:
>>> On Tue, May 10, 2022 at 08:55:33AM +0200, Michal Privoznik wrote:
>>>> When allocating large amounts of memory the task is offloaded
>>>> onto threads. These threads then use various techniques to
>>>> allocate the memory fully (madvise(), writing into the memory).
>>>> However, these threads are free to run on any CPU, which becomes
>>>> problematic on NUMA machines because it may happen that a thread
>>>> is running on a distant node.
>>>>
>>>> Ideally, this is something that a management application would
>>>> resolve, but we are not anywhere close to that, Firstly, memory
>>>> allocation happens before monitor socket is even available. But
>>>> okay, that's what -preconfig is for. But then the problem is that
>>>> 'object-add' would not return until all memory is preallocated.
>>>>
>>>> Long story short, management application has no way of learning
>>>> TIDs of allocator threads so it can't make them run NUMA aware.
>>>
>>> So I'm wondering what the impact of this problem is for various
>>> scenarios.
>>
>> The scenario which I tested this with was no <emulatorpin/> but using
>> 'virsh emulatorpin' afterwards to pin emulator thread somewhere. For
>> those which are unfamiliar with libvirt, this is about placing the main
>> qemu TID (with the main eventloop) into a CGroup that restricts on what
>> CPUs it can run.
>>
>>>
>>> The default config for a KVM guest with libvirt is no CPU pinning
>>> at all. The kernel auto-places CPUs and decides on where RAM is to
>>> be allocated. So in this case, whether or not libvirt can talk to
>>> QMP in time to query threads is largely irrelevant, as we don't
>>> want todo placement in any case.
>>>
>>> In theory the kernel should allocate RAM on the node local to
>>> where the process is currently executing. So as long as the
>>> guest RAM fits in available free RAM on the local node, RAM
>>> should be allocated from the node that matches the CPU running
>>> the QEMU main thread.
>>>
>>> The challenge is if we spawn N more threads to do pre-alloc,
>>> these can be spread onto other nodes. I wonder if the kernel
>>> huas any preference for keeping threads within a process on
>>> the same NUMA node ?
>>
>> That's not exactly what I saw. I would have thought too that initially
>> the prealloc thread could be spawned just anywhere but after few
>> iterations the scheduler realized what NUMA node the thread is close to
>> and automatically schedule it to run there. Well, it didn't happen.
> 
> Thinking about it, this does make sense to some extent. When a
> thread is first spawned, how can the kernel know what region of
> memory it is about to start touching ? So at the very least the
> kernel schedular can get it wrong initially. It would need something
> to watch memory acces patterns to determine whether the initial
> decision was right or wrong, and fine tune it later.
> 
> Seems like the kernel typically tries todo the opposite to what
> we thought, and instead of moving CPUs, has ways to move the
> memory instead.
> 
> https://www.kernel.org/doc/html/latest/vm/page_migration.html
> 
>>> Overall, if libvirt is not applying pinning to the QEMU guest,
>>> then we're 100% reliant on the kernel todo something sensible,
>>> both for normal QEMU execution and for prealloc. Since we're
>>> not doing placement of QEMU RAM or CPUs, the logic in this
>>> patch won't do anything either.
>>>
>>>
>>> If the guest has more RAM than can fit on the local NUMA node,
>>> then we're doomed no matter what, even ignoring prealloc, there
>>> will be cross-node traffic. This scenario requires the admin to
>>> setup proper CPU /memory pinning for QEMU in libvirt.
>>>
>>> If libvirt is doing CPU pinning (as instructed by the mgmt app
>>> above us), then when we first start QEMU, the process thread
>>> leader will get given affinity by libvirt prior to exec. This
>>> affinity will be the union of affinity for all CPUs that will
>>> be later configured.
>>>
>>> The typical case for CPU pinning, is that everything fits in
>>> one NUMA node, and so in this case, we don't need todo anything
>>> more. The prealloc threads will already be constrained to the
>>> right place by the affinity of the QEMU thread leader, so the
>>> logic in this patch will run, but it won't do anything that
>>> was not already done.
>>>
>>> So we're left with the hardest case, where the guest is explicitly
>>> spread across multiple NUMA nodes. In this case the thread leader
>>> affinity will span many NUMA nodes, and so the prealloc threads
>>> will freely be placed across any CPU that is in the union of CPUs
>>> the guest is placed on. Just as with thue non-pinned case, the
>>> prealloc will be at the mercy of the kernel making sensible
>>> placement decisions.
>>
>> Indeed, but it's at least somewhat restricted. NB, in real scenario
>> users will map guest NUMA nodes onto host ones with 1:1 relationship.
>> And each guest NUMA node will have its own memdev=, i.e. its own set of
>> threads, so in the end, prealloc threads won't jump between host NUMA
>> nodes but stay local to the node they are allocating memory on.
> 
> Thinking about this from a completely different QEMU angle.
> 
> Right now the preallocation happens when we create the memory
> device, and takes place in threads spawned from the main
> QEMU thread.
> 
> We are doing memory placement in order that specific blocks of
> virtual RAM are co-located with specific virtual CPUs. IOW we
> know we already have some threads that will match locality of
> the RAM we have.
> 
> We are doing memory pre-allocation to give predictable
> performance once the VM starts, and to have a guarantee
> that the memory is actually available  for use.
> 
> We don't actually need the memory pre-allocation to take
> place so early in object creation, as we have it right now.
> It just needs to be done before VM creation is done and
> vCPUs start guest code.
> 
> 
> From the POV of controlling QEMU VM resource usage, we don't
> really want memory pre-allocation to consume more host CPUs
> than we've assigned to the VM for its vCPUs.
> 
> So what if instead of creating throwaway threads for memory
> allocation early, we ran the preallocation in the vCPU
> threads before they start executing guest code ? This is
> still early enough to achieve our goals for preallocation.
> 
> These vCPU threads already have the right affinity setup. This
> ensures that the CPU burn for preallocation doesn't exceed
> what we've allowed for guest CPU usage in general, so resource
> limits will be naturally enforced.
> 
> Is this kind of approach possible ?

That sounds quite hackish. IMHO, we should make sure that any approach
we introduce is able to cope with both, coldplugged and hotplugged
memory backends.

I agree with Paolos comment that libvirt is trying to micromanage QEMU
here, which is the root of the issue IMHO.

For applicable VMs (!realtime?), Libvirt could simply allow QEMU to set
the affinity in case there cannot really be harm done. Not sure what
other interfaces the kernel could provide to allow Libvirt to restrict
the affinity to only some subset of nodes/cpus, so QEMU's harm could be
limited to that subset.

-- 
Thanks,

David / dhildenb


