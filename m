Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CA479195
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 17:40:16 +0100 (CET)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myGHH-0000eT-E9
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 11:40:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1myGFn-0007xw-TJ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 11:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1myGFk-0002Pk-GZ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 11:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639759117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/50TkzrKoNLlD8CvniiZUESG8PIY7LzrilN3LPBjoVI=;
 b=MFZENIBi5HsDbZS9rgD0zbgm1iWVvcCZIKSfuEzRdluInK9/dNIBa4psMUlIvefSguSceN
 LSQz79N+pSn969iuxd6Dl9hzrW0dJfeyWVgpnXYVNmvKrt2Vj9UwPxpnsapfmouqBA03YR
 I7s8APYZOq7eYEtoDC6AMuL2oHdZfn4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-bAzyqc-CMo6OHXridNI5tw-1; Fri, 17 Dec 2021 11:38:35 -0500
X-MC-Unique: bAzyqc-CMo6OHXridNI5tw-1
Received: by mail-ed1-f72.google.com with SMTP id
 l11-20020a056402254b00b003f6a9bd7e81so2371021edb.13
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 08:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/50TkzrKoNLlD8CvniiZUESG8PIY7LzrilN3LPBjoVI=;
 b=5nF9tJuOe/wrf5R4jHLzHhdnMwFDwMlRO2P51CIZfGbBchLYzSqnz2fxNF7V0H3jfZ
 vEf4vpKF7K1xUAnMfVinoiQOuaj8frnqay3dQoY7to+SlKfAaJFsICyk2eNFA2xka6py
 LLVwLxRrD3X+HyNL3OZ2CEHlJ9jwo3qwvF5zCsRFxWnDf9YGh/SncpmH1j0GuJrrRoiV
 vx+cOHlYIwOzNr4+suJZl0kpUi6EEvgD4n6SCqyeZrYxss5pKX12ieHz++BixXsxOWbA
 R/2o6p2wJFXb8t6JegwmlXkXfu5LZN8iglUaBjw+N2LN/pPPcpHFfv23VBJ3uIG4Wnrm
 Jgfw==
X-Gm-Message-State: AOAM532aI9CYYu0mUtEaBHjkJd9QNQEkwiLf+9rr9sZOPioeFaEcZP0H
 m009AJEf1BF+bywkTgX/OpFbe4uz9RytdUzbA2ArdbsXQF8SVFe8xaWxSe3bhmZymFsMfH8Hqw0
 mw12lh0uA+aDTUbU=
X-Received: by 2002:a17:907:8a04:: with SMTP id
 sc4mr3188999ejc.508.1639759114191; 
 Fri, 17 Dec 2021 08:38:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMzuOtZEUBfjZMFb3KR46mLM5zaoupLr1MRLAOovbsNoIX+iOqaUlomCDDiBUB/DARqhgNOA==
X-Received: by 2002:a17:907:8a04:: with SMTP id
 sc4mr3188968ejc.508.1639759113838; 
 Fri, 17 Dec 2021 08:38:33 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id hr17sm2933083ejc.57.2021.12.17.08.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 08:38:33 -0800 (PST)
Message-ID: <9ca5c434-ddf6-2ed3-08ae-92da5fc98013@redhat.com>
Date: Fri, 17 Dec 2021 17:38:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 28/31] block.c: assert BQL lock held in
 bdrv_co_invalidate_cache
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-29-eesposit@redhat.com>
 <56deaef1-6a4e-c544-9916-42a20cc20c7a@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <56deaef1-6a4e-c544-9916-42a20cc20c7a@redhat.com>
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



On 17/12/2021 12:04, Hanna Reitz wrote:
> On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
>> bdrv_co_invalidate_cache is special: it is an I/O function,
> 
> I still don’t believe it is, but well.
> 
> (Yes, it is called by a test in an iothread, but I believe we’ve seen 
> that the tests simply sometimes test things that shouldn’t be allowed.)
> 
>> but uses the block layer permission API, which is GS.
>>
>> Because of this, we can assert that either the function is
>> being called with BQL held, and thus can use the permission API,
>> or make sure that the permission API is not used, by ensuring that
>> bs (and parents) .open_flags does not contain BDRV_O_INACTIVE.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/block.c b/block.c
>> index a0309f827d..805974676b 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -6574,6 +6574,26 @@ void bdrv_init_with_whitelist(void)
>>       bdrv_init();
>>   }
>> +static bool bdrv_is_active(BlockDriverState *bs)
>> +{
>> +    BdrvChild *parent;
>> +
>> +    if (bs->open_flags & BDRV_O_INACTIVE) {
>> +        return false;
>> +    }
>> +
>> +    QLIST_FOREACH(parent, &bs->parents, next_parent) {
>> +        if (parent->klass->parent_is_bds) {
>> +            BlockDriverState *parent_bs = parent->opaque;
> 
> This looks like a really bad hack to me.  We purposefully have made the 
> parent link opaque so that a BDS cannot easily reach its parents.  All 
> accesses should go through BdrvChildClass methods.
> 
> I also don’t understand why we need to query parents at all.  The only 
> fact that determines whether the current BDS will have its permissions 
> changed is whether the BDS itself is active or inactive.  Sure, we’ll 
> invoke bdrv_co_invalidate_cache() on the parents, too, but then we could 
> simply let the assertion fail there.
> 
>> +            if (!bdrv_is_active(parent_bs)) {
>> +                return false;
>> +            }
>> +        }
>> +    }
>> +
>> +   return true;
>> +}
>> +
>>   int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, 
>> Error **errp)
>>   {
>>       BdrvChild *child, *parent;
>> @@ -6585,6 +6605,12 @@ int coroutine_fn 
>> bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>>           return -ENOMEDIUM;
>>       }
>> +    /*
>> +     * No need to muck with permissions if bs is active.
>> +     * TODO: should activation be a separate function?
>> +     */
>> +    assert(qemu_in_main_thread() || bdrv_is_active(bs));
>> +
> 
> I don’t understand this, really.  It looks to me like “if you don’t call 
> this in the main thread, this better be a no-op”, i.e., you must never 
> call this function in an I/O thread if you really want to use it.  I.e. 
> what I’d classify as a GS function.
> 
> It sounds like this is just a special case for said test, and 
> special-casing code for tests sounds like a bad idea.

Ok, but trying to leave just the qemu_in_main_thread() assertion makes 
test 307 (./check 307) fail.
I am actually not sure on why it fails, but I am sure it is because of 
the assertion, since without it it passes.

I tried with gdb (./check -gdb 307 on one terminal and
gdb -iex "target remote localhost:12345"
in another) but it points me to this below, which I think is the ndb 
server getting the socket closed (because on the other side it crashed), 
and not the actual error.


Thread 1 "qemu-system-x86" received signal SIGPIPE, Broken pipe.
0x00007ffff68af54d in sendmsg () from target:/lib64/libc.so.6
(gdb) bt
#0  0x00007ffff68af54d in sendmsg () from target:/lib64/libc.so.6
#1  0x0000555555c13cc9 in qio_channel_socket_writev (ioc=<optimized 
out>, iov=0x5555569a4870, niov=1, fds=0x0, nfds=<optimized out>, errp=0x0)
     at ../io/channel-socket.c:561
#2  0x0000555555c19b18 in qio_channel_writev_full_all 
(ioc=0x55555763b800, iov=iov@entry=0x7fffe8dffd80, niov=niov@entry=1, 
fds=fds@entry=0x0,
     nfds=nfds@entry=0, errp=errp@entry=0x0) at ../io/channel.c:240
#3  0x0000555555c19bd2 in qio_channel_writev_all (errp=0x0, niov=1, 
iov=0x7fffe8dffd80, ioc=<optimized out>) at ../io/channel.c:220
#4  qio_channel_write_all (ioc=<optimized out>, 
buf=buf@entry=0x7fffe8dffdd0 "", buflen=buflen@entry=20, 
errp=errp@entry=0x0) at ../io/channel.c:330
#5  0x0000555555c27e75 in nbd_write (errp=0x0, size=20, 
buffer=0x7fffe8dffdd0, ioc=<optimized out>) at ../nbd/nbd-internal.h:71
#6  nbd_negotiate_send_rep_len (client=client@entry=0x555556f60930, 
type=type@entry=1, len=len@entry=0, errp=errp@entry=0x0) at 
../nbd/server.c:203
#7  0x0000555555c29db1 in nbd_negotiate_send_rep (errp=0x0, type=1, 
client=0x555556f60930) at ../nbd/server.c:211
--Type <RET> for more, q to quit, c to continue without paging--
#8  nbd_negotiate_options (errp=0x7fffe8dffe88, client=<optimized out>) 
at ../nbd/server.c:1224
#9  nbd_negotiate (errp=0x7fffe8dffe88, client=<optimized out>) at 
../nbd/server.c:1340
#10 nbd_co_client_start (opaque=<optimized out>) at ../nbd/server.c:2715
#11 0x0000555555d70423 in coroutine_trampoline (i0=<optimized out>, 
i1=<optimized out>) at ../util/coroutine-ucontext.c:173
#12 0x00007ffff67f3820 in ?? () from target:/lib64/libc.so.6
#13 0x00007fffffffca80 in ?? ()

Emanuele
> 
> Hanna
> 
>>       QLIST_FOREACH(child, &bs->children, next) {
>>           bdrv_co_invalidate_cache(child->bs, &local_err);
>>           if (local_err) {
> 


