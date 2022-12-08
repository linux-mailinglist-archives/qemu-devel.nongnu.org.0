Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2836471F7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:40:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3I3a-0001gm-8Z; Thu, 08 Dec 2022 09:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p3I3W-0001gS-IE
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:39:22 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p3I3T-0000Ba-BE
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:39:22 -0500
Received: by mail-pf1-x42c.google.com with SMTP id g1so1455669pfk.2
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 06:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IZmnf3UhySOrTPQ7NgHiDwRmM4FXeEoIrqRbZqEptLE=;
 b=UymIm6kzArUCo4/TPqijoJlEuzQEUB/K0Zqvj+PtpVjgLzQ/DuoO7P6dQeMpygp8Qr
 JCf/yMxOehuN5AZim04UJy6xAc1vIBhcRpBVfVp7YjDaCTk17CF7uZ/wmnMiZVJOxdBc
 0VmGAE+mCzKTLcaVlJ+fbUE/DDerdh6TJiNDv5PHMPmj6R7KSk9OUSWAyjovgUJS46x5
 op+f/yk44yx6kIB1/AX0/DnqKsXWZl4reBtTkV9jnWDD2a4EbO/t5TuGAVfMy3QWixKe
 isWHqVjxlt/cgGe1knDgm9u48v09AIjwVwPUH5/Vw+xom53FxFi/Bd6dt4W93YDCjfr0
 qgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZmnf3UhySOrTPQ7NgHiDwRmM4FXeEoIrqRbZqEptLE=;
 b=oHuBgZfD55/8i1Vc/uy9KePU/2ia8H3VabaeLroSUkcYj4uXZKDC1dY9q59wy373Re
 VvjiwimUU1ZlWZnWh25x3I1G3HTOGMZy1EzhUbB6LtV2Rs2oqSSaXIW/zReU+ifE9HNE
 ZQszJ77bFvtvurr0W4Q1VfugzhWe7D2Wvx1NSaJ7QGYzWw0gp5FWEGRtehkI79D4hJQf
 ws8Ep8hasNHmae6S7r7mWuXq+mocxjOksesaDsws6HdtXWd9Hx+yVMYlybHzKTp597So
 zs/YBZ8E5e/ED1+ITjhiKwO08bJD6B5KwR/meogyQ9UVqoLctWJBCiL1dzxLpc+fmUVS
 oaaQ==
X-Gm-Message-State: ANoB5plledIVR401nBExUWUcuyrRgtoAGGi5dx4eD7X7WeWsqiOAoGDJ
 idJ6NxDV4nWf6mV1bJuHA+S4PQ==
X-Google-Smtp-Source: AA0mqf61aVOr0cwESe/KHy6t+jdXlb4wuEMFtkMSl4u7Wis3SrzWFSY14gRIQ4fYp4z1N4YJOuZ1BA==
X-Received: by 2002:a05:6a00:4391:b0:572:725f:3374 with SMTP id
 bt17-20020a056a00439100b00572725f3374mr2250692pfb.11.1670510357008; 
 Thu, 08 Dec 2022 06:39:17 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a621a17000000b0057630286100sm12984353pfa.164.2022.12.08.06.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 06:39:16 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------X9b6uhpkQ9WfgGVWCZG8xyqt"
Message-ID: <704c1986-e878-8837-a2bb-12f76eeb1ba4@bytedance.com>
Date: Thu, 8 Dec 2022 22:39:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [RFC PATCH] migration: reduce time of loading non-iterable vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
 <Y3+egjXTvLEHDjuT@x1n> <7e5c5d6c-8f23-c0c5-5f5c-5daad854c2e7@bytedance.com>
 <Y4Ty07M/HN9UnsGb@x1n> <1adf426d-a9c8-9015-383b-3e82eb6b7c54@bytedance.com>
 <Y44cNenFueVE4RFW@x1n> <faae03bb-7705-fb16-46a5-e4c2ea55a254@bytedance.com>
 <Y5EO8HqNVj/Rq7M5@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y5EO8HqNVj/Rq7M5@x1n>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=1, HK_RANDOM_FROM=0.999,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.266, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------X9b6uhpkQ9WfgGVWCZG8xyqt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/12/8 上午6:08, Peter Xu wrote:
> On Thu, Dec 08, 2022 at 12:07:03AM +0800, Chuang Xu wrote:
>> On 2022/12/6 上午12:28, Peter Xu wrote:
>>> Chuang,
>>>
>>> No worry on the delay; you're faster than when I read yours. :)
>>>
>>> On Mon, Dec 05, 2022 at 02:56:15PM +0800, Chuang Xu wrote:
>>>>> As a start, maybe you can try with poison address_space_to_flatview() (by
>>>>> e.g. checking the start_pack_mr_change flag and assert it is not set)
>>>>> during this process to see whether any call stack can even try to
>>>>> dereference a flatview.
>>>>>
>>>>> It's just that I didn't figure a good way to "prove" its validity, even if
>>>>> I think this is an interesting idea worth thinking to shrink the downtime.
>>>> Thanks for your sugguestions!
>>>> I used a thread local variable to identify whether the current thread is a
>>>> migration thread(main thread of target qemu) and I modified the code of
>>>> qemu_coroutine_switch to make sure the thread local variable true only in
>>>> process_incoming_migration_co call stack. If the target qemu detects that
>>>> start_pack_mr_change is set and address_space_to_flatview() is called in
>>>> non-migrating threads or non-migrating coroutine, it will crash.
>>> Are you using the thread var just to avoid the assert triggering in the
>>> migration thread when commiting memory changes?
>>>
>>> I think _maybe_ another cleaner way to sanity check this is directly upon
>>> the depth:
>>>
>>> static inline FlatView *address_space_to_flatview(AddressSpace *as)
>>> {
>>>       /*
>>>        * Before using any flatview, sanity check we're not during a memory
>>>        * region transaction or the map can be invalid.  Note that this can
>>>        * also be called during commit phase of memory transaction, but that
>>>        * should also only happen when the depth decreases to 0 first.
>>>        */
>>>       assert(memory_region_transaction_depth == 0);
>>>       return qatomic_rcu_read(&as->current_map);
>>> }
>>>
>>> That should also cover the safe cases of memory transaction commits during
>>> migration.
>>>
>> Peter, I tried this way and found that the target qemu will crash.
>>
>> Here is the gdb backtrace:
>>
>> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:51
>> #1  0x00007ff2929d851a in __GI_abort () at abort.c:118
>> #2  0x00007ff2929cfe67 in __assert_fail_base (fmt=<optimized out>, assertion=assertion@entry=0x55a32578cdc0 "memory_region_transaction_depth == 0", file=file@entry=0x55a32575d9b0 "/data00/migration/qemu-5.2.0/include/exec/memory.h",
>>      line=line@entry=766, function=function@entry=0x55a32578d6e0 <__PRETTY_FUNCTION__.20463> "address_space_to_flatview") at assert.c:92
>> #3  0x00007ff2929cff12 in __GI___assert_fail (assertion=assertion@entry=0x55a32578cdc0 "memory_region_transaction_depth == 0", file=file@entry=0x55a32575d9b0 "/data00/migration/qemu-5.2.0/include/exec/memory.h", line=line@entry=766,
>>      function=function@entry=0x55a32578d6e0 <__PRETTY_FUNCTION__.20463> "address_space_to_flatview") at assert.c:101
>> #4  0x000055a324b2ed5e in address_space_to_flatview (as=0x55a326132580 <address_space_memory>) at /data00/migration/qemu-5.2.0/include/exec/memory.h:766
>> #5  0x000055a324e79559 in address_space_to_flatview (as=0x55a326132580 <address_space_memory>) at ../softmmu/memory.c:811
>> #6  address_space_get_flatview (as=0x55a326132580 <address_space_memory>) at ../softmmu/memory.c:805
>> #7  0x000055a324e96474 in address_space_cache_init (cache=cache@entry=0x55a32a4fb000, as=<optimized out>, addr=addr@entry=68404985856, len=len@entry=4096, is_write=false) at ../softmmu/physmem.c:3307
>> #8  0x000055a324ea9cba in virtio_init_region_cache (vdev=0x55a32985d9a0, n=0) at ../hw/virtio/virtio.c:185
>> #9  0x000055a324eaa615 in virtio_load (vdev=0x55a32985d9a0, f=<optimized out>, version_id=<optimized out>) at ../hw/virtio/virtio.c:3203
>> #10 0x000055a324c6ab96 in vmstate_load_state (f=f@entry=0x55a329dc0c00, vmsd=0x55a325fc1a60 <vmstate_virtio_scsi>, opaque=0x55a32985d9a0, version_id=1) at ../migration/vmstate.c:143
>> #11 0x000055a324cda138 in vmstate_load (f=0x55a329dc0c00, se=0x55a329941c90) at ../migration/savevm.c:913
>> #12 0x000055a324cdda34 in qemu_loadvm_section_start_full (mis=0x55a3284ef9e0, f=0x55a329dc0c00) at ../migration/savevm.c:2741
>> #13 qemu_loadvm_state_main (f=f@entry=0x55a329dc0c00, mis=mis@entry=0x55a3284ef9e0) at ../migration/savevm.c:2939
>> #14 0x000055a324cdf66a in qemu_loadvm_state (f=0x55a329dc0c00) at ../migration/savevm.c:3021
>> #15 0x000055a324d14b4e in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:574
>> #16 0x000055a32501ae3b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:173
>> #17 0x00007ff2929e8000 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
>> #18 0x00007ffed80dc2a0 in ?? ()
>> #19 0x0000000000000000 in ?? ()
>>
>> address_space_cache_init() is the only caller of address_space_to_flatview
>> I can find in vmstate_load call stack so far. Although I think the mr used
>> by address_space_cache_init() won't be affected by the delay of
>> memory_region_transaction_commit(), we really need a mechanism to prevent
>> the modified mr from being used.
>>
>> Maybe we can build a stale list:
>> If a subregion is added, add its parent to the stale list(considering that
>> new subregion's priority has uncertain effects on flatviews).
>> If a subregion is deleted, add itself to the stale list.
>> When memory_region_transaction_commit() regenerates flatviews, clear the
>> stale list.
>> when address_space_translate_internal() is called, check whether the mr
>> looked up matches one of mrs（or its child）in the stale list. If yes, a
>> crash will be triggered.
> I'm not sure that'll work, though.  Consider this graph:
>
>                              A
>                             / \
>                            B   C
>                         (p=1) (p=0)
>
> A,B,C are MRs, B&C are subregions to A.  When B's priority is higher (p=1),
> any access to A will go upon B, so far so good.
>
> Then, let's assume D comes under C with even higher priority:
>
>                              A
>                             / \
>                            B   C
>                         (p=1) (p=0)
>                                |
>                                D
>                               (p=2)
>
>
> Adding C into stale list won't work because when with the old flatview
> it'll point to B instead, while B is not in the stale list. The AS
> operation will carry out without noticing it's already wrong.

Peter, I think our understanding of priority is different.

In the qemu docs
(https://qemu.readthedocs.io/en/stable-6.1/devel/memory.html#overlapping-regions-and-priority),
it says 'Priority values are local to a container, because the priorities of
two regions are only compared when they are both children of the same container.'
  
And as I read in code, when doing render_memory_region() operation on A, qemu
will firstly insert B's FlatRanges and its children's FlatRanges recursively
because B's priority is higher than C. After B's FlatRanges and its children's
FlatRanges are all inserted into flatviews, C's FlatRanges and its children's
FlatRanges will be inserted into gaps left by B if B and C overlaps.

So I think adding D as C's subregion has no effect on B in your second case.
The old FlatRange pointing to B is still effective. C and C'children with lower
priority than D will be affected, but we have flagged them as stale.

I hope I have no misunderstanding of the flatview's construction code. If I
understand wrong, please forgive my ignorance..😭

>
>> There may be many details to consider in this mechanism. Hope you can give
>> some suggestions on its feasibility.
> For this specific case, I'm wildly thinking whether we can just postpone
> the init of the vring cache until migration completes.
>
> One thing to mention from what I read it: we'll need to update all the
> caches in virtio_memory_listener_commit() anyway, when the batched commit()
> happens when migration completes with your approach, so we'll rebuild the
> vring cache once and for all which looks also nice if possible.
>
> There's some details to consider. E.g. the commit() happens only when
> memory_region_update_pending==true.  We may want to make sure the cache is
> initialized unconditionally, at least.  Not sure whether that's doable,
> though.
>
> Thanks,
>
Good idea! We can try it in the new patches! And with the delay of
virtio_init_region_cache(), we can still use assert in address_space_to_flatview().
However, I think the stale list can be used as a retention scheme for further
discussion in the future, because the stale list may adapt to more complex scenarios.

Thanks.

--------------X9b6uhpkQ9WfgGVWCZG8xyqt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/12/8 上午6:08, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y5EO8HqNVj%2FRq7M5@x1n">
      <pre class="moz-quote-pre" wrap="">On Thu, Dec 08, 2022 at 12:07:03AM +0800, Chuang Xu wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 2022/12/6 上午12:28, Peter Xu wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Chuang,

No worry on the delay; you're faster than when I read yours. :)

On Mon, Dec 05, 2022 at 02:56:15PM +0800, Chuang Xu wrote:
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">As a start, maybe you can try with poison address_space_to_flatview() (by
e.g. checking the start_pack_mr_change flag and assert it is not set)
during this process to see whether any call stack can even try to
dereference a flatview.

It's just that I didn't figure a good way to "prove" its validity, even if
I think this is an interesting idea worth thinking to shrink the downtime.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Thanks for your sugguestions!
I used a thread local variable to identify whether the current thread is a
migration thread(main thread of target qemu) and I modified the code of
qemu_coroutine_switch to make sure the thread local variable true only in
process_incoming_migration_co call stack. If the target qemu detects that
start_pack_mr_change is set and address_space_to_flatview() is called in
non-migrating threads or non-migrating coroutine, it will crash.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Are you using the thread var just to avoid the assert triggering in the
migration thread when commiting memory changes?

I think _maybe_ another cleaner way to sanity check this is directly upon
the depth:

static inline FlatView *address_space_to_flatview(AddressSpace *as)
{
     /*
      * Before using any flatview, sanity check we're not during a memory
      * region transaction or the map can be invalid.  Note that this can
      * also be called during commit phase of memory transaction, but that
      * should also only happen when the depth decreases to 0 first.
      */
     assert(memory_region_transaction_depth == 0);
     return qatomic_rcu_read(&amp;as-&gt;current_map);
}

That should also cover the safe cases of memory transaction commits during
migration.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Peter, I tried this way and found that the target qemu will crash.

Here is the gdb backtrace:

#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:51
#1  0x00007ff2929d851a in __GI_abort () at abort.c:118
#2  0x00007ff2929cfe67 in __assert_fail_base (fmt=&lt;optimized out&gt;, assertion=assertion@entry=0x55a32578cdc0 "memory_region_transaction_depth == 0", file=file@entry=0x55a32575d9b0 "/data00/migration/qemu-5.2.0/include/exec/memory.h",
    line=line@entry=766, function=function@entry=0x55a32578d6e0 &lt;__PRETTY_FUNCTION__.20463&gt; "address_space_to_flatview") at assert.c:92
#3  0x00007ff2929cff12 in __GI___assert_fail (assertion=assertion@entry=0x55a32578cdc0 "memory_region_transaction_depth == 0", file=file@entry=0x55a32575d9b0 "/data00/migration/qemu-5.2.0/include/exec/memory.h", line=line@entry=766,
    function=function@entry=0x55a32578d6e0 &lt;__PRETTY_FUNCTION__.20463&gt; "address_space_to_flatview") at assert.c:101
#4  0x000055a324b2ed5e in address_space_to_flatview (as=0x55a326132580 &lt;address_space_memory&gt;) at /data00/migration/qemu-5.2.0/include/exec/memory.h:766
#5  0x000055a324e79559 in address_space_to_flatview (as=0x55a326132580 &lt;address_space_memory&gt;) at ../softmmu/memory.c:811
#6  address_space_get_flatview (as=0x55a326132580 &lt;address_space_memory&gt;) at ../softmmu/memory.c:805
#7  0x000055a324e96474 in address_space_cache_init (cache=cache@entry=0x55a32a4fb000, as=&lt;optimized out&gt;, addr=addr@entry=68404985856, len=len@entry=4096, is_write=false) at ../softmmu/physmem.c:3307
#8  0x000055a324ea9cba in virtio_init_region_cache (vdev=0x55a32985d9a0, n=0) at ../hw/virtio/virtio.c:185
#9  0x000055a324eaa615 in virtio_load (vdev=0x55a32985d9a0, f=&lt;optimized out&gt;, version_id=&lt;optimized out&gt;) at ../hw/virtio/virtio.c:3203
#10 0x000055a324c6ab96 in vmstate_load_state (f=f@entry=0x55a329dc0c00, vmsd=0x55a325fc1a60 &lt;vmstate_virtio_scsi&gt;, opaque=0x55a32985d9a0, version_id=1) at ../migration/vmstate.c:143
#11 0x000055a324cda138 in vmstate_load (f=0x55a329dc0c00, se=0x55a329941c90) at ../migration/savevm.c:913
#12 0x000055a324cdda34 in qemu_loadvm_section_start_full (mis=0x55a3284ef9e0, f=0x55a329dc0c00) at ../migration/savevm.c:2741
#13 qemu_loadvm_state_main (f=f@entry=0x55a329dc0c00, mis=mis@entry=0x55a3284ef9e0) at ../migration/savevm.c:2939
#14 0x000055a324cdf66a in qemu_loadvm_state (f=0x55a329dc0c00) at ../migration/savevm.c:3021
#15 0x000055a324d14b4e in process_incoming_migration_co (opaque=&lt;optimized out&gt;) at ../migration/migration.c:574
#16 0x000055a32501ae3b in coroutine_trampoline (i0=&lt;optimized out&gt;, i1=&lt;optimized out&gt;) at ../util/coroutine-ucontext.c:173
#17 0x00007ff2929e8000 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
#18 0x00007ffed80dc2a0 in ?? ()
#19 0x0000000000000000 in ?? ()

address_space_cache_init() is the only caller of address_space_to_flatview
I can find in vmstate_load call stack so far. Although I think the mr used
by address_space_cache_init() won't be affected by the delay of
memory_region_transaction_commit(), we really need a mechanism to prevent
the modified mr from being used.

Maybe we can build a stale list:
If a subregion is added, add its parent to the stale list(considering that
new subregion's priority has uncertain effects on flatviews).
If a subregion is deleted, add itself to the stale list.
When memory_region_transaction_commit() regenerates flatviews, clear the
stale list.
when address_space_translate_internal() is called, check whether the mr
looked up matches one of mrs（or its child）in the stale list. If yes, a
crash will be triggered.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not sure that'll work, though.  Consider this graph:

                            A
                           / \
                          B   C
                       (p=1) (p=0)

A,B,C are MRs, B&amp;C are subregions to A.  When B's priority is higher (p=1),
any access to A will go upon B, so far so good.

Then, let's assume D comes under C with even higher priority:

                            A
                           / \
                          B   C
                       (p=1) (p=0)
                              |
                              D
                             (p=2)


Adding C into stale list won't work because when with the old flatview
it'll point to B instead, while B is not in the stale list. The AS
operation will carry out without noticing it's already wrong.</pre>
    </blockquote>
    <pre>Peter, I think our understanding of priority is different. 

In the qemu docs
(<a class="moz-txt-link-freetext" href="https://qemu.readthedocs.io/en/stable-6.1/devel/memory.html#overlapping-regions-and-priority">https://qemu.readthedocs.io/en/stable-6.1/devel/memory.html#overlapping-regions-and-priority</a>), 
it says 'Priority values are local to a container, because the priorities of 
two regions are only compared when they are both children of the same container.'
 
And as I read in code, when doing render_memory_region() operation on A, qemu 
will firstly insert B's FlatRanges and its children's FlatRanges recursively 
because B's priority is higher than C. After B's FlatRanges and its children's 
FlatRanges are all inserted into flatviews, C's FlatRanges and its children's 
FlatRanges will be inserted into gaps left by B if B and C overlaps.

So I think adding D as C's subregion has no effect on B in your second case. 
The old FlatRange pointing to B is still effective. C and C'children with lower 
priority than D will be affected, but we have flagged them as stale.

I hope I have no misunderstanding of the flatview's construction code. If I 
understand wrong, please forgive my ignorance..😭

</pre>
    <blockquote type="cite" cite="mid:Y5EO8HqNVj%2FRq7M5@x1n">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
There may be many details to consider in this mechanism. Hope you can give
some suggestions on its feasibility.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
For this specific case, I'm wildly thinking whether we can just postpone
the init of the vring cache until migration completes.

One thing to mention from what I read it: we'll need to update all the
caches in virtio_memory_listener_commit() anyway, when the batched commit()
happens when migration completes with your approach, so we'll rebuild the
vring cache once and for all which looks also nice if possible.

There's some details to consider. E.g. the commit() happens only when
memory_region_update_pending==true.  We may want to make sure the cache is
initialized unconditionally, at least.  Not sure whether that's doable,
though.

Thanks,

</pre>
    </blockquote>
    <pre>Good idea! We can try it in the new patches! And with the delay of 
virtio_init_region_cache(), we can still use assert in address_space_to_flatview(). 
However, I think the stale list can be used as a retention scheme for further 
discussion in the future, because the stale list may adapt to more complex scenarios.

Thanks.
</pre>
  </body>
</html>

--------------X9b6uhpkQ9WfgGVWCZG8xyqt--

