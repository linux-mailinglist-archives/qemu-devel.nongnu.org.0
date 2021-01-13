Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E12F494B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 12:06:53 +0100 (CET)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzdzH-0002mh-Ih
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 06:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzdyH-0002HB-Sg
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 06:05:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzdy7-00066C-OG
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 06:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610535936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrWIL7IxC4J/rHe0YjgEQ6ZOoovcXGM4ifzUOWbx7wo=;
 b=ey3ACWSJ7EX82NXuIKcInNoLofATNBKc/m6qx9mf3vIGjuOYm21+5l/oxYfzYXytNah9Rs
 pbcuc0ERvQPdVEddlNktO8uIXYhgP3wI/6h0jUgky7/f9AgVv/epHN1kZQI1IMZNu1ZCx8
 S1843poclE1Iesg4FWerOrCnANgLft8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-ezrchCnsOaaJgBoRDO4H3Q-1; Wed, 13 Jan 2021 06:05:33 -0500
X-MC-Unique: ezrchCnsOaaJgBoRDO4H3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C23581922960;
 Wed, 13 Jan 2021 11:05:32 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-113.ams2.redhat.com
 [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACEB21C930;
 Wed, 13 Jan 2021 11:05:30 +0000 (UTC)
Subject: Re: iotest 129
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>
References: <6e00b90e-5c95-8b02-23c2-0acfe9862f6a@redhat.com>
 <4474f468-dc8c-8e53-2d46-183823918863@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <22115060-4169-d979-3750-8a527914564a@redhat.com>
Date: Wed, 13 Jan 2021 12:05:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <4474f468-dc8c-8e53-2d46-183823918863@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, BIGNUM_EMAILS=0.594,
 DKIMWL_WL_HIGH=-0.251, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.01.21 10:53, Vladimir Sementsov-Ogievskiy wrote:
> 12.01.2021 20:44, Max Reitz wrote:
>> Hi,
>>
>> tl;dr: I have some troubles debugging what’s wrong with iotest 129.  
>> It wants to check that 'stop' does not drain a block job, but to me it 
>> seems like that’s exactly what’s happening with the mirror job.
>>
>>
>> For quite some time, I’ve had 129 disabled in my test branch because 
>> it fails all the time for me.  Now it came up again in Vladimir’s 
>> async backup series, and so I tried my hands at debugging it once again.
>>
>> Recap: 129 writes 128M to some image, then runs a block job from there 
>> (while the source drive is supposedly throttled), then issues a stop 
>> command, and checks that the job is not drained.  I.e., still running.
>>
>> (It checks the “running” state via @busy, which is probably wrong; it 
>> should verify that @state == 'running' (which wasn’t available back in 
>> 2015), but that’s not really why I’m writing this mail.)
>>
>> Like the last time I tried
>> (https://lists.nongnu.org/archive/html/qemu-block/2019-06/msg00499.html) 
>> I can see that block jobs completely ignore BB throttling: If you 
>> apply the attachment show-progress.patch, you’ll probably see some 
>> progress made while the test waits for five seconds.  (Here, on tmpfs, 
>> mirror and commit get to READY, and backup completes.)
>>
>> OK, so now that block jobs don’t completely break with filters, you 
>> can instead use a filter node on the source (as I tried in the patch 
>> referenced above).  And to fully fix the test, we’d also replace the 
>> @busy == True check by @status == 'running'.  That’s the attachment 
>> filter-node-show-progress.patch.
>>
>> If I apply that, I can see that now there actually is some throttling. 
>> After the time.sleep(5), mirror and commit get to exactly 1 MB, and 
>> backup gets to 1.0625 MB.  Good.
>>
>> However, after the stop is issued, backup stays at 1.2 MB (good), but 
>> mirror and commit progress obviously without throttling to 30, 40, 50 
>> MB, whatever.  So it appears to me they are drained by the stop.  
>> I.e., precisely what the iotest is trying to prove not to happen.
> 
> I don't follow.. Increasing of progress means that jobs are drained?

I don’t know.  It does mean that throttling is ignored for a bit, 
though.  I could imagine that’s because something is being drained.

>> I plan to continue investigating, but I just wanted to send this mail 
>> to see whether perhaps someone has an idea on what’s going on.
>>
>> (My main problem is that bisecting this is hard.  AFAIK the throttling 
>> applied in master:129 has been broken ever since blockdev throttling 
>> was moved to the BB.  Even without the “Deal with filters” series, you 
>> can use at least mirror sync=full from filter nodes, so I tried to use 
>> filter-node-show-progress.patch for just test_drive_mirror(), but that 
>> only works back until fe4f0614ef9e361d (or rather 0f12264e7a4145 if 
>> you prefer not to get a SIGABRT).  Before that commit, it hangs.)
>>
>> Max
> 
> 
> Hmm, in show-progress.patch you call "stop" the second time.. It's a 
> mistake I think..

Ah, oops.  Yes, not sure, how that part got in (some rebasing mistake).

Still, removing those three duplicated lines (stop + query-block-jobs) 
yields the same result.  (I mean, what else is to be expected; BB 
throttling does nothing, so even before the first stop, the jobs are 
READY/COMPLETED.)

> Also, on current master x-bps-total I can find only in iotests.. Where 
> is it defined o_O? If I change it to be bps-total, it fails.. Strange.

block/throttle-groups.c defines x- as a THROTTLE_OPT_PREFIX... :/

> I've run the test with your patch with throttling filter (and a bit more 
> logging).. Interesting. It looks like throttling just don't work 
> noramlly after stop.. I see that mirror does one 1M request, and it 
> obviously overflow throttle limit, so during your next 5 seconds it does 
> nothing (and we see progress of 1M). But immediately after "stop" 
> command all 16 read requests pending for throttling goes, and then a lot 
> more read requests (hmm, exactly 31) are issued and not throttled at all 
> (but goes through throttle node). And then new 16 requests are issued 
> and throttled. I've looked at throttle_group_co_io_limits_intercept() 
> and I just don't understand how it works)

Hm.  So you’re saying only the current set of requests are drained, but 
no new ones are generated?

Perhaps 129 was introduced to check that block jobs don’t run to 
completion on 'stop'.  The commit before it (e62303a437af72141^) makes 
block jobs pause in bdrv_drain_all(), so they don’t generate more 
requests.  Perhaps we just need to ensure that mirror won’t generate 
many concurrent requests.

Indeed.  Setting buf_size=65536 leads to offset reaching 64k after the 
sleep, and then 128k after the stop.  That makes sense now.

Now there’s only one problem: That doesn’t work with commit…

Then again, the commit 129 uses is an active commit, i.e. just mirror. 
It looks like we can translate it into a non-active commit, though then 
we still have no control over the buffer size.  But then it only 
progresses to 2.5 MB, which I guess is fine...

I suppose with your async backup series, we should then limit 
max-workers and max-chunk to the minimum for the backup job?

Max


