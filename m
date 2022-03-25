Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064524E6FA7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 09:52:29 +0100 (CET)
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXfgJ-0003xz-Ib
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 04:52:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXfex-000316-1e
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 04:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXfet-0007BY-Ks
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 04:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648198257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JDSdldZWFhDS4Y/l8keya9lrM3oqmaBmljEDDBimYI=;
 b=IXrbFNplOXCxxtD7AKM/MT0fSdjdIrK/0wszSDWD6kllkJopI0PF5iWSL/WPzTC5mFKWS5
 weHF2poeew/FMWDOcWxbbvF3mw6UyofpkzxZ/w89TNbpWDQkIRP2OTsMYBaUlcDBPk8IOi
 kI4UoWKJQ0FHBRXgebCrRpSlnYz3w4Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-TuJQYiPgNYK3rFEJuHS2nQ-1; Fri, 25 Mar 2022 04:50:56 -0400
X-MC-Unique: TuJQYiPgNYK3rFEJuHS2nQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 h22-20020a1709060f5600b006b11a2d3dcfso3783221ejj.4
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 01:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0JDSdldZWFhDS4Y/l8keya9lrM3oqmaBmljEDDBimYI=;
 b=JFe8w8w1R/cc8RJLrqaTYKTTlC0cXOKvSki3KJzDnSfxHo+g/5NaarAP0kP1hpZ9ZP
 ssRLurrW+Ho4V9ZI56C9cxP9zzWU+Gg91LAm370CpfvJ2Q8d+to6Hm8r2NDJHrNoXZm2
 K7JQhLOuVhEufx+K06aaiGETT3vZ9a4UbliL1/tCYLqtmynnkxqrab0+Kx8p+BGP1GA6
 5VDCURiDpjZZ0jKvyi5et7GLYNAEzVCT4+1+IWP2+5Yt6NfxImhnQQxb3NzfgZNm1kAZ
 t7r4fDwPwVy6kfOtM8gxy6rfV75A8wSguqyuxeZeLqSjQiHQuQeAdY0qiTvUI/0RohXV
 uX2g==
X-Gm-Message-State: AOAM533fQWZ8EozXWUr8g7CGUw3YyEhV/2ASWoqSt1wp9SQ1YENp+JuZ
 3yeW4wPTbr3J4qDWRBsg4k9YBJWv7kKVb3cMA3ONlmcS/vBoF6FfOB+BwswrGyNFEECnkwEaW6e
 iuLpG2PU+dpTlZ2c=
X-Received: by 2002:a05:6402:3586:b0:419:6059:f016 with SMTP id
 y6-20020a056402358600b004196059f016mr11834816edc.402.1648198254872; 
 Fri, 25 Mar 2022 01:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl2IfWV3LF44X8gd5U2nAm0B7Z/HBFV7akMQN8rtVTKdk4uzhk7OOYntQ9nctGktL+pEEpiA==
X-Received: by 2002:a05:6402:3586:b0:419:6059:f016 with SMTP id
 y6-20020a056402358600b004196059f016mr11834789edc.402.1648198254580; 
 Fri, 25 Mar 2022 01:50:54 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056402190600b00413d03ac4a2sm2745001edz.69.2022.03.25.01.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 01:50:54 -0700 (PDT)
Message-ID: <cbad1fa6-a854-963d-3521-4b5b3ea8193c@redhat.com>
Date: Fri, 25 Mar 2022 09:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] block/stream: Drain subtree around graph change
To: John Snow <jsnow@redhat.com>
References: <20220324140907.17192-1-hreitz@redhat.com>
 <CAFn=p-b_qv16f6rR7T+_fyfETOM+NJmOe0W0XYGJV=k4iqMFAw@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-b_qv16f6rR7T+_fyfETOM+NJmOe0W0XYGJV=k4iqMFAw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.03.22 19:49, John Snow wrote:
> On Thu, Mar 24, 2022 at 10:09 AM Hanna Reitz <hreitz@redhat.com> wrote:
>> When the stream block job cuts out the nodes between top and base in
>> stream_prepare(), it does not drain the subtree manually; it fetches the
>> base node, and tries to insert it as the top node's backing node with
>> bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, and so
>> the actual base node might change (because the base node is actually not
>> part of the stream job) before the old base node passed to
>> bdrv_set_backing_hd() is installed.
>>
>> This has two implications:
>>
>> First, the stream job does not keep a strong reference to the base node.
>> Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
>> because some other block job is drained to finish), we will get a
>> use-after-free.  We should keep a strong reference to that node.
> Does that introduce any possibility of deadlock if we're now keeping a
> strong reference? I guess not, the job can just delete its own
> reference and everything's ... fine, right?

Handling of strong references doesn’t block, bdrv_ref() just increases 
the refcount, and bdrv_unref() decreases it (deleting the node should 
the refcount reach 0).

>> Second, even with such a strong reference, the problem remains that the
>> base node might change before bdrv_set_backing_hd() actually runs and as
>> a result the wrong base node is installed.
> ow

Well, not horrible.  Just means that a node that was supposed to be 
removed is still there.  (So you’ll need to commit again.)

If users pass auto_dismiss=false and dismiss the jobs manually in order 
(which I think is a good idea anyway), this won’t happen.

>> Both effects can be seen in 030's TestParallelOps.test_overlapping_5()
>> case, which has five nodes, and simultaneously streams from the middle
>> node to the top node, and commits the middle node down to the base node.
>> As it is, this will sometimes crash, namely when we encounter the
>> above-described use-after-free.
>
> Is there a BZ# or is this an occasional failure in 030 you saw?

Yep, just occasional failure in 030.

> What
> does failure look like? Does it require anything special to trigger?

Running 030 quite a bunch of times, preferably in parallel as many times 
as you have cores.  (Perhaps disabling all test cases except 
test_overlapping_5() to make it a bit quicker.)

Failure for the use-after-free is that inside of bdrv_set_backing_hd(), 
the base node will just contain garbage and some pointer dereference fails:

#0  bdrv_inherits_from_recursive (parent=parent@entry=0x5614406438e0, 
child=0x8c8c8c8c8c8c8c8c, child@entry=0x5614412d0a70) at ../block.c:3328
#1  bdrv_set_file_or_backing_noperm
     (parent_bs=parent_bs@entry=0x5614406438e0, 
child_bs=child_bs@entry=0x5614412d0a70, 
is_backing=is_backing@entry=true, tran=tran@entry=0x5614414f5f40, 
errp=errp@entry=0x7ffdf44eb810) at ../block.c:3361
#2  0x000056143da61550 in bdrv_set_backing_noperm (errp=0x7ffdf44eb810, 
tran=0x5614414f5f40, backing_hd=0x5614412d0a70, bs=0x5614406438e0) at 
../block.c:3447
#3  bdrv_set_backing_hd (bs=bs@entry=0x5614406438e0, 
backing_hd=backing_hd@entry=0x5614412d0a70, 
errp=errp@entry=0x7ffdf44eb810) at ../block.c:3459
#4  0x000056143dae7778 in stream_prepare (job=0x56144160b6c0) at 
../block/stream.c:78
#5  0x000056143da6a91e in job_prepare (job=0x56144160b6c0) at ../job.c:837
#6  job_txn_apply (fn=<optimized out>, job=0x56144160b6c0) at ../job.c:158
#7  job_do_finalize (job=0x56144160b6c0) at ../job.c:854
#8  0x000056143da6ae02 in job_exit (opaque=0x56144160b6c0) at ../job.c:941

Hanna

>> Taking a strong reference to the base node, we no longer get a crash,
>> but the resuling block graph is less than ideal: The expected result is
>> obviously that all middle nodes are cut out and the base node is the
>> immediate backing child of the top node.  However, if stream_prepare()
>> takes a strong reference to its base node (the middle node), and then
>> the commit job finishes in bdrv_set_backing_hd(), supposedly dropping
>> that middle node, the stream job will just reinstall it again.
>>
>> Therefore, we need to keep the whole subtree drained in
>> stream_prepare(), so that the graph modification it performs is
>> effectively atomic, i.e. that the base node it fetches is still the base
>> node when bdrv_set_backing_hd() sets it as the top node's backing node.
>>
>> Verify this by asserting in said 030's test case that the base node is
>> always the top node's immediate backing child when both jobs are done.
>>
> (Off-topic: Sometimes I dream about having a block graph rendering
> tool that can update step-by-step, so I can visualize what these block
> operations look like. My "working memory" is kind of limited and I get
> sidetracked too easily tracing code. That we have the ability to
> render at a single point is pretty nice, but it's still hard to get
> images from intermediate steps when things happen in tight sequence
> without the chance for intervention.)
>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>> v2:
>> - Oops, the base can be NULL.  Would have noticed if I had ran all test
>>    cases from 030, and not just test_overlapping_5()...
>>    That means that keeping a strong reference to the base node must be
>>    conditional, based on whether there even is a base node or not.
>>    (I mean, technically we do not even need to keep a strong reference to
>>    that node, given that we are in a drained section, but I believe it is
>>    better style to do it anyway.)
>> ---
>>   block/stream.c         | 15 ++++++++++++++-
>>   tests/qemu-iotests/030 |  5 +++++
>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/stream.c b/block/stream.c
>> index 3acb59fe6a..694709bd25 100644
>> --- a/block/stream.c
>> +++ b/block/stream.c
>> @@ -64,7 +64,13 @@ static int stream_prepare(Job *job)
>>       bdrv_cor_filter_drop(s->cor_filter_bs);
>>       s->cor_filter_bs = NULL;
>>
>> +    bdrv_subtree_drained_begin(s->above_base);
>> +
>>       base = bdrv_filter_or_cow_bs(s->above_base);
>> +    if (base) {
>> +        bdrv_ref(base);
>> +    }
>> +
>>       unfiltered_base = bdrv_skip_filters(base);
>>
>>       if (bdrv_cow_child(unfiltered_bs)) {
>> @@ -75,14 +81,21 @@ static int stream_prepare(Job *job)
>>                   base_fmt = unfiltered_base->drv->format_name;
>>               }
>>           }
>> +
>>           bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
>>           ret = bdrv_change_backing_file(unfiltered_bs, base_id, base_fmt, false);
>>           if (local_err) {
>>               error_report_err(local_err);
>> -            return -EPERM;
>> +            ret = -EPERM;
>> +            goto out;
>>           }
>>       }
>>
>> +out:
>> +    if (base) {
>> +        bdrv_unref(base);
>> +    }
>> +    bdrv_subtree_drained_end(s->above_base);
>>       return ret;
>>   }
>>
>> diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
>> index 567bf1da67..14112835ed 100755
>> --- a/tests/qemu-iotests/030
>> +++ b/tests/qemu-iotests/030
>> @@ -436,6 +436,11 @@ class TestParallelOps(iotests.QMPTestCase):
>>           self.vm.run_job(job='node4', auto_dismiss=True)
>>           self.assert_no_active_block_jobs()
>>
>> +        # Assert that node0 is now the backing node of node4
>> +        result = self.vm.qmp('query-named-block-nodes')
>> +        node4 = next(node for node in result['return'] if node['node-name'] == 'node4')
>> +        self.assertEqual(node4['image']['backing-image']['filename'], self.imgs[0])
>> +
>>       # Test a block-stream and a block-commit job in parallel
>>       # Here the stream job is supposed to finish quickly in order to reproduce
>>       # the scenario that triggers the bug fixed in 3d5d319e1221 and 1a63a907507
>> --
>> 2.35.1
>>
> Seems reasonable, but the best I can give right now is an ACK because
> I'm a little rusty with block graph ops ...
>
> --js
>


