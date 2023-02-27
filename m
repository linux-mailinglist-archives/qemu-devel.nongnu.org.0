Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E356A427B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:20:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdQ9-0006Zw-Rr; Mon, 27 Feb 2023 08:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pWdQ4-0006Yr-MC
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:19:58 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pWdQ1-0004Hp-5b
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:19:56 -0500
Received: by mail-pj1-x1036.google.com with SMTP id c23so6056181pjo.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 05:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XtE9fvlV7pqBeGAD5/ezGvGGylsiCW/Dl/TXHvC4JKk=;
 b=QrfKT4qv8fazbFfn5F16hbdcbxxYltoJyE5Azckmf6o6TM4ZsWuQ4OUJ65GJSKkwc6
 Wnvk4KDduIjEWgAONogWu665aQW5IRjAwKgsKe1dWWGxoCQLAB5jOPQQYvEsYErm9AoF
 813+3XcYozZJx+kiyWwAOb+2IzypXW3nH/IYouNxXD1jjwDU5t3hR12FOAZ6PqQJIsg2
 VXvqQ1qF+MzOk+rZIDqCZdQ8gd4eXrQjwe9zg8eAbPbmmOHJsD+LcSwPt+u/guERC6WV
 CLAwwbBNtWLwj8KocEpuE39enHw40CdSJ02xBTVsmZ1i8LMoe0Ie5zquGfaJC/6ZQz0w
 IJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XtE9fvlV7pqBeGAD5/ezGvGGylsiCW/Dl/TXHvC4JKk=;
 b=uSpL9W0J/iCit8cKd4NP+8KmF7RFB62Ftbaur+YXDpMuCa6ud48JUsDbLydvcnC6zY
 oAk2UIXLWKa6G7Mu3entoi80Clw2xm29XMyy/8OGOs1fp5+Obu9iXo7JJXNj2B4sUWar
 ZdCCrVKNRu7PLavxVY+CQ5yIpalciDWAYFjETcH19e4kGP2x4/V0+ugU7DPBTJU+f37G
 a4ZUWLf2nXfTdWQghYkCoL3dZUFqW2gGysJfnoEKFT9rhBpjVGX20mZdQWIp3xfCNod6
 YAvlcEXpwSZbrO0nnW3g9aB9hXC5O2YuDvMGV0T7UhPDbpfGTWCQvfYHCq1l7SXA4T44
 xYww==
X-Gm-Message-State: AO0yUKXLEm3jp6eAzx3mYUimf2Ak9APnWGfl4BZs0EhVqUsb/rccdcY1
 zyT4rFWKzooOdaVt+f2dGXueqw==
X-Google-Smtp-Source: AK7set8YG3rN+8T0FVYs9xCZghz6xNlDBgGkuEDIO3sdOoUJpRet07MhbwlHOMSTIMkcfxpiyFGAQQ==
X-Received: by 2002:a17:903:64f:b0:19c:b11b:ffca with SMTP id
 kh15-20020a170903064f00b0019cb11bffcamr15203347plb.23.1677503986198; 
 Mon, 27 Feb 2023 05:19:46 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a17090331d800b00192c5327021sm4597047ple.200.2023.02.27.05.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 05:19:45 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------dCMGRXS9yZIw1F8qV0q0pvHv"
Message-ID: <12113de1-ad85-2bdc-aa94-2e8a565c848c@bytedance.com>
Date: Mon, 27 Feb 2023 21:19:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <877cwizqvy.fsf@secure.mitica>
 <a555b989-27be-006e-0d00-9f1688c5be4e@bytedance.com>
 <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com> <Y++i1NmxUxOPDM/V@x1n>
 <76a253ef-6989-f92d-cb33-6456a270a8d1@bytedance.com>
 <51d862b2-96be-0b93-7ed2-fcd15ffaa76e@bytedance.com> <Y/UrXwRK7rB2KRKO@x1n>
 <44f02b6f-2809-5e2d-bbc4-e4a43a4a8b75@bytedance.com> <Y/Y7Txt3Utq5AfbZ@x1n>
 <e748090b-3053-17f1-66f6-15d24b70170b@bytedance.com> <Y/op+bM6IimMTvIx@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y/op+bM6IimMTvIx@x1n>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
--------------dCMGRXS9yZIw1F8qV0q0pvHv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Peter

On 2023/2/25 下午11:32, Peter Xu wrote:
> On Thu, Feb 23, 2023 at 11:28:46AM +0800, Chuang Xu wrote:
>> Hi, Peter
> Hi, Chuang,
>
>> On 2023/2/22 下午11:57, Peter Xu wrote:
> I don't see why it's wrong, and that's exactly what I wanted to guarantee,
> that if memory_region_update_pending==true when updating ioeventfd, we may
> have some serios problem.
>
> For this, I split my patch into two parts and I put this change into the
> last patch.  See the attachment.  If you worry about this, you can e.g. try
> applying patch 1 only later, but I still don't see why it could.

Sorry, I made some mistakes in my previous understanding of the code. However,
if this assertion is added, it will indeed trigger some coredump in qtest with
my patches. Here is the coredump(This is the only one I found):

#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1  0x00007fa5e7b17535 in __GI_abort () at abort.c:79
#2  0x00007fa5e7b1740f in __assert_fail_base (fmt=0x7fa5e7c78ef0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
     assertion=0x56305fc02d60 "qemu_mutex_iothread_locked() && !memory_region_update_pending", file=0x56305fc028cb "../softmmu/memory.c", line=855, function=<optimized out>) at assert.c:92
#3  0x00007fa5e7b251a2 in __GI___assert_fail (assertion=assertion@entry=0x56305fc02d60 "qemu_mutex_iothread_locked() && !memory_region_update_pending",
     file=file@entry=0x56305fc028cb "../softmmu/memory.c", line=line@entry=855, function=function@entry=0x56305fc03cc0 <__PRETTY_FUNCTION__.38596> "address_space_update_ioeventfds")
     at assert.c:101
#4  0x000056305f8a9194 in address_space_update_ioeventfds (as=as@entry=0x563061293648) at ../softmmu/memory.c:855
#5  0x000056305f8afe4f in address_space_init (as=as@entry=0x563061293648, root=root@entry=0x5630612936a0, name=name@entry=0x5630612934f0 "virtio-net-pci") at ../softmmu/memory.c:3172
#6  0x000056305f686e43 in do_pci_register_device (errp=0x7fa5e4f39850, devfn=<optimized out>, name=0x563061011c40 "virtio-net-pci", pci_dev=0x563061293410) at ../hw/pci/pci.c:1145
#7  pci_qdev_realize (qdev=0x563061293410, errp=0x7fa5e4f39850) at ../hw/pci/pci.c:2036
#8  0x000056305f939daf in device_set_realized (obj=<optimized out>, value=true, errp=0x7fa5e4f39ae0) at ../hw/core/qdev.c:510
#9  0x000056305f93d156 in property_set_bool (obj=0x563061293410, v=<optimized out>, name=<optimized out>, opaque=0x5630610221d0, errp=0x7fa5e4f39ae0) at ../qom/object.c:2285
#10 0x000056305f93f403 in object_property_set (obj=obj@entry=0x563061293410, name=name@entry=0x56305fba6bc3 "realized", v=v@entry=0x563061e52a00, errp=errp@entry=0x7fa5e4f39ae0)
     at ../qom/object.c:1420
#11 0x000056305f94247f in object_property_set_qobject (obj=obj@entry=0x563061293410, name=name@entry=0x56305fba6bc3 "realized", value=value@entry=0x563061e61cb0,
     errp=errp@entry=0x7fa5e4f39ae0) at ../qom/qom-qobject.c:28
#12 0x000056305f93f674 in object_property_set_bool (obj=0x563061293410, name=name@entry=0x56305fba6bc3 "realized", value=value@entry=true, errp=errp@entry=0x7fa5e4f39ae0)
     at ../qom/object.c:1489
#13 0x000056305f93959c in qdev_realize (dev=<optimized out>, bus=bus@entry=0x563061c9c400, errp=errp@entry=0x7fa5e4f39ae0) at ../hw/core/qdev.c:292
#14 0x000056305f7244a0 in qdev_device_add_from_qdict (opts=0x563061e64c00, from_json=<optimized out>, errp=<optimized out>, errp@entry=0x7fa5e4f39ae0)
     at /data00/migration/qemu-open/include/hw/qdev-core.h:17
#15 0x000056305f846c75 in failover_add_primary (errp=0x7fa5e4f39ad8, n=0x563062043530) at ../hw/net/virtio-net.c:933
#16 virtio_net_set_features (vdev=<optimized out>, features=4611687122246533156) at ../hw/net/virtio-net.c:1004
#17 0x000056305f872238 in virtio_set_features_nocheck (vdev=vdev@entry=0x563062043530, val=val@entry=4611687122246533156) at ../hw/virtio/virtio.c:2851
#18 0x000056305f877e9e in virtio_load (vdev=0x563062043530, f=0x56306125bde0, version_id=11) at ../hw/virtio/virtio.c:3027
#19 0x000056305f73c601 in vmstate_load_state (f=f@entry=0x56306125bde0, vmsd=0x56305fef16c0 <vmstate_virtio_net>, opaque=0x563062043530, version_id=11) at ../migration/vmstate.c:137
#20 0x000056305f757672 in vmstate_load (f=0x56306125bde0, se=0x563062176700) at ../migration/savevm.c:919
#21 0x000056305f757905 in qemu_loadvm_section_start_full (f=f@entry=0x56306125bde0, mis=0x56306101d3e0) at ../migration/savevm.c:2503
#22 0x000056305f75aca8 in qemu_loadvm_state_main (f=f@entry=0x56306125bde0, mis=mis@entry=0x56306101d3e0) at ../migration/savevm.c:2719
#23 0x000056305f75c17a in qemu_loadvm_state (f=0x56306125bde0) at ../migration/savevm.c:2809
#24 0x000056305f74980e in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:606
#25 0x000056305fab25cb in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177

> I really think changing depth is a hack... :(
>
> Here IMHO the problem is we have other missing calls to
> address_space_to_flatview() during commit() and that caused the issue.
> There aren't a lot of those, and sorry to miss yet another one.
>
> So let me try one more time on this (with patch 1; I think I've got two
> places missed in the previous attempt).  Let's see how it goes.
>
> We may want to add a tracepoint or have some way to know when enfornced
> commit() is triggered during the vm load phase.  I just noticed when you
> worried about having enforced commit() to often then it beats the original
> purpose and I think yes that's something to worry.
>
> I still believe AHCI condition is rare (since e.g. you've passed all Juan's
> tests even before we have this "do_commit" stuff), but in short: I think it
> would still be interesting if you can capture all the users of enforced
> commit() like the AHCI case you quoted before, and list them in the cover
> letter in your next post (along with a new perf measurements, to make sure
> your worry is not true on having too much enforced commit will invalid the
> whole idea).
>
> When I was digging this out, I also found some RCU issue when using
> address_space_to_flatview() (when BQL was not taken), only in the
> memory_region_clear_dirty_bitmap() path.  I hope the new assertion
> (rcu_read_is_locked()) won't trigger on some of the use cases for you
> already, but anyway feel free to ignore this whole paragraph for now until
> if you see some assert(rcu_read_is_locked()) being triggered.  I plan to
> post some RFC for fixing RCU and I'll have you copied just for reference
> (may be separate issue as what you're working on).
>
> Thanks,
>
Unfortunately, there is another case of stack overflow...

#8  memory_region_transaction_do_commit () at ../softmmu/memory.c:1145
#9  0x00005610e96d3665 in address_space_to_flatview (as=0x5610e9ece820 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1119
#10 address_space_get_flatview (as=0x5610e9ece820 <address_space_memory>) at ../softmmu/memory.c:818
#11 0x00005610e96dfa14 in address_space_cache_init (cache=cache@entry=0x56111cdee410, as=<optimized out>, addr=addr@entry=1048576, len=len@entry=4096, is_write=false)
     at ../softmmu/physmem.c:3350
#12 0x00005610e96a0928 in virtio_init_region_cache (vdev=vdev@entry=0x5610eb72bf10, n=n@entry=0) at ../hw/virtio/virtio.c:247
#13 0x00005610e96a0db4 in virtio_memory_listener_commit (listener=0x5610eb72bff8) at ../hw/virtio/virtio.c:3592
#14 0x00005610e96d2e5e in address_space_update_flatviews_all () at ../softmmu/memory.c:1126
#15 memory_region_transaction_do_commit () at ../softmmu/memory.c:1145

Fortunately, this is probably the last one (at least according to the qtest results)😁.

BTW, Perhaps you can define do_commit as a non-static function? Because I'll use it in
address_space_to_flatview later.

My v6 patches are attached. If necessary, you can apply them and make some test.

Thanks!

--------------dCMGRXS9yZIw1F8qV0q0pvHv
Content-Type: text/plain; charset=UTF-8;
 name="v6-0001-rcu-introduce-rcu_read_is_locked.patch"
Content-Disposition: attachment;
 filename="v6-0001-rcu-introduce-rcu_read_is_locked.patch"
Content-Transfer-Encoding: base64

RnJvbSA0NGVjNjYzYzA0ZWQ1NDI4NGNkZWU0ZDQzNDBiYmM0MjFjZGU4MmM2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDaHVhbmcgWHUgPHh1Y2h1YW5neGNsd3RAYnl0ZWRh
bmNlLmNvbT4KRGF0ZTogVGh1LCAyMiBEZWMgMjAyMiAyMjozNzo1MCArMDgwMApTdWJqZWN0
OiBbUEFUQ0ggdjYgMS8zXSByY3U6IGludHJvZHVjZSByY3VfcmVhZF9pc19sb2NrZWQoKQoK
YWRkIHJjdV9yZWFkX2lzX2xvY2tlZCgpIHRvIGRldGVjdCBob2xkaW5nIG9mIHJjdSBsb2Nr
LgoKU2lnbmVkLW9mZi1ieTogQ2h1YW5nIFh1IDx4dWNodWFuZ3hjbHd0QGJ5dGVkYW5jZS5j
b20+Ci0tLQogaW5jbHVkZS9xZW11L3JjdS5oIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9xZW11L3JjdS5oIGIv
aW5jbHVkZS9xZW11L3JjdS5oCmluZGV4IGIwNjNjNmZkZTguLjcxOTkxNmQ5ZDMgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvcWVtdS9yY3UuaAorKysgYi9pbmNsdWRlL3FlbXUvcmN1LmgKQEAg
LTExOSw2ICsxMTksMTMgQEAgc3RhdGljIGlubGluZSB2b2lkIHJjdV9yZWFkX3VubG9jayh2
b2lkKQogICAgIH0KIH0KIAorc3RhdGljIGlubGluZSBib29sIHJjdV9yZWFkX2lzX2xvY2tl
ZCh2b2lkKQoreworICAgIHN0cnVjdCByY3VfcmVhZGVyX2RhdGEgKnBfcmN1X3JlYWRlciA9
IGdldF9wdHJfcmN1X3JlYWRlcigpOworCisgICAgcmV0dXJuIHBfcmN1X3JlYWRlci0+ZGVw
dGggPiAwOworfQorCiBleHRlcm4gdm9pZCBzeW5jaHJvbml6ZV9yY3Uodm9pZCk7CiAKIC8q
Ci0tIAoyLjIwLjEKCg==
--------------dCMGRXS9yZIw1F8qV0q0pvHv
Content-Type: text/plain; charset=UTF-8;
 name="v6-0002-memory-add-sanity-check-in-address_space_to_flatv.patch"
Content-Disposition: attachment;
 filename*0="v6-0002-memory-add-sanity-check-in-address_space_to_flatv.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAwOTYzMzg1ZmI2ZmY5MTA2ZWVjNjg4NmQzMTE2MDFiYmUwZTkxN2FiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDaHVhbmcgWHUgPHh1Y2h1YW5neGNsd3RAYnl0ZWRh
bmNlLmNvbT4KRGF0ZTogTW9uLCAxMiBEZWMgMjAyMiAxMToyNDoyNSArMDgwMApTdWJqZWN0
OiBbUEFUQ0ggdjYgMi8zXSBtZW1vcnk6IGFkZCBzYW5pdHkgY2hlY2sgaW4gYWRkcmVzc19z
cGFjZV90b19mbGF0dmlldwoKQmVmb3JlIHVzaW5nIGFueSBmbGF0dmlldywgc2FuaXR5IGNo
ZWNrIHdoZXRoZXIgQlFMIG9yIHJjdSBpcyBoZWxkLiBBbmQKaWYgd2UncmUgZHVyaW5nIGEg
bWVtb3J5IHJlZ2lvbiB0cmFuc2FjdGlvbiwgdHJ5IHRvIGltbWVkaWF0ZWx5IHVwZGF0ZQpt
YXBwaW5ncywgb3IgdGhlIG1hcCBjYW4gYmUgaW52YWxpZC4KClNpZ25lZC1vZmYtYnk6IENo
dWFuZyBYdSA8eHVjaHVhbmd4Y2x3dEBieXRlZGFuY2UuY29tPgotLS0KIGluY2x1ZGUvZXhl
Yy9tZW1vcnkuaCB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCiBzb2Z0bW11L21lbW9y
eS5jICAgICAgfCAgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL21lbW9yeS5oIGIvaW5jbHVkZS9leGVjL21l
bW9yeS5oCmluZGV4IDJlNjAyYTJmYWQuLjg0YjUzMWM2ZmYgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZXhlYy9tZW1vcnkuaAorKysgYi9pbmNsdWRlL2V4ZWMvbWVtb3J5LmgKQEAgLTI3LDYg
KzI3LDcgQEAKICNpbmNsdWRlICJxZW11L25vdGlmeS5oIgogI2luY2x1ZGUgInFvbS9vYmpl
Y3QuaCIKICNpbmNsdWRlICJxZW11L3JjdS5oIgorI2luY2x1ZGUgInFlbXUvbWFpbi1sb29w
LmgiCiAKICNkZWZpbmUgUkFNX0FERFJfSU5WQUxJRCAofihyYW1fYWRkcl90KTApCiAKQEAg
LTEwOTUsOCArMTA5NiwzMCBAQCBzdHJ1Y3QgRmxhdFZpZXcgewogICAgIE1lbW9yeVJlZ2lv
biAqcm9vdDsKIH07CiAKK2Jvb2wgbWVtb3J5X3JlZ2lvbl90cmFuc2FjdGlvbl9pbl9wcm9n
cmVzcyh2b2lkKTsKKwordm9pZCBtZW1vcnlfcmVnaW9uX3RyYW5zYWN0aW9uX2RvX2NvbW1p
dCh2b2lkKTsKKwogc3RhdGljIGlubGluZSBGbGF0VmlldyAqYWRkcmVzc19zcGFjZV90b19m
bGF0dmlldyhBZGRyZXNzU3BhY2UgKmFzKQogeworICAgIGlmIChxZW11X211dGV4X2lvdGhy
ZWFkX2xvY2tlZCgpKSB7CisgICAgICAgIC8qIFdlIGV4Y2x1c2l2ZWx5IG93biB0aGUgZmxh
dHZpZXcgbm93Li4gKi8KKyAgICAgICAgaWYgKG1lbW9yeV9yZWdpb25fdHJhbnNhY3Rpb25f
aW5fcHJvZ3Jlc3MoKSkgeworICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAqIEZldGNo
IHRoZSBmbGF0dmlldyB3aXRoaW4gYSB0cmFuc2FjdGlvbiBpbi1wcm9ncmVzcywgaXQKKyAg
ICAgICAgICAgICAqIG1lYW5zIGN1cnJlbnRfbWFwIG1heSBub3QgYmUgdGhlIGxhdGVzdCwg
d2UgbmVlZCB0byB1cGRhdGUKKyAgICAgICAgICAgICAqIGltbWVkaWF0ZWx5IHRvIG1ha2Ug
c3VyZSB0aGUgY2FsbGVyIHdvbid0IHNlZSBvYnNvbGV0ZQorICAgICAgICAgICAgICogbWFw
cGluZy4KKyAgICAgICAgICAgICAqLworICAgICAgICAgICAgbWVtb3J5X3JlZ2lvbl90cmFu
c2FjdGlvbl9kb19jb21taXQoKTsKKyAgICAgICAgfQorCisgICAgICAgIC8qIE5vIGZ1cnRo
ZXIgcHJvdGVjdGlvbiBuZWVkZWQgdG8gYWNjZXNzIGN1cnJlbnRfbWFwICovCisgICAgICAg
IHJldHVybiBhcy0+Y3VycmVudF9tYXA7CisgICAgfQorCisgICAgLyogT3RoZXJ3aXNlIHdl
IG11c3QgaGF2ZSBoYWQgdGhlIFJDVSBsb2NrIG9yIHNvbWV0aGluZyB3ZW50IHdyb25nICov
CisgICAgYXNzZXJ0KHJjdV9yZWFkX2lzX2xvY2tlZCgpKTsKICAgICByZXR1cm4gcWF0b21p
Y19yY3VfcmVhZCgmYXMtPmN1cnJlbnRfbWFwKTsKIH0KIApkaWZmIC0tZ2l0IGEvc29mdG1t
dS9tZW1vcnkuYyBiL3NvZnRtbXUvbWVtb3J5LmMKaW5kZXggZTUzOGYyZmU1Ny4uNWE4NGY2
MDhlZCAxMDA2NDQKLS0tIGEvc29mdG1tdS9tZW1vcnkuYworKysgYi9zb2Z0bW11L21lbW9y
eS5jCkBAIC0xMTQ2LDYgKzExNDYsMTEgQEAgdm9pZCBtZW1vcnlfcmVnaW9uX3RyYW5zYWN0
aW9uX2NvbW1pdCh2b2lkKQogICAgIH0KIH0KIAorYm9vbCBtZW1vcnlfcmVnaW9uX3RyYW5z
YWN0aW9uX2luX3Byb2dyZXNzKHZvaWQpCit7CisgICAgcmV0dXJuIG1lbW9yeV9yZWdpb25f
dHJhbnNhY3Rpb25fZGVwdGggIT0gMDsKK30KKwogc3RhdGljIHZvaWQgbWVtb3J5X3JlZ2lv
bl9kZXN0cnVjdG9yX25vbmUoTWVtb3J5UmVnaW9uICptcikKIHsKIH0KLS0gCjIuMjAuMQoK

--------------dCMGRXS9yZIw1F8qV0q0pvHv
Content-Type: text/plain; charset=UTF-8;
 name="v6-0003-migration-reduce-time-of-loading-non-iterable-vms.patch"
Content-Disposition: attachment;
 filename*0="v6-0003-migration-reduce-time-of-loading-non-iterable-vms.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAxNzY5NjYxMjAzYzQ1MDk0MWQyZTQzZWJmZDM4YjJkNWFkNmY1MzQ2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDaHVhbmcgWHUgPHh1Y2h1YW5neGNsd3RAYnl0ZWRh
bmNlLmNvbT4KRGF0ZTogVGh1LCAxNyBOb3YgMjAyMiAxNzo1MzoxOSArMDgwMApTdWJqZWN0
OiBbUEFUQ0ggdjYgMy8zXSBtaWdyYXRpb246IHJlZHVjZSB0aW1lIG9mIGxvYWRpbmcgbm9u
LWl0ZXJhYmxlIHZtc3RhdGUKClRoZSBkdXJhdGlvbiBvZiBsb2FkaW5nIG5vbi1pdGVyYWJs
ZSB2bXN0YXRlIGFjY291bnRzIGZvciBhIHNpZ25pZmljYW50CnBvcnRpb24gb2YgZG93bnRp
bWUgKHN0YXJ0aW5nIHdpdGggdGhlIHRpbWVzdGFtcCBvZiBzb3VyY2UgcWVtdSBzdG9wIGFu
ZAplbmRpbmcgd2l0aCB0aGUgdGltZXN0YW1wIG9mIHRhcmdldCBxZW11IHN0YXJ0KS4gTW9z
dCBvZiB0aGUgdGltZSBpcyBzcGVudApjb21taXR0aW5nIG1lbW9yeSByZWdpb24gY2hhbmdl
cyByZXBlYXRlZGx5LgoKVGhpcyBwYXRjaCBwYWNrcyBhbGwgdGhlIGNoYW5nZXMgdG8gbWVt
b3J5IHJlZ2lvbiBkdXJpbmcgdGhlIHBlcmlvZCBvZgpsb2FkaW5nIG5vbi1pdGVyYWJsZSB2
bXN0YXRlIGluIGEgc2luZ2xlIG1lbW9yeSB0cmFuc2FjdGlvbi4gV2l0aCB0aGUKaW5jcmVh
c2Ugb2YgZGV2aWNlcywgdGhpcyBwYXRjaCB3aWxsIGdyZWF0bHkgaW1wcm92ZSB0aGUgcGVy
Zm9ybWFuY2UuCgpIZXJlIGFyZSB0aGUgdGVzdDEgcmVzdWx0czoKdGVzdCBpbmZvOgotIEhv
c3QKICAtIEludGVsKFIpIFhlb24oUikgUGxhdGludW0gODI2MCBDUFUKICAtIE5WSURJQSBN
ZWxsYW5veCBDb25uZWN0WC01Ci0gVk0KICAtIDMyIENQVXMgMTI4R0IgUkFNIFZNCiAgLSA4
IDE2LXF1ZXVlIHZob3N0LW5ldCBkZXZpY2UKICAtIDE2IDQtcXVldWUgdmhvc3QtdXNlci1i
bGsgZGV2aWNlLgoKCXRpbWUgb2YgbG9hZGluZyBub24taXRlcmFibGUgdm1zdGF0ZSAgICAg
ZG93bnRpbWUKYmVmb3JlCQlhYm91dCAxNTAgbXMJCQkgIDc0MCsgbXMKYWZ0ZXIJCWFib3V0
IDMwIG1zCQkJICA2MzArIG1zCgpJbiB0ZXN0Miwgd2Uga2VlcCB0aGUgbnVtYmVyIG9mIHRo
ZSBkZXZpY2UgdGhlIHNhbWUgYXMgdGVzdDEsIHJlZHVjZSB0aGUKbnVtYmVyIG9mIHF1ZXVl
cyBwZXIgZGV2aWNlOgoKSGVyZSBhcmUgdGhlIHRlc3QyIHJlc3VsdHM6CnRlc3QgaW5mbzoK
LSBIb3N0CiAgLSBJbnRlbChSKSBYZW9uKFIpIFBsYXRpbnVtIDgyNjAgQ1BVCiAgLSBOVklE
SUEgTWVsbGFub3ggQ29ubmVjdFgtNQotIFZNCiAgLSAzMiBDUFVzIDEyOEdCIFJBTSBWTQog
IC0gOCAxLXF1ZXVlIHZob3N0LW5ldCBkZXZpY2UKICAtIDE2IDEtcXVldWUgdmhvc3QtdXNl
ci1ibGsgZGV2aWNlLgoKCXRpbWUgb2YgbG9hZGluZyBub24taXRlcmFibGUgdm1zdGF0ZSAg
ICAgZG93bnRpbWUKYmVmb3JlCQlhYm91dCA5MCBtcwkJCSBhYm91dCAyNTAgbXMKCmFmdGVy
CQlhYm91dCAyNSBtcwkJCSBhYm91dCAxNjAgbXMKCkluIHRlc3QzLCB3ZSBrZWVwIHRoZSBu
dW1iZXIgb2YgcXVldWVzIHBlciBkZXZpY2UgdGhlIHNhbWUgYXMgdGVzdDEsIHJlZHVjZQp0
aGUgbnVtYmVyIG9mIGRldmljZXM6CgpIZXJlIGFyZSB0aGUgdGVzdDMgcmVzdWx0czoKdGVz
dCBpbmZvOgotIEhvc3QKICAtIEludGVsKFIpIFhlb24oUikgUGxhdGludW0gODI2MCBDUFUK
ICAtIE5WSURJQSBNZWxsYW5veCBDb25uZWN0WC01Ci0gVk0KICAtIDMyIENQVXMgMTI4R0Ig
UkFNIFZNCiAgLSAxIDE2LXF1ZXVlIHZob3N0LW5ldCBkZXZpY2UKICAtIDEgNC1xdWV1ZSB2
aG9zdC11c2VyLWJsayBkZXZpY2UuCgoJdGltZSBvZiBsb2FkaW5nIG5vbi1pdGVyYWJsZSB2
bXN0YXRlICAgICBkb3dudGltZQpiZWZvcmUJCWFib3V0IDIwIG1zCQkJIGFib3V0IDcwIG1z
CmFmdGVyCQlhYm91dCAxMSBtcwkJCSBhYm91dCA2MCBtcwoKQXMgd2UgY2FuIHNlZSBmcm9t
IHRoZSB0ZXN0IHJlc3VsdHMgYWJvdmUsIGJvdGggdGhlIG51bWJlciBvZiBxdWV1ZXMgYW5k
CnRoZSBudW1iZXIgb2YgZGV2aWNlcyBoYXZlIGEgZ3JlYXQgaW1wYWN0IG9uIHRoZSB0aW1l
IG9mIGxvYWRpbmcgbm9uLWl0ZXJhYmxlCnZtc3RhdGUuIFRoZSBncm93dGggb2YgdGhlIG51
bWJlciBvZiBkZXZpY2VzIGFuZCBxdWV1ZXMgd2lsbCBsZWFkIHRvIG1vcmUKbXIgY29tbWl0
cywgYW5kIHRoZSB0aW1lIGNvbnN1bXB0aW9uIGNhdXNlZCBieSB0aGUgZmxhdHZpZXcgcmVj
b25zdHJ1Y3Rpb24Kd2lsbCBhbHNvIGluY3JlYXNlLgoKU2lnbmVkLW9mZi1ieTogQ2h1YW5n
IFh1IDx4dWNodWFuZ3hjbHd0QGJ5dGVkYW5jZS5jb20+Ci0tLQogbWlncmF0aW9uL3NhdmV2
bS5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9taWdyYXRpb24vc2F2ZXZtLmMgYi9taWdyYXRpb24v
c2F2ZXZtLmMKaW5kZXggYjVlNjk2MmJiNi4uM2RkOWRhYWJkOCAxMDA2NDQKLS0tIGEvbWln
cmF0aW9uL3NhdmV2bS5jCisrKyBiL21pZ3JhdGlvbi9zYXZldm0uYwpAQCAtMjc3MCw2ICsy
NzcwLDcgQEAgb3V0OgogICAgICAgICAgICAgZ290byByZXRyeTsKICAgICAgICAgfQogICAg
IH0KKwogICAgIHJldHVybiByZXQ7CiB9CiAKQEAgLTI3OTUsNyArMjc5NiwyNSBAQCBpbnQg
cWVtdV9sb2Fkdm1fc3RhdGUoUUVNVUZpbGUgKmYpCiAKICAgICBjcHVfc3luY2hyb25pemVf
YWxsX3ByZV9sb2Fkdm0oKTsKIAorICAgIC8qCisgICAgICogQ2FsbCBtZW1vcnlfcmVnaW9u
X3RyYW5zYWN0aW9uX2JlZ2luKCkgYmVmb3JlIGxvYWRpbmcgdm1zdGF0ZS4KKyAgICAgKiBU
aGlzIGNhbGwgaXMgcGFpcmVkIHdpdGggbWVtb3J5X3JlZ2lvbl90cmFuc2FjdGlvbl9jb21t
aXQoKSBhdAorICAgICAqIHRoZSBlbmQgb2YgcWVtdV9sb2Fkdm1fc3RhdGVfbWFpbigpLCBp
biBvcmRlciB0byBwYWNrIGFsbCB0aGUKKyAgICAgKiBjaGFuZ2VzIHRvIG1lbW9yeSByZWdp
b24gZHVyaW5nIHRoZSBwZXJpb2Qgb2YgbG9hZGluZworICAgICAqIG5vbi1pdGVyYWJsZSB2
bXN0YXRlIGluIGEgc2luZ2xlIG1lbW9yeSB0cmFuc2FjdGlvbi4KKyAgICAgKiBUaGlzIG9w
ZXJhdGlvbiB3aWxsIHJlZHVjZSB0aW1lIG9mIGxvYWRpbmcgbm9uLWl0ZXJhYmxlIHZtc3Rh
dGUKKyAgICAgKi8KKyAgICBtZW1vcnlfcmVnaW9uX3RyYW5zYWN0aW9uX2JlZ2luKCk7CisK
ICAgICByZXQgPSBxZW11X2xvYWR2bV9zdGF0ZV9tYWluKGYsIG1pcyk7CisKKyAgICAvKgor
ICAgICAqIENhbGwgbWVtb3J5X3JlZ2lvbl90cmFuc2FjdGlvbl9jb21taXQoKSBhZnRlciBs
b2FkaW5nIHZtc3RhdGUuCisgICAgICogQXQgdGhpcyBwb2ludCwgcWVtdSBhY3R1YWxseSBj
b21wbGV0ZXMgYWxsIHRoZSBwcmV2aW91cyBtZW1vcnkKKyAgICAgKiByZWdpb24gdHJhbnNh
Y3Rpb25zLgorICAgICAqLworICAgIG1lbW9yeV9yZWdpb25fdHJhbnNhY3Rpb25fY29tbWl0
KCk7CisKICAgICBxZW11X2V2ZW50X3NldCgmbWlzLT5tYWluX3RocmVhZF9sb2FkX2V2ZW50
KTsKIAogICAgIHRyYWNlX3FlbXVfbG9hZHZtX3N0YXRlX3Bvc3RfbWFpbihyZXQpOwotLSAK
Mi4yMC4xCgo=

--------------dCMGRXS9yZIw1F8qV0q0pvHv--

