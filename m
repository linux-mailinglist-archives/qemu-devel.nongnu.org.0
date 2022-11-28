Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF363A547
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 10:43:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozafL-0005CX-O6; Mon, 28 Nov 2022 04:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1ozaf9-0004zU-Qo
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:42:57 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1ozaf5-0007fY-Eh
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:42:54 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 o5-20020a17090a678500b00218cd5a21c9so9626768pjj.4
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 01:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=A3Ujc+kXWGqv/16mOSYxm5ozsQKEX3LsUEmdX97PgjU=;
 b=PhyXNTG+hZ7hji0q37oDBsybl7OvXD3dXTEpyl38SKMXinqkJXocbiiOYbpApdoVrG
 trzixrk6z5pJTAJ5fyB+8JCQqvCYwZb4YgP0I4ZzrAZUJvqbTm3Rxr1JUGNiESFTS1O6
 DHZDawke5o1GhMRpzn2VSmFZyUEa9wqbHpMG4kZ5phMwtBb3xJIeV1zwIBBCjxwWxOlp
 TyFryMXr6rruFCxXMYtRMn6U16uBYzJU3x30dCp08VdEacb6vm+6ekx1VW9oG0NpbrSx
 ERCKu7WO4s6bK3Jk84firTQgvrRETXtaopXnlL3H/MFMGSHJX+n0WLkrp/aoAG6nzsKH
 3KGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A3Ujc+kXWGqv/16mOSYxm5ozsQKEX3LsUEmdX97PgjU=;
 b=szso11wuB7nNO7sFMgGiIyqLvQ8gcb8kwA5bJByIGrEe39gsMHNiFm2OplWzh8ednl
 mDSpmvqD3KUoXra/HIjlIvVq98ooLcMuDbjErr+ncpZjdzceO9Lzs6DxjEuLcr7zZVKG
 8F7iBvWLxmP4Xy5zNIDuaX3lZLRk5GoxqXYeInW7/hSuV0A/oDwRGar8W8J4m0abbnYX
 IYehXoqum/L9R1MutEtB5hVhoyGqV1S9dfEgTkBaiIN9og2DEGI4nFfiuxQ2Zqzy2y9b
 qnVfBbep8QuSUhdjVTv1W2UVBXWV9fwg2vRWfQ/v52sho/E0NB4aM5O6L9GAsrbWQUPg
 pUhw==
X-Gm-Message-State: ANoB5pl+Ne4qKcHRXwKhFxSLNyWJ8fmSwNekJx4dH/nGGjvZ03gpkJWf
 SnSJoJJWhVrRqMn4dez2BgjtcQ==
X-Google-Smtp-Source: AA0mqf7wx3Fim5yKBiouQg1q1xL8o/sz8mBCCIht7SfgbaXiF8MMGO8q+PF8aBZtbYDIQnDHh2oKWQ==
X-Received: by 2002:a17:90b:1117:b0:218:f5d3:61f3 with SMTP id
 gi23-20020a17090b111700b00218f5d361f3mr22762267pjb.222.1669628569449; 
 Mon, 28 Nov 2022 01:42:49 -0800 (PST)
Received: from [10.4.64.37] ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a170903121000b00188c04258c9sm8455637plh.52.2022.11.28.01.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 01:42:48 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------IaqhhZXsZs8qVALOTX2FvYBO"
Message-ID: <7e5c5d6c-8f23-c0c5-5f5c-5daad854c2e7@bytedance.com>
Date: Mon, 28 Nov 2022 17:42:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [RFC PATCH] migration: reduce time of loading non-iterable vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
 <Y3+egjXTvLEHDjuT@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y3+egjXTvLEHDjuT@x1n>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
--------------IaqhhZXsZs8qVALOTX2FvYBO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/11/25 上午12:40, Peter Xu wrote:
> On Fri, Nov 18, 2022 at 04:36:48PM +0800, Chuang Xu wrote:
>> The duration of loading non-iterable vmstate accounts for a significant
>> portion of downtime (starting with the timestamp of source qemu stop and
>> ending with the timestamp of target qemu start). Most of the time is spent
>> committing memory region changes repeatedly.
>>
>> This patch packs all the changes to memory region during the period of
>> loading non-iterable vmstate in a single memory transaction. With the
>> increase of devices, this patch will greatly improve the performance.
>>
>> Here are the test results:
>> test vm info:
>> - 32 CPUs 128GB RAM
>> - 8 16-queue vhost-net device
>> - 16 4-queue vhost-user-blk device.
>>
>> 	time of loading non-iterable vmstate
>> before		about 210 ms
>> after		about 40 ms
>>
>> Signed-off-by: Chuang Xu<xuchuangxclwt@bytedance.com>
> This is an interesting idea..  I think it means at least the address space
> operations will all be messed up if happening during the precopy loading

Sorry, I don't quite understand the meaning of "messed up" here.. Maybe I need
more information about how the address space operations will be messed up.

> progress, but I don't directly see its happening either.  For example, in
> most post_load()s of vmsd I think the devices should just write directly to
> its buffers, accessing MRs directly, even if they want DMAs or just update
> fields to correct states.  Even so, I'm not super confident that holds

And I'm not sure whether the "its happening" means "begin/commit happening"
or "messed up happening"? If it's the former, Here are what I observe:
the stage of loading iterable vmstate doesn't call begin/commit, but the
stage of loading noniterable vmstate calls a large amount of begin/commit
in field->info->get() operation. For example:

#0  memory_region_transaction_commit () at ../softmmu/memory.c:1085
#1  0x0000559b6f683523 in pci_update_mappings (d=d@entry=0x7f5cd8682010) at ../hw/pci/pci.c:1361
#2  0x0000559b6f683a1f in get_pci_config_device (f=<optimized out>, pv=0x7f5cd86820a0, size=256, field=<optimized out>) at ../hw/pci/pci.c:545
#3  0x0000559b6f5fcd86 in vmstate_load_state (f=f@entry=0x559b757eb4b0, vmsd=vmsd@entry=0x559b70909d40 <vmstate_pci_device>, opaque=opaque@entry=0x7f5cd8682010, version_id=2)
     at ../migration/vmstate.c:143
#4  0x0000559b6f68466f in pci_device_load (s=s@entry=0x7f5cd8682010, f=f@entry=0x559b757eb4b0) at ../hw/pci/pci.c:664
#5  0x0000559b6f6ad38a in virtio_pci_load_config (d=0x7f5cd8682010, f=0x559b757eb4b0) at ../hw/virtio/virtio-pci.c:181
#6  0x0000559b6f7dfe91 in virtio_load (vdev=0x7f5cd868a1a0, f=0x559b757eb4b0, version_id=1) at ../hw/virtio/virtio.c:3071
#7  0x0000559b6f5fcd86 in vmstate_load_state (f=f@entry=0x559b757eb4b0, vmsd=0x559b709ae260 <vmstate_vhost_user_blk>, opaque=0x7f5cd868a1a0, version_id=1) at ../migration/vmstate.c:143
#8  0x0000559b6f62da48 in vmstate_load (f=0x559b757eb4b0, se=0x559b7591c010) at ../migration/savevm.c:913
#9  0x0000559b6f631334 in qemu_loadvm_section_start_full (mis=0x559b73f1a580, f=0x559b757eb4b0) at ../migration/savevm.c:2741
#10 qemu_loadvm_state_main (f=f@entry=0x559b757eb4b0, mis=mis@entry=0x559b73f1a580) at ../migration/savevm.c:2937
#11 0x0000559b6f632faa in qemu_loadvm_state (f=0x559b757eb4b0) at ../migration/savevm.c:3018
#12 0x0000559b6f6d2ece in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:574
#13 0x0000559b6f9f9f0b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:173
#14 0x00007f5cfeecf000 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
#15 0x00007fff04a2e8f0 in ?? ()
#16 0x0000000000000000 in ?? ()

> true, not to mention any other side effects (e.g., would we release bql
> during precopy for any reason?).
>
> Copy Paolo and PeterM for some extra eyes.
>
What I observe is that during the loading process, migration thread will call Condwait to
wait for the vcpu threads to complete tasks, such as kvm_apic_post_load, and rcu thread
will acquire the bql to do the flatview_destroy operation. So far, I haven't seen the
side effects of these two situations.

>> ---
>>   migration/migration.c | 1 +
>>   migration/migration.h | 2 ++
>>   migration/savevm.c    | 8 ++++++++
>>   3 files changed, 11 insertions(+)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index e6f8bc2478..ed20704552 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -224,6 +224,7 @@ void migration_object_init(void)
>>       qemu_sem_init(&current_incoming->postcopy_pause_sem_fast_load, 0);
>>       qemu_mutex_init(&current_incoming->page_request_mutex);
>>       current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
>> +    current_incoming->start_pack_mr_change = false;
>>   
>>       migration_object_check(current_migration, &error_fatal);
>>   
>> diff --git a/migration/migration.h b/migration/migration.h
>> index 58b245b138..86597f5feb 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -186,6 +186,8 @@ struct MigrationIncomingState {
>>        * contains valid information.
>>        */
>>       QemuMutex page_request_mutex;
>> +
>> +    bool start_pack_mr_change;
>>   };
>>   
>>   MigrationIncomingState *migration_incoming_get_current(void);
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 48e85c052c..a073009a74 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -2630,6 +2630,12 @@ retry:
>>           switch (section_type) {
>>           case QEMU_VM_SECTION_START:
>>           case QEMU_VM_SECTION_FULL:
>> +            /* call memory_region_transaction_begin() before loading non-iterable vmstate */
>> +            if (section_type == QEMU_VM_SECTION_FULL && !mis->start_pack_mr_change) {
>> +                memory_region_transaction_begin();
>> +                mis->start_pack_mr_change = true;
> This is slightly hacky to me.  Can we just wrap the begin/commit inside the
> whole qemu_loadvm_state_main() call?

The iterative copy phase doesn't call begin/commit, so There seems to be no essential
difference between these two codes. I did try to wrap the begin/commit inside the whole
qemu_loadvm_state_main() call, this way also worked well.
But only calling begin/commit before/after the period of loading non-iterable vmstate may
have less unkown side effect?

>
>> +            }
>> +
>>               ret = qemu_loadvm_section_start_full(f, mis);
>>               if (ret < 0) {
>>                   goto out;
>> @@ -2650,6 +2656,8 @@ retry:
>>               }
>>               break;
>>           case QEMU_VM_EOF:
>> +            /* call memory_region_transaction_commit() after loading non-iterable vmstate */
>> +            memory_region_transaction_commit();
>>               /* This is the end of migration */
>>               goto out;
>>           default:
>> -- 
>> 2.20.1
>>
Peter, Thanks a lot for your advice! Hope for more suggestions from you!

--------------IaqhhZXsZs8qVALOTX2FvYBO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Re: [RFC PATCH] migration: reduce time of loading
      non-iterable vmstate</title>
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/11/25 上午12:40, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y3+egjXTvLEHDjuT@x1n">
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

Signed-off-by: Chuang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuchuangxclwt@bytedance.com">&lt;xuchuangxclwt@bytedance.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is an interesting idea..  I think it means at least the address space
operations will all be messed up if happening during the precopy loading</pre>
    </blockquote>
    <pre>Sorry, I don't quite understand the meaning of "messed up" here.. Maybe I need 
more information about how the address space operations will be messed up.</pre>
    <blockquote type="cite" cite="mid:Y3+egjXTvLEHDjuT@x1n">
      <pre class="moz-quote-pre" wrap="">
progress, but I don't directly see its happening either.  For example, in
most post_load()s of vmsd I think the devices should just write directly to
its buffers, accessing MRs directly, even if they want DMAs or just update
fields to correct states.  Even so, I'm not super confident that holds</pre>
    </blockquote>
    <pre>And I'm not sure whether the "its happening" means "begin/commit happening" 
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
#16 0x0000000000000000 in ?? ()</pre>
    <blockquote type="cite" cite="mid:Y3+egjXTvLEHDjuT@x1n">
      <pre class="moz-quote-pre" wrap="">
true, not to mention any other side effects (e.g., would we release bql
during precopy for any reason?).

Copy Paolo and PeterM for some extra eyes.

</pre>
    </blockquote>
    <pre>What I observe is that during the loading process, migration thread will call Condwait to 
wait for the vcpu threads to complete tasks, such as kvm_apic_post_load, and rcu thread 
will acquire the bql to do the flatview_destroy operation. So far, I haven't seen the 
side effects of these two situations.
</pre>
    <blockquote type="cite" cite="mid:Y3+egjXTvLEHDjuT@x1n">
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
      <pre class="moz-quote-pre" wrap="">
This is slightly hacky to me.  Can we just wrap the begin/commit inside the
whole qemu_loadvm_state_main() call?</pre>
    </blockquote>
    <pre>The iterative copy phase doesn't call begin/commit, so There seems to be no essential 
difference between these two codes. I did try to wrap the begin/commit inside the whole 
qemu_loadvm_state_main() call, this way also worked well. 
But only calling begin/commit before/after the period of loading non-iterable vmstate may
have less unkown side effect?
</pre>
    <blockquote type="cite" cite="mid:Y3+egjXTvLEHDjuT@x1n">
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
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <pre>Peter, Thanks a lot for your advice! Hope for more suggestions from you!</pre>
  </body>
</html>

--------------IaqhhZXsZs8qVALOTX2FvYBO--

