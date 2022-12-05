Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F30664231E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 07:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p25Ow-0000gf-00; Mon, 05 Dec 2022 01:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p25Os-0000gS-89
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 01:56:26 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p25Oo-0007TF-Md
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 01:56:26 -0500
Received: by mail-pl1-x62e.google.com with SMTP id jn7so9942956plb.13
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 22:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XMzdS3F4AxZtCYUCeRQQ+iktVy+MO+xTpZLiyAN3XQE=;
 b=69MZL8CDrUmjng8HS9Zo+QAe6580Sat79FIG4obO3wqVZ87BfNkLKg9gDi5OlumhJe
 d0lXhVa0dC/DvtoZB0RavDLC0azjRQ2D99p5ZM7MolEgfiDfIYdXR91gWa3Dzg+jy8DC
 vKMz5ys0jhhqQyZegMNaqfi9HVwoR6FkCNmsvKhwi8c2SMzviGn9WAz2a59MeoxN7ENu
 iUt3smHbCS2xp3bpAFkSePCARY8DGkTITsm5HJ1ZOvtmKejzZBCZ4jw5bC2da4EYdtkL
 vySkz74IUWEPEZ9o9MRQfH8IYbkmi6gECN5EZY5DSjsF9lVRZJw4t2f54klE+XNoHwRq
 SJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMzdS3F4AxZtCYUCeRQQ+iktVy+MO+xTpZLiyAN3XQE=;
 b=vXcONIwJug9dEGuYgpz+Tjqm0Gmo7e7J0tA+/3ok10q3dm/ix+hvpFjtYugfbAxNqP
 eDv92iOpeQQJ1q4bHcw9sGh1mMN10eNKnAheGudrhY/+vcNyVQ9KihvzFbpMth9296JR
 wLiUi/eoSO2wOCAvJtt27ho+c7pxYe7HmhU1Oa/YbifkVeCjwpjpgkoSnjKdWA+ZKTT6
 XsmsXQZy9un8XnWKWWWBK5qy/I0M7u3nC3rKVhRcwkmC/waAGs9xz5csu6NE2v8ypcGw
 dFgdjYRHxNkBy52em6Eis3i2dGKJmnJhSYjUYSsPPB1CRIo09JVd65m6lbLc8wwrmw9E
 FrFQ==
X-Gm-Message-State: ANoB5pl/cp4p2eNT826aM//jGRJj6PHU89VMbxjxcyH3LiIQoU7jA18A
 bLc5mdUzID5PEXw6der56ucM2g==
X-Google-Smtp-Source: AA0mqf5okUVN7FgaA+I3bPumuhK7Hk0lnjvJ8MElWeAb+hhREXgewMc4YViCKJQmXGEBWgJnYjRlvA==
X-Received: by 2002:a17:902:c946:b0:186:99e3:c079 with SMTP id
 i6-20020a170902c94600b0018699e3c079mr63525292pla.149.1670223380426; 
 Sun, 04 Dec 2022 22:56:20 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a17090341cd00b00186f81bb3f0sm9839271ple.122.2022.12.04.22.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 22:56:20 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Nb0q07SedgL0aNXZsYTp57Wl"
Message-ID: <1adf426d-a9c8-9015-383b-3e82eb6b7c54@bytedance.com>
Date: Mon, 5 Dec 2022 14:56:15 +0800
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
 <Y4Ty07M/HN9UnsGb@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y4Ty07M/HN9UnsGb@x1n>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001,
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
--------------Nb0q07SedgL0aNXZsYTp57Wl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Peter, I'm sorry I didn't reply to your email in time, because I was busy with
other work last week. Here is my latest progress.

On 2022/11/29 上午1:41, Peter Xu wrote:
> On Mon, Nov 28, 2022 at 05:42:43PM +0800, Chuang Xu wrote:
>> On 2022/11/25 上午12:40, Peter Xu wrote:
>>> On Fri, Nov 18, 2022 at 04:36:48PM +0800, Chuang Xu wrote:
>>>> The duration of loading non-iterable vmstate accounts for a significant
>>>> portion of downtime (starting with the timestamp of source qemu stop and
>>>> ending with the timestamp of target qemu start). Most of the time is spent
>>>> committing memory region changes repeatedly.
>>>>
>>>> This patch packs all the changes to memory region during the period of
>>>> loading non-iterable vmstate in a single memory transaction. With the
>>>> increase of devices, this patch will greatly improve the performance.
>>>>
>>>> Here are the test results:
>>>> test vm info:
>>>> - 32 CPUs 128GB RAM
>>>> - 8 16-queue vhost-net device
>>>> - 16 4-queue vhost-user-blk device.
>>>>
>>>> 	time of loading non-iterable vmstate
>>>> before		about 210 ms
>>>> after		about 40 ms
>>>>
>>>> Signed-off-by: Chuang Xu<xuchuangxclwt@bytedance.com>
>>> This is an interesting idea..  I think it means at least the address space
>>> operations will all be messed up if happening during the precopy loading
>> Sorry, I don't quite understand the meaning of "messed up" here.. Maybe I need
>> more information about how the address space operations will be messed up.
> AFAIK the major thing we do during commit of memory regions is to apply the
> memory region changes to the rest (flatviews, or ioeventfds), basically it
> makes everything matching with the new memory region layout.
>
> If we allow memory region commit to be postponed for the whole loading
> process, it means at least from flat view pov any further things like:
>
>    address_space_write(&address_space_memory, ...)
>
> Could write to wrong places because the flat views are not updated.

I have tested migration on normal qemu and optimized qemu repeatedly,
I haven't trace any other operation on target qemu's mr (such as
address_space_write...) happens so far.

>>> progress, but I don't directly see its happening either.  For example, in
>>> most post_load()s of vmsd I think the devices should just write directly to
>>> its buffers, accessing MRs directly, even if they want DMAs or just update
>>> fields to correct states.  Even so, I'm not super confident that holds
>> And I'm not sure whether the "its happening" means "begin/commit happening"
>> or "messed up happening"? If it's the former, Here are what I observe:
>> the stage of loading iterable vmstate doesn't call begin/commit, but the
>> stage of loading noniterable vmstate calls a large amount of begin/commit
>> in field->info->get() operation. For example:
>>
>> #0  memory_region_transaction_commit () at ../softmmu/memory.c:1085
>> #1  0x0000559b6f683523 in pci_update_mappings (d=d@entry=0x7f5cd8682010) at ../hw/pci/pci.c:1361
>> #2  0x0000559b6f683a1f in get_pci_config_device (f=<optimized out>, pv=0x7f5cd86820a0, size=256, field=<optimized out>) at ../hw/pci/pci.c:545
>> #3  0x0000559b6f5fcd86 in vmstate_load_state (f=f@entry=0x559b757eb4b0, vmsd=vmsd@entry=0x559b70909d40 <vmstate_pci_device>, opaque=opaque@entry=0x7f5cd8682010, version_id=2)
>>      at ../migration/vmstate.c:143
>> #4  0x0000559b6f68466f in pci_device_load (s=s@entry=0x7f5cd8682010, f=f@entry=0x559b757eb4b0) at ../hw/pci/pci.c:664
>> #5  0x0000559b6f6ad38a in virtio_pci_load_config (d=0x7f5cd8682010, f=0x559b757eb4b0) at ../hw/virtio/virtio-pci.c:181
>> #6  0x0000559b6f7dfe91 in virtio_load (vdev=0x7f5cd868a1a0, f=0x559b757eb4b0, version_id=1) at ../hw/virtio/virtio.c:3071
>> #7  0x0000559b6f5fcd86 in vmstate_load_state (f=f@entry=0x559b757eb4b0, vmsd=0x559b709ae260 <vmstate_vhost_user_blk>, opaque=0x7f5cd868a1a0, version_id=1) at ../migration/vmstate.c:143
>> #8  0x0000559b6f62da48 in vmstate_load (f=0x559b757eb4b0, se=0x559b7591c010) at ../migration/savevm.c:913
>> #9  0x0000559b6f631334 in qemu_loadvm_section_start_full (mis=0x559b73f1a580, f=0x559b757eb4b0) at ../migration/savevm.c:2741
>> #10 qemu_loadvm_state_main (f=f@entry=0x559b757eb4b0, mis=mis@entry=0x559b73f1a580) at ../migration/savevm.c:2937
>> #11 0x0000559b6f632faa in qemu_loadvm_state (f=0x559b757eb4b0) at ../migration/savevm.c:3018
>> #12 0x0000559b6f6d2ece in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:574
>> #13 0x0000559b6f9f9f0b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:173
>> #14 0x00007f5cfeecf000 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
>> #15 0x00007fff04a2e8f0 in ?? ()
>> #16 0x0000000000000000 in ?? ()
>>
>>> true, not to mention any other side effects (e.g., would we release bql
>>> during precopy for any reason?).
>>>
>>> Copy Paolo and PeterM for some extra eyes.
>>>
>> What I observe is that during the loading process, migration thread will call Condwait to
>> wait for the vcpu threads to complete tasks, such as kvm_apic_post_load, and rcu thread
>> will acquire the bql to do the flatview_destroy operation. So far, I haven't seen the
>> side effects of these two situations.
> Yes that's something I'd worry about.
>
> The current memory API should be defined as: when we release the bql we
> should guarantee the memory layout is persistent and no pending
> transactions.  I used to have a patchset just for that because when
> violating that rule it's prone to very weird bugs:
>
> https://lore.kernel.org/all/20210728183151.195139-8-peterx@redhat.com/
>
> One example report that was caused by wrongly releasing bql and you can
> have a feeling of it by the stack dumped (after above patchset applied):
>
> https://lore.kernel.org/qemu-devel/CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com/
>
> Said that, it's not exact the case here since it's not releasing bql during
> a memory commit phase, so probably no immediate problem as rcu thread will
> just ignore any updates to be committed.  It might be safe to do it like
> that (and making sure no vcpu is running), but worth serious thoughts.
>
> As a start, maybe you can try with poison address_space_to_flatview() (by
> e.g. checking the start_pack_mr_change flag and assert it is not set)
> during this process to see whether any call stack can even try to
> dereference a flatview.
>
> It's just that I didn't figure a good way to "prove" its validity, even if
> I think this is an interesting idea worth thinking to shrink the downtime.

Thanks for your sugguestions!
I used a thread local variable to identify whether the current thread is a
migration thread(main thread of target qemu) and I modified the code of
qemu_coroutine_switch to make sure the thread local variable true only in
process_incoming_migration_co call stack. If the target qemu detects that
start_pack_mr_change is set and address_space_to_flatview() is called in
non-migrating threads or non-migrating coroutine, it will crash. I tested
migration for lots of times, there was no crash. Does this prove the validity
to some extent?

>>>> ---
>>>>    migration/migration.c | 1 +
>>>>    migration/migration.h | 2 ++
>>>>    migration/savevm.c    | 8 ++++++++
>>>>    3 files changed, 11 insertions(+)
>>>>
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index e6f8bc2478..ed20704552 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -224,6 +224,7 @@ void migration_object_init(void)
>>>>        qemu_sem_init(&current_incoming->postcopy_pause_sem_fast_load, 0);
>>>>        qemu_mutex_init(&current_incoming->page_request_mutex);
>>>>        current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
>>>> +    current_incoming->start_pack_mr_change = false;
>>>>        migration_object_check(current_migration, &error_fatal);
>>>> diff --git a/migration/migration.h b/migration/migration.h
>>>> index 58b245b138..86597f5feb 100644
>>>> --- a/migration/migration.h
>>>> +++ b/migration/migration.h
>>>> @@ -186,6 +186,8 @@ struct MigrationIncomingState {
>>>>         * contains valid information.
>>>>         */
>>>>        QemuMutex page_request_mutex;
>>>> +
>>>> +    bool start_pack_mr_change;
>>>>    };
>>>>    MigrationIncomingState *migration_incoming_get_current(void);
>>>> diff --git a/migration/savevm.c b/migration/savevm.c
>>>> index 48e85c052c..a073009a74 100644
>>>> --- a/migration/savevm.c
>>>> +++ b/migration/savevm.c
>>>> @@ -2630,6 +2630,12 @@ retry:
>>>>            switch (section_type) {
>>>>            case QEMU_VM_SECTION_START:
>>>>            case QEMU_VM_SECTION_FULL:
>>>> +            /* call memory_region_transaction_begin() before loading non-iterable vmstate */
>>>> +            if (section_type == QEMU_VM_SECTION_FULL && !mis->start_pack_mr_change) {
>>>> +                memory_region_transaction_begin();
>>>> +                mis->start_pack_mr_change = true;
>>> This is slightly hacky to me.  Can we just wrap the begin/commit inside the
>>> whole qemu_loadvm_state_main() call?
>> The iterative copy phase doesn't call begin/commit, so There seems to be no essential
>> difference between these two codes. I did try to wrap the begin/commit inside the whole
>> qemu_loadvm_state_main() call, this way also worked well.
>> But only calling begin/commit before/after the period of loading non-iterable vmstate may
>> have less unkown side effect?
> I don't worry much on the iterative migration phase, because they should be
> mostly pure data movements unless I miss something important.  Having them
> wrap qemu_loadvm_state_main() can avoid the flag completely and avoid the
> special treatment within these migration internal flags which is hacky, imo.
>
In my latest patch for testing, I wrap the begin/commit inside the whole
qemu_loadvm_state_main() call as you suggested. So far everything works well.

>>>> +            }
>>>> +
>>>>                ret = qemu_loadvm_section_start_full(f, mis);
>>>>                if (ret < 0) {
>>>>                    goto out;
>>>> @@ -2650,6 +2656,8 @@ retry:
>>>>                }
>>>>                break;
>>>>            case QEMU_VM_EOF:
>>>> +            /* call memory_region_transaction_commit() after loading non-iterable vmstate */
>>>> +            memory_region_transaction_commit();
>>>>                /* This is the end of migration */
>>>>                goto out;
>>>>            default:
>>>> -- 
>>>> 2.20.1
>>>>
>> Peter, Thanks a lot for your advice! Hope for more suggestions from you!
--------------Nb0q07SedgL0aNXZsYTp57Wl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Peter, I'm sorry I didn't reply to your email in time, because I was busy with 
other work last week. Here is my latest progress.
</pre>
    <div class="moz-cite-prefix">On 2022/11/29 上午1:41, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y4Ty07M%2FHN9UnsGb@x1n">
      <pre class="moz-quote-pre" wrap="">On Mon, Nov 28, 2022 at 05:42:43PM +0800, Chuang Xu wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 2022/11/25 上午12:40, Peter Xu wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, Nov 18, 2022 at 04:36:48PM +0800, Chuang Xu wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">The duration of loading non-iterable vmstate accounts for a significant
portion of downtime (starting with the timestamp of source qemu stop and
ending with the timestamp of target qemu start). Most of the time is spent
committing memory region changes repeatedly.

This patch packs all the changes to memory region during the period of
loading non-iterable vmstate in a single memory transaction. With the
increase of devices, this patch will greatly improve the performance.

Here are the test results:
test vm info:
- 32 CPUs 128GB RAM
- 8 16-queue vhost-net device
- 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate
before		about 210 ms
after		about 40 ms

Signed-off-by: Chuang Xu<a class="moz-txt-link-rfc2396E" href="mailto:xuchuangxclwt@bytedance.com">&lt;xuchuangxclwt@bytedance.com&gt;</a>
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">This is an interesting idea..  I think it means at least the address space
operations will all be messed up if happening during the precopy loading
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Sorry, I don't quite understand the meaning of "messed up" here.. Maybe I need
more information about how the address space operations will be messed up.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
AFAIK the major thing we do during commit of memory regions is to apply the
memory region changes to the rest (flatviews, or ioeventfds), basically it
makes everything matching with the new memory region layout.

If we allow memory region commit to be postponed for the whole loading
process, it means at least from flat view pov any further things like:

  address_space_write(&amp;address_space_memory, ...)

Could write to wrong places because the flat views are not updated.
</pre>
    </blockquote>
    <pre>I have tested migration on normal qemu and optimized qemu repeatedly, 
I haven't trace any other operation on target qemu's mr (such as 
address_space_write...) happens so far.
</pre>
    <blockquote type="cite" cite="mid:Y4Ty07M%2FHN9UnsGb@x1n">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">progress, but I don't directly see its happening either.  For example, in
most post_load()s of vmsd I think the devices should just write directly to
its buffers, accessing MRs directly, even if they want DMAs or just update
fields to correct states.  Even so, I'm not super confident that holds
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
And I'm not sure whether the "its happening" means "begin/commit happening"
or "messed up happening"? If it's the former, Here are what I observe:
the stage of loading iterable vmstate doesn't call begin/commit, but the
stage of loading noniterable vmstate calls a large amount of begin/commit
in field-&gt;info-&gt;get() operation. For example:

#0  memory_region_transaction_commit () at ../softmmu/memory.c:1085
#1  0x0000559b6f683523 in pci_update_mappings (d=d@entry=0x7f5cd8682010) at ../hw/pci/pci.c:1361
#2  0x0000559b6f683a1f in get_pci_config_device (f=&lt;optimized out&gt;, pv=0x7f5cd86820a0, size=256, field=&lt;optimized out&gt;) at ../hw/pci/pci.c:545
#3  0x0000559b6f5fcd86 in vmstate_load_state (f=f@entry=0x559b757eb4b0, vmsd=vmsd@entry=0x559b70909d40 &lt;vmstate_pci_device&gt;, opaque=opaque@entry=0x7f5cd8682010, version_id=2)
    at ../migration/vmstate.c:143
#4  0x0000559b6f68466f in pci_device_load (s=s@entry=0x7f5cd8682010, f=f@entry=0x559b757eb4b0) at ../hw/pci/pci.c:664
#5  0x0000559b6f6ad38a in virtio_pci_load_config (d=0x7f5cd8682010, f=0x559b757eb4b0) at ../hw/virtio/virtio-pci.c:181
#6  0x0000559b6f7dfe91 in virtio_load (vdev=0x7f5cd868a1a0, f=0x559b757eb4b0, version_id=1) at ../hw/virtio/virtio.c:3071
#7  0x0000559b6f5fcd86 in vmstate_load_state (f=f@entry=0x559b757eb4b0, vmsd=0x559b709ae260 &lt;vmstate_vhost_user_blk&gt;, opaque=0x7f5cd868a1a0, version_id=1) at ../migration/vmstate.c:143
#8  0x0000559b6f62da48 in vmstate_load (f=0x559b757eb4b0, se=0x559b7591c010) at ../migration/savevm.c:913
#9  0x0000559b6f631334 in qemu_loadvm_section_start_full (mis=0x559b73f1a580, f=0x559b757eb4b0) at ../migration/savevm.c:2741
#10 qemu_loadvm_state_main (f=f@entry=0x559b757eb4b0, mis=mis@entry=0x559b73f1a580) at ../migration/savevm.c:2937
#11 0x0000559b6f632faa in qemu_loadvm_state (f=0x559b757eb4b0) at ../migration/savevm.c:3018
#12 0x0000559b6f6d2ece in process_incoming_migration_co (opaque=&lt;optimized out&gt;) at ../migration/migration.c:574
#13 0x0000559b6f9f9f0b in coroutine_trampoline (i0=&lt;optimized out&gt;, i1=&lt;optimized out&gt;) at ../util/coroutine-ucontext.c:173
#14 0x00007f5cfeecf000 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
#15 0x00007fff04a2e8f0 in ?? ()
#16 0x0000000000000000 in ?? ()

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">true, not to mention any other side effects (e.g., would we release bql
during precopy for any reason?).

Copy Paolo and PeterM for some extra eyes.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">What I observe is that during the loading process, migration thread will call Condwait to
wait for the vcpu threads to complete tasks, such as kvm_apic_post_load, and rcu thread
will acquire the bql to do the flatview_destroy operation. So far, I haven't seen the
side effects of these two situations.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes that's something I'd worry about.

The current memory API should be defined as: when we release the bql we
should guarantee the memory layout is persistent and no pending
transactions.  I used to have a patchset just for that because when
violating that rule it's prone to very weird bugs:

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20210728183151.195139-8-peterx@redhat.com/">https://lore.kernel.org/all/20210728183151.195139-8-peterx@redhat.com/</a>

One example report that was caused by wrongly releasing bql and you can
have a feeling of it by the stack dumped (after above patchset applied):

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/qemu-devel/CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com/">https://lore.kernel.org/qemu-devel/CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com/</a>

Said that, it's not exact the case here since it's not releasing bql during
a memory commit phase, so probably no immediate problem as rcu thread will
just ignore any updates to be committed.  It might be safe to do it like
that (and making sure no vcpu is running), but worth serious thoughts.

As a start, maybe you can try with poison address_space_to_flatview() (by
e.g. checking the start_pack_mr_change flag and assert it is not set)
during this process to see whether any call stack can even try to
dereference a flatview.

It's just that I didn't figure a good way to "prove" its validity, even if
I think this is an interesting idea worth thinking to shrink the downtime.
</pre>
    </blockquote>
    <pre>Thanks for your sugguestions!
I used a thread local variable to identify whether the current thread is a 
migration thread(main thread of target qemu) and I modified the code of 
qemu_coroutine_switch to make sure the thread local variable true only in 
process_incoming_migration_co call stack. If the target qemu detects that 
start_pack_mr_change is set and address_space_to_flatview() is called in 
non-migrating threads or non-migrating coroutine, it will crash. I tested 
migration for lots of times, there was no crash. Does this prove the validity 
to some extent?
</pre>
    <blockquote type="cite" cite="mid:Y4Ty07M%2FHN9UnsGb@x1n">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">---
  migration/migration.c | 1 +
  migration/migration.h | 2 ++
  migration/savevm.c    | 8 ++++++++
  3 files changed, 11 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index e6f8bc2478..ed20704552 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -224,6 +224,7 @@ void migration_object_init(void)
      qemu_sem_init(&amp;current_incoming-&gt;postcopy_pause_sem_fast_load, 0);
      qemu_mutex_init(&amp;current_incoming-&gt;page_request_mutex);
      current_incoming-&gt;page_requested = g_tree_new(page_request_addr_cmp);
+    current_incoming-&gt;start_pack_mr_change = false;
      migration_object_check(current_migration, &amp;error_fatal);
diff --git a/migration/migration.h b/migration/migration.h
index 58b245b138..86597f5feb 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -186,6 +186,8 @@ struct MigrationIncomingState {
       * contains valid information.
       */
      QemuMutex page_request_mutex;
+
+    bool start_pack_mr_change;
  };
  MigrationIncomingState *migration_incoming_get_current(void);
diff --git a/migration/savevm.c b/migration/savevm.c
index 48e85c052c..a073009a74 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2630,6 +2630,12 @@ retry:
          switch (section_type) {
          case QEMU_VM_SECTION_START:
          case QEMU_VM_SECTION_FULL:
+            /* call memory_region_transaction_begin() before loading non-iterable vmstate */
+            if (section_type == QEMU_VM_SECTION_FULL &amp;&amp; !mis-&gt;start_pack_mr_change) {
+                memory_region_transaction_begin();
+                mis-&gt;start_pack_mr_change = true;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">This is slightly hacky to me.  Can we just wrap the begin/commit inside the
whole qemu_loadvm_state_main() call?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The iterative copy phase doesn't call begin/commit, so There seems to be no essential
difference between these two codes. I did try to wrap the begin/commit inside the whole
qemu_loadvm_state_main() call, this way also worked well.
But only calling begin/commit before/after the period of loading non-iterable vmstate may
have less unkown side effect?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't worry much on the iterative migration phase, because they should be
mostly pure data movements unless I miss something important.  Having them
wrap qemu_loadvm_state_main() can avoid the flag completely and avoid the
special treatment within these migration internal flags which is hacky, imo.

</pre>
    </blockquote>
    <pre>In my latest patch for testing, I wrap the begin/commit inside the whole
qemu_loadvm_state_main() call as you suggested. So far everything works well.</pre>
    <blockquote type="cite" cite="mid:Y4Ty07M%2FHN9UnsGb@x1n">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+            }
+
              ret = qemu_loadvm_section_start_full(f, mis);
              if (ret &lt; 0) {
                  goto out;
@@ -2650,6 +2656,8 @@ retry:
              }
              break;
          case QEMU_VM_EOF:
+            /* call memory_region_transaction_commit() after loading non-iterable vmstate */
+            memory_region_transaction_commit();
              /* This is the end of migration */
              goto out;
          default:
-- 
2.20.1

</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Peter, Thanks a lot for your advice! Hope for more suggestions from you!
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------Nb0q07SedgL0aNXZsYTp57Wl--

