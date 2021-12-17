Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16FD4790AF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:56:00 +0100 (CET)
Received: from localhost ([::1]:44918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myFaR-00068d-L9
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:55:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1myFYG-000569-Dp
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 10:53:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1myFYE-0006H1-VL
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 10:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639756422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxGFCvUvhv5lIDIW9MFNmw1tdZPuUD/faUeq7e1hKbk=;
 b=Pz85BF6faNF3Ihn3r1igiRW4xhZLufBTMAVx4VTZj9u/FVBEyVU1sq0WbDVDp4pS56SAaU
 UCC27BDUExHc6h7ltGMb7BHTiExw7G5Rm+jzh/SrrO68VpNAqlTETKdK8eNJwYn26q+aqJ
 Bdo4acq/BTlfIey4NKeNLgqhz3rljj4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-gvSeLO3iMJ-5w9YK2J0t8Q-1; Fri, 17 Dec 2021 10:53:39 -0500
X-MC-Unique: gvSeLO3iMJ-5w9YK2J0t8Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 l11-20020a056402254b00b003f6a9bd7e81so2256671edb.13
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 07:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nxGFCvUvhv5lIDIW9MFNmw1tdZPuUD/faUeq7e1hKbk=;
 b=DVI2emfaRR8UJ6JQEh9k5yQJ55GJlk2gaVbqbXZKRUUVa9P8Ml1nMIefFu7iVwhJCm
 WzeNW7ThbTfuPciEPqo9vbMWC+ti8/R3s+g96LODn9Nrl48Vp+X8l4qwqEb7UIpZWbe/
 jAW1tZDutSqi0QNDrm4SQEJIri4SJp0cIx706tGQ0qNqcgdumtCNG5GRNAXhMxm1x7OK
 4XZNdd6nv6T/qDqXZRRs5rpcBfcKgUdcm09lo+noTK/eDvpI59bCBPwntXK9TwnOZ34e
 uUvcXgMYqFtMBm4DYd52OhFl+o8hGYfl4iPIQSP48lRTQxVY0Q51V2SaWnZ8cEigUtjm
 zeRQ==
X-Gm-Message-State: AOAM531bsJdysqem9mp0Xa0cxe8L3x6fnj/TApOyEAhseNJ+GyjTS/Yu
 9wDg/CdbBBWOFW+bgDAlr00Lp9pewPcMYUcWUraGydQSrQw8LxQ7mmnR5PjxrUlFMwfQLloqIZ/
 /ivoCes1MrihpyXY=
X-Received: by 2002:a17:906:d187:: with SMTP id
 c7mr2866365ejz.477.1639756417693; 
 Fri, 17 Dec 2021 07:53:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLcK9282UFnoxfZ+iGGLsHmP2YBwsQKchCqH9u3XERo/pj1oJbjcpj7LYEq5j5I0ehtiwLwA==
X-Received: by 2002:a17:906:d187:: with SMTP id
 c7mr2866341ejz.477.1639756417450; 
 Fri, 17 Dec 2021 07:53:37 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id l8sm573718ejo.197.2021.12.17.07.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 07:53:36 -0800 (PST)
Message-ID: <574fa9f6-0e42-b3bb-f3eb-3bb9e67278b6@redhat.com>
Date: Fri, 17 Dec 2021 16:53:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 22/31] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-23-eesposit@redhat.com>
 <8ca6c67b-4826-19eb-76b4-5870b20dcc93@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <8ca6c67b-4826-19eb-76b4-5870b20dcc93@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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



On 16/12/2021 19:43, Hanna Reitz wrote:
> On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block.c        | 18 ++++++++++++++++++
>>   block/create.c | 10 ++++++++++
>>   2 files changed, 28 insertions(+)
> 
> [...]
> 
>> diff --git a/block/create.c b/block/create.c
>> index 89812669df..0167118579 100644
>> --- a/block/create.c
>> +++ b/block/create.c
>> @@ -42,6 +42,16 @@ static int coroutine_fn blockdev_create_run(Job 
>> *job, Error **errp)
>>       BlockdevCreateJob *s = container_of(job, BlockdevCreateJob, 
>> common);
>>       int ret;
>> +    /*
>> +     * Currently there is nothing preventing this
>> +     * function from being called in an iothread context.
>> +     * However, since it will crash anyways because of the
>> +     * aiocontext lock not taken, we might as well make it
>> +     * crash with a more meaningful error, by checking that
>> +     * we are in the main loop
>> +     */
>> +    assert(qemu_in_main_thread());
> 
> Mostly agreed.  This function is always run in the main loop right now, 
> so this assertion will never fail.
> 
> But that’s the “mostly”: Adding this assertion won’t give a more 
> meaningful error, because the problem still remains that block drivers 
> do not error out when encountering (or correctly handle) BDSs in 
> non-main contexts, and so it remains a “qemu_mutex_unlock_impl: 
> Operation not permitted”.
> 
> Not trying to say that that’s your problem.  It’s pre-existing, and this 
> assertion is good.  Just wanting to clarify something about the comment 
> that seemed unclear to me (in that I found it implied that the 
> qemu_mutex_unlock_impl error would be replaced by this assertion failing).
> 

You are right. Trying your example given in v4:

$ touch /tmp/iothread-create-test.qcow2
$ ./qemu-system-x86_64 -object iothread,id=iothr0 -qmp stdio <<EOF
{"execute": "qmp_capabilities"}
{"execute":"blockdev-add","arguments":{"node-name":"proto","driver":"file","filename":"/tmp/iothread-create-test.qcow2"}}
{"execute":"x-blockdev-set-iothread","arguments":{"node-name":"proto","iothread":"iothr0"}}
{"execute":"blockdev-create","arguments":{"job-id":"create","options":{"driver":"qcow2","file":"proto","size":0}}}
EOF

I still get "qemu_mutex_unlock_impl: Operation not permitted"

I will remove the comment above the assertion, makes no sense.

Or should I replace it with a TODO/FIXME explaining the above? Something 
like:

/*
  * TODO: it is currently possible to run a blockdev-create job in an
  * I/O thread, for example by doing:
  * [ command line above ]
  * This should not be allowed.
  */

What do you think?

Emanuele


> 
>> +
>>       job_progress_set_remaining(&s->common, 1);
>>       ret = s->drv->bdrv_co_create(s->opts, errp);
>>       job_progress_update(&s->common, 1);
> 


