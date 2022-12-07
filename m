Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E5645E60
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2wx6-0002lw-50; Wed, 07 Dec 2022 11:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p2wx3-0002lf-PB
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 11:07:17 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p2wwy-0003IY-Ew
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 11:07:17 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d3so17437954plr.10
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 08:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3pphlLYgZZh8gK63Rx/ceTjqP935AsrO3uWdmQrfDG4=;
 b=dJWrMZQrDTuP3W/QS8TZZGucWEd0I3M7LDB7nGLMj+S9p1JHlpi8XJLZxhO/NkIzRf
 aiHwRcqKDm5KOMhuHWJjOkPufV3hb+gBvg2XogqYDWsJW58wx06FzTYZONQJnqfKMlAh
 vZJ0OcW9MWlSWUdsRISgQmt3FDATCaJzrU3EbxzZXtcD3nAE8MBHmvDBtIOx0nYIawKt
 w1Xe/7UhDnurRg3h4iI7nCUm2mkiVOr7b9OxQS5PtfKsQSKzFn0Guve1RMCOQ1LKV/U9
 e/pJpH8IcbQUju37l/OYcwH2sWhWpPrSEHZqYVOAB4XYpj5zG3M9NP2enw4d8rJtwpP8
 0tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3pphlLYgZZh8gK63Rx/ceTjqP935AsrO3uWdmQrfDG4=;
 b=YXT+/g7kfp9CFZcIhg92/78Ks6dvllqbhnqfV79mfurt8HSvQqgoEZCKy9QmJ/yd7Z
 4ufbLGj1/Imj1D95KFrftJVrQ1M40+jHk4eQIVuW2Q+sdvNUJyUQtXiI1YYq1UuXhCqi
 eHCkBgzzEE2ZUIwSB0zkm9NgwBq2DK2hJHQBih7arNgTv487EwpnVmI4mDu8Nc9UUYbc
 NljVYKhlaBW7qBsHq7dcFHtQFKnto9NJr/WAnhCj4rrbxSOvyRgsLPdxzdJrdQQJq/ks
 E0o9M5pW2ZdQYTxzm5NkE/iJztuw54Qvf03HyB7kMuDIlIMtUsiTTnJM1rJeLH5nmEfB
 52Jw==
X-Gm-Message-State: ANoB5pnhHa/4yK3zLtfrVLeJEUsE1O/zItv66LALXY5ATmLOBI+wbrny
 48RPm530SVwRbZlYM+PQj4lq4A==
X-Google-Smtp-Source: AA0mqf70ElPsb6loUnOpUcV2ZzIjcSD9ktDRCFVQW0EXeX7Fad3FD3YrczYik/PqzxKP5dWC9nT7Xg==
X-Received: by 2002:a17:902:eb82:b0:189:da3b:17ae with SMTP id
 q2-20020a170902eb8200b00189da3b17aemr748075plg.14.1670429229030; 
 Wed, 07 Dec 2022 08:07:09 -0800 (PST)
Received: from [10.4.70.50] ([139.177.225.229])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b00189b910c6ccsm7259664plg.125.2022.12.07.08.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 08:07:08 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------D7McTDoV4QQ6W1GhTzB3PIfo"
Message-ID: <faae03bb-7705-fb16-46a5-e4c2ea55a254@bytedance.com>
Date: Thu, 8 Dec 2022 00:07:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [External] Re: [RFC PATCH] migration: reduce time of loading
 non-iterable vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
 <Y3+egjXTvLEHDjuT@x1n> <7e5c5d6c-8f23-c0c5-5f5c-5daad854c2e7@bytedance.com>
 <Y4Ty07M/HN9UnsGb@x1n> <1adf426d-a9c8-9015-383b-3e82eb6b7c54@bytedance.com>
 <Y44cNenFueVE4RFW@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y44cNenFueVE4RFW@x1n>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001,
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
--------------D7McTDoV4QQ6W1GhTzB3PIfo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/12/6 上午12:28, Peter Xu wrote:
> Chuang,
>
> No worry on the delay; you're faster than when I read yours. :)
>
> On Mon, Dec 05, 2022 at 02:56:15PM +0800, Chuang Xu wrote:
>>> As a start, maybe you can try with poison address_space_to_flatview() (by
>>> e.g. checking the start_pack_mr_change flag and assert it is not set)
>>> during this process to see whether any call stack can even try to
>>> dereference a flatview.
>>>
>>> It's just that I didn't figure a good way to "prove" its validity, even if
>>> I think this is an interesting idea worth thinking to shrink the downtime.
>> Thanks for your sugguestions!
>> I used a thread local variable to identify whether the current thread is a
>> migration thread(main thread of target qemu) and I modified the code of
>> qemu_coroutine_switch to make sure the thread local variable true only in
>> process_incoming_migration_co call stack. If the target qemu detects that
>> start_pack_mr_change is set and address_space_to_flatview() is called in
>> non-migrating threads or non-migrating coroutine, it will crash.
> Are you using the thread var just to avoid the assert triggering in the
> migration thread when commiting memory changes?
>
> I think _maybe_ another cleaner way to sanity check this is directly upon
> the depth:
>
> static inline FlatView *address_space_to_flatview(AddressSpace *as)
> {
>      /*
>       * Before using any flatview, sanity check we're not during a memory
>       * region transaction or the map can be invalid.  Note that this can
>       * also be called during commit phase of memory transaction, but that
>       * should also only happen when the depth decreases to 0 first.
>       */
>      assert(memory_region_transaction_depth == 0);
>      return qatomic_rcu_read(&as->current_map);
> }
>
> That should also cover the safe cases of memory transaction commits during
> migration.
>
Peter, I tried this way and found that the target qemu will crash.

Here is the gdb backtrace:

#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:51
#1  0x00007ff2929d851a in __GI_abort () at abort.c:118
#2  0x00007ff2929cfe67 in __assert_fail_base (fmt=<optimized out>, assertion=assertion@entry=0x55a32578cdc0 "memory_region_transaction_depth == 0", file=file@entry=0x55a32575d9b0 "/data00/migration/qemu-5.2.0/include/exec/memory.h",
     line=line@entry=766, function=function@entry=0x55a32578d6e0 <__PRETTY_FUNCTION__.20463> "address_space_to_flatview") at assert.c:92
#3  0x00007ff2929cff12 in __GI___assert_fail (assertion=assertion@entry=0x55a32578cdc0 "memory_region_transaction_depth == 0", file=file@entry=0x55a32575d9b0 "/data00/migration/qemu-5.2.0/include/exec/memory.h", line=line@entry=766,
     function=function@entry=0x55a32578d6e0 <__PRETTY_FUNCTION__.20463> "address_space_to_flatview") at assert.c:101
#4  0x000055a324b2ed5e in address_space_to_flatview (as=0x55a326132580 <address_space_memory>) at /data00/migration/qemu-5.2.0/include/exec/memory.h:766
#5  0x000055a324e79559 in address_space_to_flatview (as=0x55a326132580 <address_space_memory>) at ../softmmu/memory.c:811
#6  address_space_get_flatview (as=0x55a326132580 <address_space_memory>) at ../softmmu/memory.c:805
#7  0x000055a324e96474 in address_space_cache_init (cache=cache@entry=0x55a32a4fb000, as=<optimized out>, addr=addr@entry=68404985856, len=len@entry=4096, is_write=false) at ../softmmu/physmem.c:3307
#8  0x000055a324ea9cba in virtio_init_region_cache (vdev=0x55a32985d9a0, n=0) at ../hw/virtio/virtio.c:185
#9  0x000055a324eaa615 in virtio_load (vdev=0x55a32985d9a0, f=<optimized out>, version_id=<optimized out>) at ../hw/virtio/virtio.c:3203
#10 0x000055a324c6ab96 in vmstate_load_state (f=f@entry=0x55a329dc0c00, vmsd=0x55a325fc1a60 <vmstate_virtio_scsi>, opaque=0x55a32985d9a0, version_id=1) at ../migration/vmstate.c:143
#11 0x000055a324cda138 in vmstate_load (f=0x55a329dc0c00, se=0x55a329941c90) at ../migration/savevm.c:913
#12 0x000055a324cdda34 in qemu_loadvm_section_start_full (mis=0x55a3284ef9e0, f=0x55a329dc0c00) at ../migration/savevm.c:2741
#13 qemu_loadvm_state_main (f=f@entry=0x55a329dc0c00, mis=mis@entry=0x55a3284ef9e0) at ../migration/savevm.c:2939
#14 0x000055a324cdf66a in qemu_loadvm_state (f=0x55a329dc0c00) at ../migration/savevm.c:3021
#15 0x000055a324d14b4e in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:574
#16 0x000055a32501ae3b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:173
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

There may be many details to consider in this mechanism. Hope you can give
some suggestions on its feasibility.

>> I tested migration for lots of times, there was no crash. Does this prove
>> the validity to some extent?
> Yes I think so, it's just that if we cannot 100% prove it's safe (e.g. you
> cannot cover all the code paths in qemu that migration can trigger) then we
> may need some sanity check like above along with the solution to make sure
> even if something wrong it won't go wrong as weird.
>
> And if we want to try this out, it'll better be at the start of a dev cycle
> and we fix things or revert before the next rc0 releases.
>
> I'm not sure whether that assert might be too strong, we can use an error
> instead, but so far I don't see how that can happen and if that happens I
> feel like it's bad enough, so maybe not so much.  Then AFAICT we can
> completely drop start_pack_mr_change with that stronger check.
> If you agree with above, feel free to have two patches in the new version,
> making the depth assert a separate patch.  At the meantime, let's see
> whether you can get some other comments from others.
>
Yes, start_pack_mr_change isn't needed any more. I'll drop it in the new patches.

--------------D7McTDoV4QQ6W1GhTzB3PIfo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/12/6 上午12:28, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y44cNenFueVE4RFW@x1n">
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
        <pre class="moz-quote-pre" wrap="">
Thanks for your sugguestions!
I used a thread local variable to identify whether the current thread is a
migration thread(main thread of target qemu) and I modified the code of
qemu_coroutine_switch to make sure the thread local variable true only in
process_incoming_migration_co call stack. If the target qemu detects that
start_pack_mr_change is set and address_space_to_flatview() is called in
non-migrating threads or non-migrating coroutine, it will crash.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Are you using the thread var just to avoid the assert triggering in the
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
</pre>
    <div data-page-id="SykHdNHxkoUyaexnnttc3L25n5F"
      data-docx-has-block-data="false">
      <div style="white-space:pre;" class=" old-record-id-OuikdaQGGoW6E0x4nddcRRRGngG"><pre>#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:51
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
#19 0x0000000000000000 in ?? ()</pre></div>
    </div>
    <span
data-lark-record-data="{&quot;rootId&quot;:&quot;SykHdNHxkoUyaexnnttc3L25n5F&quot;,&quot;text&quot;:{&quot;initialAttributedTexts&quot;:{&quot;text&quot;:{&quot;0&quot;:&quot;#0
      __GI_raise (sig=sig@entry=6) at
      ../sysdeps/unix/sysv/linux/raise.c:51\n#1 0x00007ff2929d851a in
      __GI_abort () at abort.c:118\n#2 0x00007ff2929cfe67 in
      __assert_fail_base (fmt=&lt;optimized out&gt;,
      assertion=assertion@entry=0x55a32578cdc0
      \&quot;memory_region_transaction_depth == 0\&quot;,
      file=file@entry=0x55a32575d9b0
      \&quot;/data00/migration/qemu-5.2.0/include/exec/memory.h\&quot;,\n
      line=line@entry=766, function=function@entry=0x55a32578d6e0
      &lt;__PRETTY_FUNCTION__.20463&gt;
      \&quot;address_space_to_flatview\&quot;) at assert.c:92\n#3
      0x00007ff2929cff12 in __GI___assert_fail
      (assertion=assertion@entry=0x55a32578cdc0
      \&quot;memory_region_transaction_depth == 0\&quot;,
      file=file@entry=0x55a32575d9b0
      \&quot;/data00/migration/qemu-5.2.0/include/exec/memory.h\&quot;,
      line=line@entry=766,\n function=function@entry=0x55a32578d6e0
      &lt;__PRETTY_FUNCTION__.20463&gt;
      \&quot;address_space_to_flatview\&quot;) at assert.c:101\n#4
      0x000055a324b2ed5e in address_space_to_flatview (as=0x55a326132580
      &lt;address_space_memory&gt;) at
      /data00/migration/qemu-5.2.0/include/exec/memory.h:766\n#5
      0x000055a324e79559 in address_space_to_flatview (as=0x55a326132580
      &lt;address_space_memory&gt;) at ../softmmu/memory.c:811\n#6
      address_space_get_flatview (as=0x55a326132580
      &lt;address_space_memory&gt;) at ../softmmu/memory.c:805\n#7
      0x000055a324e96474 in address_space_cache_init
      (cache=cache@entry=0x55a32a4fb000, as=&lt;optimized out&gt;,
      addr=addr@entry=68404985856, len=len@entry=4096, is_write=false)
      at ../softmmu/physmem.c:3307\n#8 0x000055a324ea9cba in
      virtio_init_region_cache (vdev=0x55a32985d9a0, n=0) at
      ../hw/virtio/virtio.c:185\n#9 0x000055a324eaa615 in virtio_load
      (vdev=0x55a32985d9a0, f=&lt;optimized out&gt;,
      version_id=&lt;optimized out&gt;) at
      ../hw/virtio/virtio.c:3203\n#10 0x000055a324c6ab96 in
      vmstate_load_state (f=f@entry=0x55a329dc0c00, vmsd=0x55a325fc1a60
      &lt;vmstate_virtio_scsi&gt;, opaque=0x55a32985d9a0, version_id=1)
      at ../migration/vmstate.c:143\n#11 0x000055a324cda138 in
      vmstate_load (f=0x55a329dc0c00, se=0x55a329941c90) at
      ../migration/savevm.c:913\n#12 0x000055a324cdda34 in
      qemu_loadvm_section_start_full (mis=0x55a3284ef9e0,
      f=0x55a329dc0c00) at ../migration/savevm.c:2741\n#13
      qemu_loadvm_state_main (f=f@entry=0x55a329dc0c00,
      mis=mis@entry=0x55a3284ef9e0) at ../migration/savevm.c:2939\n#14
      0x000055a324cdf66a in qemu_loadvm_state (f=0x55a329dc0c00) at
      ../migration/savevm.c:3021\n#15 0x000055a324d14b4e in
      process_incoming_migration_co (opaque=&lt;optimized out&gt;) at
      ../migration/migration.c:574\n#16 0x000055a32501ae3b in
      coroutine_trampoline (i0=&lt;optimized out&gt;, i1=&lt;optimized
      out&gt;) at ../util/coroutine-ucontext.c:173\n#17
      0x00007ff2929e8000 in ?? () from
      /lib/x86_64-linux-gnu/libc.so.6\n#18 0x00007ffed80dc2a0 in ??
      ()\n#19 0x0000000000000000 in ??
()&quot;},&quot;attribs&quot;:{&quot;0&quot;:&quot;*0|l+20y*0+v&quot;}},&quot;apool&quot;:{&quot;numToAttrib&quot;:{&quot;0&quot;:[&quot;author&quot;,&quot;6947858099835256833&quot;]},&quot;nextNum&quot;:1}},&quot;type&quot;:&quot;text&quot;,&quot;referenceRecordMap&quot;:{},&quot;extra&quot;:{&quot;mention_page_title&quot;:{},&quot;external_mention_url&quot;:{}},&quot;isKeepQuoteContainer&quot;:false,&quot;isFromCode&quot;:true,&quot;selection&quot;:[{&quot;id&quot;:2,&quot;type&quot;:&quot;text&quot;,&quot;selection&quot;:{&quot;start&quot;:10113,&quot;end&quot;:12770},&quot;recordId&quot;:&quot;OuikdaQGGoW6E0x4nddcRRRGngG&quot;}],&quot;isCut&quot;:false}"
      data-lark-record-format="docx/text" class="lark-record-clipboard"></span>
    <pre class="moz-quote-pre" wrap="">address_space_cache_init() is the only caller of address_space_to_flatview 
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

There may be many details to consider in this mechanism. Hope you can give 
some suggestions on its feasibility.

</pre>
    <blockquote type="cite" cite="mid:Y44cNenFueVE4RFW@x1n">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I tested migration for lots of times, there was no crash. Does this prove
the validity to some extent?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes I think so, it's just that if we cannot 100% prove it's safe (e.g. you
cannot cover all the code paths in qemu that migration can trigger) then we
may need some sanity check like above along with the solution to make sure
even if something wrong it won't go wrong as weird.

And if we want to try this out, it'll better be at the start of a dev cycle
and we fix things or revert before the next rc0 releases.

I'm not sure whether that assert might be too strong, we can use an error
instead, but so far I don't see how that can happen and if that happens I
feel like it's bad enough, so maybe not so much.  Then AFAICT we can
completely drop start_pack_mr_change with that stronger check.
If you agree with above, feel free to have two patches in the new version,
making the depth assert a separate patch.  At the meantime, let's see
whether you can get some other comments from others.

</pre>
    </blockquote>
    <pre>Yes, start_pack_mr_change isn't needed any more. I'll drop it in the new patches.
</pre>
  </body>
</html>

--------------D7McTDoV4QQ6W1GhTzB3PIfo--

