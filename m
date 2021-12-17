Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A8B4790E3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 17:02:45 +0100 (CET)
Received: from localhost ([::1]:49318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myFgx-000136-SL
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 11:02:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1myFem-00087r-KK
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 11:00:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1myFek-0007FM-DA
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 11:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639756825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGv5dOtjciCw7oNKEtOXVJurt7j+W7gbw/jF/Mlg8nE=;
 b=OIvKbnfaaMUVgTiWjekshX4QXN0cEt/l4/iQuX03Fd0921ixBtHRdd14+sD5wS8CEumxxj
 ekvNn8cZiFGJzUl4kkFL338QzFE9R6KzVKyB3ntQqMPLseirUfLs7LejvjP2nWWYFa+CWT
 Hlujqit/X4JqwUEdJPi9mN/QyGdoBR4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-fWE6141QMbmTsTNFxQa5Lw-1; Fri, 17 Dec 2021 11:00:22 -0500
X-MC-Unique: fWE6141QMbmTsTNFxQa5Lw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r10-20020a1c440a000000b003456b2594e0so1075771wma.8
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 08:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qGv5dOtjciCw7oNKEtOXVJurt7j+W7gbw/jF/Mlg8nE=;
 b=KBuE3dB5Bkhf4D+qSGyeYlL14Fyvl0rA3qPlL1yMQVHyv1Yvwvwx7f1AArjCY5g7Xl
 RUYVVaJ36SgpPna4ukDp4cBGna3w64yvTxnQSf/5dscgSYaY7+DHhnmcN5oDzQuBbyyo
 G1qEirH1lKvV+WmpdB5BhoQeCqp/o45Paxr2ulBw7DlI93AOwGGM8n5RwUVziiiJ61pe
 6TWX83bz6bubQRsDdi+xce7t2IxQiwpKzfx2OU+NbwtiNKh1j15ExFP8xEls30mQ7Vqh
 bot6eECcoCI3r34HDQOFo+7wWCtLJ9HhFMJMSOL0pgIhEa1RD84Z7qIAJRbMrfFxraaf
 P66Q==
X-Gm-Message-State: AOAM533bQKO8LeSIt5gzD/EUhhUYpf+pBu06Z1risPqdp1vq0ECAASF4
 kpWYK+PH9y3biyMjW/tzxVK3TLwR0Rruu+VJOkU6C9+IhhAbzKUyPCSp36Is65HPNFLPntE0MQ4
 HlDGSY6S592bVgJI=
X-Received: by 2002:a05:6000:11c2:: with SMTP id
 i2mr2092275wrx.674.1639756821093; 
 Fri, 17 Dec 2021 08:00:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSYRBfk54hmMtDYv6I77nkxkZulTR5Nf6vyIEGVc9MuTSDbLbPof2nDoLA2jFJNCSLLtCJ5Q==
X-Received: by 2002:a05:6000:11c2:: with SMTP id
 i2mr2092231wrx.674.1639756820681; 
 Fri, 17 Dec 2021 08:00:20 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id d8sm1245155wmq.13.2021.12.17.08.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 08:00:20 -0800 (PST)
Message-ID: <23ce8a68-79eb-c655-e394-b9f41aed3b90@redhat.com>
Date: Fri, 17 Dec 2021 17:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 22/31] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-23-eesposit@redhat.com>
 <8ca6c67b-4826-19eb-76b4-5870b20dcc93@redhat.com>
 <574fa9f6-0e42-b3bb-f3eb-3bb9e67278b6@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <574fa9f6-0e42-b3bb-f3eb-3bb9e67278b6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.21 16:53, Emanuele Giuseppe Esposito wrote:
>
>
> On 16/12/2021 19:43, Hanna Reitz wrote:
>> On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>   block.c        | 18 ++++++++++++++++++
>>>   block/create.c | 10 ++++++++++
>>>   2 files changed, 28 insertions(+)
>>
>> [...]
>>
>>> diff --git a/block/create.c b/block/create.c
>>> index 89812669df..0167118579 100644
>>> --- a/block/create.c
>>> +++ b/block/create.c
>>> @@ -42,6 +42,16 @@ static int coroutine_fn blockdev_create_run(Job 
>>> *job, Error **errp)
>>>       BlockdevCreateJob *s = container_of(job, BlockdevCreateJob, 
>>> common);
>>>       int ret;
>>> +    /*
>>> +     * Currently there is nothing preventing this
>>> +     * function from being called in an iothread context.
>>> +     * However, since it will crash anyways because of the
>>> +     * aiocontext lock not taken, we might as well make it
>>> +     * crash with a more meaningful error, by checking that
>>> +     * we are in the main loop
>>> +     */
>>> +    assert(qemu_in_main_thread());
>>
>> Mostly agreed.  This function is always run in the main loop right 
>> now, so this assertion will never fail.
>>
>> But that’s the “mostly”: Adding this assertion won’t give a more 
>> meaningful error, because the problem still remains that block 
>> drivers do not error out when encountering (or correctly handle) BDSs 
>> in non-main contexts, and so it remains a “qemu_mutex_unlock_impl: 
>> Operation not permitted”.
>>
>> Not trying to say that that’s your problem.  It’s pre-existing, and 
>> this assertion is good.  Just wanting to clarify something about the 
>> comment that seemed unclear to me (in that I found it implied that 
>> the qemu_mutex_unlock_impl error would be replaced by this assertion 
>> failing).
>>
>
> You are right. Trying your example given in v4:
>
> $ touch /tmp/iothread-create-test.qcow2
> $ ./qemu-system-x86_64 -object iothread,id=iothr0 -qmp stdio <<EOF
> {"execute": "qmp_capabilities"}
> {"execute":"blockdev-add","arguments":{"node-name":"proto","driver":"file","filename":"/tmp/iothread-create-test.qcow2"}} 
>
> {"execute":"x-blockdev-set-iothread","arguments":{"node-name":"proto","iothread":"iothr0"}} 
>
> {"execute":"blockdev-create","arguments":{"job-id":"create","options":{"driver":"qcow2","file":"proto","size":0}}} 
>
> EOF
>
> I still get "qemu_mutex_unlock_impl: Operation not permitted"
>
> I will remove the comment above the assertion, makes no sense.
>
> Or should I replace it with a TODO/FIXME explaining the above? 
> Something like:
>
> /*
>  * TODO: it is currently possible to run a blockdev-create job in an
>  * I/O thread, for example by doing:
>  * [ command line above ]
>  * This should not be allowed.
>  */

Just removing it makes the most sense to me.  We already have a TODO 
comment to that effect (block/create.c:86).

(And to be precise, it is *not* possible to run a blockdev-create job in 
an I/O thread, it’s always run in the main thread.  It is possible to 
run a blockdev-create job involving nodes in I/O threads, and it’s fine 
that that’s possible, but in such cases the block drivers’ 
.bdrv_co_create() implementations should at least error out with a 
benign error, which they don’t.)

Hanna


