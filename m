Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FC04A630E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:58:03 +0100 (CET)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExPl-0008Dt-SQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:58:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEvnf-0001ZX-Ef
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:14:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEvnb-0005QJ-Tt
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643732070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPvW1y1cfaLsOOzI21uh3EwGZXYW2rvWCT13jfB44Fo=;
 b=KewiEihv6fA5x/s3onhUz30csJJ0352lmbsx+1Z1pmSwESv8/0GcGlqy1U6kZGX9Pfbxkc
 F5BCdvhQhjLozsIlNk8MhV9+RMet/PPdLdtFzQyR+RKVsBB+hVOa9erf6geYh9AbgJSeDj
 06OWSSIasZkZs3TWVpzIvsHcGb35X3I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-UMya0gz1MDOko7aRaJcEjQ-1; Tue, 01 Feb 2022 11:14:29 -0500
X-MC-Unique: UMya0gz1MDOko7aRaJcEjQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 gb4-20020a170907960400b0069d1ebc4538so6789335ejc.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=tPvW1y1cfaLsOOzI21uh3EwGZXYW2rvWCT13jfB44Fo=;
 b=vaow8lZhzazTB9bS184PBrJVKHD6lanVNXmIJ9KFIBt4j7RnDtdunO4/oPmDzzL5ru
 4s9uEMDip7d7jXfzQmVKUN3LU9ot12e8vgFyLPZ8ZSUHoo/M/ABtDEtWOHl3c4UgNqKv
 o2vn/IW9dVdCJrwfuHWsvwuai7svb4YSWVDKhPdbTWndhhp4CVeYC7i1dYnVYwGKDu6o
 qs/8M4jNF0DaOOoVGhRSquN3Niuw20WwMPzKGtzrqEbsc9hbyhMMmk+Uj1fi3qZeqGCx
 iw33/SyvlAsHARGRXqNEPL3O8K2EGjc6jKOyleAzAtf0mhJaXDhkHFrJXp/0uB30ulwQ
 f12A==
X-Gm-Message-State: AOAM53389yM9ZVE72W1dUTrrW4lTrydDI28Vf4nFM3fnfoCIghnbrtFR
 +EQ8tZUrseZLMvtu9Vi3XCIu/zR+H9ukpDsOtTRAJuYksLdGFmGUTngxrjExBtkoYBXr9Q9OVzv
 fz+cT08eh5rkfXy4=
X-Received: by 2002:a05:6402:4313:: with SMTP id
 m19mr25457828edc.320.1643732067825; 
 Tue, 01 Feb 2022 08:14:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzorxDowfH9rePw0lXugRRKJ6LB+f5y7mS98B1QFwzLLHlpMf0OahKRqqWwDwqz04YfpGBR6Q==
X-Received: by 2002:a05:6402:4313:: with SMTP id
 m19mr25457794edc.320.1643732067495; 
 Tue, 01 Feb 2022 08:14:27 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id c14sm19741041edy.66.2022.02.01.08.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 08:14:27 -0800 (PST)
Message-ID: <e5fa1814-2bf9-1f5e-8051-719f8cee0edc@redhat.com>
Date: Tue, 1 Feb 2022 17:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC] block/nbd: Move s->ioc on AioContext change
From: Hanna Reitz <hreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220128155130.13326-1-hreitz@redhat.com>
 <4836201a-a469-c063-babb-4e293daee297@virtuozzo.com>
 <6b28a0b4-8244-54bc-ec1b-91a123569c7c@redhat.com>
In-Reply-To: <6b28a0b4-8244-54bc-ec1b-91a123569c7c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.02.22 12:40, Hanna Reitz wrote:
> On 01.02.22 12:18, Vladimir Sementsov-Ogievskiy wrote:
>> 28.01.2022 18:51, Hanna Reitz wrote:
>>> s->ioc must always be attached to the NBD node's AioContext.  If that
>>> context changes, s->ioc must be attached to the new context.
>>>
>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1990835
>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>> ---
>>> This is an RFC because I believe there are some other things in the NBD
>>> block driver that need attention on an AioContext change, too. Namely,
>>> there are two timers (reconnect_delay_timer and open_timer) that are
>>> also attached to the node's AioContext, and I'm afraid they need to be
>>> handled, too.  Probably pause them on detach, and resume them on 
>>> attach,
>>> but I'm not sure, which is why I'm posting this as an RFC to get some
>>> comments from that from someone who knows this code better than me. :)
>>>
>>> (Also, in a real v1, of course I'd want to add a regression test.)
>>> ---
>>>   block/nbd.c | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/block/nbd.c b/block/nbd.c
>>> index 63dbfa807d..119a774c04 100644
>>> --- a/block/nbd.c
>>> +++ b/block/nbd.c
>>> @@ -2036,6 +2036,25 @@ static void 
>>> nbd_cancel_in_flight(BlockDriverState *bs)
>>>       nbd_co_establish_connection_cancel(s->conn);
>>>   }
>>>   +static void nbd_attach_aio_context(BlockDriverState *bs,
>>> +                                   AioContext *new_context)
>>> +{
>>> +    BDRVNBDState *s = bs->opaque;
>>> +
>>> +    if (s->ioc) {
>>> +        qio_channel_attach_aio_context(s->ioc, new_context);
>>> +    }
>>> +}
>>> +
>>> +static void nbd_detach_aio_context(BlockDriverState *bs)
>>> +{
>>> +    BDRVNBDState *s = bs->opaque;
>>> +
>>> +    if (s->ioc) {
>>> +        qio_channel_detach_aio_context(s->ioc);
>>> +    }
>>> +}
>>> +
>>>   static BlockDriver bdrv_nbd = {
>>>       .format_name                = "nbd",
>>>       .protocol_name              = "nbd",
>>> @@ -2059,6 +2078,9 @@ static BlockDriver bdrv_nbd = {
>>>       .bdrv_dirname               = nbd_dirname,
>>>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>>>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
>>> +
>>> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
>>> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>>>   };
>>>     static BlockDriver bdrv_nbd_tcp = {
>>> @@ -2084,6 +2106,9 @@ static BlockDriver bdrv_nbd_tcp = {
>>>       .bdrv_dirname               = nbd_dirname,
>>>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>>>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
>>> +
>>> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
>>> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>>>   };
>>>     static BlockDriver bdrv_nbd_unix = {
>>> @@ -2109,6 +2134,9 @@ static BlockDriver bdrv_nbd_unix = {
>>>       .bdrv_dirname               = nbd_dirname,
>>>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>>>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
>>> +
>>> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
>>> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>>>   };
>>>     static void bdrv_nbd_init(void)
>>>
>>
>>
>> Hmm. I was so happy to remove these handlers together with 
>> connection-coroutine :) . But you are right, seems I've removed too 
>> much :(.
>>
>>
>> open_timer exists only during bdrv_open() handler, so, I hope on 
>> attach/detach it should not exist.
>
> That’s… kind of surprising.  It’s good for me here, but as far as I 
> can see it means that all of qemu blocks until the connection 
> succeeds, right?  That doesn’t seem quite ideal...
>
> Anyway, good for me. O:)
>
>> reconnect_delay_timer should exist only during IO request: it's 
>> created during request if we don't have a connection. And request 
>> will not finish until timer elapsed or connection established (timer 
>> should be removed in this case too). So, again, when attaching / 
>> detaching the context we should be in a drained sections, so no 
>> in-flight requests and no reconnect_delay_timer.
>
> Got it.  FWIW, other block drivers rely on this, too (e.g. null-aio 
> with latency-ns set creates a timer in every I/O request and settles 
> the request once the timer expires).

Looks like the timer isn’t removed when the connection is 
reestablished.  When I add an `assert(!s->reconnect_delay_timer)` to 
`nbd_attach_aio_context()` (on top of this patch), then I get:

$ ./qemu-nbd \
     --fork \
     --pid-file=/tmp/nbd.pid \
     --socket=/tmp/nbd.sock \
     -f raw \
     null-co://

$ (echo '{"execute": "qmp_capabilities"}';
sleep 1;
kill $(cat /tmp/nbd.pid);
./qemu-nbd \
     --fork \
     --pid-file=/tmp/nbd.pid \
     --socket=/tmp/nbd.sock \
     -f raw \
     null-co://;
echo '{"execute": "human-monitor-command",
        "arguments": {"command-line": "qemu-io nbd \"write 0 64k\""}}';
echo '{"execute": "x-blockdev-set-iothread",
        "arguments": {"node-name": "nbd", "iothread": "iothr0"}}') \
| ./qemu-system-x86_64 \
     -qmp stdio \
     -blockdev '{
         "node-name": "nbd",
         "driver": "nbd",
         "reconnect-delay": 1,
         "server": {
             "type": "unix",
             "path": "/tmp/nbd.sock"
         } }' \
     -object iothread,id=iothr0
{"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 6}, 
"package": "v6.2.0-1288-ge3116c38f7-dirty"}, "capabilities": ["oob"]}}
{"return": {}}
wrote 65536/65536 bytes at offset 0
64 KiB, 1 ops; 00.00 sec (170.326 MiB/sec and 2725.2189 ops/sec)
{"return": ""}
qemu-system-x86_64: ../block/nbd.c:2044: nbd_attach_aio_context: 
Assertion `!s->reconnect_delay_timer' failed.
Aborted (core dumped)


(The above kills the NBD server and immediately starts it, so that the 
following write request will have to reconnect, and immediately 
succeed.  The failed assertion when changing the AioContext shows that 
the timer is still there after successfully reconnecting.)

Not sure whether that’s a problem in normal operation.  On master, 
there’s no failure, of course, the only problem is that 
`reconnect_delay_timer_cb()` will probably be run in the old context.  
If in the new context we then have a concurrent reconnection attempt, 
perhaps the `reconnect_delay_timer_del()` might interfere with 
`reconnect_delay_timer_init()`, such that the former frees the timer 
(and sets it to NULL), and then the `timer_mod()` call in the latter 
function accesses NULL.  But that’d be extremely difficult to test, 
because that’s a very small time window...

I can definitely see the following problem with this RFC patch applied, 
though I don’t quite understand it:

./qemu-nbd \
     --fork \
     --pid-file=/tmp/nbd.pid \
     --socket=/tmp/nbd.sock \
     -f raw \
     null-co://
(echo '{"execute": "qmp_capabilities"}';
sleep 1;
kill $(cat /tmp/nbd.pid);
./qemu-nbd \
     --fork \
     --pid-file=/tmp/nbd.pid \
     --socket=/tmp/nbd.sock \
     -f raw \
     null-co://;
echo '{"execute": "human-monitor-command",
        "arguments": {"command-line": "qemu-io nbd \"write 0 64k\""}}';
echo '{"execute": "x-blockdev-set-iothread",
        "arguments": {"node-name": "nbd", "iothread": "iothr0"}}';
sleep 2;
kill $(cat /tmp/nbd.pid);
./qemu-nbd \
     --fork \
     --pid-file=/tmp/nbd.pid \
     --socket=/tmp/nbd.sock \
     -f raw \
     null-co://;
echo '{"execute": "human-monitor-command",
        "arguments": {"command-line": "qemu-io nbd \"write 0 64k\""}}';
echo '{"execute": "quit"}') \
| ./qemu-system-x86_64 \
     -qmp stdio \
     -blockdev '{
         "node-name": "nbd",
         "driver": "nbd",
         "reconnect-delay": 1,
         "server": {
             "type": "unix",
             "path": "/tmp/nbd.sock"
         } }' \
     -object iothread,id=iothr0
{"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 6}, 
"package": "v6.2.0-1129-g731bf9ede7"}, "capabilities": ["oob"]}}
{"return": {}}
wrote 65536/65536 bytes at offset 0
64 KiB, 1 ops; 00.00 sec (191.279 MiB/sec and 3060.4719 ops/sec)
{"return": ""}
{"return": {}}
wrote 65536/65536 bytes at offset 0
64 KiB, 1 ops; 00.00 sec (159.672 MiB/sec and 2554.7483 ops/sec)
{"return": ""}
{"return": {}}
{"timestamp": {"seconds": 1643731721, "microseconds": 22290}, "event": 
"SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
qemu-system-x86_64: ../util/qemu-timer.c:115: timerlist_free: Assertion 
`!timerlist_has_timers(timer_list)' failed.
Aborted (core dumped)


I.e.:
1. Kill/restart the NBD server, as above, so that the reconnect on write 
succeeds immediately
2. Move the NBD server to a different AioContext
3. Wait two seconds, so that the reconnect timer expires
4. Repeat step 1, which will install a new reconnect timer
5. Have qemu quit before that new timer instance can expire

I have tried stripping this down to just a single timer instance, but 
didn’t succeed.  I always needed one instance expire in the original 
context, and then start another one in the new context.


